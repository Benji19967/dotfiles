tmux_start_session() {
  local SESSION="$1"
  local SHELL_WINDOW_NAME="${2:-shell}"
  local EDITOR_WINDOW_NAME="${3:-editor}"
  local WORKSPACE="${4:-${WORKSPACE}}"

  # Check if session exists
  tmux has-session -t "$SESSION" 2>/dev/null

  if [ $? != 0 ]; then
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
  fi
}
