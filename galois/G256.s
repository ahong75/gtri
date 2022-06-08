	.file	"G256.cpp"
# GNU C++14 (Ubuntu 9.3.0-17ubuntu1~20.04) version 9.3.0 (x86_64-linux-gnu)
#	compiled by GNU C version 9.3.0, GMP version 6.2.0, MPFR version 4.0.2, MPC version 1.1.0, isl version isl-0.22.1-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -imultiarch x86_64-linux-gnu -D_GNU_SOURCE G256.cpp
# -mtune=generic -march=x86-64 -O3 -fverbose-asm
# -fasynchronous-unwind-tables -fstack-protector-strong -Wformat
# -Wformat-security -fstack-clash-protection -fcf-protection
# options enabled:  -fPIC -fPIE -faggressive-loop-optimizations
# -falign-functions -falign-jumps -falign-labels -falign-loops
# -fassume-phsa -fasynchronous-unwind-tables -fauto-inc-dec
# -fbranch-count-reg -fcaller-saves -fcode-hoisting
# -fcombine-stack-adjustments -fcommon -fcompare-elim -fcprop-registers
# -fcrossjumping -fcse-follow-jumps -fdefer-pop
# -fdelete-null-pointer-checks -fdevirtualize -fdevirtualize-speculatively
# -fdwarf2-cfi-asm -fearly-inlining -feliminate-unused-debug-types
# -fexceptions -fexpensive-optimizations -fforward-propagate
# -ffp-int-builtin-inexact -ffunction-cse -fgcse -fgcse-after-reload
# -fgcse-lm -fgnu-runtime -fgnu-unique -fguess-branch-probability
# -fhoist-adjacent-loads -fident -fif-conversion -fif-conversion2
# -findirect-inlining -finline -finline-atomics -finline-functions
# -finline-functions-called-once -finline-small-functions -fipa-bit-cp
# -fipa-cp -fipa-cp-clone -fipa-icf -fipa-icf-functions -fipa-icf-variables
# -fipa-profile -fipa-pure-const -fipa-ra -fipa-reference
# -fipa-reference-addressable -fipa-sra -fipa-stack-alignment -fipa-vrp
# -fira-hoist-pressure -fira-share-save-slots -fira-share-spill-slots
# -fisolate-erroneous-paths-dereference -fivopts -fkeep-static-consts
# -fleading-underscore -flifetime-dse -floop-interchange
# -floop-unroll-and-jam -flra-remat -flto-odr-type-merging -fmath-errno
# -fmerge-constants -fmerge-debug-strings -fmove-loop-invariants
# -fomit-frame-pointer -foptimize-sibling-calls -foptimize-strlen
# -fpartial-inlining -fpeel-loops -fpeephole -fpeephole2 -fplt
# -fpredictive-commoning -fprefetch-loop-arrays -free -freg-struct-return
# -freorder-blocks -freorder-blocks-and-partition -freorder-functions
# -frerun-cse-after-loop -fsched-critical-path-heuristic
# -fsched-dep-count-heuristic -fsched-group-heuristic -fsched-interblock
# -fsched-last-insn-heuristic -fsched-rank-heuristic -fsched-spec
# -fsched-spec-insn-heuristic -fsched-stalled-insns-dep -fschedule-fusion
# -fschedule-insns2 -fsemantic-interposition -fshow-column -fshrink-wrap
# -fshrink-wrap-separate -fsigned-zeros -fsplit-ivs-in-unroller
# -fsplit-loops -fsplit-paths -fsplit-wide-types -fssa-backprop
# -fssa-phiopt -fstack-clash-protection -fstack-protector-strong
# -fstdarg-opt -fstore-merging -fstrict-aliasing
# -fstrict-volatile-bitfields -fsync-libcalls -fthread-jumps
# -ftoplevel-reorder -ftrapping-math -ftree-bit-ccp -ftree-builtin-call-dce
# -ftree-ccp -ftree-ch -ftree-coalesce-vars -ftree-copy-prop -ftree-cselim
# -ftree-dce -ftree-dominator-opts -ftree-dse -ftree-forwprop -ftree-fre
# -ftree-loop-distribute-patterns -ftree-loop-distribution
# -ftree-loop-if-convert -ftree-loop-im -ftree-loop-ivcanon
# -ftree-loop-optimize -ftree-loop-vectorize -ftree-parallelize-loops=
# -ftree-partial-pre -ftree-phiprop -ftree-pre -ftree-pta -ftree-reassoc
# -ftree-scev-cprop -ftree-sink -ftree-slp-vectorize -ftree-slsr -ftree-sra
# -ftree-switch-conversion -ftree-tail-merge -ftree-ter -ftree-vrp
# -funit-at-a-time -funswitch-loops -funwind-tables -fverbose-asm
# -fversion-loops-for-strides -fzero-initialized-in-bss
# -m128bit-long-double -m64 -m80387 -malign-stringops
# -mavx256-split-unaligned-load -mavx256-split-unaligned-store
# -mfancy-math-387 -mfp-ret-in-387 -mfxsr -mglibc -mieee-fp
# -mlong-double-80 -mmmx -mno-sse4 -mpush-args -mred-zone -msse -msse2
# -mstv -mtls-direct-seg-refs -mvzeroupper

	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Out of range."
	.section	.text.unlikely,"ax",@progbits
	.align 2
.LCOLDB1:
	.text
.LHOTB1:
	.align 2
	.p2align 4
	.globl	_ZN6Galois4ElemC2EPNS_4G256Eh
	.type	_ZN6Galois4ElemC2EPNS_4G256Eh, @function
_ZN6Galois4ElemC2EPNS_4G256Eh:
.LFB1967:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA1967
	endbr64	
	pushq	%r12	#
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp	#
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	subq	$8, %rsp	#,
	.cfi_def_cfa_offset 32
# G256.cpp:44: Elem::Elem(G256 *f, u8 n) : val(n), field(f) {
	movq	%rsi, (%rdi)	# f, *this_3(D).field
	movb	%dl, 8(%rdi)	# n, *this_3(D).val
# G256.cpp:45:   if (n > f->mx || n < 0) {
	cmpb	%dl, 48(%rsi)	# n, *f_5(D).mx
	jb	.L5	#,
# G256.cpp:48: };
	addq	$8, %rsp	#,
	.cfi_def_cfa_offset 24
	popq	%rbp	#
	.cfi_def_cfa_offset 16
	popq	%r12	#
	.cfi_def_cfa_offset 8
	ret	
	.globl	__gxx_personality_v0
	.section	.gcc_except_table,"a",@progbits
.LLSDA1967:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE1967-.LLSDACSB1967
.LLSDACSB1967:
.LLSDACSE1967:
	.text
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDAC1967
	.type	_ZN6Galois4ElemC2EPNS_4G256Eh.cold, @function
_ZN6Galois4ElemC2EPNS_4G256Eh.cold:
.LFSB1967:
.L5:
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -24
	.cfi_offset 12, -16
# G256.cpp:46:     throw std::invalid_argument("Out of range.");
	movl	$16, %edi	#,
	call	__cxa_allocate_exception@PLT	#
	leaq	.LC0(%rip), %rsi	#,
	movq	%rax, %rdi	# _10,
	movq	%rax, %rbp	# tmp95, _10
.LEHB0:
	call	_ZNSt16invalid_argumentC1EPKc@PLT	#
.LEHE0:
# G256.cpp:46:     throw std::invalid_argument("Out of range.");
	movq	_ZNSt16invalid_argumentD1Ev@GOTPCREL(%rip), %rdx	#,
	leaq	_ZTISt16invalid_argument(%rip), %rsi	#,
	movq	%rbp, %rdi	# _10,
.LEHB1:
	call	__cxa_throw@PLT	#
.L4:
	endbr64	
	movq	%rax, %r12	# tmp96, tmp91
# G256.cpp:46:     throw std::invalid_argument("Out of range.");
	movq	%rbp, %rdi	# _10,
	call	__cxa_free_exception@PLT	#
	movq	%r12, %rdi	# tmp91,
	call	_Unwind_Resume@PLT	#
.LEHE1:
	.cfi_endproc
.LFE1967:
	.section	.gcc_except_table
.LLSDAC1967:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSEC1967-.LLSDACSBC1967
.LLSDACSBC1967:
	.uleb128 .LEHB0-.LCOLDB1
	.uleb128 .LEHE0-.LEHB0
	.uleb128 .L4-.LCOLDB1
	.uleb128 0
	.uleb128 .LEHB1-.LCOLDB1
	.uleb128 .LEHE1-.LEHB1
	.uleb128 0
	.uleb128 0
