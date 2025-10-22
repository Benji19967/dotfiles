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

    # Rename current window
    tmux rename-window -t "$SESSION:0" "$SHELL_WINDOW_NAME"

    # Create editor window
    tmux new-window -t "$SESSION" -n "$EDITOR_WINDOW_NAME"
    tmux send-keys -t "$SESSION:$EDITOR_WINDOW_NAME" "cd $WORKSPACE/$SESSION" C-m
    tmux send-keys -t "$SESSION:$EDITOR_WINDOW_NAME" "vim ." C-m

    # Go back to shell window
    tmux select-window -t "$SESSION:$SHELL_WINDOW_NAME"
  fi

  # Attach to the session
  tmux attach-session -t "$SESSION"
}
