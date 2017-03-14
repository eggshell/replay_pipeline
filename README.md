# replay_pipeline

Playbooks to deploy multi-node pipeline for Starcraft II replay processing.

## Overview

<p align="center">
  <img src="https://github.com/eggshell/replay_pipeline/blob/master/replay_pipeline.png?raw=true" alt="Replay Pipeline Diagram"/>
</p>

## Requirements

* One or more Windows 7/8/10 boxes with a StarCraft II installation.
* One or more linux hosts.
* Access to a [BlueMix Object Storage](https://console.ng.bluemix.net/catalog/object-storage/) account.
* Access to a [Watson Analytics](https://www.ibm.com/analytics/watson-analytics/us-en/) account.
* People who play StarCraft and want to know more about how they play!

## Installation

1. Clone this repo:

   ```shell
   git clone https://github.com/eggshell/replay_pipeline.git
   ```

1. Install python requirements (use of a virtualenv is recommended):

   ```shell
   pip install -r requirements.txt
   ```

1. Fill out `inventory/hosts`, `inventory/group_vars/windows` and `inventory/group_vars/all.yml` with your secrets.

1. Run `site.yml`:

   ```
   ansible-playbook -vvvv -i inventory/hosts site.yml
   ```

## Usage

Once the installation is complete on all machines, all you need to do is play a game of StarCraft II! All `.SC2Replay` files will be pushed through your shiny new pipeline and you'll get some neat graphs to look at in your Watson Analytics account.

## Support

Please use the [Issue Tracker](https://github.com/eggshell/replay_pipeline/issues)
for bug reports and feature requests.

## Contributing

Please contribute using [GitHub Flow](https://guides.github.com/introduction/flow/).
Create a branch, add commits,
and [open a pull request](https://github.com/eggshell/replay_pipeline/compare/).

## Acknowledgements