.LLSDACSEC1967:
	.section	.text.unlikely
	.text
	.size	_ZN6Galois4ElemC2EPNS_4G256Eh, .-_ZN6Galois4ElemC2EPNS_4G256Eh
	.section	.text.unlikely
	.size	_ZN6Galois4ElemC2EPNS_4G256Eh.cold, .-_ZN6Galois4ElemC2EPNS_4G256Eh.cold
.LCOLDE1:
	.text
.LHOTE1:
	.globl	_ZN6Galois4ElemC1EPNS_4G256Eh
	.set	_ZN6Galois4ElemC1EPNS_4G256Eh,_ZN6Galois4ElemC2EPNS_4G256Eh
	.align 2
	.p2align 4
	.globl	_ZN6Galois4ElemplERKS0_
	.type	_ZN6Galois4ElemplERKS0_, @function
_ZN6Galois4ElemplERKS0_:
.LFB1969:
	.cfi_startproc
	endbr64	
# G256.cpp:52:   return res;
	movq	(%rdi), %r8	# this_6(D)->field, D.47855
# G256.cpp:51:   res.val = this->val ^ e.val;
	movzbl	8(%rdi), %eax	# this_6(D)->val, this_6(D)->val
# G256.cpp:52:   return res;
	xorl	%edx, %edx	# D.47855
# G256.cpp:51:   res.val = this->val ^ e.val;
	xorb	8(%rsi), %al	# e_8(D)->val, _4
# G256.cpp:52:   return res;
	movb	%al, %dl	# _4, D.47855
# G256.cpp:53: }
	movq	%r8, %rax	# D.47855,
	ret	
	.cfi_endproc
.LFE1969:
	.size	_ZN6Galois4ElemplERKS0_, .-_ZN6Galois4ElemplERKS0_
	.align 2
	.p2align 4
	.globl	_ZN6Galois4ElemmiERKS0_
	.type	_ZN6Galois4ElemmiERKS0_, @function
_ZN6Galois4ElemmiERKS0_:
.LFB2667:
	.cfi_startproc
	endbr64	
	movq	(%rdi), %r8	# this_2(D)->field, retval.170
	movzbl	8(%rdi), %eax	# this_2(D)->val, this_2(D)->val
	xorl	%edx, %edx	# retval.170
	xorb	8(%rsi), %al	# e_3(D)->val, _8
	movb	%al, %dl	# _8, retval.170
	movq	%r8, %rax	# retval.170,
	ret	
	.cfi_endproc
.LFE2667:
	.size	_ZN6Galois4ElemmiERKS0_, .-_ZN6Galois4ElemmiERKS0_
	.align 2
	.p2align 4
	.globl	_ZN6Galois4ElemmlERKS0_
	.type	_ZN6Galois4ElemmlERKS0_, @function
_ZN6Galois4ElemmlERKS0_:
.LFB1971:
	.cfi_startproc
	endbr64	
# G256.cpp:62:   Elem res(this->field);
	movq	(%rdi), %r8	# this_9(D)->field, _1
# G256.cpp:63:   res.val = (field->mul)[this->val][e.val];
	movzbl	8(%rdi), %eax	# this_9(D)->val, this_9(D)->val
# G256.cpp:63:   res.val = (field->mul)[this->val][e.val];
	movzbl	8(%rsi), %ecx	# e_11(D)->val, e_11(D)->val
	movq	(%r8), %rdx	# MEM[(struct vector * *)_1],
	leaq	(%rax,%rax,2), %rax	#, tmp102
	leaq	(%rdx,%rax,8), %rax	#, tmp104
# G256.cpp:64:   return res;
	xorl	%edx, %edx	# D.47863
# G256.cpp:63:   res.val = (field->mul)[this->val][e.val];
	movq	(%rax), %rax	# MEM[(unsigned char * *)_19], MEM[(unsigned char * *)_19]
# G256.cpp:64:   return res;
	movb	(%rax,%rcx), %dl	# *_12, D.47863
# G256.cpp:65: }
	movq	%r8, %rax	# _1,
	ret	
	.cfi_endproc
.LFE1971:
	.size	_ZN6Galois4ElemmlERKS0_, .-_ZN6Galois4ElemmlERKS0_
	.section	.rodata.str1.1
.LC2:
	.string	"Cannot divide by 0."
	.section	.text.unlikely
	.align 2
.LCOLDB3:
	.text
.LHOTB3:
	.align 2
	.p2align 4
	.globl	_ZN6Galois4ElemdvERKS0_
	.type	_ZN6Galois4ElemdvERKS0_, @function
_ZN6Galois4ElemdvERKS0_:
.LFB1972:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA1972
	endbr64	
	pushq	%r12	#
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp	#
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	subq	$8, %rsp	#,
	.cfi_def_cfa_offset 32
# G256.cpp:68:   if (e.val == 0) {
	movzbl	8(%rsi), %eax	# e_12(D)->val,
# G256.cpp:68:   if (e.val == 0) {
	testb	%al, %al	# _1
	je	.L15	#,
# G256.cpp:71:   Elem res(this->field);
	movq	(%rdi), %r8	# this_13(D)->field, _2
# G256.cpp:72:   res.val = (field->div)[this->val][e.val - 1];
	movzbl	8(%rdi), %edx	# this_13(D)->val, this_13(D)->val
# G256.cpp:72:   res.val = (field->div)[this->val][e.val - 1];
	subl	$1, %eax	#, tmp112
# G256.cpp:72:   res.val = (field->div)[this->val][e.val - 1];
	cltq
	movq	24(%r8), %rcx	# MEM[(struct vector * *)_2 + 24B],
	leaq	(%rdx,%rdx,2), %rdx	#, tmp108
	leaq	(%rcx,%rdx,8), %rdx	#, tmp110
# G256.cpp:72:   res.val = (field->div)[this->val][e.val - 1];
	movq	(%rdx), %rcx	# MEM[(unsigned char * *)_27], MEM[(unsigned char * *)_27]
# G256.cpp:73:   return res;
	xorl	%edx, %edx	# D.47869
	movb	(%rcx,%rax), %dl	# *_15, D.47869
# G256.cpp:74: }
	addq	$8, %rsp	#,
	.cfi_def_cfa_offset 24
	movq	%r8, %rax	# _2,
	popq	%rbp	#
	.cfi_def_cfa_offset 16
	popq	%r12	#
	.cfi_def_cfa_offset 8
	ret	
	.section	.gcc_except_table
.LLSDA1972:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE1972-.LLSDACSB1972
.LLSDACSB1972:
.LLSDACSE1972:
	.text
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDAC1972
	.type	_ZN6Galois4ElemdvERKS0_.cold, @function
_ZN6Galois4ElemdvERKS0_.cold:
.LFSB1972:
.L15:
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -24
	.cfi_offset 12, -16
# G256.cpp:69:     throw std::invalid_argument("Cannot divide by 0.");
	movl	$16, %edi	#,
	call	__cxa_allocate_exception@PLT	#
	leaq	.LC2(%rip), %rsi	#,
	movq	%rax, %rdi	# _20,
	movq	%rax, %rbp	# tmp123, _20
.LEHB2:
	call	_ZNSt16invalid_argumentC1EPKc@PLT	#
.LEHE2:
# G256.cpp:69:     throw std::invalid_argument("Cannot divide by 0.");
	movq	_ZNSt16invalid_argumentD1Ev@GOTPCREL(%rip), %rdx	#,
	leaq	_ZTISt16invalid_argument(%rip), %rsi	#,
	movq	%rbp, %rdi	# _20,
.LEHB3:
	call	__cxa_throw@PLT	#
.L14:
	endbr64	
	movq	%rax, %r12	# tmp124, tmp116
# G256.cpp:69:     throw std::invalid_argument("Cannot divide by 0.");
	movq	%rbp, %rdi	# _20,
	call	__cxa_free_exception@PLT	#
	movq	%r12, %rdi	# tmp116,
	call	_Unwind_Resume@PLT	#
.LEHE3:
	.cfi_endproc
.LFE1972:
	.section	.gcc_except_table
.LLSDAC1972:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSEC1972-.LLSDACSBC1972
.LLSDACSBC1972:
	.uleb128 .LEHB2-.LCOLDB3
	.uleb128 .LEHE2-.LEHB2
	.uleb128 .L14-.LCOLDB3
	.uleb128 0
	.uleb128 .LEHB3-.LCOLDB3
	.uleb128 .LEHE3-.LEHB3
	.uleb128 0
	.uleb128 0
.LLSDACSEC1972:
	.section	.text.unlikely
	.text
	.size	_ZN6Galois4ElemdvERKS0_, .-_ZN6Galois4ElemdvERKS0_
	.section	.text.unlikely
	.size	_ZN6Galois4ElemdvERKS0_.cold, .-_ZN6Galois4ElemdvERKS0_.cold
