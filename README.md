# 🌟 Zsh Shell Setup with Oh My Zsh + Starship + Plugins
`git clone https://github.com/kjtakke/linux-terminal.git && bash linux-terminal/install.sh && rm -rf linux-terminal`
## 🛠️ Installation

```bash
sudo apt install zsh -y

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

starship init zsh


curl -sS https://starship.rs/install.sh | sh

eval "$(starship init zsh)"


# zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# fast-syntax-highlighting
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting

# zsh-autocomplete
git clone https://github.com/marlonrichert/zsh-autocomplete.git \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autocomplete

```

## 🔌 Enable Plugins

Clone these into the custom plugin directory:
`~/.zshrc`
```bash
starship init zsh


curl -sS https://starship.rs/install.sh | sh

eval "$(starship init zsh)"


# zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# fast-syntax-highlighting
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting

# zsh-autocomplete
git clone https://github.com/marlonrichert/zsh-autocomplete.git \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autocomplete

```


* * *

## ⚙️ Configure `~/.zshrc`

```bash
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="agnoster"

plugins=(git zsh-autosuggestions fast-syntax-highlighting zsh-syntax-highlighting)

# Starship prompt
eval "$(starship init zsh)"

# Load zsh-autocomplete LAST
source ~/.oh-my-zsh/custom/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh

```

* * *

## 🔤 Fonts (for Powerline & Nerd Font Support)

```bash
starship preset gruvbox-rainbow -o ~/.config/starship.toml
mkdir -p ~/.fonts
cd ~/.fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/DroidSansMono.zip
unzip DroidSansMono.zip
source $ZSH/oh-my-zsh.sh
```
`.config/starship.toml`
```toml
# ~/.config/starship.toml

format = """
$username $directory$git_branch$git_status$nodejs$python$time
$character
"""

[username]
show_always = true
style_user = "bold fg:green"
format = "[$user]($style)"

[directory]
style = "bold fg:blue"
truncation_length = 3
truncate_to_repo = false
format = " in [$path]($style) "

[git_branch]
symbol = "🌿 "
style = "bold fg:purple"
format = "on [$symbol$branch]($style) "

[git_status]
style = "fg:yellow"
format = "[$all_status]($style)"

[nodejs]
symbol = "⬢ "
style = "fg:green"
format = "via [$symbol$version]($style) "

[python]
symbol = "🐍 "
style = "fg:cyan"
format = "via [$symbol$version]($style) "

[time]
disabled = false
time_format = "%H:%M"
style = "fg:yellow"
format = " [$time]($style)"

[character]
success_symbol = "[❯](bold fg:green) "
error_symbol = "[✗](bold fg:red) "
```

* * *

## ✅ Make Zsh Your Default Shell

```bash
chsh -s /usr/bin/zsh
```
