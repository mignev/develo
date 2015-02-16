#!/usr/bin/env bash

if [ -d ~/.develo_project ]; then
  echo ""
  echo 'Develo is already installed!'
  echo ""
  echo 'If you want to update develo, type the following:'
  echo '    develo selfupdate'
else
  git clone https://github.com/mignev/develo.git ~/.develo_project
  echo '\nsource ~/.develo_project/develo.sh' >> ~/.bashrc
  source ~/.develo_project/develo.sh
fi