.LCOLDE3:
	.text
.LHOTE3:
	.section	.text._ZNSt6vectorIS_IhSaIhEESaIS1_EED2Ev,"axG",@progbits,_ZNSt6vectorIS_IhSaIhEESaIS1_EED5Ev,comdat
	.align 2
	.p2align 4
	.weak	_ZNSt6vectorIS_IhSaIhEESaIS1_EED2Ev
	.type	_ZNSt6vectorIS_IhSaIhEESaIS1_EED2Ev, @function
_ZNSt6vectorIS_IhSaIhEESaIS1_EED2Ev:
.LFB2218:
	.cfi_startproc
	endbr64	
	pushq	%r12	#
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movq	%rdi, %r12	# tmp86, this
	pushq	%rbp	#
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx	#
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
# /usr/include/c++/9/bits/stl_vector.h:677: 	std::_Destroy(this->_M_impl._M_start, this->_M_impl._M_finish,
	movq	8(%rdi), %rbx	# this_3(D)->D.16835._M_impl.D.16137._M_finish, _1
	movq	(%rdi), %rbp	# this_3(D)->D.16835._M_impl.D.16137._M_start, __first
# /usr/include/c++/9/bits/stl_construct.h:107: 	  for (; __first != __last; ++__first)
	cmpq	%rbp, %rbx	# __first, _1
	je	.L19	#,
	.p2align 4,,10
	.p2align 3
.L23:
# /usr/include/c++/9/bits/stl_vector.h:677: 	std::_Destroy(this->_M_impl._M_start, this->_M_impl._M_finish,
	movq	0(%rbp), %rdi	# MEM[base: __first_19, offset: 0B], _8
# /usr/include/c++/9/bits/stl_vector.h:350: 	if (__p)
	testq	%rdi, %rdi	# _8
	je	.L20	#,
# /usr/include/c++/9/ext/new_allocator.h:128: 	::operator delete(__p);
	call	_ZdlPv@PLT	#
# /usr/include/c++/9/bits/stl_construct.h:107: 	  for (; __first != __last; ++__first)
	addq	$24, %rbp	#, __first
# /usr/include/c++/9/bits/stl_construct.h:107: 	  for (; __first != __last; ++__first)
	cmpq	%rbp, %rbx	# __first, _1
	jne	.L23	#,
.L21:
	movq	(%r12), %rbp	# MEM[(struct _Vector_base *)this_3(D)]._M_impl.D.16137._M_start, __first
.L19:
# /usr/include/c++/9/bits/stl_vector.h:350: 	if (__p)
	testq	%rbp, %rbp	# __first
	je	.L18	#,
# /usr/include/c++/9/bits/stl_vector.h:680:       }
	popq	%rbx	#
	.cfi_remember_state
	.cfi_def_cfa_offset 24
# /usr/include/c++/9/ext/new_allocator.h:128: 	::operator delete(__p);
	movq	%rbp, %rdi	# __first,
# /usr/include/c++/9/bits/stl_vector.h:680:       }
	popq	%rbp	#
	.cfi_def_cfa_offset 16
	popq	%r12	#
	.cfi_def_cfa_offset 8
# /usr/include/c++/9/ext/new_allocator.h:128: 	::operator delete(__p);
	jmp	_ZdlPv@PLT	#
	.p2align 4,,10
	.p2align 3
.L20:
	.cfi_restore_state
# /usr/include/c++/9/bits/stl_construct.h:107: 	  for (; __first != __last; ++__first)
	addq	$24, %rbp	#, __first
# /usr/include/c++/9/bits/stl_construct.h:107: 	  for (; __first != __last; ++__first)
	cmpq	%rbp, %rbx	# __first, _1
	jne	.L23	#,
	jmp	.L21	#
	.p2align 4,,10
	.p2align 3
.L18:
# /usr/include/c++/9/bits/stl_vector.h:680:       }
	popq	%rbx	#
	.cfi_def_cfa_offset 24
	popq	%rbp	#
	.cfi_def_cfa_offset 16
	popq	%r12	#
	.cfi_def_cfa_offset 8
	ret	
	.cfi_endproc
.LFE2218:
	.size	_ZNSt6vectorIS_IhSaIhEESaIS1_EED2Ev, .-_ZNSt6vectorIS_IhSaIhEESaIS1_EED2Ev
	.weak	_ZNSt6vectorIS_IhSaIhEESaIS1_EED1Ev
	.set	_ZNSt6vectorIS_IhSaIhEESaIS1_EED1Ev,_ZNSt6vectorIS_IhSaIhEESaIS1_EED2Ev
	.section	.text.unlikely
	.align 2
.LCOLDB4:
	.text
.LHOTB4:
	.align 2
	.p2align 4
	.globl	_ZN6Galois4G256C2Ev
	.type	_ZN6Galois4G256C2Ev, @function
_ZN6Galois4G256C2Ev:
.LFB1961:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA1961
	endbr64	
	pushq	%r15	#
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
# /usr/include/c++/9/bits/stl_vector.h:95: 	: _M_start(), _M_finish(), _M_end_of_storage()
	pxor	%xmm0, %xmm0	# tmp225
# G256.cpp:10: G256::G256() {
	pushq	%r14	#
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13	#
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movq	%rdi, %r13	# tmp385, this
	pushq	%r12	#
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp	#
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx	#
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$40, %rsp	#,
	.cfi_def_cfa_offset 96
# G256.cpp:11:   mx = 255;
	movb	$-1, 48(%rdi)	#, *this_33(D).mx
# /usr/include/c++/9/bits/stl_vector.h:95: 	: _M_start(), _M_finish(), _M_end_of_storage()
	movups	%xmm0, (%rdi)	# tmp225, MEM[(struct vector * *)this_33(D)]
	movups	%xmm0, 16(%rdi)	# tmp225, MEM[(struct vector * *)this_33(D) + 16B]
	movups	%xmm0, 32(%rdi)	# tmp225, MEM[(struct vector * *)this_33(D) + 32B]
# /usr/include/c++/9/ext/new_allocator.h:114: 	return static_cast<_Tp*>(::operator new(__n * sizeof(_Tp)));
	movl	$256, %edi	#,
.LEHB4:
	call	_Znwm@PLT	#
.LEHE4:
# /usr/include/c++/9/bits/stl_algobase.h:725: 	__builtin_memset(__first, static_cast<unsigned char>(__tmp), __len);
	leaq	8(%rax), %rdi	#, tmp235
	movq	%rax, %rcx	# _106, _106
	movq	$0, (%rax)	#,* _106
# /usr/include/c++/9/ext/new_allocator.h:114: 	return static_cast<_Tp*>(::operator new(__n * sizeof(_Tp)));
	movq	%rax, %rbp	# tmp386, _106
# /usr/include/c++/9/bits/stl_algobase.h:725: 	__builtin_memset(__first, static_cast<unsigned char>(__tmp), __len);
	movq	$0, 248(%rax)	#,
	andq	$-8, %rdi	#, tmp235
	xorl	%eax, %eax	# tmp231
	subq	%rdi, %rcx	# tmp235, _106
	addl	$256, %ecx	#, tmp230
	shrl	$3, %ecx	#,
	rep stosq
# /usr/include/c++/9/ext/new_allocator.h:114: 	return static_cast<_Tp*>(::operator new(__n * sizeof(_Tp)));
	movl	$6144, %edi	#,
.LEHB5:
	call	_Znwm@PLT	#
.LEHE5:
	movq	%rax, %r12	# tmp387, _114
# /usr/include/c++/9/bits/stl_vector.h:360: 	this->_M_impl._M_end_of_storage = this->_M_impl._M_start + __n;
	leaq	6144(%rax), %rax	#, _110
	movq	%rax, (%rsp)	# _110, %sfp
# /usr/include/c++/9/ext/new_allocator.h:114: 	return static_cast<_Tp*>(::operator new(__n * sizeof(_Tp)));
	movq	%r12, %rbx	# _114, __cur
.L27:
# /usr/include/c++/9/bits/stl_vector.h:95: 	: _M_start(), _M_finish(), _M_end_of_storage()
	movq	$0, 16(%rbx)	#, MEM[base: __cur_199, offset: 16B]
	pxor	%xmm1, %xmm1	# tmp438
# /usr/include/c++/9/ext/new_allocator.h:114: 	return static_cast<_Tp*>(::operator new(__n * sizeof(_Tp)));
	movl	$256, %edi	#,
