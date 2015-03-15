#!/bin/bash

salt 'zookeeper*' state.highstate --state-output=mixed
