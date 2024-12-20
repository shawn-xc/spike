ZVMM_INIT(2);
VI_VFP_COMMON;

switch (P.VU.vsew) {
  case 32: {
    auto macc = [](auto a, auto b, auto c) { return f64_add(c, f64_mul(f32_to_f64(a), f32_to_f64(b))); };
    ZVMM_GENERIC_LOOP(float32_t, float64_t, macc);
    break;
  }
  default: {
    require(false);
    break;
  }
}
