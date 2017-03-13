#!/bin/bash

source /opt/venvs/replays/bin/activate

replayscan -R /tmp/replays_unprocessed >> /tmp/starcraft_data.csv
