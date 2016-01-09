function __develo_load_env_file_helper {
  local develoenv_file=$1
  if [ -f "$develoenv_file" ]; then
    source "$develoenv_file";
  fi
}

# Optional entry point for any develo project script
# Returns 1 if no function is executed
# Usage in i.e. `.develo/server`:
# __develo_run_helper $@
# How function names are resolved:
# $ develo server
# _run_server will be executed from within .develo/server (if found)
# $ develo server start
# _run_server_start will be executed from within .develo/server (if found)
# fallabacks to _run_server start (if found)
function __develo_run_helper {
  local cmd=$1;
  local args=${@:2};
  local sub;
  local func;

  func="_run_$cmd";

  # run sub command function if available
  # i.e. _run_server_start
  if [ ! -z $2 ]; then
    sub="${func}_$2";

    if _develo_private_check_function_exists $sub; then
      ${sub} $args;
      return 0;
    fi
  fi

  # run command function if available
  # i.e. _run_server
  if _develo_private_check_function_exists $func; then
    ${func} $args;
    return 0;
  fi

  return 1;
}

# Develo private function - check if function is declared
function _develo_private_check_function_exists {
  declare -f ${1} > /dev/null;
  return $?;
}
