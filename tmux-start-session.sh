# Fresh start on ubuntu:
#
# pkill -u $(id -u) tmux
# rm -rf /tmp/tmux-$(id -u)/*
# unset TMUX
# tmux start-server

tmux_start_session() {
    local SESSION="$1"
    local SHELL_WINDOW_NAME="${2:-terminal}"
    local EDITOR_WINDOW_NAME="${3:-nvim}"
    local WORKSPACE="${4:-${WORKSPACE}}"

    if ! tmux has-session -t "$SESSION" 2>/dev/null; then
        echo "Session does not exist, creating..."
        tmux new-session -d -s "$SESSION"
    else
        echo "Session '$SESSION' already exists. Exiting."
        return
    fi

    # Create new session detached
    tmux new-session -d -s "$SESSION"

    # Configure nvim window
    tmux rename-window -t "$SESSION:0" "$EDITOR_WINDOW_NAME"
    tmux send-keys -t "$SESSION:$EDITOR_WINDOW_NAME" "cd $WORKSPACE/$SESSION" C-m
    tmux send-keys -t "$SESSION:$EDITOR_WINDOW_NAME" "vim ." C-m

    # Create terminal window
    tmux new-window -t "$SESSION" -n "$SHELL_WINDOW_NAME"
    tmux send-keys -t "$SESSION:$SHELL_WINDOW_NAME" "cd $WORKSPACE/$SESSION; clear" C-m

    # Go back to editor window
    tmux select-window -t "$SESSION:$EDITOR_WINDOW_NAME"
}
