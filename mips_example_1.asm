.data


.text
	
	j main
	
#-------------------------------int suma()------------------------------------------------------------------------
_add :
	add $v0, $a0, $a1
	jr $ra

#-------------------------------int factorial() implemetado con un for------------------------------------------------------------------------

#factorial(int _factorial)
#	
#	int acumulador = 1;
#	for(int i = 1; i<=_factorial; i++
#		acumulador *= i
#	return acumulador

factorial :
	# acumulador -> t1
	#a0 -> _factorial
	#t2 -> i
	addi $t1, $zero, 1
	addi $t2, $zero, 1
	
	
for_factorial :
	
	bgt $t2, $a0, end_for_factorial
		mul $t1, $t1, $t2
		
	#i++
	addi $t2, $t2, 1
	j for_factorial	
		
end_for_factorial :
	move $v0, $t1
	jr $ra

#-----------------------------Factorial rescursivo-----------------------------------------------------------------------------------
#int factorial ( int factorial )
#{
#	if(factorial <= 1)
#		return 1;
#	else
#		return factorial(factorial-1)*factorial;
#}

factorial_recursivo:
	
	bgt $a0, 1, else_factorial_recursivo
	addi $v0,$zero,1
	jr $ra
		
else_factorial_recursivo:
	addi $sp, $sp, -8
	sw  $ra, ($sp)
	sw  $a0,4($sp)
	
	addi $a0, $a0, -1
	jal factorial_recursivo
	lw $ra,($sp)
	lw $a0,4($sp)
	addi $sp, $sp, 8
	mul $v0, $a0,$v0
	jr $ra
main : 
	addi $a0, $zero, 5
	jal factorial_recursivo




	


	
	