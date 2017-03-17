#!/bin/bash

function refresh_token {
  curl -X POST -H "X-IBM-Client-Id: {{ watson_secrets.client_id }}"         \
               -H "X-IBM-Client-Secret: {{ watson_secrets.client_secret }}" \
               -H "Content-Type: multipart/form-data"                       \
               -F "grant_type=refresh_token"                                \
               -F "refresh_token={{ watson_secrets.refresh_token }}"        \
                  "{{ auth_link }}"
}

function main {
  access_token=$(refresh_token | jq -r '.access_token')

  curl -X PUT -H "X-IBM-Client-Id: {{ watson_secrets.client_id }}"         \
              -H "X-IBM-Client-Secret: {{ watson_secrets.client_secret }}" \
              -H "Authorization: Bearer $access_token"                     \
              -H "Content-Type:text/csv"                                   \
              -F "data=@/opt/replays/starcraft_data.csv"                        \
                 "{{ dataset_link }}/{{ watson_secrets.dataset_id }}/content"
}

main "$@"
