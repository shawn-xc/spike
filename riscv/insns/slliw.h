#ifdef BODY
require_rv64;
WRITE_RD(sext32(RS1 << SHAMT));

#endif