#
# CPU32 instruction verification code
#

	.file	1 "test.c"
	.section .mdebug.abi32
	.previous
	.gnu_attribute 4, 1
	.text
	.align	2
	.globl	main
	.set	nomips16
	.ent	main
	.type	main, @function
main:
	.frame	$fp,16,$31		# vars= 8, regs= 1/0, args= 0, gp= 0
	.mask	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro

#
# tests
# (each assertion will make an infinite loop if fails)
#

	# multu
	nop
	mtlo    $0
	mthi    $0
	addi    $t0,$0,-1
	addi    $t1,$0,-1
	multu   $t0,$t1
assert_multu_hi: # hi should be fffffffe
	mfhi    $t2
	addi    $t2,$t2,2
	bne     $t2,$0,assert_multu_hi 
assert_multu_lo: # lo should be 1
	nop
	mflo    $t2
	addi    $t7,$0,1
	bne     $t2,$t7,assert_multu_lo

	# mult
	nop
	mtlo    $0
	mthi    $0
	addi    $t0,$0,-1
	addi    $t1,$0,-1
	mult    $t0,$t1
assert_mult_hi:
	mfhi    $t2
	bne     $t2,$0,assert_mult_hi
assert_mult_lo:
	nop
	mflo    $t2
	addi    $t7,$0,1
	bne     $t2,$t7,assert_mult_lo

	# sll
	nop
	addi	$t0,$0,0x1
	sll	$t1,$t0,0x1
assert_sll:
	addi	$t7,$0,0x2
	bne	$t1,$t7,assert_sll

	# srl
	nop
	addi	$t0,$0,0x2
	srl	$t1,$t0,0x1
assert_srl:
	addi	$t7,$0,0x1
	bne	$t1,$t7,assert_srl

	# sra
	nop
	addi	$t0,$0,0x0
	addi	$t1,$0,0x1
	sub	$t0,$t0,$t1
	sra	$t2,$t0,0x1
assert_sra:
	bne	$t2,$t0,assert_sra

	# sllv
	nop
	addi	$t0,$0,0x1
	addi	$t1,$0,0x3
	sllv	$t2,$t0,$t1
assert_sllv:
	addi	$t7,$0,0x8
	bne	$t2,$t7,assert_sllv

	# srav
	nop
	addi    $t0,$0,0x0
	addi    $t1,$0,0x1
	sub	$t0,$t0,$t1
	addi	$t2,$0,0x3
	srav    $t2,$t0,$t2
assert_srav:
	bne     $t2,$t0,assert_srav

	# jr
	# jalr
	# syscall
	# break

	# mthi, mfhi
	nop
	addi	$t0,$0,0x1
	mthi	$t0
	mfhi	$t1
assert_mthi:
	addi	$t7,$0,0x1
	bne	$t1,$t7,assert_mthi
	
	# mtlo, mflo
	nop
	addi    $t0,$0,0x1
	mtlo    $t0
	mflo    $t1
assert_mtlo:
	addi    $t7,$0,0x1
	bne     $t1,$t7,assert_mtlo

end:

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.ident	"GCC: (GNU) 4.7.2"
