	.file	"speedtest.cpp"
# GNU C++14 (Ubuntu 9.3.0-17ubuntu1~20.04) version 9.3.0 (x86_64-linux-gnu)
#	compiled by GNU C version 9.3.0, GMP version 6.2.0, MPFR version 4.0.2, MPC version 1.1.0, isl version isl-0.22.1-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -imultiarch x86_64-linux-gnu -D_GNU_SOURCE speedtest.cpp
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
	.section	.text._ZNSt6vectorIS_IhSaIhEESaIS1_EED2Ev,"axG",@progbits,_ZNSt6vectorIS_IhSaIhEESaIS1_EED5Ev,comdat
	.align 2
	.p2align 4
	.weak	_ZNSt6vectorIS_IhSaIhEESaIS1_EED2Ev
	.type	_ZNSt6vectorIS_IhSaIhEESaIS1_EED2Ev, @function
_ZNSt6vectorIS_IhSaIhEESaIS1_EED2Ev:
.LFB2880:
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
	je	.L2	#,
	.p2align 4,,10
	.p2align 3
.L6:
# /usr/include/c++/9/bits/stl_vector.h:677: 	std::_Destroy(this->_M_impl._M_start, this->_M_impl._M_finish,
	movq	0(%rbp), %rdi	# MEM[base: __first_19, offset: 0B], _8
# /usr/include/c++/9/bits/stl_vector.h:350: 	if (__p)
	testq	%rdi, %rdi	# _8
	je	.L3	#,
# /usr/include/c++/9/ext/new_allocator.h:128: 	::operator delete(__p);
	call	_ZdlPv@PLT	#
# /usr/include/c++/9/bits/stl_construct.h:107: 	  for (; __first != __last; ++__first)
	addq	$24, %rbp	#, __first
# /usr/include/c++/9/bits/stl_construct.h:107: 	  for (; __first != __last; ++__first)
	cmpq	%rbp, %rbx	# __first, _1
	jne	.L6	#,
.L4:
	movq	(%r12), %rbp	# MEM[(struct _Vector_base *)this_3(D)]._M_impl.D.16137._M_start, __first
.L2:
# /usr/include/c++/9/bits/stl_vector.h:350: 	if (__p)
	testq	%rbp, %rbp	# __first
	je	.L1	#,
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
.L3:
	.cfi_restore_state
# /usr/include/c++/9/bits/stl_construct.h:107: 	  for (; __first != __last; ++__first)
	addq	$24, %rbp	#, __first
# /usr/include/c++/9/bits/stl_construct.h:107: 	  for (; __first != __last; ++__first)
	cmpq	%rbp, %rbx	# __first, _1
	jne	.L6	#,
	jmp	.L4	#
	.p2align 4,,10
	.p2align 3
.L1:
# /usr/include/c++/9/bits/stl_vector.h:680:       }
	popq	%rbx	#
	.cfi_def_cfa_offset 24
	popq	%rbp	#
	.cfi_def_cfa_offset 16
	popq	%r12	#
	.cfi_def_cfa_offset 8
	ret	
	.cfi_endproc
.LFE2880:
	.size	_ZNSt6vectorIS_IhSaIhEESaIS1_EED2Ev, .-_ZNSt6vectorIS_IhSaIhEESaIS1_EED2Ev
	.weak	_ZNSt6vectorIS_IhSaIhEESaIS1_EED1Ev
	.set	_ZNSt6vectorIS_IhSaIhEESaIS1_EED1Ev,_ZNSt6vectorIS_IhSaIhEESaIS1_EED2Ev
	.section	.text.unlikely,"ax",@progbits
.LCOLDB1:
	.section	.text.startup,"ax",@progbits
.LHOTB1:
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB2622:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA2622
	endbr64	
	pushq	%r14	#
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13	#
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12	#
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp	#
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx	#
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	subq	$96, %rsp	#,
	.cfi_def_cfa_offset 144
# speedtest.cpp:11: int main() {
	movq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp138
	movq	%rax, 88(%rsp)	# tmp138, D.62132
	xorl	%eax, %eax	# tmp138
# speedtest.cpp:12:   Galois::G256 field;
	leaq	32(%rsp), %r13	#, tmp133
# speedtest.cpp:13:   Galois::Elem a(&field, 10);
	movq	%rsp, %r12	#, tmp132
# speedtest.cpp:12:   Galois::G256 field;
	movq	%r13, %rdi	# tmp133,
.LEHB0:
	call	_ZN6Galois4G256C1Ev@PLT	#
