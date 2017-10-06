# is x egrep argument available?
egrep-flag-available() {
    echo | egrep $1 "" >/dev/null 2>&1
}

GREP_OPTIONS=""

# color egrep results
if egrep-flag-available --color=auto; then
    GREP_OPTIONS+=" --color=always"
fi

# ignore VCS folders (if the necessary egrep flags are available)
VCS_FOLDERS="{.bzr,CVS,.git,.hg,.svn,.swp}"

if egrep-flag-available --exclude-dir=.cvs; then
    GREP_OPTIONS+=" --exclude-dir=$VCS_FOLDERS"
elif egrep-flag-available --exclude=.cvs; then
    GREP_OPTIONS+=" --exclude=$VCS_FOLDERS"
fi

# export egrep settings
alias egrep="egrep $GREP_OPTIONS"

# clean up
unset GREP_OPTIONS
unset VCS_FOLDERS
unfunction egrep-flag-available
