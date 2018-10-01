# Loading develo build in helpers
for helper in ${DEVELO_CONF_DIR}/helpers/*
do
    source $helper
done

if [ -d "$DEVELO_PRIVATE_HELPERS_DIR" ]; then
  # Loading private helpers
  for helper in $DEVELO_PRIVATE_HELPERS_DIR/*
  do
      source $helper
  done
fi
