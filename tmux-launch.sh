#!/bin/zsh

SHELL_WINDOW_NAME="shell"
EDITOR_WINDOW_NAME="editor"

SESSION="dotfiles"
# Check if session exists
tmux has-session -t $SESSION 2>/dev/null

if [ $? != 0 ]; then
  # Create new session detached
  tmux new-session -d -s $SESSION

  # Rename current window
  tmux rename-window -t $SESSION:0 ${SHELL_WINDOW_NAME}

  # Create editor window
  tmux new-window -t ${SESSION} -n ${EDITOR_WINDOW_NAME}
  tmux send-keys -t $SESSION:${EDITOR_WINDOW_NAME} 'cd ${WORKSPACE}/dotfiles' C-m
  tmux send-keys -t $SESSION:${EDITOR_WINDOW_NAME} 'vim .' C-m

  tmux select-window -t $SESSION:${SHELL_WINDOW_NAME}
fi
