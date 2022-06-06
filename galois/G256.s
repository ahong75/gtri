	.file	"G256.cpp"
	.text
	.p2align 4
	.def	__tcf_0;	.scl	3;	.type	32;	.endef
	.seh_proc	__tcf_0
__tcf_0:
.LFB2879:
	.seh_endprologue
	leaq	_ZStL8__ioinit(%rip), %rcx
	jmp	_ZNSt8ios_base4InitD1Ev
	.seh_endproc
	.section .rdata,"dr"
.LC0:
	.ascii "Out of range.\0"
	.text
	.align 2
	.p2align 4
	.globl	_ZN6Galois4ElemC2EPNS_4G256Eh
	.def	_ZN6Galois4ElemC2EPNS_4G256Eh;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN6Galois4ElemC2EPNS_4G256Eh
_ZN6Galois4ElemC2EPNS_4G256Eh:
.LFB2215:
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	movq	%rdx, (%rcx)
	movb	%r8b, 8(%rcx)
	cmpb	%r8b, 48(%rdx)
	jb	.L7
	addq	$40, %rsp
	popq	%r12
	popq	%r13
	ret
.L7:
	movl	$16, %ecx
	call	__cxa_allocate_exception
	leaq	.LC0(%rip), %rdx
	movq	%rax, %rcx
	movq	%rax, %r12
.LEHB0:
	call	_ZNSt16invalid_argumentC1EPKc
.LEHE0:
	leaq	_ZNSt16invalid_argumentD1Ev(%rip), %r8
	leaq	_ZTISt16invalid_argument(%rip), %rdx
	movq	%r12, %rcx
.LEHB1:
	call	__cxa_throw
.L6:
	movq	%rax, %r13
	movq	%r12, %rcx
	call	__cxa_free_exception
	movq	%r13, %rcx
	call	_Unwind_Resume
	nop
.LEHE1:
	.def	__gxx_personality_seh0;	.scl	2;	.type	32;	.endef
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
.LLSDA2215:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE2215-.LLSDACSB2215
.LLSDACSB2215:
	.uleb128 .LEHB0-.LFB2215
	.uleb128 .LEHE0-.LEHB0
	.uleb128 .L6-.LFB2215
	.uleb128 0
	.uleb128 .LEHB1-.LFB2215
	.uleb128 .LEHE1-.LEHB1
	.uleb128 0
	.uleb128 0
.LLSDACSE2215:
	.text
	.seh_endproc
	.globl	_ZN6Galois4ElemC1EPNS_4G256Eh
	.def	_ZN6Galois4ElemC1EPNS_4G256Eh;	.scl	2;	.type	32;	.endef
	.set	_ZN6Galois4ElemC1EPNS_4G256Eh,_ZN6Galois4ElemC2EPNS_4G256Eh
	.align 2
	.p2align 4
	.globl	_ZN6Galois4ElemplERKS0_
	.def	_ZN6Galois4ElemplERKS0_;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN6Galois4ElemplERKS0_
_ZN6Galois4ElemplERKS0_:
.LFB2217:
	.seh_endprologue
	movq	%rcx, %rax
	movq	(%rdx), %rcx
	movzbl	8(%rdx), %edx
	xorb	8(%r8), %dl
	movq	%rcx, (%rax)
	movb	%dl, 8(%rax)
	ret
	.seh_endproc
	.align 2
	.p2align 4
	.globl	_ZN6Galois4ElemmiERKS0_
	.def	_ZN6Galois4ElemmiERKS0_;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN6Galois4ElemmiERKS0_
_ZN6Galois4ElemmiERKS0_:
.LFB2883:
	.seh_endprologue
	movq	%rcx, %rax
	movq	(%rdx), %rcx
	movzbl	8(%rdx), %edx
	xorb	8(%r8), %dl
	movq	%rcx, (%rax)
	movb	%dl, 8(%rax)
	ret
	.seh_endproc
	.align 2
	.p2align 4
	.globl	_ZN6Galois4ElemmlERKS0_
	.def	_ZN6Galois4ElemmlERKS0_;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN6Galois4ElemmlERKS0_
