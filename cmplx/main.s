default rel
global mod

section .text
mod:
mulsd xmm0, xmm0
mulsd xmm1, xmm1
addsd xmm0, xmm1
sqrtsd xmm0, xmm0
xorpd xmm1, xmm1
