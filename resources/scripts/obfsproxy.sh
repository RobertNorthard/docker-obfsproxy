#!/bin/sh

if [ "${DEBUG}" == "true" ]
  then
   set -x
fi

if ! [[ ${OBFSPROXY_ROLE} == 'client' || ${OBFSPROXY_ROLE} == 'server' ]]; then
  echo "Usage: obfsproxy.sh <client|server>"
  exit 1
fi

COMMAND="obfsproxy --log-min-severity=$LOG_MIN_SEVERITY \
              --data-dir=$DATA_DIR \
              scramblesuit \
              --dest=$DESTINATION_ADDRESS:$DESTINATION_PORT \
              ${OBFSPROXY_ROLE} \
              $LISTEN_ADDRESS:$LISTEN_PORT"

# If password blank generate a new one
if [ -z ${PASSWORD} ] && [ ${OBFSPROXY_ROLE} = "server" ]; then

	PASSWORD=$(python -c 'import base64, os; print base64.b32encode(os.urandom(20))')

cat <<EOF

Starting obfsproxy.
Password:${PASSWORD}
Listening on ${LISTEN_ADDRESS}:${LISTEN_PORT}

EOF

elif [ -z ${PASSWORD} ] && [ ${OBFSPROXY_ROLE} = "client" ]; then
  echo "The PASSWORD environment variable must be set when operating obfsproxy in client mode."
  exit 1
fi

COMMAND="${COMMAND} --password=${PASSWORD}"

eval "${COMMAND}"
