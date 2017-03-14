#!/bin/bash

source /opt/venvs/replays/bin/activate

replayscan -R /opt/replays/replays_unprocessed >> /opt/replays/starcraft_data.csv
