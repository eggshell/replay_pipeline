#!/bin/bash

source /opt/venvs/replays/bin/activate
source /opt/replays/scripts/openrc.sh

swift download -D /opt/replays/replays_unprocessed replays_unprocessed

for replay in $(swift list replays_processed); do
  swift copy --destination replays/processed replays_unprocessed $replay
  swift delete replays_unprocessed $replay
done
