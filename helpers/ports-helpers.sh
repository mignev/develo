function __develo_ports_find_free_port {
  local default_port=$1;
  local free_ports=$(netstat -ant | sed -e '/^tcp/ !d' -e 's/^[^ ]* *[^ ]* *[^ ]* *.*[\.:]\([0-9]*\) .*$/\1/' | sort -g | uniq)

  local check_default_port=$(echo $free_ports| grep $default_port)

  if [ -z "$check_default_port" ]; then
    echo $default_port;
    return 0;
  else
    for new_port in $(seq $default_port 65000); do
      local free_port=$(echo $free_ports| grep $new_port)
      if [ -z "$free_port" ]; then
        echo $new_port;
        return 0;
      fi
    done
  fi

}
