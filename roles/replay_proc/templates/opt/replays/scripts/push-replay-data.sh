#!/bin/bash

replay_data=$(cat /opt/replays/replay_data)

curl -v -X PUT -H "X-IBM-Client-Id:{{ watson_secrets.client_id }}"          \
               -H "X-IBM-Client-Secret:{{ watson_secrets.client_secret }}"  \
               -H "Authorization: Bearer {{ watson_secrets.access_token }}" \
               -H "Content-Type:text/csv"                                   \
               "{{ dataset_link }}/{{ watson_secrets.dataset_id }}/content" \
               -d "$replay_data"