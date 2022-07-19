#!/bin/bash

BRANCH=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
echo "BRANCH: ${BRANCH}"
CHECK=$(git log origin/${BRANCH}..${BRANCH} | cat)
echo "HERE: ${CHECK}"
if [[ "${CHECK}" == "" ]]; then
    echo "absent"
else
    echo "present"
fi
