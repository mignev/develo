function _develo_root_dir {

  local current_dir="."

  while [ ! -d "$current_dir/$DEVELO_DIR" ]; do
    current_dir="$current_dir/.."
  done

  (builtin cd "$current_dir" && echo "$(pwd -P)")
}

is_function() { [[ "$(declare -Ff "$1")" ]]; }

#Predefine cd for autoload
# function cd {
#   local directory="$1";

#   # The case is:
#   # When you are using cd without any arugments ... have to go to the home dir
#   # And the or statement is when you are changing to dir with space
#   # like this one "Some\ Directory"
#   [[ $# -eq 0 ]] && builtin cd ||  builtin cd "$directory";

#   #RVM hooks pactch
#   [[ -n \"\${rvm_current_rvmrc:-""}\" && \"\$*\" == \".\" ]] && rvm_current_rvmrc=\"\" || true
#       is_function __rvm_cd_functions_set && __rvm_cd_functions_set

#   if [ -d "$DEVELO_DIR" ]; then
#     _develo_activate;
#   fi
# }
