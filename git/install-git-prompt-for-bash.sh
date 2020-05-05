#!/usr/bin/env bash

function Install_Git_Prompt_Hook() {
  if [[ $(grep -q '##GIT_PROMPT_HOOK##' $HOME/.bashrc) ]]; then
    echo "[SKIP] Git prompt hook is already installed in ${HOME}/.bashrc"
  else
cat >> "$HOME/.bashrc" << EOF
##GIT_PROMPT_HOOK##
if [ -f "$HOME/.bash-git-prompt/gitprompt.sh" ]; then
  GIT_PROMPT_ONLY_IN_REPO=1
  GIT_PROMPT_THEME=Solarized
  source $HOME/.bash-git-prompt/gitprompt.sh
fi
EOF
  fi
}

function Pull_Git_Prompt_Repo() {
  git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1
}

Pull_Git_Prompt_Repo
Install_Git_Prompt_Hook