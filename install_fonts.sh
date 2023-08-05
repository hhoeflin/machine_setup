#!/bin/bash

# for list of interesting fonts see 
# https://realdougwilson.com/writing/coding-with-character
declare -a fonts=(
	FiraCode
	FiraMono
	Inconsolate
	UbuntuMono
	VictorMono
	CascadiaCode
	Iosevka
)

version='3.0.2'
fonts_dir="${HOME}/.local/share/fonts"

if [[ ! -d "$fonts_dir" ]]; then
    mkdir -p "$fonts_dir"
fi

for font in "${fonts[@]}"; do
    zip_file="${font}.zip"
    download_url="https://github.com/ryanoasis/nerd-fonts/releases/download/v${version}/${zip_file}"
    echo "Downloading ${download_url}"
    wget "$download_url"
    unzip "${zip_file}" -d "${fonts_dir}/${font}" -x "*.txt/*" -x "*.md/*"
    rm "${zip_file}"
done

find "$fonts_dir" -name '*Windows Compatible*' -delete

fc-cache -fv

