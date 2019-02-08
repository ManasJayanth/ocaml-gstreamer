open OUnit2

let () =
  run_test_tt_main
  ("GStreamer tests" >:::
    [
      Test_core.tests;
    ]
  )
