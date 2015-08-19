.data
	
	c : .word  0
.text



main :

	

	#for(int c = 0; c<10; c++)
	la $t0,c
	lw $t1, c
	for_1 :
	
	bge $t1,10,end_for	
	addi $t1,$t1,1
	j for_1
	end_for:
	
	
	