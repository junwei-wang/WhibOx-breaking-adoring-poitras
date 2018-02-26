#include <stdio.h>
#include <string.h>
#include <stdarg.h>

#define uchar unsigned char
#define uint unsigned int

uchar *out_ptr, *in_ptr;

void program();

uchar t[730000]={0};

void read_bit(uint to, uint from, uint shift) {
    t[to]=(in_ptr[from]>>shift)&1;
}
void write_bit(uint to, uint pos, uint from) {
    uint tmp=(t[from])&1;
    out_ptr[to]^=tmp<<pos;
}

void not(uint to, uint from) {
    t[to]=t[from]^1;
}
void or(uint to, uint from1, uint from2) {
    t[to]=t[from1]|t[from2];
}
void xor(uint to, uint from1, uint from2) {
    t[to] = t[from1] ^ t[from2];
}

void xor1(uint to, int num , ...) {
   t[to] = 0;

   va_list valist;
   va_start(valist, num);
   for (int i = 0; i < num; i++) {
      t[to]^=t[va_arg(valist, uint)];
   }
   va_end(valist);
}

void nxor(uint to, uint from1, uint from2) {
    t[to]=1^(t[from1]^t[from2]);
}

void nxor1(uint to, int num , ...) {
   t[to] = 1;

   va_list valist;
   va_start(valist, num);
   for (int i = 0; i < num; i++) {
      t[to]^=t[va_arg(valist, uint)];
   }
   va_end(valist);
}

void and(uint to, uint from1, uint from2) {
    t[to]=t[from1]&t[from2];
}

void u1(uint to, uint a, uint b, uint c) {
    t[to] = (t[a]&t[b])^t[c]^t[a];
}

void AES_128_encrypt(uchar *out, uchar *in) {
    out_ptr = out;
    in_ptr = in;
    memset(t, 0, 730000);
    memset(out_ptr, 0, 16);

    program();
}