# /usr/include/c++/9/bits/stl_vector.h:95: 	: _M_start(), _M_finish(), _M_end_of_storage()
	movups	%xmm1, (%rbx)	# tmp438, MEM[base: __cur_199, offset: 0B]
.LEHB6:
# /usr/include/c++/9/ext/new_allocator.h:114: 	return static_cast<_Tp*>(::operator new(__n * sizeof(_Tp)));
	call	_Znwm@PLT	#
.LEHE6:
# /usr/include/c++/9/bits/stl_algobase.h:386: 	    __builtin_memmove(__result, __first, sizeof(_Tp) * _Num);
	movdqu	0(%rbp), %xmm2	# MEM[(void *)_106], tmp439
	movdqu	16(%rbp), %xmm3	# MEM[(void *)_106], tmp440
# /usr/include/c++/9/bits/stl_vector.h:358: 	this->_M_impl._M_start = this->_M_allocate(__n);
	movq	%rax, (%rbx)	# tmp240, MEM[base: __cur_199, offset: 0B]
# /usr/include/c++/9/bits/stl_vector.h:360: 	this->_M_impl._M_end_of_storage = this->_M_impl._M_start + __n;
	leaq	256(%rax), %rdx	#, _131
# /usr/include/c++/9/bits/stl_algobase.h:386: 	    __builtin_memmove(__result, __first, sizeof(_Tp) * _Num);
	movdqu	32(%rbp), %xmm4	# MEM[(void *)_106], tmp441
	movdqu	48(%rbp), %xmm5	# MEM[(void *)_106], tmp442
# /usr/include/c++/9/bits/stl_vector.h:360: 	this->_M_impl._M_end_of_storage = this->_M_impl._M_start + __n;
	movq	%rdx, 16(%rbx)	# _131, MEM[base: __cur_199, offset: 16B]
# /usr/include/c++/9/bits/stl_uninitialized.h:221: 	      for (; __n > 0; --__n, (void) ++__cur)
	addq	$24, %rbx	#, __cur
# /usr/include/c++/9/bits/stl_algobase.h:386: 	    __builtin_memmove(__result, __first, sizeof(_Tp) * _Num);
	movdqu	64(%rbp), %xmm6	# MEM[(void *)_106], tmp443
	movdqu	80(%rbp), %xmm7	# MEM[(void *)_106], tmp444
	movups	%xmm2, (%rax)	# tmp439, MEM[(void *)_139]
	movdqu	96(%rbp), %xmm1	# MEM[(void *)_106], tmp445
	movdqu	112(%rbp), %xmm2	# MEM[(void *)_106], tmp446
	movups	%xmm3, 16(%rax)	# tmp440, MEM[(void *)_139]
	movups	%xmm4, 32(%rax)	# tmp441, MEM[(void *)_139]
	movdqu	128(%rbp), %xmm3	# MEM[(void *)_106], tmp447
	movdqu	144(%rbp), %xmm4	# MEM[(void *)_106], tmp448
	movups	%xmm5, 48(%rax)	# tmp442, MEM[(void *)_139]
	movdqu	160(%rbp), %xmm5	# MEM[(void *)_106], tmp449
	movups	%xmm6, 64(%rax)	# tmp443, MEM[(void *)_139]
	movdqu	176(%rbp), %xmm6	# MEM[(void *)_106], tmp450
	movups	%xmm7, 80(%rax)	# tmp444, MEM[(void *)_139]
	movdqu	192(%rbp), %xmm7	# MEM[(void *)_106], tmp451
	movups	%xmm1, 96(%rax)	# tmp445, MEM[(void *)_139]
	movdqu	208(%rbp), %xmm1	# MEM[(void *)_106], tmp452
	movups	%xmm2, 112(%rax)	# tmp446, MEM[(void *)_139]
	movdqu	224(%rbp), %xmm2	# MEM[(void *)_106], tmp453
	movups	%xmm3, 128(%rax)	# tmp447, MEM[(void *)_139]
	movups	%xmm4, 144(%rax)	# tmp448, MEM[(void *)_139]
	movups	%xmm5, 160(%rax)	# tmp449, MEM[(void *)_139]
	movups	%xmm6, 176(%rax)	# tmp450, MEM[(void *)_139]
	movups	%xmm7, 192(%rax)	# tmp451, MEM[(void *)_139]
	movups	%xmm1, 208(%rax)	# tmp452, MEM[(void *)_139]
	movups	%xmm2, 224(%rax)	# tmp453, MEM[(void *)_139]
	movdqu	240(%rbp), %xmm3	# MEM[(void *)_106], tmp454
# /usr/include/c++/9/bits/stl_vector.h:554: 	this->_M_impl._M_finish =
	movq	%rdx, -16(%rbx)	# _131, MEM[base: __cur_199, offset: 8B]
# /usr/include/c++/9/bits/stl_algobase.h:386: 	    __builtin_memmove(__result, __first, sizeof(_Tp) * _Num);
	movups	%xmm3, 240(%rax)	# tmp454, MEM[(void *)_139]
# /usr/include/c++/9/bits/stl_uninitialized.h:221: 	      for (; __n > 0; --__n, (void) ++__cur)
	cmpq	%rbx, (%rsp)	# __cur, %sfp
	jne	.L27	#,
# /usr/include/c++/9/bits/stl_vector.h:108: 	  _M_start = __x._M_start;
	movq	(%rsp), %rax	# %sfp, _110
# /usr/include/c++/9/bits/stl_vector.h:108: 	  _M_start = __x._M_start;
	movq	0(%r13), %r14	# MEM[(const struct _Vector_impl_data &)this_33(D)]._M_start, _147
# /usr/include/c++/9/bits/stl_vector.h:108: 	  _M_start = __x._M_start;
	movq	%r12, %xmm0	# _114, tmp257
# /usr/include/c++/9/bits/stl_vector.h:109: 	  _M_finish = __x._M_finish;
	movq	8(%r13), %r15	# MEM[(const struct _Vector_impl_data &)this_33(D)]._M_finish, _148
# /usr/include/c++/9/bits/stl_vector.h:108: 	  _M_start = __x._M_start;
	movq	%rax, %xmm6	# _110, _110
# /usr/include/c++/9/bits/stl_vector.h:110: 	  _M_end_of_storage = __x._M_end_of_storage;
	movq	%rax, 16(%r13)	# _110, MEM[(struct _Vector_impl_data *)this_33(D)]._M_end_of_storage
# /usr/include/c++/9/bits/stl_construct.h:107: 	  for (; __first != __last; ++__first)
	movq	%r14, %rbx	# _147, __first
# /usr/include/c++/9/bits/stl_vector.h:108: 	  _M_start = __x._M_start;
	punpcklqdq	%xmm6, %xmm0	# _110, tmp257
	movups	%xmm0, 0(%r13)	# tmp257, MEM[(struct vector * *)this_33(D)]
# /usr/include/c++/9/bits/stl_construct.h:107: 	  for (; __first != __last; ++__first)
	cmpq	%r15, %r14	# _148, _147
	je	.L38	#,
.L28:
# /usr/include/c++/9/bits/stl_vector.h:677: 	std::_Destroy(this->_M_impl._M_start, this->_M_impl._M_finish,
	movq	(%rbx), %rdi	# MEM[base: __first_220, offset: 0B], _156
# /usr/include/c++/9/bits/stl_vector.h:350: 	if (__p)
	testq	%rdi, %rdi	# _156
	je	.L37	#,
# /usr/include/c++/9/ext/new_allocator.h:128: 	::operator delete(__p);
	call	_ZdlPv@PLT	#
# /usr/include/c++/9/bits/stl_construct.h:107: 	  for (; __first != __last; ++__first)
	addq	$24, %rbx	#, __first
# /usr/include/c++/9/bits/stl_construct.h:107: 	  for (; __first != __last; ++__first)
	cmpq	%r15, %rbx	# _148, __first
	jne	.L28	#,
.L38:
# /usr/include/c++/9/bits/stl_vector.h:350: 	if (__p)
	testq	%r14, %r14	# _147
	je	.L30	#,
# /usr/include/c++/9/ext/new_allocator.h:128: 	::operator delete(__p);
	movq	%r14, %rdi	# _147,
	call	_ZdlPv@PLT	#
.L30:
	movq	%rbp, %rdi	# _106,
	call	_ZdlPv@PLT	#
# /usr/include/c++/9/ext/new_allocator.h:114: 	return static_cast<_Tp*>(::operator new(__n * sizeof(_Tp)));
	movl	$255, %edi	#,
.LEHB7:
	call	_Znwm@PLT	#
