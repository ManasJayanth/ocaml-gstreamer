#! /bin/bash

eval $(opam env || opam config env)
opam pin add . -y

cd tests
ocamlfind ocamlopt -package gstreamer -linkpkg init.ml
./a.out
