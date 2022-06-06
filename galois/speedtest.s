	.file	"speedtest.cpp"
	.text
	.p2align 4
	.def	__tcf_0;	.scl	3;	.type	32;	.endef
	.seh_proc	__tcf_0
__tcf_0:
.LFB3458:
	.seh_endprologue
	leaq	_ZStL8__ioinit(%rip), %rcx
	jmp	_ZNSt8ios_base4InitD1Ev
	.seh_endproc
	.section	.text$_ZNSt6vectorIS_IhSaIhEESaIS1_EED1Ev,"x"
	.linkonce discard
	.align 2
	.p2align 4
	.globl	_ZNSt6vectorIS_IhSaIhEESaIS1_EED1Ev
	.def	_ZNSt6vectorIS_IhSaIhEESaIS1_EED1Ev;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt6vectorIS_IhSaIhEESaIS1_EED1Ev
_ZNSt6vectorIS_IhSaIhEESaIS1_EED1Ev:
.LFB3169:
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	8(%rcx), %rbx
	movq	(%rcx), %r12
	movq	%rcx, %rsi
	cmpq	%r12, %rbx
	je	.L4
	.p2align 4,,10
	.p2align 3
.L8:
	movq	(%r12), %rcx
	testq	%rcx, %rcx
	je	.L5
	movq	16(%r12), %rdx
	addq	$24, %r12
	subq	%rcx, %rdx
	call	_ZdlPvy
	cmpq	%r12, %rbx
	jne	.L8
.L7:
	movq	(%rsi), %r12
.L4:
	testq	%r12, %r12
	je	.L3
	movq	16(%rsi), %rdx
	movq	%r12, %rcx
	subq	%r12, %rdx
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%r12
	jmp	_ZdlPvy
	.p2align 4,,10
	.p2align 3
.L5:
	addq	$24, %r12
	cmpq	%r12, %rbx
	jne	.L8
	jmp	.L7
	.p2align 4,,10
	.p2align 3
.L3:
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%r12
	ret
	.seh_endproc
	.def	__main;	.scl	2;	.type	32;	.endef
	.section	.text.startup,"x"
	.p2align 4
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
.LFB2899:
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$144, %rsp
	.seh_stackalloc	144
	.seh_endprologue
	call	__main
	leaq	80(%rsp), %r13
	leaq	48(%rsp), %rsi
	movq	%r13, %rcx
.LEHB0:
	call	_ZN6Galois4G256C1Ev
.LEHE0:
	movl	$10, %r8d
	movq	%r13, %rdx
	movq	%rsi, %rcx
.LEHB1:
	call	_ZN6Galois4ElemC1EPNS_4G256Eh
	leaq	64(%rsp), %rdi
	movl	$20, %r8d
	movq	%r13, %rdx
	movq	%rdi, %rcx
	call	_ZN6Galois4ElemC1EPNS_4G256Eh
	movl	$3000000000, %ebx
	leaq	32(%rsp), %rbp
	.p2align 4,,10
	.p2align 3
.L11:
	movq	%rdi, %r8
	movq	%rsi, %rdx
	movq	%rbp, %rcx
	call	_ZN6Galois4ElemmlERKS0_
	subq	$1, %rbx
	jne	.L11
	call	clock
	movl	$3000000000, %ebx
	movl	%eax, %r12d
	.p2align 4,,10
	.p2align 3
.L12:
	movq	%rdi, %r8
	movq	%rsi, %rdx
	movq	%rbp, %rcx
	call	_ZN6Galois4ElemmlERKS0_
	subq	$1, %rbx
	jne	.L12
	movq	.refptr._ZSt4cout(%rip), %r14
	movq	(%r14), %rax
	movq	-24(%rax), %rdx
	addq	%r14, %rdx
	movl	24(%rdx), %eax
	movq	$10, 8(%rdx)
	andl	$-261, %eax
	orl	$4, %eax
	movl	%eax, 24(%rdx)
	call	clock
	pxor	%xmm1, %xmm1
	movq	%r14, %rcx
	subl	%r12d, %eax
	cvtsi2sdl	%eax, %xmm1
	divsd	.LC0(%rip), %xmm1
	call	_ZNSo9_M_insertIdEERSoT_
	movq	%rax, %r12
	movq	(%rax), %rax
	movq	-24(%rax), %rax
	movq	240(%r12,%rax), %r14
	testq	%r14, %r14
	je	.L22
	cmpb	$0, 56(%r14)
	je	.L14
	movzbl	67(%r14), %eax