.LEHE7:
# /usr/include/c++/9/bits/stl_algobase.h:725: 	__builtin_memset(__first, static_cast<unsigned char>(__tmp), __len);
	leaq	8(%rax), %rdi	#, tmp271
	movq	%rax, %rcx	# _163, _163
# /usr/include/c++/9/ext/new_allocator.h:114: 	return static_cast<_Tp*>(::operator new(__n * sizeof(_Tp)));
	movq	%rax, %r12	# tmp398, _163
# /usr/include/c++/9/bits/stl_algobase.h:725: 	__builtin_memset(__first, static_cast<unsigned char>(__tmp), __len);
	movq	$0, (%rax)	#,* _163
	andq	$-8, %rdi	#, tmp271
	leaq	263(%rax), %r14	#, tmp369
	xorl	%eax, %eax	# tmp267
	movq	$0, -16(%r14)	#,
	subq	%rdi, %rcx	# tmp271, _163
	addl	$255, %ecx	#, tmp266
	shrl	$3, %ecx	#,
	rep stosq
# /usr/include/c++/9/ext/new_allocator.h:114: 	return static_cast<_Tp*>(::operator new(__n * sizeof(_Tp)));
	movl	$6144, %edi	#,
.LEHB8:
	call	_Znwm@PLT	#
.LEHE8:
	movq	%rax, %r15	# tmp391, _171
# /usr/include/c++/9/bits/stl_vector.h:360: 	this->_M_impl._M_end_of_storage = this->_M_impl._M_start + __n;
	leaq	6144(%rax), %rbp	#, _167
# /usr/include/c++/9/ext/new_allocator.h:114: 	return static_cast<_Tp*>(::operator new(__n * sizeof(_Tp)));
	movq	%rax, %rbx	# _171, __cur
.L40:
# /usr/include/c++/9/bits/stl_vector.h:95: 	: _M_start(), _M_finish(), _M_end_of_storage()
	movq	$0, 16(%rbx)	#, MEM[base: __cur_203, offset: 16B]
	pxor	%xmm4, %xmm4	# tmp458
# /usr/include/c++/9/ext/new_allocator.h:114: 	return static_cast<_Tp*>(::operator new(__n * sizeof(_Tp)));
	movl	$255, %edi	#,
# /usr/include/c++/9/bits/stl_vector.h:95: 	: _M_start(), _M_finish(), _M_end_of_storage()
	movups	%xmm4, (%rbx)	# tmp458, MEM[base: __cur_203, offset: 0B]
.LEHB9:
# /usr/include/c++/9/ext/new_allocator.h:114: 	return static_cast<_Tp*>(::operator new(__n * sizeof(_Tp)));
	call	_Znwm@PLT	#
.LEHE9:
# /usr/include/c++/9/bits/stl_vector.h:358: 	this->_M_impl._M_start = this->_M_allocate(__n);
	movq	%rax, (%rbx)	# tmp276, MEM[base: __cur_203, offset: 0B]
# /usr/include/c++/9/bits/stl_algobase.h:386: 	    __builtin_memmove(__result, __first, sizeof(_Tp) * _Num);
	leaq	8(%rax), %rdi	#, tmp288
	movq	%r12, %rsi	# _163, _163
# /usr/include/c++/9/bits/stl_uninitialized.h:221: 	      for (; __n > 0; --__n, (void) ++__cur)
	addq	$24, %rbx	#, __cur
# /usr/include/c++/9/bits/stl_vector.h:360: 	this->_M_impl._M_end_of_storage = this->_M_impl._M_start + __n;
	leaq	255(%rax), %rdx	#, _188
# /usr/include/c++/9/bits/stl_algobase.h:386: 	    __builtin_memmove(__result, __first, sizeof(_Tp) * _Num);
	andq	$-8, %rdi	#, tmp288
# /usr/include/c++/9/bits/stl_vector.h:360: 	this->_M_impl._M_end_of_storage = this->_M_impl._M_start + __n;
	movq	%rdx, -8(%rbx)	# _188, MEM[base: __cur_203, offset: 16B]
# /usr/include/c++/9/bits/stl_algobase.h:386: 	    __builtin_memmove(__result, __first, sizeof(_Tp) * _Num);
	movq	(%r12), %rcx	#* _163, tmp280
	movq	%rcx, (%rax)	# tmp280,
	movq	-16(%r14), %rcx	#, tmp287
	movq	%rcx, 247(%rax)	# tmp287,
	subq	%rdi, %rax	# tmp288, _196
	subq	%rax, %rsi	# _196, _163
	addl	$255, %eax	#, tmp279
	shrl	$3, %eax	#, tmp279
	movl	%eax, %ecx	# tmp279,
	rep movsq
# /usr/include/c++/9/bits/stl_vector.h:554: 	this->_M_impl._M_finish =
	movq	%rdx, -16(%rbx)	# _188, MEM[base: __cur_203, offset: 8B]
# /usr/include/c++/9/bits/stl_uninitialized.h:221: 	      for (; __n > 0; --__n, (void) ++__cur)
	cmpq	%rbx, %rbp	# __cur, _167
	jne	.L40	#,
# /usr/include/c++/9/bits/stl_vector.h:108: 	  _M_start = __x._M_start;
	movq	24(%r13), %r14	# MEM[(const struct _Vector_impl_data &)this_33(D) + 24]._M_start, _204
# /usr/include/c++/9/bits/stl_vector.h:109: 	  _M_finish = __x._M_finish;
	movq	32(%r13), %rax	# MEM[(const struct _Vector_impl_data &)this_33(D) + 24]._M_finish, _205
# /usr/include/c++/9/bits/stl_vector.h:108: 	  _M_start = __x._M_start;
	movq	%rbp, %xmm5	# _167, _167
	movq	%r15, %xmm0	# _171, tmp291
	punpcklqdq	%xmm5, %xmm0	# _167, tmp291
# /usr/include/c++/9/bits/stl_vector.h:110: 	  _M_end_of_storage = __x._M_end_of_storage;
	movq	%rbp, 40(%r13)	# _167, MEM[(struct _Vector_impl_data *)this_33(D) + 24B]._M_end_of_storage
# /usr/include/c++/9/bits/stl_vector.h:108: 	  _M_start = __x._M_start;
	movups	%xmm0, 24(%r13)	# tmp291, MEM[(struct vector * *)this_33(D) + 24B]
# /usr/include/c++/9/bits/stl_construct.h:107: 	  for (; __first != __last; ++__first)
	movq	%r14, %rbx	# _204, __first
	movq	%rax, %rbp	# _205, _205
	cmpq	%rax, %r14	# _205, _204
	je	.L51	#,
.L41:
# /usr/include/c++/9/bits/stl_vector.h:677: 	std::_Destroy(this->_M_impl._M_start, this->_M_impl._M_finish,
	movq	(%rbx), %rdi	# MEM[base: __first_224, offset: 0B], _213
# /usr/include/c++/9/bits/stl_vector.h:350: 	if (__p)
	testq	%rdi, %rdi	# _213
	je	.L50	#,
# /usr/include/c++/9/ext/new_allocator.h:128: 	::operator delete(__p);
	call	_ZdlPv@PLT	#
# /usr/include/c++/9/bits/stl_construct.h:107: 	  for (; __first != __last; ++__first)
	addq	$24, %rbx	#, __first
# /usr/include/c++/9/bits/stl_construct.h:107: 	  for (; __first != __last; ++__first)
	cmpq	%rbx, %rbp	# __first, _205
	jne	.L41	#,
.L51:
# /usr/include/c++/9/bits/stl_vector.h:350: 	if (__p)
	testq	%r14, %r14	# _204
	je	.L43	#,
# /usr/include/c++/9/ext/new_allocator.h:128: 	::operator delete(__p);
	movq	%r14, %rdi	# _204,
	call	_ZdlPv@PLT	#
.L43:
	movq	%r12, %rdi	# _163,
	call	_ZdlPv@PLT	#
	movb	$0, 31(%rsp)	#, %sfp
	xorl	%edi, %edi	# ivtmp.231
	movq	$-1, 8(%rsp)	#, %sfp
# G256.cpp:19:   for (int i = 0; i < 256; i++) {
	movl	$0, 24(%rsp)	#, %sfp
.L71:
	movl	24(%rsp), %ebx	# %sfp, i
