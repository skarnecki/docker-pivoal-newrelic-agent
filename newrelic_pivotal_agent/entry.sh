#!/bin/bash

RABBITMQ_DEBUG=1
if [ -z "$NEWRELIC_AGENT_RABBITMQ_DEBUG" ]
then
  RABBITMQ_DEBUG=0
fi

AGENT_VEBOSE=1
if [ -z "$NEWRELIC_AGENT_VEBOSE" ]
then
  AGENT_VEBOSE=0
fi

echo "
newrelic:
  license_key: '${NEWRELIC_AGENT_LICENCE_KEY}'
  verbose: ${AGENT_VEBOSE}
agents:
  rabbitmq:
    management_api_url: '${NEWRELIC_AGENT_RABBITMQ_URL}'
    debug: ${RABBITMQ_DEBUG}
" > ./config/newrelic_plugin.yml

exec ./pivotal_agent
