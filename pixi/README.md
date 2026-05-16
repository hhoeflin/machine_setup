# Pixi Global Tools

Global CLI tools managed with [pixi](https://pixi.sh).

## Install pixi

```bash
curl -fsSL https://pixi.sh/install.sh | bash
```

Then add to your `~/.bashrc` or `~/.zshrc` (the installer usually does this automatically):

```bash
export PATH="$HOME/.pixi/bin:$PATH"
```

## Install all tools

Copy the manifest to the pixi global config location and sync:

```bash
mkdir -p ~/.pixi/manifests
cp pixi-global.toml ~/.pixi/manifests/pixi-global.toml
pixi global sync
```

## Post-install steps

Some tools are not available in conda-forge and need to be installed separately.

### copilot-cli (GitHub Copilot in the CLI)

`copilot-cli` is a `gh` extension. After `pixi global sync` has installed `gh`:

```bash
gh extension install github/gh-copilot
```

Usage:

```bash
gh copilot suggest "create a git branch"
gh copilot explain "git rebase -i HEAD~3"
```

### opencode

Not in conda-forge. Install via the official script:

```bash
curl -fsSL https://opencode.ai/install | bash
```

Or via npm if nodejs is available:

```bash
npm install -g opencode-ai
```

### gemini-cli

```bash
npm install -g @google/gemini-cli
```

Or grab the binary directly from the [releases page](https://github.com/google-gemini/gemini-cli/releases).

### bash-preexec

A shell script (not a package), required by tools like `atuin`:

```bash
curl https://raw.githubusercontent.com/rcaloras/bash-preexec/master/bash-preexec.sh \
  -o ~/.bash-preexec.sh
echo '[[ -f ~/.bash-preexec.sh ]] && source ~/.bash-preexec.sh' >> ~/.bashrc
```

### glow (markdown viewer)

The `glow` name in conda-forge is an unrelated PySpark package. Install the
Charmbracelet Glow viewer via Go (available after `pixi global sync`) or a direct binary:

```bash
# via go (available after pixi global sync):
go install github.com/charmbracelet/glow@latest

# or grab a binary from releases:
# https://github.com/charmbracelet/glow/releases
```

## Updating tools

```bash
pixi global sync          # re-sync from manifest (picks up version bumps)
pixi global upgrade --all # upgrade all envs to latest available versions
```

## Adding a new tool

Edit `pixi-global.toml`, add the package under the appropriate `[envs.<name>.dependencies]`
and expose its binary in `[envs.<name>.exposed]`, then run:

```bash
pixi global sync
```

To find the correct conda-forge package name:

```bash
pixi search <name>
# or browse https://prefix.dev/channels/conda-forge
```
