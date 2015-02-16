
##
# http://misc.flogisoft.com/bash/tip_colors_and_formatting
##


function _develo_color_line {
  for i in {16..21} {21..16}; do
   echo -en "\x1B[38;5;${i}m#\x1B[0m\x1B[38;5;${i}m#\x1B[0m";
  done
}

function _develo_sad_color_line {
  for i in {124..129} {129..124}; do
   echo -en "\x1B[38;5;${i}m:-\x1B[0m\x1B[38;5;${i}m( \x1B[0m";
  done
}

function _develo_initalized_banner {
  # Color fun :)
  echo
  _develo_color_line;
  echo
  echo -en "#  \x1B[32mDevelo initialized! \x1B[0m#";
  echo
  _develo_color_line;
  echo
  echo
  echo "  Getting Started with"
  echo
  echo -e "      \x1B[1mdevelo help\x1B[0m"

}

function _develo_action_not_exist_banner {
  local cmd=$1;
  echo
  _develo_sad_color_line;
  echo
  echo
  echo -e "\x1B[31m   Sorry ... \x1B[0m\x1B[1m$cmd\x1B[0m\x1B[31m isn't exist in .develo/ \x1B[0m";
  echo -en "\x1B[1m      If you want ... create it by self!\x1B[0m";
  echo
  echo
  _develo_sad_color_line;
  echo
  echo
}


function _develo_actions_activate_banner {

  if [ ! -z "$DEVELO_AUTO_ACTIVATE" ]; then
    # Color fun :)
    echo
    _develo_color_line;
    echo
    echo -e "#   \x1B[1mDevelo detected    \x1B[0m#";
    echo -en "# \x1B[32m and it's activated! \x1B[0m#";
    echo
    _develo_color_line;
    echo
    echo
  else
    echo
    _develo_color_line;
    echo
    echo -en "#\x1B[32m Develo is activated! \x1B[0m#";
    echo
    _develo_color_line;
    echo
    echo
  fi
}

function _develo_detected_banner {
    # Color fun :)
    echo
    _develo_color_line;
    echo
    echo -e "#   \x1B[1mDevelo detected    \x1B[0m#";
    echo -e "#  \x1B[1m                    \x1B[0m#";
    echo -e "#  \x1B[32m develo activate    \x1B[0m#";
    echo -e "#  \x1B[1m                    \x1B[0m#";
    echo -en "# \x1B[1m  to activate it!    \x1B[0m#";
    echo
    _develo_color_line;
    echo
    echo
}

function _develo_actions_deploy_banner {
  echo
  _develo_color_line;
  echo
  echo -en "#\x1B[32m  Deploying started!  \x1B[0m#";
  echo
  _develo_color_line;
  echo
  echo
}

function _develo_actions_db_banner {
  echo
  _develo_color_line;
  echo
  echo -en "#\x1B[32m   Connecting to DB!  \x1B[0m#";
  echo
  _develo_color_line;
  echo
  echo
}

function _develo_actions_server_banner {
  echo
  _develo_color_line;
  echo
  echo -en "#\x1B[32m     Start Server!    \x1B[0m#";
  echo
  _develo_color_line;
  echo
  echo
}

function _develo_actions_selfupdate_banner {
  echo
  _develo_color_line;
  echo
  echo -en "#\x1B[32m   Updating Develo!   \x1B[0m#";
  echo
  _develo_color_line;
  echo
  echo
}

function _develo_version_banner {
  local version=$1;
  # Color fun :)
  echo
  _develo_color_line;
  echo
  echo -en "#     \x1B[32mDevelo ${DEVELO_VERSION}\x1B[0m    #";
  echo
  _develo_color_line;
  echo
}