# G256.cpp:34:           a ^= 0b11011;
	movzbl	31(%rsp), %eax	# %sfp, ivtmp.233
	testb	%bl, %bl	# i
	movl	%eax, %r8d	# ivtmp.233, a
	movb	%bl, 29(%rsp)	# tmp463, %sfp
	sete	(%rsp)	#, %sfp
	xorl	$27, %r8d	#, a
	testb	%bl, %bl	# i
	cmovns	%eax, %r8d	# a,, ivtmp.233, a
	testb	%al, %al	# ivtmp.233
	sete	%al	#, tmp302
	testb	%bl, %bl	# i
	movl	$0, %ebx	#, tmp469
	cmovs	%ebx, %eax	# tmp302,, tmp469, tmp302
	movb	%al, 18(%rsp)	# tmp302, %sfp
	movl	%r8d, %eax	# a, a
	addb	%al, %al	# a
	movl	%eax, %r10d	# a, a
	sete	19(%rsp)	#, %sfp
	xorl	$27, %r10d	#, a
	testb	%r8b, %r8b	# a
	cmovns	%eax, %r10d	# a,, a, a
	movl	%r10d, %r11d	# a, a
	addb	%r11b, %r11b	# a
	movl	%r11d, %eax	# a, a
	sete	20(%rsp)	#, %sfp
	xorl	$27, %eax	#, a
	testb	%r10b, %r10b	# a
	cmovs	%eax, %r11d	# a,, a, a
	movl	%r11d, %eax	# a, a
	addb	%al, %al	# a
	movl	%eax, %ebx	# a, a
	sete	21(%rsp)	#, %sfp
	xorl	$27, %ebx	#, a
	testb	%r11b, %r11b	# a
	cmovns	%eax, %ebx	# a,, a, a
	movl	%ebx, %ebp	# a, a
	addb	%bpl, %bpl	# a
	movl	%ebp, %eax	# a, a
	sete	22(%rsp)	#, %sfp
	xorl	$27, %eax	#, a
	testb	%bl, %bl	# a
	cmovs	%eax, %ebp	# a,, a, a
	movl	%ebp, %r12d	# a, a
	addb	%r12b, %r12b	# a
	movl	%r12d, %eax	# a, a
	sete	23(%rsp)	#, %sfp
	xorl	$27, %eax	#, a
	testb	%bpl, %bpl	# a
	cmovs	%eax, %r12d	# a,, a, a
	movl	%r12d, %eax	# a, a
	addb	%al, %al	# a
	movl	%eax, %edx	# a, a
	sete	28(%rsp)	#, %sfp
	xorl	$27, %edx	#, a
	testb	%r12b, %r12b	# a
	cmovs	%edx, %eax	# a,, a
	xorl	%ecx, %ecx	# ivtmp.218
	movb	%al, 30(%rsp)	# a, %sfp
	jmp	.L70	#
	.p2align 4,,10
	.p2align 3
.L125:
# G256.cpp:28:         b >>= 1;
	sarl	%edx	# _258
	movl	%edx, %r14d	# _258, b
# G256.cpp:24:       for (int k = 0; k < 8 && a != 0 && b != 0; k++) {
	je	.L55	#,
	cmpb	$0, 18(%rsp)	#, %sfp
	jne	.L55	#,
.L76:
# G256.cpp:26:           p ^= a;
	movl	%eax, %r15d	# p, tmp370
	xorl	%r8d, %r15d	# a, tmp370
	andl	$1, %r14d	#, b
# G256.cpp:28:         b >>= 1;
	movl	%edx, %r14d	# _258, tmp321
# G256.cpp:26:           p ^= a;
	cmovne	%r15d, %eax	# tmp370,, p
# G256.cpp:32:         if (carry) {
	movzbl	19(%rsp), %r15d	# %sfp, _246
# G256.cpp:28:         b >>= 1;
	sarl	%r14d	# tmp321
# G256.cpp:32:         if (carry) {
	testb	%r8b, %r8b	# a
	cmovns	%r15d, %esi	# _251,, _246, _251
# G256.cpp:24:       for (int k = 0; k < 8 && a != 0 && b != 0; k++) {
	movl	%edx, %r15d	# _258, tmp430
	shrl	%r15d	# tmp430
	sete	%r15b	#, tmp323
	orb	%r15b, %sil	# tmp323, _190
	jne	.L58	#,
# G256.cpp:26:           p ^= a;
	movl	%eax, %r15d	# p, tmp372
	xorl	%r10d, %r15d	# a, tmp372
	andl	$1, %r14d	#, tmp321
# G256.cpp:28:         b >>= 1;
	movl	%edx, %r14d	# _258, tmp325
# G256.cpp:26:           p ^= a;
	cmovne	%r15d, %eax	# tmp372,, p
# G256.cpp:32:         if (carry) {
	movzbl	20(%rsp), %r15d	# %sfp, _174
# G256.cpp:28:         b >>= 1;
	sarl	$2, %r14d	#, tmp325
# G256.cpp:32:         if (carry) {
	testb	%r10b, %r10b	# a
	cmovns	%r15d, %esi	# _190,, _174, _190
# G256.cpp:24:       for (int k = 0; k < 8 && a != 0 && b != 0; k++) {
	movl	%edx, %r15d	# _258, tmp431
	shrl	$2, %r15d	#, tmp431
	sete	%r15b	#, tmp327
	orb	%r15b, %sil	# tmp327, _116
	jne	.L58	#,
# G256.cpp:26:           p ^= a;
	movl	%eax, %r15d	# p, tmp374
	xorl	%r11d, %r15d	# a, tmp374
	andl	$1, %r14d	#, tmp325
# G256.cpp:28:         b >>= 1;
	movl	%edx, %r14d	# _258, tmp329
# G256.cpp:26:           p ^= a;
	cmovne	%r15d, %eax	# tmp374,, p
# G256.cpp:32:         if (carry) {
	movzbl	21(%rsp), %r15d	# %sfp, _122
# G256.cpp:28:         b >>= 1;
	sarl	$3, %r14d	#, tmp329
# G256.cpp:32:         if (carry) {
	testb	%r11b, %r11b	# a
	cmovns	%r15d, %esi	# _116,, _122, _116
# G256.cpp:24:       for (int k = 0; k < 8 && a != 0 && b != 0; k++) {
	movl	%edx, %r15d	# _258, tmp432
	shrl	$3, %r15d	#, tmp432
	sete	%r15b	#, tmp331
	orb	%r15b, %sil	# tmp331, prephitmp_127
	jne	.L58	#,
# G256.cpp:26:           p ^= a;
	movl	%eax, %r15d	# p, tmp376
	xorl	%ebx, %r15d	# a, tmp376
	andl	$1, %r14d	#, tmp329
# G256.cpp:28:         b >>= 1;
	movl	%edx, %r14d	# _258, tmp333
# G256.cpp:26:           p ^= a;
	cmovne	%r15d, %eax	# tmp376,, p
# G256.cpp:32:         if (carry) {
	movzbl	22(%rsp), %r15d	# %sfp, _129
# G256.cpp:28:         b >>= 1;
	sarl	$4, %r14d	#, tmp333
# G256.cpp:32:         if (carry) {
	testb	%bl, %bl	# a
	cmovns	%r15d, %esi	# prephitmp_127,, _129, prephitmp_127
# G256.cpp:24:       for (int k = 0; k < 8 && a != 0 && b != 0; k++) {
	movl	%edx, %r15d	# _258, tmp433
	shrl	$4, %r15d	#, tmp433
	sete	%r15b	#, tmp335
	orb	%sil, %r15b	# prephitmp_127, prephitmp_115
	jne	.L58	#,
# G256.cpp:26:           p ^= a;
	movl	%eax, %esi	# p, tmp378
	xorl	%ebp, %esi	# a, tmp378
	andl	$1, %r14d	#, tmp333
# G256.cpp:28:         b >>= 1;
	movl	%edx, %r14d	# _258, tmp337
# G256.cpp:26:           p ^= a;
	cmovne	%esi, %eax	# tmp378,, p
# G256.cpp:32:         if (carry) {
	movzbl	23(%rsp), %esi	# %sfp, _103
# G256.cpp:28:         b >>= 1;
	sarl	$5, %r14d	#, tmp337
# G256.cpp:32:         if (carry) {
	testb	%bpl, %bpl	# a
	cmovns	%esi, %r15d	# prephitmp_115,, _103, prephitmp_115
# G256.cpp:24:       for (int k = 0; k < 8 && a != 0 && b != 0; k++) {
	movl	%edx, %esi	# _258, tmp434
	shrl	$5, %esi	#, tmp434
	sete	%sil	#, tmp339
	orb	%r15b, %sil	# prephitmp_115, _278
	jne	.L58	#,
# G256.cpp:26:           p ^= a;
	movl	%eax, %r15d	# p, tmp380
	xorl	%r12d, %r15d	# a, tmp380
	andl	$1, %r14d	#, tmp337
# G256.cpp:32:         if (carry) {
	movzbl	28(%rsp), %r14d	# %sfp, _166
