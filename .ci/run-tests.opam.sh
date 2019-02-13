#! /bin/bash

eval $(opam env || opam config env)
opam pin add . -y

dune runtest

cd e2e
ocamlfind ocamlopt -package gi-gstreamer -linkpkg init.ml
./a.out
