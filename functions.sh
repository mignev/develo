function _develo_root_dir {

  local current_dir="."

  while [ ! -d "$current_dir/$DEVELO_DIR" ]; do
    current_dir="$current_dir/.."
  done

  (cd "$current_dir" && echo "$(pwd -P)")
}

is_function() { [[ "$(declare -Ff "$1")" ]]; }

#Predefine cd for autoload
function cd {
  builtin cd $@;

  #RVM hooks pactch
  [[ -n \"\${rvm_current_rvmrc:-""}\" && \"\$*\" == \".\" ]] && rvm_current_rvmrc=\"\" || true
      is_function __rvm_cd_functions_set && __rvm_cd_functions_set

  if [ -d "$DEVELO_DIR" ]; then
    _develo_activate;
  fi
}