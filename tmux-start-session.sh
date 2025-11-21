# Fresh start on ubuntu:
#
# pkill -u $(id -u) tmux
# rm -rf /tmp/tmux-$(id -u)/*
# unset TMUX
# tmux start-server

tmux_start_session() {
    local SESSION="$1"
    local SHELL_WINDOW_NAME="${2:-shell}"
    local EDITOR_WINDOW_NAME="${3:-editor}"
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

    # Configure shell window
    tmux rename-window -t "$SESSION:0" "$SHELL_WINDOW_NAME"
    tmux send-keys -t "$SESSION:$SHELL_WINDOW_NAME" "cd $WORKSPACE/$SESSION" C-m

    # Create editor window
    tmux new-window -t "$SESSION" -n "$EDITOR_WINDOW_NAME"
    tmux send-keys -t "$SESSION:$EDITOR_WINDOW_NAME" "cd $WORKSPACE/$SESSION" C-m
    tmux send-keys -t "$SESSION:$EDITOR_WINDOW_NAME" "vim ." C-m

    # Go back to shell window
    tmux select-window -t "$SESSION:$SHELL_WINDOW_NAME"
}
