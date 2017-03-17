#!/bin/bash

source /opt/venvs/replays/bin/activate
source /opt/replays/scripts/openrc.sh

swift download -D /opt/replays/replays_unprocessed replays_unprocessed

IFS=$'\n'
for replay in $(swift list replays_unprocessed); do
  swift copy --destination /replays_processed/$replay replays_unprocessed $replay
  swift delete replays_unprocessed $replay
done
