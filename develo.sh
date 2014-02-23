#!/bin/bash

DEVELO_VERSION="0.0.1"
DEVELO_CONF_DIR=${HOME}/.develo_project
#have to be in every directory that you want to use develo
DEVELO_DIR=".develo"

#Predefine cd for autoload
function cd {
  builtin cd $@;

  if [ -d "$DEVELO_DIR" ]; then
    _develo_activate;
  fi
}

# Colorful banners :)
# You will see them when you init new env
# or when activate env and so on :)
source "${BASH_SOURCE%/*}/banners.sh"

function _develo_root_dir {

  local current_dir="."

  while [ ! -d "$current_dir/.develo" ]; do
    current_dir="$current_dir/.."
  done

  (cd "$current_dir" && echo "$(pwd -P)")
}

function develo {
  local cmd=$1;

  if [ "$cmd" == "init" ]; then
    _develo_init;
    return 0;
  fi

  if [ "$cmd" == "help" ]; then
    _develo_help;
    return 0;
  fi

  if [ "$cmd" == "activate" ]; then
    _develo_activate 1;
    return 0;
  fi

  if [ ! -z "$cmd" ]; then
    _develo_run $@;
    return 0;
  fi

  _develo_help;
  return 0;
}

function _develo_help {

  echo "usage: develo <command>"
  echo

  if [ -d "$DEVELO_DIR" ]; then
    echo -e "\x1B[1mSome things that you have to know:\x1B[0m"
    echo ""
    echo "  Your scripts are here: $(pwd)/$DEVELO_DIR/"
  fi
}

function _develo_run {
  local cmd=$1;
  local args=${@:2};
  local file="$(_develo_root_dir)/$DEVELO_DIR/$cmd"

  if [ -f $file ]; then
    bash $file;
    return 0;
  else
    _develo_action_not_exist_banner $cmd;
    return 1;
  fi
}

function _develo_init {

  # Create .develo dir if doesn't exists
  if [ ! -d "$DEVELO_DIR" ]; then

    cp -R $DEVELO_CONF_DIR/actions $(pwd)/$DEVELO_DIR;
    chmod +x $(pwd)/$DEVELO_DIR/*;

    _develo_initalized_banner;
    # echo "Initialized fresh Develo in $(pwd)/$DEVELO_DIR/";
    return 0;
  else
    echo "Develo is already initialized in $(pwd)/$DEVELO_DIR/";
    return 0;
  fi
}

function _develo_activate {

  local manual_activation=$1;

  if [[ ! "$PS1" =~ "Develo" ]]; then

    # Show this banner on activating every time
    # except when develo is activate manualy "develo activate"
    if [ -z "$manual_activation" ]; then
      _develo_auto_activating_banner;
    fi

    local cwd=$(basename "$PWD");

    PS1="\n(Develo#$cwd)$PS1";
    _develo_run activate;
  fi

  # This will show up when develo
  # is activated by command "develo activate"
  if [ ! -z "$manual_activation" ]; then
    _develo_activating_banner;
    _develo_run activate;
  fi
}

function _develo_decativate {
  echo "Deactivating Develo ..."
  echo "Not implemented yet..."
  return 0;
}

function _develo_update {
  echo "Updating Develo ..."
  echo "Not implemented yet..."
  return 0;
}