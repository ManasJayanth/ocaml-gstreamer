#! /bin/bash

if [[ "$TRAVIS_OS_NAME" == "linux" ]]; then
    docker build -t ocaml-gi/${TYPE} -f ./.ci/Dockerfile.${TYPE} .
    docker run --name ocaml-gi-${TYPE} -dit -v $PWD:/ocaml-gstreamer ocaml-gi/${TYPE} bash
    docker exec -w /ocaml-gstreamer ocaml-gi-${TYPE} bash /ocaml-gstreamer/.ci/install-deps.opam.sh
elif [[ "$TRAVIS_OS_NAME" == "osx" ]]; then
    bash ./.ci/install-deps.brew.sh
    bash ./.ci/install-deps.opam.sh
fi
