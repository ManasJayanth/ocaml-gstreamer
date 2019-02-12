#! /bin/bash

if [[ "$TRAVIS_OS_NAME" == "linux" ]]; then
    . ./.ci/install-deps.ubuntu.sh
elif [[ "$TRAVIS_OS_NAME" == "osx" ]]; then
    . ./.ci/install-deps.macos.sh
fi

echo "Initialising opam"
opam init -y  --comp 4.06.1

echo "Installing deps"
opam install ocamlfind -y

echo "Pinning gobject-introspection"
opam pin add -y gobject-introspection https://github.com/cedlemo/OCaml-GObject-Introspection.git

echo "Pinning gi-bindings-generator"
opam pin add -y gi-bindings-generator https://github.com/cedlemo/OCaml-GI-ctypes-bindings-generator.git

echo "Pinning gi-glib2"
opam pin add -y gi-glib2 https://github.com/cedlemo/OCaml-GLib2.git

echo "Pinning gi-gobject"
opam pin add -y gi-gobject https://github.com/prometheansacrifice/ocaml-gobject.git
