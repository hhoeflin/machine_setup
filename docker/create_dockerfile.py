from pathlib import Path
from typing import List

import sh
import typer


def parse_makefile(makefile: Path):
    makefile_lines = makefile.read_text().splitlines(keepends=False)
    make_calls = [line for line in makefile_lines if line.startswith("\t$(MAKE)")]
    subdirs_called = [call.split(" ")[2] for call in make_calls]

    return make_calls, subdirs_called


def create_docker_snippet_for_call(
    call: str, subdir: str, root: Path, do_copy: bool
) -> str:
    docker_code = []
    if do_copy:
        # add lines that copy the files; should only be called for a program if has not
        # been called before
        tracked_files = sh.git("ls-files", str(root / subdir)).split()  # type: ignore

        docker_root = Path("/home/docker/makefiles")

        docker_code.append(
            "COPY --chown=docker:docker "
            f"{' '.join([x for x in tracked_files if Path(x).name != '.gitignore'])} "
            f"{str(docker_root / subdir)}/"
        )

    # we need to change the call a bit
    call = call.replace("\t$(MAKE)", "make")
    call = call.replace("$@", "all")
    docker_code.append(f"RUN {call}")

    return "\n".join(docker_code)


def create_dockerfile(
    makefile_path: Path, dockerfile_header: Path, dockerfile_out: Path
):
    calls, subdirs = parse_makefile(makefile_path)

    docker_snippets = []
    subdirs_used = set()

    for call, subdir in zip(calls, subdirs):
        docker_snippets.append(
            create_docker_snippet_for_call(
                call,
                subdir,
                root=makefile_path.parent,
                do_copy=subdir not in subdirs_used,
            )
        )
        subdirs_used.add(subdir)

    docker_all = dockerfile_header.read_text() + "\n\n" + "\n\n".join(docker_snippets)

    dockerfile_out.write_text(docker_all)


if __name__ == "__main__":
    typer.run(create_dockerfile)