.L15:
	movsbl	%al, %edx
	movq	%r12, %rcx
	call	_ZNSo3putEc
	movq	%rax, %rcx
	call	_ZNSo5flushEv
	leaq	104(%rsp), %rcx
	call	_ZNSt6vectorIS_IhSaIhEESaIS1_EED1Ev
	movq	%r13, %rcx
	call	_ZNSt6vectorIS_IhSaIhEESaIS1_EED1Ev
	xorl	%eax, %eax
	addq	$144, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
.L14:
	movq	%r14, %rcx
	call	_ZNKSt5ctypeIcE13_M_widen_initEv
	movq	(%r14), %rax
	movl	$10, %edx
	movq	%r14, %rcx
	call	*48(%rax)
	jmp	.L15
.L22:
	call	_ZSt16__throw_bad_castv
.LEHE1:
.L17:
	leaq	104(%rsp), %rcx
	movq	%rax, %r12
	call	_ZNSt6vectorIS_IhSaIhEESaIS1_EED1Ev
	movq	%r13, %rcx
	call	_ZNSt6vectorIS_IhSaIhEESaIS1_EED1Ev
	movq	%r12, %rcx
.LEHB2:
	call	_Unwind_Resume
	nop
.LEHE2:
	.def	__gxx_personality_seh0;	.scl	2;	.type	32;	.endef
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
.LLSDA2899:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE2899-.LLSDACSB2899
.LLSDACSB2899:
	.uleb128 .LEHB0-.LFB2899
	.uleb128 .LEHE0-.LEHB0
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB1-.LFB2899
	.uleb128 .LEHE1-.LEHB1
	.uleb128 .L17-.LFB2899
	.uleb128 0
	.uleb128 .LEHB2-.LFB2899
	.uleb128 .LEHE2-.LEHB2
	.uleb128 0
	.uleb128 0
.LLSDACSE2899:
	.section	.text.startup,"x"
	.seh_endproc
	.p2align 4
	.def	_GLOBAL__sub_I_main;	.scl	3;	.type	32;	.endef
	.seh_proc	_GLOBAL__sub_I_main
_GLOBAL__sub_I_main:
.LFB3459:
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	leaq	_ZStL8__ioinit(%rip), %rcx
	call	_ZNSt8ios_base4InitC1Ev
	leaq	__tcf_0(%rip), %rcx
	addq	$40, %rsp
	jmp	atexit
	.seh_endproc
	.section	.ctors,"w"
	.align 8
	.quad	_GLOBAL__sub_I_main
.lcomm _ZStL8__ioinit,1,1
	.section .rdata,"dr"
	.align 8
.LC0:
	.long	0
	.long	1083129856
	.ident	"GCC: (Rev1, Built by MSYS2 project) 11.3.0"
	.def	_ZNSt8ios_base4InitD1Ev;	.scl	2;	.type	32;	.endef
	.def	_ZdlPvy;	.scl	2;	.type	32;	.endef
	.def	_ZN6Galois4G256C1Ev;	.scl	2;	.type	32;	.endef
	.def	_ZN6Galois4ElemC1EPNS_4G256Eh;	.scl	2;	.type	32;	.endef
	.def	_ZN6Galois4ElemmlERKS0_;	.scl	2;	.type	32;	.endef
	.def	clock;	.scl	2;	.type	32;	.endef
	.def	_ZNSo9_M_insertIdEERSoT_;	.scl	2;	.type	32;	.endef
	.def	_ZNSo3putEc;	.scl	2;	.type	32;	.endef
	.def	_ZNSo5flushEv;	.scl	2;	.type	32;	.endef
	.def	_ZNKSt5ctypeIcE13_M_widen_initEv;	.scl	2;	.type	32;	.endef
	.def	_ZSt16__throw_bad_castv;	.scl	2;	.type	32;	.endef
	.def	_Unwind_Resume;	.scl	2;	.type	32;	.endef
	.def	_ZNSt8ios_base4InitC1Ev;	.scl	2;	.type	32;	.endef
	.def	atexit;	.scl	2;	.type	32;	.endef
	.section	.rdata$.refptr._ZSt4cout, "dr"
	.globl	.refptr._ZSt4cout
	.linkonce	discard
.refptr._ZSt4cout:
	.quad	_ZSt4cout