_ZN6Galois4ElemmlERKS0_:
.LFB2219:
	.seh_endprologue
	movq	%rcx, %rax
	movq	(%rdx), %rcx
	movzbl	8(%rdx), %edx
	movq	(%rcx), %r9
	leaq	(%rdx,%rdx,2), %rdx
	movq	%rcx, (%rax)
	movzbl	8(%r8), %ecx
	leaq	(%r9,%rdx,8), %rdx
	movq	(%rdx), %rdx
	movzbl	(%rdx,%rcx), %edx
	movb	%dl, 8(%rax)
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC1:
	.ascii "Cannot divide by 0.\0"
	.text
	.align 2
	.p2align 4
	.globl	_ZN6Galois4ElemdvERKS0_
	.def	_ZN6Galois4ElemdvERKS0_;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN6Galois4ElemdvERKS0_
_ZN6Galois4ElemdvERKS0_:
.LFB2220:
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	movzbl	8(%r8), %eax
	movq	%rcx, %r9
	testb	%al, %al
	je	.L16
	movq	(%rdx), %rcx
	movzbl	8(%rdx), %edx
	subl	$1, %eax
	cltq
	movq	24(%rcx), %r8
	leaq	(%rdx,%rdx,2), %rdx
	movq	%rcx, (%r9)
	leaq	(%r8,%rdx,8), %rdx
	movq	(%rdx), %rdx
	movzbl	(%rdx,%rax), %eax
	movb	%al, 8(%r9)
	movq	%r9, %rax
	addq	$40, %rsp
	popq	%r12
	popq	%r13
	ret
.L16:
	movl	$16, %ecx
	call	__cxa_allocate_exception
	leaq	.LC1(%rip), %rdx
	movq	%rax, %rcx
	movq	%rax, %r12
.LEHB2:
	call	_ZNSt16invalid_argumentC1EPKc
.LEHE2:
	leaq	_ZNSt16invalid_argumentD1Ev(%rip), %r8
	leaq	_ZTISt16invalid_argument(%rip), %rdx
	movq	%r12, %rcx
.LEHB3:
	call	__cxa_throw
.L14:
	movq	%rax, %r13
	movq	%r12, %rcx
	call	__cxa_free_exception
	movq	%r13, %rcx
	call	_Unwind_Resume
	nop
.LEHE3:
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
.LLSDA2220:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE2220-.LLSDACSB2220
.LLSDACSB2220:
	.uleb128 .LEHB2-.LFB2220
	.uleb128 .LEHE2-.LEHB2
	.uleb128 .L14-.LFB2220
	.uleb128 0
	.uleb128 .LEHB3-.LFB2220
	.uleb128 .LEHE3-.LEHB3
	.uleb128 0
	.uleb128 0
.LLSDACSE2220:
	.text
	.seh_endproc
	.section	.text$_ZNSt6vectorIS_IhSaIhEESaIS1_EED1Ev,"x"
	.linkonce discard
	.align 2
	.p2align 4
	.globl	_ZNSt6vectorIS_IhSaIhEESaIS1_EED1Ev
	.def	_ZNSt6vectorIS_IhSaIhEESaIS1_EED1Ev;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt6vectorIS_IhSaIhEESaIS1_EED1Ev
_ZNSt6vectorIS_IhSaIhEESaIS1_EED1Ev:
.LFB2478:
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
	je	.L18
	.p2align 4,,10
	.p2align 3
.L22:
	movq	(%r12), %rcx
	testq	%rcx, %rcx
	je	.L19
	movq	16(%r12), %rdx
	addq	$24, %r12
	subq	%rcx, %rdx
	call	_ZdlPvy
	cmpq	%r12, %rbx
	jne	.L22
.L21:
	movq	(%rsi), %r12
