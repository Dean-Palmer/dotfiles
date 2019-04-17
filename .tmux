set -g default-shell $SHELL

set -g base-index 1
setw -g pane-base-index 1
set -g history-limit 100000

unbind C-b
bind C-z send-prefix
set -g prefix C-z
