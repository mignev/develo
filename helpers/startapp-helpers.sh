function __develo_startapp_mongodb_helper {
  local APPNAME=$1
  local NAMESPACE=$2
  local MONGODB_LOCAL_PORT=$3

  local MONGO_CONNECTED=$(ps aux| grep "$APPNAME-.*27017"| grep -v grep)

  if [ -z "$MONGO_CONNECTED" ]; then
    echo "Connecting to MongoDB on StartApp"
    local SSH_HOST=$(app show $APPNAME -n $NAMESPACE --gears ssh)
    local MONGO_HOST=$(app ssh $APPNAME -n $NAMESPACE 'env|grep OPENSHIFT_MONGODB_DB_URL')
    local MONGO_HOST=$(echo $MONGO_HOST| tr ' ' '\n'| grep OPENSHIFT_MONGODB_DB_URL=|sed 's/\///g'| sed 's/@/\:/g')

    [[ "$MONGO_HOST" =~ ^OPENSHIFT_MONGODB_DB_URL=mongodb:(.*):(.*):(.*):(.*)$ ]] && \
    local _MONGO_USER=${BASH_REMATCH[1]}
    local _MONGO_PASS=${BASH_REMATCH[2]}
    local _MONGO_REMOTE_HOST=${BASH_REMATCH[3]}
    local _MONGO_REMOTE_PORT=${BASH_REMATCH[4]}

    export STARTAPP_MONGODB_DATABASE=$APPNAME
    export STARTAPP_MONGODB_USER=$_MONGO_USER
    export STARTAPP_MONGODB_PASS=$_MONGO_PASS
    export STARTAPP_MONGODB_HOST=127.0.0.1
    export STARTAPP_MONGODB_PORT=$MONGODB_LOCAL_PORT
    export STARTAPP_MONGODB_URI=127.0.0.1:$MONGODB_LOCAL_PORT

    ssh $SSH_HOST -f -N -L $MONGODB_LOCAL_PORT:$_MONGO_REMOTE_HOST:$_MONGO_REMOTE_PORT
    local MONGO_CONNECTED=$(ps aux| grep "$APPNAME-.*27017"| grep -v grep)
    if [ -n "$MONGO_CONNECTED" ]; then
      echo "MongoDB connected!"
    fi
  else
    echo "MongoDB is already connected!"
  fi
}