.L18:
	testq	%r12, %r12
	je	.L17
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
.L19:
	addq	$24, %r12
	cmpq	%r12, %rbx
	jne	.L22
	jmp	.L21
	.p2align 4,,10
	.p2align 3
.L17:
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%r12
	ret
	.seh_endproc
	.section	.text$_ZNSt12_Destroy_auxILb0EE9__destroyIPSt6vectorIhSaIhEEEEvT_S6_,"x"
	.linkonce discard
	.p2align 4
	.globl	_ZNSt12_Destroy_auxILb0EE9__destroyIPSt6vectorIhSaIhEEEEvT_S6_
	.def	_ZNSt12_Destroy_auxILb0EE9__destroyIPSt6vectorIhSaIhEEEEvT_S6_;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt12_Destroy_auxILb0EE9__destroyIPSt6vectorIhSaIhEEEEvT_S6_
_ZNSt12_Destroy_auxILb0EE9__destroyIPSt6vectorIhSaIhEEEEvT_S6_:
.LFB2737:
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	movq	%rcx, %rbx
	movq	%rdx, %rsi
	cmpq	%rdx, %rcx
	je	.L24
	.p2align 4,,10
	.p2align 3
.L28:
	movq	(%rbx), %rcx
	testq	%rcx, %rcx
	je	.L26
	movq	16(%rbx), %rdx
	addq	$24, %rbx
	subq	%rcx, %rdx
	call	_ZdlPvy
	cmpq	%rbx, %rsi
	jne	.L28
.L24:
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	ret
	.p2align 4,,10
	.p2align 3
.L26:
	addq	$24, %rbx
	cmpq	%rbx, %rsi
	jne	.L28
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	ret
	.seh_endproc
	.text
	.align 2
	.p2align 4
	.globl	_ZN6Galois4G256C2Ev
	.def	_ZN6Galois4G256C2Ev;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN6Galois4G256C2Ev
_ZN6Galois4G256C2Ev:
.LFB2212:
	pushq	%r15
	.seh_pushreg	%r15
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
	subq	$88, %rsp
	.seh_stackalloc	88
	movups	%xmm6, 64(%rsp)
	.seh_savexmm	%xmm6, 64
	.seh_endprologue
	pxor	%xmm0, %xmm0
	movb	$-1, 48(%rcx)
	movq	%rcx, 160(%rsp)
	movups	%xmm0, (%rcx)
	movups	%xmm0, 16(%rcx)
	movups	%xmm0, 32(%rcx)
	movl	$256, %ecx
.LEHB4:
	call	_Znwy
.LEHE4:
	leaq	9(%rax), %rdi
	movb	$0, (%rax)
	movq	%rax, %r12
	andq	$-8, %rdi
	movq	$0, 1(%rax)
	movq	$0, 248(%rax)
	subl	%edi, %eax
	leal	256(%rax), %ecx
	xorl	%eax, %eax
	shrl	$3, %ecx
	rep stosq
	movl	$6144, %ecx
.LEHB5:
	call	_Znwy
.LEHE5:
	movq	%rax, %r13
	leaq	6144(%rax), %rbx
	pxor	%xmm6, %xmm6
	movq	%rax, %r14
.L30:
	movq	$0, 16(%r14)
	movl	$256, %ecx
	movups	%xmm6, (%r14)
.LEHB6:
	call	_Znwy
