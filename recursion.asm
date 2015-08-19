.data
	
	c : .word  0
.text
j main
	
	
	addOneToSource : 
	
	lw $t0, 0($a0)
	addi $t0, $t0, 1
	add $v0, $zero, $t0
	jr $ra
	
	
	
	#int addOneToSource(source)
	#{
	#	return source+1;
	#}

main :

	la $a0,c
	
	jal addOneToSource
	sw $v0, 0($a0)
	
	jal addOneToSource
	sw $v0, 0($a0)
	
