#!/bin/bash

source /opt/venvs/replays/bin/activate

replayscan -R /tmp/replays_unprocessed >> /opt/replays/replay_data.csv