.LEHE6:
	movdqu	(%r12), %xmm1
	movdqu	16(%r12), %xmm2
	leaq	256(%rax), %rdx
	movq	%rax, (%r14)
	movdqu	32(%r12), %xmm3
	movdqu	48(%r12), %xmm4
	movq	%rdx, 16(%r14)
	addq	$24, %r14
	movdqu	64(%r12), %xmm5
	movups	%xmm1, (%rax)
	movdqu	80(%r12), %xmm1
	movups	%xmm2, 16(%rax)
	movdqu	96(%r12), %xmm2
	movups	%xmm3, 32(%rax)
	movdqu	112(%r12), %xmm3
	movups	%xmm4, 48(%rax)
	movdqu	128(%r12), %xmm4
	movups	%xmm5, 64(%rax)
	movdqu	144(%r12), %xmm5
	movups	%xmm1, 80(%rax)
	movdqu	160(%r12), %xmm1
	movups	%xmm2, 96(%rax)
	movdqu	176(%r12), %xmm2
	movups	%xmm3, 112(%rax)
	movdqu	192(%r12), %xmm3
	movups	%xmm4, 128(%rax)
	movdqu	208(%r12), %xmm4
	movups	%xmm5, 144(%rax)
	movdqu	224(%r12), %xmm5
	movups	%xmm1, 160(%rax)
	movups	%xmm2, 176(%rax)
	movups	%xmm3, 192(%rax)
	movups	%xmm4, 208(%rax)
	movups	%xmm5, 224(%rax)
	movdqu	240(%r12), %xmm1
	movq	%rdx, -16(%r14)
	movups	%xmm1, 240(%rax)
	cmpq	%r14, %rbx
	jne	.L30
	movq	160(%rsp), %rax
	movq	%rbx, %xmm6
	movq	%r13, %xmm0
	punpcklqdq	%xmm6, %xmm0
	movq	(%rax), %r14
	movq	8(%rax), %rdi
	movups	%xmm0, (%rax)
	movq	16(%rax), %rsi
	movq	%rbx, 16(%rax)
	movq	%r14, %rbx
	cmpq	%rdi, %r14
	je	.L39
.L31:
	movq	(%rbx), %rcx
	testq	%rcx, %rcx
	je	.L37
	movq	16(%rbx), %rdx
	addq	$24, %rbx
	subq	%rcx, %rdx
	call	_ZdlPvy
	cmpq	%rbx, %rdi
	jne	.L31
.L39:
	testq	%r14, %r14
	je	.L33
.L32:
	subq	%r14, %rsi
	movq	%r14, %rcx
	movq	%rsi, %rdx
	call	_ZdlPvy
.L33:
	movq	%r12, %rcx
	movl	$256, %edx
	call	_ZdlPvy
	movl	$255, %ecx
.LEHB7:
	call	_Znwy
.LEHE7:
	leaq	9(%rax), %rdi
	movb	$0, (%rax)
	movq	%rax, %r13
	leaq	263(%rax), %rbp
	andq	$-8, %rdi
	movq	$0, 1(%rax)
	subl	%edi, %eax
	movq	$0, -16(%rbp)
	leal	255(%rax), %ecx
	xorl	%eax, %eax
	shrl	$3, %ecx
	rep stosq
	movl	$6144, %ecx
.LEHB8:
	call	_Znwy
.LEHE8:
	movq	%rax, %r14
	leaq	6144(%rax), %rbx
	pxor	%xmm6, %xmm6
	movq	%rax, %r12
.L40:
	movq	$0, 16(%r12)
	movl	$255, %ecx
	movups	%xmm6, (%r12)
.LEHB9:
	call	_Znwy
.LEHE9:
	movq	%rax, (%r12)
	leaq	8(%rax), %rdi
	movq	%r13, %rsi
	addq	$24, %r12
	leaq	255(%rax), %rdx
	andq	$-8, %rdi
	movq	%rdx, -8(%r12)
	movq	0(%r13), %rcx
	movq	%rcx, (%rax)
	movq	-16(%rbp), %rcx
	movq	%rcx, 247(%rax)
	subq	%rdi, %rax
	subq	%rax, %rsi
	addl	$255, %eax
	shrl	$3, %eax
	movl	%eax, %ecx
	rep movsq
	movq	%rdx, -16(%r12)
	cmpq	%r12, %rbx
	jne	.L40
	movq	160(%rsp), %rax
	movq	%rbx, %xmm2
	movq	%r14, %xmm0
	punpcklqdq	%xmm2, %xmm0
	movq	24(%rax), %r12
	movq	32(%rax), %rdi
	movups	%xmm0, 24(%rax)
	movq	40(%rax), %rsi
	movq	%rbx, 40(%rax)
	movq	%r12, %rbx
	cmpq	%rdi, %r12
	je	.L49
