#!/bin/zsh

# Credit: https://github.com/codeinthehole
# Resources:
# https://gist.github.com/codeinthehole/26b37efa67041e1307db

echo "Configuring..."

# Disabling write permissions and updating owner of zshr directories since insecure directories
echo "Disable write permission, and update owner for zsh directory"
sudo chmod -R 755 /usr/local/share/zsh
sudo chown -R root:staff /usr/local/share/zsh

echo "Installing tmux plugins..."
# Start new server and session without attaching
tmux start-server
tmux new-session -d
# Source tmux conf
tmux source ~/.tmux.conf
# Install the plugins
~/.tmux/plugins/tpm/scripts/install_plugins.sh
# Kill server
tmux kill-server

echo "Installing vim plugins..."
vim + 'PlugInstall --sync' +qa

source ~/.zshrc
