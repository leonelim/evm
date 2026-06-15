	.file	"test.c"
	.text
	.p2align 4
	.globl	variance
	.type	variance, @function
variance:
.LFB22:
	.cfi_startproc
	testq	%rsi, %rsi
	je	.L11
	cmpq	$1, %rsi
	je	.L18
	movq	%rsi, %rcx
	movq	%rdi, %rdx
	pxor	%xmm0, %xmm0
	movq	%rdi, %rax
	shrq	%rcx
	salq	$4, %rcx
	addq	%rdi, %rcx
	.p2align 5
	.p2align 4
	.p2align 3
.L5:
	addsd	(%rax), %xmm0
	addq	$16, %rax
	addsd	-8(%rax), %xmm0
	cmpq	%rcx, %rax
	jne	.L5
	movq	%rsi, %rax
	andq	$-2, %rax
	testb	$1, %sil
	je	.L19
	addsd	(%rdi,%rax,8), %xmm0
	pxor	%xmm5, %xmm5
	cvtsi2sdq	%rsi, %xmm5
	movapd	%xmm0, %xmm2
	divsd	%xmm5, %xmm2
.L7:
	movapd	%xmm2, %xmm4
	pxor	%xmm0, %xmm0
	unpcklpd	%xmm4, %xmm4
	.p2align 5
	.p2align 4
	.p2align 3
.L8:
	movupd	(%rdx), %xmm1
	addq	$16, %rdx
	subpd	%xmm4, %xmm1
	mulpd	%xmm1, %xmm1
	addsd	%xmm1, %xmm0
	unpckhpd	%xmm1, %xmm1
	addsd	%xmm1, %xmm0
	cmpq	%rdx, %rcx
	jne	.L8
	andl	$1, %esi
	je	.L2
.L4:
	movsd	(%rdi,%rax,8), %xmm1
	subsd	%xmm2, %xmm1
	mulsd	%xmm1, %xmm1
	addsd	%xmm1, %xmm0
.L2:
	divsd	%xmm5, %xmm0
	ret
	.p2align 4,,10
	.p2align 3
.L19:
	pxor	%xmm5, %xmm5
	movapd	%xmm0, %xmm2
	cvtsi2sdq	%rax, %xmm5
	divsd	%xmm5, %xmm2
	jmp	.L7
	.p2align 4,,10
	.p2align 3
.L11:
	pxor	%xmm5, %xmm5
	movapd	%xmm5, %xmm0
	divsd	%xmm5, %xmm0
	ret
.L18:
	pxor	%xmm2, %xmm2
	pxor	%xmm0, %xmm0
	addsd	(%rdi), %xmm2
	xorl	%eax, %eax
	movsd	.LC1(%rip), %xmm5
	jmp	.L4
	.cfi_endproc
.LFE22:
	.size	variance, .-variance
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC4:
	.string	"%f\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB23:
	.cfi_startproc
	subq	$40, %rsp
	.cfi_def_cfa_offset 48
	movapd	.LC2(%rip), %xmm0
	movl	$3, %esi
	movq	%fs:40, %rax
	movq	%rax, 24(%rsp)
	xorl	%eax, %eax
	movq	.LC3(%rip), %rax
	movq	%rsp, %rdi
	movaps	%xmm0, (%rsp)
	movq	%rax, 16(%rsp)
	call	variance
	leaq	.LC4(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
	movq	24(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L23
	xorl	%eax, %eax
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L23:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE23:
	.size	main, .-main
	.set	.LC1,.LC2
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC2:
	.long	0
	.long	1072693248
	.long	0
	.long	1073741824
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC3:
	.long	0
	.long	1074266112
	.ident	"GCC: (GNU) 15.2.1 20260209"
	.section	.note.GNU-stack,"",@progbits
