#!/bin/bash

source /opt/venvs/replays/bin/activate

replayscan -R /opt/replays/starcraft_replays > /opt/replays/starcraft_data.csv
