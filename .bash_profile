# Add `~/local/bin` to the `$PATH`
export PATH="$HOME/local/bin:$PATH";

# Load the shell dotfiles, and then some:
# *  ~/.path can be used to extend `$PATH`.
for file in ~/.{path,exports,aliases,private}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Case-insensitive globbing
shopt -s nocaseglob;

# Append to the Bash history file, rather than overwritting it
shopt -s histappend;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
    shopt -s "$option" 2> /dev/null;
done;

# Add tab completion for many Bash commands
if which brew > /dev/null && [ -f "$(brew --prefix)/etc/bash_completion" ]; then
    source "$(brew --prefix)/etc/bash_completion";
elif [ -f /etc/bash_completion ]; then
    source /etc/bash_completion;
fi;

# Create a new directory and enter it
function mkd() {
    mkdir -p "$@" && cd "$_";
}

# For editor:
# `a`, `s` or `v` with no arguments opens the current directory in Atom Editor, SublimeText or Vim, otherwise opens the given location
function a() {
    if [ $# -eq 0 ]; then
        atom .;
    else
        atom "$@";
    fi;
}

function s() {
    if [ $# -eq 0 ]; then
        subl .;
    else
        subl "$@";
    fi;
}

function v() {
    if [ $# -eq 0 ]; then
        vim .;
    else
        vim "$@";
    fi;
}

# `o` with no arguments opens the current directory, otherwise opens the given location
function o() {
    if [ $# -eq 0 ]; then
        open .;
    else
        open "$@";
    fi;
}

# use Git's colored diff when availalbe
hash git &>/dev/null;
if [ $? -eq 0 ]; then
    function diff() {
        git diff --no-index --color-words "$@";
    }
fi;
