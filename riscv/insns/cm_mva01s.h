#ifdef BODY
require_extension(EXT_ZCMP);
WRITE_REG(X_A0, READ_REG(RVC_R1S));
WRITE_REG(X_A1, READ_REG(RVC_R2S));

#endif