#include <arm_neon.h>
#include <time.h>
#include <stdio.h>

// Square 4 floats using NEON
void square_floats_vectorized( float* inp_ptr , float* store_ptr) {
  // Load 4 floats from memory into a NEON register
  float32x4_t f = vld1q_f32( inp_ptr );

  // Multiply each float with itself
  f = vmulq_f32( f, f );

  // Store the result back into memory
  vst1q_f32( store_ptr, f );
}

void square_floats( float* inp_ptr , float* store_ptr) {
  // I have verified that this doesn't produce and simd code
  store_ptr[0] = inp_ptr[0] * inp_ptr[0];
  store_ptr[1] = inp_ptr[1] * inp_ptr[1];
  store_ptr[2] = inp_ptr[2] * inp_ptr[2];
  store_ptr[3] = inp_ptr[3] * inp_ptr[3];
}


#define BENCH_MARK_ITERATIONS 0xFFFFFFF

void benchmark_square_floats() {
  float a[4] = { 1.0f, 2.0f, 3.0f, 4.0f };
  float startTime = (float)clock()/CLOCKS_PER_SEC;
  for (int i = 0; i < BENCH_MARK_ITERATIONS; i++) {
    square_floats(a, a);
  }
  float endTime = (float)clock()/CLOCKS_PER_SEC;
  printf(" %f %f %f %f \n", a[0], a[1], a[2], a[3]);
  printf( "Time taken for normal version: %f\n", endTime - startTime );
}

void benchmark_square_floats_vectorized() {
  float a[4] = { 1.0f, 2.0f, 3.0f, 4.0f };
  float startTime = (float)clock()/CLOCKS_PER_SEC;
  for (int i = 0; i < BENCH_MARK_ITERATIONS; i++) {
    square_floats_vectorized(a, a);
  }
  float endTime = (float)clock()/CLOCKS_PER_SEC;
  printf(" %f %f %f %f \n", a[0], a[1], a[2], a[3]);
  printf( "Time taken for vectorized version: %f\n", endTime - startTime );
}

int main() {

  benchmark_square_floats();
  benchmark_square_floats_vectorized();

  return 0;
}
