#ifdef BODY
require_extension(EXT_ZABHA);
WRITE_RD(sreg_t(MMU.amo<int16_t>(RS1, [&](uint16_t lhs) { return std::min(lhs, uint16_t(RS2)); })));

#endif