#!/bin/bash

# Make config directory
NEOVIM_CONFIG_DIR="$HOME/.config/nvim/"
mkdir -p $NEOVIM_CONFIG_DIR

# Make config file symbolic link
SCRIPT_DIR=$(cd $(dirname $0); pwd)
ln -sf "$SCRIPT_DIR/init.vim" $NEOVIM_CONFIG_DIR
ln -sf "$SCRIPT_DIR/ftplugin" $NEOVIM_CONFIG_DIR

# Install dein
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > $SCRIPT_DIR/dein_installer.sh
chmod 755 $SCRIPT_DIR/dein_installer.sh
$SCRIPT_DIR/dein_installer.sh $HOME/.cache/dein
rm $SCRIPT_DIR/dein_installer.sh

echo "You have successfully set up the NeoVim."
