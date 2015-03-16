#!/bin/bash

salt -v 'zookeeper*' state.highstate --state-output=mixed