.L41:
	movq	(%rbx), %rcx
	testq	%rcx, %rcx
	je	.L47
	movq	16(%rbx), %rdx
	addq	$24, %rbx
	subq	%rcx, %rdx
	call	_ZdlPvy
	cmpq	%rbx, %rdi
	jne	.L41
.L49:
	testq	%r12, %r12
	je	.L43
.L42:
	subq	%r12, %rsi
	movq	%r12, %rcx
	movq	%rsi, %rdx
	call	_ZdlPvy
.L43:
	movq	%r13, %rcx
	movl	$255, %edx
	call	_ZdlPvy
	movq	160(%rsp), %rax
	movb	$0, 63(%rsp)
	movq	$-1, 40(%rsp)
	movl	$0, 56(%rsp)
	movq	(%rax), %r13
.L70:
	movl	56(%rsp), %edi
	movzbl	63(%rsp), %eax
	testb	%dil, %dil
	movl	%eax, %ebx
	movb	%dil, 60(%rsp)
	setne	%r10b
	xorl	$27, %ebx
	testb	%dil, %dil
	cmovns	%eax, %ebx
	testb	%al, %al
	setne	%al
	testb	%dil, %dil
	movl	$1, %edi
	cmovs	%edi, %eax
	movb	%al, 50(%rsp)
	movl	%ebx, %eax
	addb	%al, %al
	movl	%eax, %esi
	setne	51(%rsp)
	xorl	$27, %esi
	testb	%bl, %bl
	cmovns	%eax, %esi
	movl	%esi, %eax
	addb	%al, %al
	movl	%eax, %edi
	setne	52(%rsp)
	xorl	$27, %edi
	testb	%sil, %sil
	cmovns	%eax, %edi
	movl	%edi, %ebp
	addb	%bpl, %bpl
	movl	%ebp, %eax
	setne	53(%rsp)
	xorl	$27, %eax
	testb	%dil, %dil
	cmovs	%eax, %ebp
	movl	%ebp, %eax
	addb	%al, %al
	movl	%eax, %r12d
	setne	54(%rsp)
	xorl	$27, %r12d
	testb	%bpl, %bpl
	cmovns	%eax, %r12d
	movl	%r12d, %eax
	addb	%al, %al
	movl	%eax, %edx
	setne	55(%rsp)
	xorl	$27, %edx
	testb	%r12b, %r12b
	cmovs	%edx, %eax
	movl	%eax, %ecx
	movb	%al, 49(%rsp)
	addb	%al, %al
	movl	%eax, %edx
	setne	61(%rsp)
	xorl	$27, %edx
	testb	%cl, %cl
	cmovns	%eax, %edx
	xorl	%r8d, %r8d
	movb	%dl, 62(%rsp)
	jmp	.L67
	.p2align 4,,10
	.p2align 3
.L51:
	movl	%r8d, %ecx
	shrb	%cl
	je	.L75
	cmpb	$0, 50(%rsp)
	movzbl	60(%rsp), %eax
	je	.L75
