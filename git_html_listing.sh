#!/usr/bin/env bash

# Licence: LGPLv2

out_dir="temp_dir"
git_dir="."


out_dir=$(realpath "${out_dir}")
git_dir=$(realpath "${git_dir}")

script_dir=$(dirname $0)
script_dir=$(realpath "${script_dir}")
html_index=""

origin_url=$(git config --get remote.origin.url)
html_prefix="<html><body><h2>History listing for git repository: ${origin_url}</h2><ul>"

#if [[ -d "$out_dir" ]]; then
#   rm -rf "$out_dir"
#fi

mkdir -p "$out_dir"

pushd "$git_dir"

for f in $(git ls-files); do
    echo "Processing $f"
    out_file="$out_dir/$f"
    
    dname=$(dirname "$out_file")
    mkdir -p "$dname"

    link_name=${f}
    link_path="${f}.html"
    out_html_path="${out_file}.html"

    echo "<html><body><h2>History listing for file: ${f}</h2>" >${out_html_path}

    git log --color=always --follow --pretty=fuller -p --ignore-cr-at-eol --raw ${f} | ${script_dir}/ansi2html.sh >>${out_html_path} 

    html_index="${html_index}<li><a href=\"${link_path}\">$f</a>"

done

echo "${html_prefix}${html_index}" >${out_dir}/index.html



