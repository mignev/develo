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
  echo -en "\x1B[1m       If you want ... crate it by self!\x1B[0m";
  echo
  echo
  _develo_sad_color_line;
  echo
  echo
}

function _develo_auto_activating_banner {
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
}

function _develo_activating_banner {
  echo
  _develo_color_line;
  echo
  echo -en "#\x1B[32m Develo is activated! \x1B[0m#";
  echo
  _develo_color_line;
  echo
  echo
}