#!/bin/bash

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
brew tap homebrew/cask-versions
brew tap homebrew/cask-drivers
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

# ===============================
# Install Command Line Interfaces
# ===============================
echo "Installing command line interfaces from Homebrew..."
brew install \
  gh \
  wget

# ===========================
# Download Apps Not Installed
# ===========================
echo "Downloading apps..."
cd ~/Downloads
wget https://software.vc.logitech.com/downloads/tune/LogiTuneInstaller.dmg
open ~/Downloads

# =============
# Install Fonts
# =============
echo "Installing fonts..."
brew tap homebrew/cask-fonts
brew install --cask \
  font-sf-arabic \
  font-sf-compact \
  font-sf-mono \
  font-new-york \
  font-sf-pro \

# ===========
# Install NVM
# ===========
echo "Installing NVM..."
brew install nvm
mkdir ~/.nvm
echo '# nvm' > ~/.zshrc
echo '' >> ~/.zshrc
echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.zshrc
echo '[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh" # loads nvm' >> ~/.zshrc
echo '[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" # load nvm base_completion' >> ~/.zshrc
echo '' >> ~/.zshrc

# ==============
# Install Gatsby
# ==============
npm install -g gatsby-cli
