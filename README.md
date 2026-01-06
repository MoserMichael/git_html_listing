# git_html_listing.sh

A shell script for producing an html listing for the change history of each file in a git repository.

The script creates a index.html file with an entry per file that is part of the git repository.

Each entry contains a link to the history log of the file and a  link to git blame listing for that file.  

Each line of the git blame listing is linking to the commit where it came from.


## installation

Copy the files
- [git_html_listing.sh](https://raw.githubusercontent.com/MoserMichael/git_html_listing/refs/heads/main/git_html_listing.sh) and [ansi2html.sh](https://raw.githubusercontent.com/MoserMichael/git_html_listing/refs/heads/main/ansi2html.sh) into the same directory
- you also need the presence of git, sed, gawk

## Thanks

This script uses [ansi2html.sh](https://www.pixelbeat.org/scripts/ansi2html.sh)

## Example html listing for this repository
  
[see link](https://mosermichael.github.io/git_html_listing/html_history_listing/index.html)
