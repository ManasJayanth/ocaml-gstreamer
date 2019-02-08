open OUnit2
open Gstreamer

let test_gstreamer_initialization _ctxt =
  let () = Gstreamer.Core.init None None in
  let state = Gstreamer.Core.is_initialized () in
  let message = "Gstreamer should be detecter as initialized" in
  assert_bool message state

let tests =
  "Gstreamer Core tests" >:::
  [
    "Gstreamer initialization" >:: test_gstreamer_initialization;
  ]
