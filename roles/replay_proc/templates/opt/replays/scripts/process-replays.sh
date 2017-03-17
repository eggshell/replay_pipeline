#!/bin/bash

source /opt/venvs/replays/bin/activate

replayscan -R /opt/replays/replays_unprocessed | tail -n +2 | head -n -8 >> /opt/replays/starcraft_data.csv

mv /opt/replays/replays_unprocessed/*.SC2Replay /opt/replays/replays_processed
