#!/usr/bin/env bash

function Install_Git_Prompt_Hook() {
  if [[ $(grep -q '##GIT_PROMPT_HOOK##' $HOME/.bashrc) ]]; then
    echo "[SKIP] Git prompt hook is already installed in ${HOME}/.bashrc"
  else
cat >> "$HOME/.bashrc" << EOF
##GIT_PROMPT_HOOK##
if [ -f "$HOME/.bash-git-prompt/gitprompt.sh" ]; then
  GIT_PROMPT_ONLY_IN_REPO=1
  # GIT_PROMPT_FETCH_REMOTE_STATUS=0   # uncomment to avoid fetching remote status
  # GIT_PROMPT_IGNORE_SUBMODULES=1 # uncomment to avoid searching for changed files in submodules
  # GIT_PROMPT_WITH_VIRTUAL_ENV=0 # uncomment to avoid setting virtual environment infos for node/python/conda environments
  # GIT_PROMPT_SHOW_UPSTREAM=1 # uncomment to show upstream tracking branch
  # GIT_PROMPT_SHOW_UNTRACKED_FILES=normal # can be no, normal or all; determines counting of untracked files
  # GIT_PROMPT_SHOW_CHANGED_FILES_COUNT=0 # uncomment to avoid printing the number of changed files
  # GIT_PROMPT_START=...    # uncomment for custom prompt start sequence
  # GIT_PROMPT_END=...      # uncomment for custom prompt end sequence
  # as last entry source the gitprompt script
  # GIT_PROMPT_THEME=Custom # use custom theme specified in file GIT_PROMPT_THEME_FILE (default ~/.git-prompt-colors.sh)
  # GIT_PROMPT_THEME_FILE=~/.git-prompt-colors.sh
  GIT_PROMPT_THEME=Solarized # use theme optimized for solarized color scheme
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