#!/bin/bash

KCONTEXT="$(kubectl config current-context)"
KNAMESPACE="$(kubectl config view --minify --output 'jsonpath={..namespace}' 2>/dev/null)"

echo ${KCONTEXT}:${KNAMESPACE}
