#ifdef BODY
require_either_extension('D', EXT_ZDINX);
require_fp;
softfloat_roundingMode = RM;
WRITE_FRD_D(f64_add(FRS1_D, FRS2_D));
set_fp_exceptions;

#endif