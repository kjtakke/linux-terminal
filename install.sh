#!/bin/bash

# Exit on any error
set -e

echo "🔧 Installing Zsh..."
sudo apt update
sudo apt install zsh curl git wget unzip -y

echo "💡 Installing Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "🚀 Installing Starship prompt..."
curl -sS https://starship.rs/install.sh | sh -s -- -y

echo "📦 Installing Zsh plugins..."

ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

# Autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM}/plugins/zsh-autosuggestions"

# Syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting"

# Fast syntax highlighting
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git "${ZSH_CUSTOM}/plugins/fast-syntax-highlighting"

# Autocomplete
git clone https://github.com/marlonrichert/zsh-autocomplete.git "${ZSH_CUSTOM}/plugins/zsh-autocomplete"

echo "🎨 Setting up Starship preset..."
mkdir -p ~/.config
starship preset gruvbox-rainbow -o ~/.config/starship.toml

echo "🔤 Installing Nerd Font (DroidSansMono)..."
mkdir -p ~/.fonts
cd ~/.fonts
wget -q https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/DroidSansMono.zip
unzip -o DroidSansMono.zip
fc-cache -fv
cd ~

echo "⚙️ Updating ~/.zshrc..."

# Backup existing .zshrc
cp ~/.zshrc ~/.zshrc.backup

cat > ~/.zshrc <<EOF
export ZSH="\$HOME/.oh-my-zsh"
ZSH_THEME="agnoster"

plugins=(
  git
  zsh-autosuggestions
  fast-syntax-highlighting
  zsh-syntax-highlighting
)

source \$ZSH/oh-my-zsh.sh

# Initialise Starship prompt
eval "\$(starship init zsh)"

# Load zsh-autocomplete LAST
source \$ZSH/custom/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
EOF

echo "💻 Setting Zsh as the default shell..."
chsh -s "$(which zsh)"

echo "✅ Installation complete! Please restart your terminal or run: exec zsh"