# G256.cpp:26:           p ^= a;
	cmovne	%r15d, %eax	# tmp380,, p
# G256.cpp:32:         if (carry) {
	testb	%r12b, %r12b	# a
	cmovns	%r14d, %esi	# _278,, _166, _278
# G256.cpp:24:       for (int k = 0; k < 8 && a != 0 && b != 0; k++) {
	shrl	$6, %edx	#, _258
	je	.L58	#,
# G256.cpp:26:           p ^= a;
	movzbl	30(%rsp), %edx	# %sfp, tmp382
	xorl	%eax, %edx	# p, tmp382
	testb	%sil, %sil	# _278
	cmove	%edx, %eax	# tmp382,, p
.L58:
# G256.cpp:37:       mul[i][j] = p;
	movq	0(%r13), %rdx	# MEM[(struct vector * *)this_33(D)], MEM[(struct vector * *)this_33(D)]
# G256.cpp:37:       mul[i][j] = p;
	movq	(%rdx,%rdi), %rdx	# MEM[(unsigned char * *)_64], MEM[(unsigned char * *)_64]
	movb	%al, (%rdx,%rcx)	# p, *_76
# G256.cpp:38:       if (p != 0 && i != 0) {
	testb	%al, %al	# p
	je	.L69	#,
.L74:
# G256.cpp:39:         div[p][i - 1] = j;
	movq	24(%r13), %rdx	# MEM[(struct vector * *)this_33(D) + 24B],
# G256.cpp:39:         div[p][i - 1] = j;
	movzbl	%al, %eax	# p, p
# G256.cpp:39:         div[p][i - 1] = j;
	leaq	(%rax,%rax,2), %rax	#, tmp351
	leaq	(%rdx,%rax,8), %rax	#, tmp353
# G256.cpp:39:         div[p][i - 1] = j;
	movq	8(%rsp), %rdx	# %sfp, ivtmp.232
	movq	(%rax), %rax	# MEM[(unsigned char * *)_47], MEM[(unsigned char * *)_47]
	movb	%r9b, (%rax,%rdx)	# b, *_55
.L69:
	addq	$1, %rcx	#, ivtmp.218
# G256.cpp:20:     for (int j = 0; j < 256; j++) {
	cmpq	$256, %rcx	#, ivtmp.218
	je	.L124	#,
.L70:
# G256.cpp:24:       for (int k = 0; k < 8 && a != 0 && b != 0; k++) {
	testb	%cl, %cl	# ivtmp.218
# G256.cpp:22:       u8 b = static_cast<u8>(j);
	movl	%ecx, %r9d	# ivtmp.218, b
# G256.cpp:24:       for (int k = 0; k < 8 && a != 0 && b != 0; k++) {
	sete	%sil	#, tmp317
	orb	(%rsp), %sil	# %sfp, _251
	jne	.L55	#,
# G256.cpp:25:         if (b & 1) {
	movl	%ecx, %eax	# ivtmp.218, p
# G256.cpp:25:         if (b & 1) {
	movzbl	%cl, %edx	# ivtmp.218, _257
# G256.cpp:25:         if (b & 1) {
	andl	$1, %eax	#, p
	je	.L125	#,
# G256.cpp:28:         b >>= 1;
	sarl	%edx	# _258
	movl	%edx, %r14d	# _258, b
# G256.cpp:24:       for (int k = 0; k < 8 && a != 0 && b != 0; k++) {
	je	.L75	#,
	cmpb	$0, 18(%rsp)	#, %sfp
	jne	.L75	#,
# G256.cpp:26:           p ^= a;
	movzbl	29(%rsp), %eax	# %sfp, p
	jmp	.L76	#
.L37:
# /usr/include/c++/9/bits/stl_construct.h:107: 	  for (; __first != __last; ++__first)
	addq	$24, %rbx	#, __first
# /usr/include/c++/9/bits/stl_construct.h:107: 	  for (; __first != __last; ++__first)
	cmpq	%rbx, %r15	# __first, _148
	jne	.L28	#,
	jmp	.L38	#
	.p2align 4,,10
	.p2align 3
.L55:
# G256.cpp:37:       mul[i][j] = p;
	movq	0(%r13), %rax	# MEM[(struct vector * *)this_33(D)], MEM[(struct vector * *)this_33(D)]
# G256.cpp:37:       mul[i][j] = p;
	movq	(%rax,%rdi), %rax	#* ivtmp.231, MEM[(unsigned char * *)_404]
	movb	$0, (%rax,%rcx)	#,* ivtmp.218
	addq	$1, %rcx	#, ivtmp.218
# G256.cpp:20:     for (int j = 0; j < 256; j++) {
	cmpq	$256, %rcx	#, ivtmp.218
	jne	.L70	#,
.L124:
# G256.cpp:19:   for (int i = 0; i < 256; i++) {
	addl	$1, 24(%rsp)	#, %sfp
	movl	24(%rsp), %eax	# %sfp, i
	addq	$24, %rdi	#, ivtmp.231
	addq	$1, 8(%rsp)	#, %sfp
	addb	$2, 31(%rsp)	#, %sfp
# G256.cpp:19:   for (int i = 0; i < 256; i++) {
	cmpl	$256, %eax	#, i
	jne	.L71	#,
# G256.cpp:43: }
	addq	$40, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx	#
	.cfi_def_cfa_offset 48
	popq	%rbp	#
	.cfi_def_cfa_offset 40
	popq	%r12	#
	.cfi_def_cfa_offset 32
	popq	%r13	#
	.cfi_def_cfa_offset 24
	popq	%r14	#
	.cfi_def_cfa_offset 16
	popq	%r15	#
	.cfi_def_cfa_offset 8
	ret	
.L75:
	.cfi_restore_state
# G256.cpp:37:       mul[i][j] = p;
	movq	0(%r13), %rax	# MEM[(struct vector * *)this_33(D)], MEM[(struct vector * *)this_33(D)]
# G256.cpp:37:       mul[i][j] = p;
	movzbl	29(%rsp), %esi	# %sfp, _89
	movq	(%rax,%rdi), %rax	# MEM[(unsigned char * *)_263], MEM[(unsigned char * *)_263]
	movb	%sil, (%rax,%rcx)	# _89, *_315
# G256.cpp:26:           p ^= a;
	movl	%esi, %eax	# _89, p
	jmp	.L74	#
.L50:
# /usr/include/c++/9/bits/stl_construct.h:107: 	  for (; __first != __last; ++__first)
	addq	$24, %rbx	#, __first
# /usr/include/c++/9/bits/stl_construct.h:107: 	  for (; __first != __last; ++__first)
	cmpq	%rbx, %rbp	# __first, _205
	jne	.L41	#,
	jmp	.L51	#
.L86:
	endbr64	
	movq	%rax, %rbp	# tmp397, tmp355
	jmp	.L72	#
.L90:
	endbr64	
	movq	%rax, %rdi	# tmp393, tmp292
	jmp	.L44	#
.L88:
	endbr64	
	movq	%rax, %rdi	# tmp389, tmp258
	jmp	.L31	#
.L87:
	endbr64	
	movq	%rax, %rbp	# tmp396, tmp297
	jmp	.L49	#
.L85:
	endbr64	
	movq	%rax, %rbx	# tmp395, tmp263
	jmp	.L36	#
	.section	.gcc_except_table
	.align 4
.LLSDA1961:
	.byte	0xff
	.byte	0x9b
	.uleb128 .LLSDATT1961-.LLSDATTD1961
.LLSDATTD1961:
	.byte	0x1
	.uleb128 .LLSDACSE1961-.LLSDACSB1961
.LLSDACSB1961:
	.uleb128 .LEHB4-.LFB1961
	.uleb128 .LEHE4-.LEHB4
	.uleb128 .L86-.LFB1961
	.uleb128 0
	.uleb128 .LEHB5-.LFB1961
	.uleb128 .LEHE5-.LEHB5
	.uleb128 .L85-.LFB1961
	.uleb128 0
	.uleb128 .LEHB6-.LFB1961
	.uleb128 .LEHE6-.LEHB6
	.uleb128 .L88-.LFB1961
	.uleb128 0x1
	.uleb128 .LEHB7-.LFB1961
	.uleb128 .LEHE7-.LEHB7
	.uleb128 .L86-.LFB1961
	.uleb128 0
	.uleb128 .LEHB8-.LFB1961
	.uleb128 .LEHE8-.LEHB8
	.uleb128 .L87-.LFB1961
	.uleb128 0
	.uleb128 .LEHB9-.LFB1961
	.uleb128 .LEHE9-.LEHB9
	.uleb128 .L90-.LFB1961
	.uleb128 0x1
