#!/bin/bash

source /opt/venvs/replays/bin/activate
source /opt/replays/scripts/openrc.sh

swift download -D /opt/replays/starcraft_replays starcraft_replays
