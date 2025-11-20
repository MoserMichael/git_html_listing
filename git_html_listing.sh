#!/usr/bin/env bash

# Licence: LGPLv2

out_dir="html_history_listing"
git_dir="."

function Help()
{
    if [[ $1 != "" ]]; then
        echo "Error: $*"
    fi

	cat <<EOF
Usage: $0 -g <git_repo_directory> -o <html_output_directory> [-v] [-h] 

A shell script for producing a nice html listing for the history of each file.
The script creates a index.html file that contains a link per html file in given git repository.
Each linked html file contains the change log for one file contained in the repository.


EOF
	exit 1
}

while getopts "hg:o:" opt; do
  case ${opt} in
    h)
    	Help
        ;;
    g)
        git_dir=$OPTARG
        ;;
    o)
        out_dir=$OPTARG
        ;;
    v)
        set -x
        export PS4='+(${BASH_SOURCE}:${LINENO})'
        VERBOSE=1
        ;; 
    *)
        Help "Invalid option"
        ;;
   esac
done	

out_dir=$(realpath "${out_dir}")
git_dir=$(realpath "${git_dir}")

if [[ ! -d "$git_dir" ]]; then
  Help "git repo directory ${git_dir} does not exist"
fi

script_dir=$(dirname $0)
script_dir=$(realpath "${script_dir}")
html_index=""

#if [[ -d "$out_dir" ]]; then
#   rm -rf "$out_dir"
#fi

cat <<EOF
** building html listing **

For repository directory: ${git_dir} 
html listing directory: ${out_dir}

EOF

mkdir -p "$out_dir"

pushd "$git_dir"

origin_url=$(git config --get remote.origin.url)
html_prefix="<html><body><h2>History listing for git repository: ${origin_url}</h2><ul>"

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