.LEHE0:
# speedtest.cpp:13:   Galois::Elem a(&field, 10);
	movl	$10, %edx	#,
	movq	%r13, %rsi	# tmp133,
	movq	%r12, %rdi	# tmp132,
.LEHB1:
	call	_ZN6Galois4ElemC1EPNS_4G256Eh@PLT	#
# speedtest.cpp:14:   Galois::Elem b(&field, 20);
	leaq	16(%rsp), %rbp	#, tmp131
	movl	$20, %edx	#,
	movq	%r13, %rsi	# tmp133,
	movq	%rbp, %rdi	# tmp131,
	call	_ZN6Galois4ElemC1EPNS_4G256Eh@PLT	#
	movl	$3000000000, %ebx	#, ivtmp_6
	.p2align 4,,10
	.p2align 3
.L11:
# speedtest.cpp:17:     Galois::Elem c = a * b;
	movq	%rbp, %rsi	# tmp131,
	movq	%r12, %rdi	# tmp132,
	call	_ZN6Galois4ElemmlERKS0_@PLT	#
# speedtest.cpp:16:   for (long long i = 0; i < N; i++) {
	subq	$1, %rbx	#, ivtmp_6
	jne	.L11	#,
# speedtest.cpp:19:   clock_t start = clock();
	call	clock@PLT	#
	movl	$3000000000, %ebx	#, ivtmp_37
	movq	%rax, %r14	# tmp134, start
	.p2align 4,,10
	.p2align 3
.L12:
# speedtest.cpp:22:     Galois::Elem c = a * b;
	movq	%rbp, %rsi	# tmp131,
	movq	%r12, %rdi	# tmp132,
	call	_ZN6Galois4ElemmlERKS0_@PLT	#
# speedtest.cpp:21:   for (long long i = 0; i < N; i++) {
	subq	$1, %rbx	#, ivtmp_37
	jne	.L12	#,
# /usr/include/c++/9/ostream:132: 	__pf(*this);
	movq	_ZSt4cout(%rip), %rax	# cout._vptr.basic_ostream, cout._vptr.basic_ostream
	leaq	_ZSt4cout(%rip), %rbp	#, tmp111
	movq	-24(%rax), %rdx	# MEM[(long int *)_28 + -24B], _31
	addq	%rbp, %rdx	# tmp111, _31
# /usr/include/c++/9/bits/ios_base.h:84:   { return _Ios_Fmtflags(static_cast<int>(__a) & static_cast<int>(__b)); }
	movl	24(%rdx), %eax	# _31->_M_flags, tmp115
# /usr/include/c++/9/bits/ios_base.h:708:       _M_precision = __prec;
	movq	$10, 8(%rdx)	#, MEM[(streamsize *)_31 + 8B]
# /usr/include/c++/9/bits/ios_base.h:84:   { return _Ios_Fmtflags(static_cast<int>(__a) & static_cast<int>(__b)); }
	andl	$-261, %eax	#, tmp115
# /usr/include/c++/9/bits/ios_base.h:88:   { return _Ios_Fmtflags(static_cast<int>(__a) | static_cast<int>(__b)); }
	orl	$4, %eax	#, tmp117
	movl	%eax, 24(%rdx)	# tmp117, MEM[(_Ios_Fmtflags &)_31 + 24]
# speedtest.cpp:25:   cout << fixed << setprecision(10) << double(clock() - start) / CLOCKS_PER_SEC << endl;
	call	clock@PLT	#
# speedtest.cpp:25:   cout << fixed << setprecision(10) << double(clock() - start) / CLOCKS_PER_SEC << endl;
	pxor	%xmm0, %xmm0	# tmp119
# /usr/include/c++/9/ostream:221:       { return _M_insert(__f); }
	movq	%rbp, %rdi	# tmp111,
# speedtest.cpp:25:   cout << fixed << setprecision(10) << double(clock() - start) / CLOCKS_PER_SEC << endl;
	subq	%r14, %rax	# start, tmp118
# speedtest.cpp:25:   cout << fixed << setprecision(10) << double(clock() - start) / CLOCKS_PER_SEC << endl;
	cvtsi2sdq	%rax, %xmm0	# tmp118, tmp119
# speedtest.cpp:25:   cout << fixed << setprecision(10) << double(clock() - start) / CLOCKS_PER_SEC << endl;
	divsd	.LC0(%rip), %xmm0	#, tmp120
