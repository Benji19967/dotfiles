#!/bin/bash

session="housing"

tmux new-session -d -s $session

window=0
tmux rename-window -t $session:$window 'workspace'
tmux send-keys -t $session:$window 'cd $CODE_REPO/housing' C-m
tmux send-keys -t $session:$window 'source env/bin/activate' C-m
tmux send-keys -t $session:$window 'vim .' C-m

tmux split-window -t $session:$window -h
tmux send-keys -t $session:$window 'cd $CODE_REPO/housing' C-m
tmux send-keys -t $session:$window 'source env/bin/activate' C-m
tmux send-keys -t $session:$window 'clear' C-m

window=1
tmux new-window -t $session:$window -n 'example-second-window'
tmux send-keys -t $session:$window 'cd $CODE_REPO/housing' C-m
tmux send-keys -t $session:$window 'source env/bin/activate' C-m
tmux send-keys -t $session:$window 'vim .' C-m
