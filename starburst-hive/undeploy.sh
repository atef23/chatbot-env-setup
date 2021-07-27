#!/usr/bin/env bash
printf "\n\n######## undeploy starburst hive ########\n"

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

oc project ${OC_PROJECT} && oc delete -f "${DIR}/resources/starburst-hive.yaml"
