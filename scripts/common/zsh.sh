#!/bin/bash

echo "Setting up zsh..."

git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh &> /dev/null
curl -s https://gist.githubusercontent.com/saelo/7614863612553a4647ae/raw/.zshrc > ~/.zshrc

# needs sudo to work passwordless
sudo chsh -s /usr/bin/zsh sam