.L73:
	movl	%eax, %r14d
	xorl	%ebx, %r14d
	testb	$1, %cl
	cmovne	%r14d, %eax
	movzbl	51(%rsp), %r14d
	testb	%bl, %bl
	cmovns	%r14d, %edx
	movl	%ecx, %r14d
	shrb	%r14b
	setne	%r15b
	andb	%r15b, %dl
	je	.L55
	movl	%eax, %r15d
	xorl	%esi, %r15d
	andl	$1, %r14d
	movl	%ecx, %r14d
	cmovne	%r15d, %eax
	movzbl	52(%rsp), %r15d
	testb	%sil, %sil
	cmovns	%r15d, %edx
	shrb	$2, %r14b
	setne	%r15b
	andb	%r15b, %dl
	je	.L55
	movl	%eax, %r15d
	xorl	%edi, %r15d
	andl	$1, %r14d
	movl	%ecx, %r14d
	cmovne	%r15d, %eax
	movzbl	53(%rsp), %r15d
	testb	%dil, %dil
	cmovns	%r15d, %edx
	shrb	$3, %r14b
	setne	%r15b
	andb	%r15b, %dl
	je	.L55
	movl	%eax, %r15d
	xorl	%ebp, %r15d
	andl	$1, %r14d
	movzbl	54(%rsp), %r14d
	cmovne	%r15d, %eax
	testb	%bpl, %bpl
	cmovns	%r14d, %edx
	movl	%ecx, %r14d
	shrb	$4, %r14b
	setne	%r15b
	andb	%dl, %r15b
	je	.L55
	movl	%eax, %edx
	xorl	%r12d, %edx
	andl	$1, %r14d
	movl	%ecx, %r14d
	cmovne	%edx, %eax
	movzbl	55(%rsp), %edx
	testb	%r12b, %r12b
	cmovns	%edx, %r15d
	shrb	$5, %r14b
	setne	%dl
	andb	%r15b, %dl
	je	.L55
	movzbl	49(%rsp), %r15d
	xorl	%eax, %r15d
	andl	$1, %r14d
	cmovne	%r15d, %eax
	movzbl	61(%rsp), %r15d
	cmpb	$0, 49(%rsp)
	cmovns	%r15d, %edx
	shrb	$6, %cl
	je	.L55
	movzbl	62(%rsp), %ecx
	xorl	%eax, %ecx
	testb	%dl, %dl
	cmovne	%ecx, %eax
.L55:
	movb	%al, (%r11)
	testb	%al, %al
	je	.L66
.L72:
	movq	160(%rsp), %rcx
	movzbl	%al, %eax
	leaq	(%rax,%rax,2), %rax
	salq	$3, %rax
	addq	24(%rcx), %rax
	movq	40(%rsp), %rcx
	movq	(%rax), %rax
	movb	%r9b, (%rax,%rcx)
.L66:
	addq	$1, %r8
	cmpq	$256, %r8
	je	.L144
.L67:
	testb	%r8b, %r8b
	movq	0(%r13), %r11
	movl	%r8d, %r9d
	setne	%dl
	addq	%r8, %r11
	andb	%r10b, %dl
	je	.L77
	movl	%r8d, %eax
	andl	$1, %eax
	jne	.L51
	movl	%r8d, %ecx
	shrb	%cl
	je	.L77
	cmpb	$0, 50(%rsp)
	jne	.L73
	.p2align 4,,10
	.p2align 3
.L77:
	addq	$1, %r8
	movb	$0, (%r11)
	cmpq	$256, %r8
	jne	.L67
.L144:
	addl	$1, 56(%rsp)
	movl	56(%rsp), %eax
	addq	$24, %r13
	addq	$1, 40(%rsp)
	addb	$2, 63(%rsp)
	cmpl	$256, %eax
	jne	.L70
	movups	64(%rsp), %xmm6
	addq	$88, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
.L37:
	addq	$24, %rbx
	cmpq	%rbx, %rdi
	jne	.L31
	testq	%r14, %r14
	jne	.L32
	jmp	.L33
	.p2align 4,,10
	.p2align 3
.L47:
	addq	$24, %rbx
	cmpq	%rbx, %rdi
	jne	.L41
	testq	%r12, %r12
	jne	.L42
	jmp	.L43
	.p2align 4,,10
	.p2align 3
.L75:
	movzbl	60(%rsp), %eax
	movb	%al, (%r11)
	jmp	.L72
.L89:
	movq	%rax, %r12
.L46:
	movl	$255, %edx
	movq	%r13, %rcx
	call	_ZdlPvy
