#!/bin/bash
params=$(config params)

if test "${params}"; then
  bash puck $params
else
  bash puck $args
fi


