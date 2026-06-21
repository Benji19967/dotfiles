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

    # 1. Configure the initial window to be index 9 instead of 0
    tmux move-window -s "$SESSION:0" -t "$SESSION:9"
    tmux rename-window -t "$SESSION:9" "$EDITOR_WINDOW_NAME"
    tmux send-keys -t "$SESSION:$EDITOR_WINDOW_NAME" "cd $WORKSPACE/$SESSION" C-m
    tmux send-keys -t "$SESSION:$EDITOR_WINDOW_NAME" "a" C-m
    tmux send-keys -t "$SESSION:$EDITOR_WINDOW_NAME" "vim ." C-m

    # 2. Create the terminal window explicitly at index 0
    tmux new-window -t "$SESSION:0" -n "$SHELL_WINDOW_NAME"
    tmux send-keys -t "$SESSION:$SHELL_WINDOW_NAME" "cd $WORKSPACE/$SESSION" C-m
    tmux send-keys -t "$SESSION:$SHELL_WINDOW_NAME" "a; clear" C-m

    # Go back to your editor window (index 9)
    tmux select-window -t "$SESSION:9"
}
