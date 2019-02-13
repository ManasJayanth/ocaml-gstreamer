echo "Initialising opam"
opam init --comp 4.06.1 --disable-sandboxing --reinit -y # disable sanboxing due to sandboxing issues. See https://github.com/ocaml/opam/issues/3424#issuecomment-434222022

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