.LLSDACSE1961:
	.byte	0x1
	.byte	0
	.align 4
	.long	0

.LLSDATT1961:
	.text
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDAC1961
	.type	_ZN6Galois4G256C2Ev.cold, @function
_ZN6Galois4G256C2Ev.cold:
.LFSB1961:
	nop	
.L89:
	.cfi_def_cfa_offset 96
	.cfi_offset 3, -56
	.cfi_offset 6, -48
	.cfi_offset 12, -40
	.cfi_offset 13, -32
	.cfi_offset 14, -24
	.cfi_offset 15, -16
	endbr64	
	movq	%rax, %rbx	# tmp390, tmp260
# /usr/include/c++/9/bits/stl_uninitialized.h:225: 	  __catch(...)
	call	__cxa_end_catch@PLT	#
# /usr/include/c++/9/ext/new_allocator.h:128: 	::operator delete(__p);
	movq	%r12, %rdi	# _114,
	call	_ZdlPv@PLT	#
.L36:
# /usr/include/c++/9/ext/new_allocator.h:128: 	::operator delete(__p);
	movq	%rbp, %rdi	# _106,
	movq	%rbx, %rbp	# tmp263, tmp355
	call	_ZdlPv@PLT	#
.L72:
# G256.cpp:10: G256::G256() {
	leaq	24(%r13), %rdi	#, tmp357
	call	_ZNSt6vectorIS_IhSaIhEESaIS1_EED1Ev	#
	movq	%r13, %rdi	# this,
	call	_ZNSt6vectorIS_IhSaIhEESaIS1_EED1Ev	#
	movq	%rbp, %rdi	# tmp355,
.LEHB10:
	call	_Unwind_Resume@PLT	#
.LEHE10:
.L44:
# /usr/include/c++/9/bits/stl_uninitialized.h:225: 	  __catch(...)
	call	__cxa_begin_catch@PLT	#
# /usr/include/c++/9/ext/new_allocator.h:114: 	return static_cast<_Tp*>(::operator new(__n * sizeof(_Tp)));
	movq	%r15, %rbp	# _171, __first
.L47:
# /usr/include/c++/9/bits/stl_construct.h:107: 	  for (; __first != __last; ++__first)
	cmpq	%rbx, %rbp	# __cur, __first
	jne	.L126	#,
.LEHB11:
# /usr/include/c++/9/bits/stl_uninitialized.h:228: 	      __throw_exception_again;
	call	__cxa_rethrow@PLT	#
.LEHE11:
.L91:
	endbr64	
	movq	%rax, %rbp	# tmp394, tmp294
# /usr/include/c++/9/bits/stl_uninitialized.h:225: 	  __catch(...)
	call	__cxa_end_catch@PLT	#
# /usr/include/c++/9/ext/new_allocator.h:128: 	::operator delete(__p);
	movq	%r15, %rdi	# _171,
	call	_ZdlPv@PLT	#
.L49:
# /usr/include/c++/9/ext/new_allocator.h:128: 	::operator delete(__p);
	movq	%r12, %rdi	# _163,
	call	_ZdlPv@PLT	#
	jmp	.L72	#
.L31:
# /usr/include/c++/9/bits/stl_uninitialized.h:225: 	  __catch(...)
	call	__cxa_begin_catch@PLT	#
# /usr/include/c++/9/ext/new_allocator.h:114: 	return static_cast<_Tp*>(::operator new(__n * sizeof(_Tp)));
	movq	%r12, %r14	# _114, __first
.L34:
# /usr/include/c++/9/bits/stl_construct.h:107: 	  for (; __first != __last; ++__first)
	cmpq	%rbx, %r14	# __cur, __first
	jne	.L127	#,
.LEHB12:
# /usr/include/c++/9/bits/stl_uninitialized.h:228: 	      __throw_exception_again;
	call	__cxa_rethrow@PLT	#
.LEHE12:
.L126:
# /usr/include/c++/9/bits/stl_vector.h:677: 	std::_Destroy(this->_M_impl._M_start, this->_M_impl._M_finish,
	movq	0(%rbp), %rdi	# MEM[base: __first_180, offset: 0B], _181
# /usr/include/c++/9/bits/stl_vector.h:350: 	if (__p)
	testq	%rdi, %rdi	# _181
	je	.L46	#,
# /usr/include/c++/9/ext/new_allocator.h:128: 	::operator delete(__p);
	call	_ZdlPv@PLT	#
.L46:
# /usr/include/c++/9/bits/stl_construct.h:107: 	  for (; __first != __last; ++__first)
	addq	$24, %rbp	#, __first
	jmp	.L47	#
.L127:
# /usr/include/c++/9/bits/stl_vector.h:677: 	std::_Destroy(this->_M_impl._M_start, this->_M_impl._M_finish,
	movq	(%r14), %rdi	# MEM[base: __first_123, offset: 0B], _124
# /usr/include/c++/9/bits/stl_vector.h:350: 	if (__p)
	testq	%rdi, %rdi	# _124
	je	.L33	#,
# /usr/include/c++/9/ext/new_allocator.h:128: 	::operator delete(__p);
	call	_ZdlPv@PLT	#
.L33:
# /usr/include/c++/9/bits/stl_construct.h:107: 	  for (; __first != __last; ++__first)
	addq	$24, %r14	#, __first
	jmp	.L34	#
	.cfi_endproc
.LFE1961:
	.section	.gcc_except_table
	.align 4
.LLSDAC1961:
	.byte	0xff
	.byte	0x9b
	.uleb128 .LLSDATTC1961-.LLSDATTDC1961
.LLSDATTDC1961:
	.byte	0x1
	.uleb128 .LLSDACSEC1961-.LLSDACSBC1961
.LLSDACSBC1961:
	.uleb128 .LEHB10-.LCOLDB4
	.uleb128 .LEHE10-.LEHB10
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB11-.LCOLDB4
	.uleb128 .LEHE11-.LEHB11
	.uleb128 .L91-.LCOLDB4
	.uleb128 0
	.uleb128 .LEHB12-.LCOLDB4
	.uleb128 .LEHE12-.LEHB12
	.uleb128 .L89-.LCOLDB4
	.uleb128 0
.LLSDACSEC1961:
	.byte	0x1
	.byte	0
	.align 4
	.long	0

.LLSDATTC1961:
	.section	.text.unlikely
	.text
	.size	_ZN6Galois4G256C2Ev, .-_ZN6Galois4G256C2Ev
	.section	.text.unlikely
	.size	_ZN6Galois4G256C2Ev.cold, .-_ZN6Galois4G256C2Ev.cold
.LCOLDE4:
	.text
.LHOTE4:
	.globl	_ZN6Galois4G256C1Ev
	.set	_ZN6Galois4G256C1Ev,_ZN6Galois4G256C2Ev
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.type	_GLOBAL__sub_I__ZN6Galois4G256C2Ev, @function
_GLOBAL__sub_I__ZN6Galois4G256C2Ev:
.LFB2619:
	.cfi_startproc
	endbr64	
	subq	$8, %rsp	#,
	.cfi_def_cfa_offset 16
# /usr/include/c++/9/iostream:74:   static ios_base::Init __ioinit;
	leaq	_ZStL8__ioinit(%rip), %rdi	#,
	call	_ZNSt8ios_base4InitC1Ev@PLT	#
	movq	_ZNSt8ios_base4InitD1Ev@GOTPCREL(%rip), %rdi	#,
# G256.cpp:75: } // namespace Galois
	addq	$8, %rsp	#,
	.cfi_def_cfa_offset 8
# /usr/include/c++/9/iostream:74:   static ios_base::Init __ioinit;
	leaq	__dso_handle(%rip), %rdx	#,
	leaq	_ZStL8__ioinit(%rip), %rsi	#,
	jmp	__cxa_atexit@PLT	#
	.cfi_endproc
.LFE2619:
	.size	_GLOBAL__sub_I__ZN6Galois4G256C2Ev, .-_GLOBAL__sub_I__ZN6Galois4G256C2Ev
	.section	.init_array,"aw"
	.align 8
	.quad	_GLOBAL__sub_I__ZN6Galois4G256C2Ev
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,1
	.hidden	DW.ref.__gxx_personality_v0
	.weak	DW.ref.__gxx_personality_v0
	.section	.data.rel.local.DW.ref.__gxx_personality_v0,"awG",@progbits,DW.ref.__gxx_personality_v0,comdat
	.align 8
	.type	DW.ref.__gxx_personality_v0, @object
	.size	DW.ref.__gxx_personality_v0, 8
DW.ref.__gxx_personality_v0:
	.quad	__gxx_personality_v0
	.hidden	__dso_handle
	.ident	"GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
