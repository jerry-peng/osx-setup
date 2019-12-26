echo "Configuring OSX..."
# Credit: https://github.com/codeinthehole
# Resources:
# https://gist.github.com/codeinthehole/26b37efa67041e1307db

# Set fast key repeat rate
defaults write NSGlobalDomain KeyRepeat -int 0

# Show filename extensions by default
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

echo "Configuring git..."
read -p "Git Name: " name
read -p "Git Email: " email
git config --global user.name "$name"
git config --global user.email "$email"
git config --global core.excludesfile '~/.gitignore'

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