.L69:
	movq	160(%rsp), %rax
	leaq	24(%rax), %rcx
	call	_ZNSt6vectorIS_IhSaIhEESaIS1_EED1Ev
	movq	160(%rsp), %rcx
	call	_ZNSt6vectorIS_IhSaIhEESaIS1_EED1Ev
	movq	%r12, %rcx
.LEHB10:
	call	_Unwind_Resume
.LEHE10:
.L88:
	movq	%rax, %r12
	jmp	.L69
.L87:
	movq	%rax, %rbx
	jmp	.L36
.L90:
	movq	%rax, %rcx
	call	__cxa_begin_catch
	movq	%r14, %rdx
	movq	%r13, %rcx
	call	_ZNSt12_Destroy_auxILb0EE9__destroyIPSt6vectorIhSaIhEEEEvT_S6_
.LEHB11:
	call	__cxa_rethrow
.LEHE11:
.L92:
	movq	%rax, %rcx
	call	__cxa_begin_catch
	movq	%r12, %rdx
	movq	%r14, %rcx
	call	_ZNSt12_Destroy_auxILb0EE9__destroyIPSt6vectorIhSaIhEEEEvT_S6_
.LEHB12:
	call	__cxa_rethrow
.LEHE12:
.L91:
	movq	%rax, %rbx
	call	__cxa_end_catch
	movl	$6144, %edx
	movq	%r13, %rcx
	call	_ZdlPvy
.L36:
	movq	%r12, %rcx
	movl	$256, %edx
	movq	%rbx, %r12
	call	_ZdlPvy
	jmp	.L69
.L93:
	movq	%rax, %r12
	call	__cxa_end_catch
	movl	$6144, %edx
	movq	%r14, %rcx
	call	_ZdlPvy
	jmp	.L46
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
	.align 4
.LLSDA2212:
	.byte	0xff
	.byte	0x9b
	.uleb128 .LLSDATT2212-.LLSDATTD2212
.LLSDATTD2212:
	.byte	0x1
	.uleb128 .LLSDACSE2212-.LLSDACSB2212
.LLSDACSB2212:
	.uleb128 .LEHB4-.LFB2212
	.uleb128 .LEHE4-.LEHB4
	.uleb128 .L88-.LFB2212
	.uleb128 0
	.uleb128 .LEHB5-.LFB2212
	.uleb128 .LEHE5-.LEHB5
	.uleb128 .L87-.LFB2212
	.uleb128 0
	.uleb128 .LEHB6-.LFB2212
	.uleb128 .LEHE6-.LEHB6
	.uleb128 .L90-.LFB2212
	.uleb128 0x1
	.uleb128 .LEHB7-.LFB2212
	.uleb128 .LEHE7-.LEHB7
	.uleb128 .L88-.LFB2212
	.uleb128 0
	.uleb128 .LEHB8-.LFB2212
	.uleb128 .LEHE8-.LEHB8
	.uleb128 .L89-.LFB2212
	.uleb128 0
	.uleb128 .LEHB9-.LFB2212
	.uleb128 .LEHE9-.LEHB9
	.uleb128 .L92-.LFB2212
	.uleb128 0x1
	.uleb128 .LEHB10-.LFB2212
	.uleb128 .LEHE10-.LEHB10
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB11-.LFB2212
	.uleb128 .LEHE11-.LEHB11
	.uleb128 .L91-.LFB2212
	.uleb128 0
	.uleb128 .LEHB12-.LFB2212
	.uleb128 .LEHE12-.LEHB12
	.uleb128 .L93-.LFB2212
	.uleb128 0
.LLSDACSE2212:
	.byte	0x1
	.byte	0
	.align 4
	.long	0

