#ifdef BODY
require_extension(EXT_ZBA);
WRITE_RD(sext_xlen((RS1 << 3) + RS2));

#endif