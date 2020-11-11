#!/bin/bash

echo "Installing extensions"
if [ -x "$(command -v code)" ]; then
  code --install-extension rogalmic.bash-debug
  code --install-extension peterjausovec.vscode-docker
  code --install-extension ms-vscode.go
  code --install-extension pkief.material-icon-theme
  code --install-extension equinusocio.vsc-material-theme
  code --install-extension ms-vscode.powershell
  code --install-extension ms-python.python
  code --install-extension fabiospampinato.vscode-todo-plus
  exit 0
fi
#code --install-extension rogalmic.bash-debug
#code --install-extension peterjausovec.vscode-docker
#code --install-extension ms-vscode.go
#code --install-extension pkief.material-icon-theme
#code --install-extension equinusocio.vsc-material-theme
#code --install-extension ms-vscode.powershell
#code --install-extension ms-python.python
#code --install-extension fabiospampinato.vscode-todo-plus