.LLSDATT2212:
	.text
	.seh_endproc
	.globl	_ZN6Galois4G256C1Ev
	.def	_ZN6Galois4G256C1Ev;	.scl	2;	.type	32;	.endef
	.set	_ZN6Galois4G256C1Ev,_ZN6Galois4G256C2Ev
	.section	.text.startup,"x"
	.p2align 4
	.def	_GLOBAL__sub_I__ZN6Galois4G256C2Ev;	.scl	3;	.type	32;	.endef
	.seh_proc	_GLOBAL__sub_I__ZN6Galois4G256C2Ev
_GLOBAL__sub_I__ZN6Galois4G256C2Ev:
.LFB2880:
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
	.quad	_GLOBAL__sub_I__ZN6Galois4G256C2Ev
	.globl	_ZTSSt9exception
	.section	.rdata$_ZTSSt9exception,"dr"
	.linkonce same_size
	.align 8
_ZTSSt9exception:
	.ascii "St9exception\0"
	.globl	_ZTISt9exception
	.section	.rdata$_ZTISt9exception,"dr"
	.linkonce same_size
	.align 8
_ZTISt9exception:
	.quad	_ZTVN10__cxxabiv117__class_type_infoE+16
	.quad	_ZTSSt9exception
	.globl	_ZTSSt11logic_error
	.section	.rdata$_ZTSSt11logic_error,"dr"
	.linkonce same_size
	.align 16
_ZTSSt11logic_error:
	.ascii "St11logic_error\0"
	.globl	_ZTISt11logic_error
	.section	.rdata$_ZTISt11logic_error,"dr"
	.linkonce same_size
	.align 8
_ZTISt11logic_error:
	.quad	_ZTVN10__cxxabiv120__si_class_type_infoE+16
	.quad	_ZTSSt11logic_error
	.quad	_ZTISt9exception
	.globl	_ZTSSt16invalid_argument
	.section	.rdata$_ZTSSt16invalid_argument,"dr"
	.linkonce same_size
	.align 16
_ZTSSt16invalid_argument:
	.ascii "St16invalid_argument\0"
	.globl	_ZTISt16invalid_argument
	.section	.rdata$_ZTISt16invalid_argument,"dr"
	.linkonce same_size
	.align 8
_ZTISt16invalid_argument:
	.quad	_ZTVN10__cxxabiv120__si_class_type_infoE+16
	.quad	_ZTSSt16invalid_argument
	.quad	_ZTISt11logic_error
.lcomm _ZStL8__ioinit,1,1
	.ident	"GCC: (Rev1, Built by MSYS2 project) 11.3.0"
	.def	_ZNSt8ios_base4InitD1Ev;	.scl	2;	.type	32;	.endef
	.def	__cxa_allocate_exception;	.scl	2;	.type	32;	.endef
	.def	_ZNSt16invalid_argumentC1EPKc;	.scl	2;	.type	32;	.endef
	.def	_ZNSt16invalid_argumentD1Ev;	.scl	2;	.type	32;	.endef
	.def	__cxa_throw;	.scl	2;	.type	32;	.endef
	.def	__cxa_free_exception;	.scl	2;	.type	32;	.endef
	.def	_Unwind_Resume;	.scl	2;	.type	32;	.endef
	.def	_ZdlPvy;	.scl	2;	.type	32;	.endef
	.def	_Znwy;	.scl	2;	.type	32;	.endef
	.def	__cxa_begin_catch;	.scl	2;	.type	32;	.endef
	.def	__cxa_rethrow;	.scl	2;	.type	32;	.endef
	.def	__cxa_end_catch;	.scl	2;	.type	32;	.endef
	.def	_ZNSt8ios_base4InitC1Ev;	.scl	2;	.type	32;	.endef
	.def	atexit;	.scl	2;	.type	32;	.endef
	.section	.rdata$.refptr._ZNSt16invalid_argumentD1Ev, "dr"
	.globl	.refptr._ZNSt16invalid_argumentD1Ev
	.linkonce	discard
.refptr._ZNSt16invalid_argumentD1Ev:
	.quad	_ZNSt16invalid_argumentD1Ev
