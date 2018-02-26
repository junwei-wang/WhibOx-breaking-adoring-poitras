#include <stdio.h>

extern void AES_128_encrypt(unsigned char *ciphertext, unsigned char *plaintext);

int main(void) {

  unsigned char in[16], out[16];
  for (int i = 0; i<16;i++) {
    in[i] = i ^ 0xf0;
  }

  AES_128_encrypt(out, in);

  for (int i = 0; i<16;i++) {
    printf("%02x", out[i]);
  }
  printf("\n");

}
