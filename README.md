# git_html_listing.sh

A shell script for producing a nice html listing for the history of each file.
The script creates a index.html file that contains a link per html file in given git repository.
Each linked html file contains the change log for one file contained in the repository.


## installation

Copy the files
- [git_html_listing.sh](https://raw.githubusercontent.com/MoserMichael/git_html_listing/refs/heads/main/git_html_listing.sh) and [ansi2html.sh](https://raw.githubusercontent.com/MoserMichael/git_html_listing/refs/heads/main/ansi2html.sh) into the same directory
- you also need the presence of git, sed, gawk

## Thanks

This script uses [ansi2html.sh](https://www.pixelbeat.org/scripts/ansi2html.sh)


## Example html listing for this repository
  
[see link](https://mosermichael.github.io/git_html_listing/html_history_listing/index.html)
