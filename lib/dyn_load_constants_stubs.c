#include <stdio.h>
#include <glib.h>
#include <gst/gst.h>
#include <caml/custom.h>
#include <caml/mlvalues.h>
#include <caml/alloc.h>
#include <caml/memory.h>
#define Some_val(v) Field(v,0)
#define Val_none Val_int(0)

CAMLprim value
get_major_version () {
    return Val_int (GLIB_MAJOR_VERSION);
}

CAMLprim value
get_minor_version () {
    return Val_int (GLIB_MINOR_VERSION);
}

CAMLprim value
get_micro_version () {
    return Val_int (GLIB_MICRO_VERSION);
}

CAMLprim value
caml_gst_init(value argc, value argv) {
    CAMLparam2(argc, argv);
    CAMLlocal1(unit);
    
    int c_argc = 0;
    if (argc != Val_none) {
      c_argc = Int_val(Some_val(argc));
    }
    char* c_argv;
    if (argv != Val_none) {
        c_argv = String_val(Some_val(argv));
    }

    // TODO get ptrs to applications argc, argv
    gst_init(NULL, NULL);
    CAMLreturn(unit);
}