# /usr/include/c++/9/ostream:221:       { return _M_insert(__f); }
	call	_ZNSo9_M_insertIdEERSoT_@PLT	#
	movq	%rax, %rdi	# tmp136, _32
# /usr/include/c++/9/ostream:113: 	return __pf(*this);
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@PLT	#
.LEHE1:
# G256.hpp:10: class G256 {
	leaq	56(%rsp), %rdi	#, tmp123
	call	_ZNSt6vectorIS_IhSaIhEESaIS1_EED1Ev	#
	movq	%r13, %rdi	# tmp133,
	call	_ZNSt6vectorIS_IhSaIhEESaIS1_EED1Ev	#
# speedtest.cpp:26: }
	movq	88(%rsp), %rax	# D.62132, tmp139
	xorq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp139
	jne	.L20	#,
	addq	$96, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	xorl	%eax, %eax	#
	popq	%rbx	#
	.cfi_def_cfa_offset 40
	popq	%rbp	#
	.cfi_def_cfa_offset 32
	popq	%r12	#
	.cfi_def_cfa_offset 24
	popq	%r13	#
	.cfi_def_cfa_offset 16
	popq	%r14	#
	.cfi_def_cfa_offset 8
	ret	
.L20:
	.cfi_restore_state
	call	__stack_chk_fail@PLT	#
.L15:
	endbr64	
	movq	%rax, %rbp	# tmp137, tmp129
	jmp	.L13	#
	.globl	__gxx_personality_v0
	.section	.gcc_except_table,"a",@progbits
.LLSDA2622:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE2622-.LLSDACSB2622
.LLSDACSB2622:
	.uleb128 .LEHB0-.LFB2622
	.uleb128 .LEHE0-.LEHB0
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB1-.LFB2622
	.uleb128 .LEHE1-.LEHB1
	.uleb128 .L15-.LFB2622
	.uleb128 0
.LLSDACSE2622:
	.section	.text.startup
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDAC2622
	.type	main.cold, @function
main.cold:
.LFSB2622:
.L13:
	.cfi_def_cfa_offset 144
	.cfi_offset 3, -48
	.cfi_offset 6, -40
	.cfi_offset 12, -32
	.cfi_offset 13, -24
	.cfi_offset 14, -16
# G256.hpp:10: class G256 {
	leaq	56(%rsp), %rdi	#, tmp127
	call	_ZNSt6vectorIS_IhSaIhEESaIS1_EED1Ev	#
	movq	%r13, %rdi	# tmp133,
	call	_ZNSt6vectorIS_IhSaIhEESaIS1_EED1Ev	#
	movq	%rbp, %rdi	# tmp129,
.LEHB2:
	call	_Unwind_Resume@PLT	#
.LEHE2:
	.cfi_endproc
.LFE2622:
	.section	.gcc_except_table
.LLSDAC2622:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSEC2622-.LLSDACSBC2622
.LLSDACSBC2622:
	.uleb128 .LEHB2-.LCOLDB1
	.uleb128 .LEHE2-.LEHB2
	.uleb128 0
	.uleb128 0
.LLSDACSEC2622:
	.section	.text.unlikely
	.section	.text.startup
	.size	main, .-main
	.section	.text.unlikely
	.size	main.cold, .-main.cold
.LCOLDE1:
	.section	.text.startup
.LHOTE1:
	.p2align 4
	.type	_GLOBAL__sub_I_main, @function
_GLOBAL__sub_I_main:
.LFB3178:
	.cfi_startproc
	endbr64	
	subq	$8, %rsp	#,
	.cfi_def_cfa_offset 16
# /usr/include/c++/9/iostream:74:   static ios_base::Init __ioinit;
	leaq	_ZStL8__ioinit(%rip), %rdi	#,
	call	_ZNSt8ios_base4InitC1Ev@PLT	#
	movq	_ZNSt8ios_base4InitD1Ev@GOTPCREL(%rip), %rdi	#,
# speedtest.cpp:26: }
	addq	$8, %rsp	#,
	.cfi_def_cfa_offset 8
# /usr/include/c++/9/iostream:74:   static ios_base::Init __ioinit;
	leaq	__dso_handle(%rip), %rdx	#,
	leaq	_ZStL8__ioinit(%rip), %rsi	#,
	jmp	__cxa_atexit@PLT	#
	.cfi_endproc
.LFE3178:
	.size	_GLOBAL__sub_I_main, .-_GLOBAL__sub_I_main
	.section	.init_array,"aw"
	.align 8
	.quad	_GLOBAL__sub_I_main
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,1
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	0
	.long	1093567616
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
