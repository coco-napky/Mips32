#	int Fibonacci(int n) {  
#        if (n == 0 ||  n == 1)  return n;
#        else
#        return Fibonacci(n - 1) + Fibonacci(n - 2); }

.data

.text

	j main

Fibonacci:
	
	
	beq	$a0,	1,	return_one
	beqz	$a0,	return_one
	
	addi	$sp,	$sp,	-12
	sw	$a0,	($sp)
	sw	$ra,	4($sp)
	sw	$s0,	8($sp)	
	
	addi $a0,	$a0,	-1
	jal Fibonacci
	
	move $s0,	$v0
	addi $a0,	$a0,	-1
	jal Fibonacci
	
	add $v0,	$v0,	$s0
	
	lw	$a0,	($sp)
	lw	$ra,	4($sp)
	lw	$s0,	8($sp)		
	addi	$sp,	$sp,	12
	jr $ra
	
return_one :
	addi $v0,	$zero,	1
	jr $ra
	
main :
	
	addi	$a0,	$zero,	5
	jal Fibonacci
			
