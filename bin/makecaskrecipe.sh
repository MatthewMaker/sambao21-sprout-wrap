#!/usr/bin/env bash 
# Argument = -r recipe -c cookbook folder -s soloist file -d debug level -v verbose

# source shflags from current directory
. ./shflags

# define a 'name' command-line string flag
DEFINE_string 'name' 'world' 'name to say hello to' 'n'
DEFINE_string 'cookbook' 'sambao21_workstation' 'cookbook folder' 'c'

# parse the command-line
FLAGS "$@" || exit 1
eval set -- "${FLAGS_ARGV}"

# say hello
echo "Hello, ${FLAGS_name}!"

echo "cookbook: ${cookbook}"


usage() { echo "Usage: $0 [-s <45|90>] [-p <string>]" 1>&2; exit 1; }


CommandLineOptions__new_recipe=""
CommandLineOptions__cookbook="sambao21_workstation"
CommandLineOptions__soloist_file="soloist"
CommandLineOptions__debug_level=""


#if test "x$CommandLineOptions__debug_level" != "x"
#    # echo all of our lines as they execute
#    set -x
#fi

set -o nounset
set -e

#zero args
#if (($# == 0)); then
#fi

#
#
#
 

top_folder=../$CommandLineOptions__cookbook
recipe_folder=recipes
recipe="$1"
outfile="${top_folder}/${recipe_folder}/${recipe}.rb"

found=$(brew cask search ${recipe})
if [ ! "$found" ]
then
    echo "${recipe}: not found in brew cask search"
    exit 2
fi

if test -f "$outfile"
then
    echo "$outfile: already exists"
    exit 1
fi

# begin!
echo include_recipe \"homebrew::cask\" >$outfile
echo homebrew_cask \"$recipe\" >>$outfile

cat "$outfile"

OUT=$(mktemp /tmp/output.XXXXXXXXXX) || { echo "Failed to create temp file"; exit 1; }
awk "/- homebrew::cask/{print;print \"- ${CommandLineOptions__cookbook}::${recipe}\";next}1" ../soloistrc > ${OUT} && mv ${OUT} ../soloistrc

