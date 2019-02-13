#! /bin/bash

if [[ "$TRAVIS_OS_NAME" == "linux" ]]; then
    docker exec -w /ocaml-gstreamer ocaml-gi-${TYPE} bash /ocaml-gstreamer/.ci/run-tests.opam.sh
elif [[ "$TRAVIS_OS_NAME" == "osx" ]]; then
    bash ./.ci/run-tests.opam.sh
fi
