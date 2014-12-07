#!/bin/sh

echo "Setting up zsh..."

git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh > /dev/null 2>&1
curl -s https://gist.githubusercontent.com/saelo/7614863612553a4647ae/raw/.zshrc > ~/.zshrc

# needs sudo to work passwordless
sudo chsh -s $(which zsh) $(whoami)
