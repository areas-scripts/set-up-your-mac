#!/bin/bash

# to make this executable:
# chmod +x set-up-mac.sh

# ====================================
# Install Command Line Tools for Xcode
# ====================================
echo "Installing Command Line Tools for Xcode..."
xcode-select --install

# ================
# Install Homebrew
# ================
echo "Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew tap homebrew/cask-versions
brew tap homebrew/cask-drivers
brew tap homebrew/cask-fonts

# =====================
# Install App Store CLI
# =====================
echo "Installing App Store CLI..."
brew install mas

# ===============================
# Install Apps from the App Store
# ===============================
# 640199958   Apple Developer
# 937984704   Amphetamine
# 1055511498  Day One
# 1482920575  DuckDuckGo Privacy Essentials
# 424389933   Final Cut Pro
# 682658836   GarageBand
# 775737590   iA Writer
# 408981434   iMovie
# 409183694   Keynote
# 462058435   Microsoft Excel
# 462054704   Microsoft Word
# 409203825   Numbers
# 1474884867  Orchid
# 409201541   Pages
# 967805235   Paste
# 803453959   Slack
# 1176895641  Spark
# 1153157709  Speedtest
# 1496833156  Swift Playgrounds
# 1147396723  WhatsApp
# 497799835   Xcode
echo "Installing apps from the App Store..."
mas install \
  640199958 \
  937984704 \
  409183694 \
  409203825 \
  409201541 \
  1055511498 \
  1482920575 \
  424389933 \
  682658836 \
  775737590 \
  408981434 \
  462058435 \
  462054704 \
  1474884867 \
  967805235 \
  803453959 \
  1176895641 \
  1153157709 \
  1496833156 \
  1147396723 \
  497799835

# ===============================
# Install Apps from Homebrew Cask
# ===============================
echo "Installing apps from Homebrew Cask..."
brew install --cask \
  appcleaner \
  brave-browser \
  discord \
  elgato-control-center \
  firefox \
  google-chrome \
  karabiner-elements \
  qmk-toolbox \
  safari-technology-preview \
  stoplight-studio \
  via \
  visual-studio-code \
  zoom

# ===================
# Download Other Apps # todo: find a way to install these apps
# ===================
echo "Downloading other apps..."
brew install wget
cd ~/Downloads
wget https://software.vc.logitech.com/downloads/tune/LogiTuneInstaller.dmg
open ~/Downloads/LogiTuneInstaller.dmg
cd -

# =============
# Configure git 
# =============
echo "Configuring git..."
git config --global init.defaultBranch main
git config --global user.name "Christian Areas"
git config --global user.email me@areas.me
git config -l

# ===============================
# Configure GitHub and GitHub CLI
# ===============================
echo "Configuring GitHub..."
ssh-keygen -t ed25519 -C "$(whoami)@$(hostname -s)"
eval "$(ssh-agent -s)"
cp files/config ~/.ssh/config
ssh-add --apple-use-keychain ~/.ssh/id_ed25519
brew install gh
gh ssh-key add ~/.ssh/id_ed25519.pub

# ===========
# Install NVM
# ===========
echo "Installing NVM..."
brew install nvm
mkdir ~/.nvm
cp files/.zshrc ~/.zshrc

# ==============
# Install Gatsby
# ==============
npm install -g gatsby-cli

# =============
# Install Fonts
# =============
echo "Installing fonts..."
brew install --cask \
  font-sf-pro \
  font-sf-compact \
  font-sf-mono \
  font-sf-arabic \
  font-new-york \
  font-ia-writer-duo \
  font-ia-writer-duospace \
  font-ia-writer-mono \
  font-ia-writer-quattro
  