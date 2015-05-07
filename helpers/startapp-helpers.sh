###
# StartApp Cloud MongoDB Helper
###

function __develo_startapp_mongodb_helper {
  local APPNAME=$1
  local NAMESPACE=$2

  local LOCAL_PORT=$3
  local LOCAL_PORT=${LOCAL_PORT:=27017}

  local HELPER_NAME="MongoDB"
  local ENV_VAR_DB_NAME="OPENSHIFT_MONGODB_DB_URL"

  __develo_startapp_database_helper $APPNAME $NAMESPACE $LOCAL_PORT $HELPER_NAME $ENV_VAR_DB_NAME
}

###
# StartApp Cloud MySQL Helper
###

function __develo_startapp_mysql_helper {
  local APPNAME=$1
  local NAMESPACE=$2

  local LOCAL_PORT=$3
  local LOCAL_PORT=${LOCAL_PORT:=3306}

  local HELPER_NAME="MySQL"
  local ENV_VAR_DB_NAME="OPENSHIFT_MYSQL_DB_URL"

  __develo_startapp_database_helper $APPNAME $NAMESPACE $LOCAL_PORT $HELPER_NAME $ENV_VAR_DB_NAME
}

###
# StartApp Cloud PostgreSQL Helper
###

function __develo_startapp_postgresql_helper {
  local APPNAME=$1
  local NAMESPACE=$2

  local LOCAL_PORT=$3
  local LOCAL_PORT=${LOCAL_PORT:=5432}

  local HELPER_NAME="PostgreSQL"
  local ENV_VAR_DB_NAME="OPENSHIFT_POSTGRESQL_DB_URL"

  __develo_startapp_database_helper $APPNAME $NAMESPACE $LOCAL_PORT $HELPER_NAME $ENV_VAR_DB_NAME
}


function __develo_startapp_database_helper {

  local APPNAME=$1
  local NAMESPACE=$2

  local LOCAL_PORT=$3
  local LOCAL_PORT=${LOCAL_PORT:=27017}

  local _HELPER_NAME=$4
  local _ENV_DB_NAME=$5

  local _HOST=$(app ssh $APPNAME -n $NAMESPACE "env|grep $_ENV_DB_NAME")
  local _HOST=$(echo $_HOST| tr ' ' '\n'| grep $_ENV_DB_NAME=|sed 's/\///g'| sed 's/@/\:/g')

  local _HELPER_LOWER_NAME=$(echo "$_HELPER_NAME"| tr '[:upper:]' '[:lower:]')
  local _HELPER_UPPER_NAME=$(echo "$_HELPER_NAME"| tr '[:lower:]' '[:upper:]')

  [[ "$_HOST" =~ ^${_ENV_DB_NAME}=${_HELPER_LOWER_NAME}:(.*):(.*):(.*):(.*)$ ]] && \
    local _USER=${BASH_REMATCH[1]}
    local _PASS=${BASH_REMATCH[2]}
    local _REMOTE_HOST=${BASH_REMATCH[3]}
    local _REMOTE_PORT=${BASH_REMATCH[4]}

  local IS_CONNECTED=$(ps aux| grep "$APPNAME-.*$LOCAL_PORT"| grep -v grep)

  if [ -z "$IS_CONNECTED" ]; then
    echo "Connecting to $_HELPER_NAME on StartApp"

    local SSH_HOST=$(app show $APPNAME -n $NAMESPACE --gears ssh | grep "$APPNAME-$NAMESPACE")

    ssh $SSH_HOST -f -N -L $LOCAL_PORT:$_REMOTE_HOST:$_REMOTE_PORT
    local IS_CONNECTED=$(ps aux| grep "$APPNAME-.*$LOCAL_PORT"| grep -v grep)
    if [ -n "$IS_CONNECTED" ]; then
      echo "$_HELPER_NAME connected!"
    else
      echo "Uuups: There's a problem with $_HELPER_NAME connection. Cannot connect! :("
    fi
  else
    echo "$_HELPER_NAME is already connected!"
  fi

  export STARTAPP_${_HELPER_UPPER_NAME}_DATABASE=$APPNAME
  export STARTAPP_${_HELPER_UPPER_NAME}_USER=$_USER
  export STARTAPP_${_HELPER_UPPER_NAME}_PASS=$_PASS
  export STARTAPP_${_HELPER_UPPER_NAME}_HOST=127.0.0.1
  export STARTAPP_${_HELPER_UPPER_NAME}_PORT=$LOCAL_PORT
  export STARTAPP_${_HELPER_UPPER_NAME}_URI=127.0.0.1:$LOCAL_PORT

  echo ""
  echo "You can access your database via these ENV VARS."
  echo "They are already exported and ready to use."
  echo ""
  echo "  STARTAPP_${_HELPER_UPPER_NAME}_DATABASE"
  echo "  STARTAPP_${_HELPER_UPPER_NAME}_USER"
  echo "  STARTAPP_${_HELPER_UPPER_NAME}_PASS"
  echo "  STARTAPP_${_HELPER_UPPER_NAME}_HOST"
  echo "  STARTAPP_${_HELPER_UPPER_NAME}_PORT"
  echo "  STARTAPP_${_HELPER_UPPER_NAME}_URI"
  echo ""

}
