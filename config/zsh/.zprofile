# Only login shells read .zprofile and most Linux 
# terminals don’t start login shells by default.
# Apple’s Terminal.app, however, _always_ starts a 
# login shell whenever you open a new window or tab.

# The following are used by Apple in /etc/zshrc, which
# is sourced _before_ `.zshrc`
# Wouldn't have to go in .zprofile otherwise.
# We could put them in .zshenv, but that file is best 
# kept as small as possible.
export SHELL_SESSION_DIR=$XDG_STATE_HOME/zsh/sessions
export \
    SHELL_SESSION_FILE=$SHELL_SESSION_DIR/$TERM_SESSION_ID

xrdb -load "$XDG_CONFIG_HOME/X11/xresources"
