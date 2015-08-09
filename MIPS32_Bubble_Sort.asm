.data
	arr: .word 10, 6, 2, 0, 8, 4
	size: .word 6
.text

#  int i, j; //variables used for for loops.
#  char temporaryCharHolder; //used to swap values of two array entries
#  for (i = 0; i < numberOfElements; i++) {
#    for (j = 0; j < numberOfElements - 1; j++) { 
#      if (arrayOfCharsToSort[j] > arrayOfCharsToSort[j + 1]) {
#        temporaryCharHolder = arrayOfCharsToSort[j];
#        arrayOfCharsToSort[j] = arrayOfCharsToSort[j + 1];
#        arrayOfCharsToSort[j + 1] = temporaryCharHolder;
#      }
#    }
#  }

	j main

bubble_sort :
	#i -> t0
	#j -> t1
	#size of array -> t2
	#t6 -> size -1
	add $t0,	$zero,	$zero
	add $t1,	$zero,	$zero
	lw $t2,	size
	addi $t6,	$t2,	-1	
	
for_uno :
	#t3 -> pointer to start of array
	la $t3,		arr	
	
	#  for (i = 0; i < numberOfElements; i++) 
	bge $t0,	$t2,	end_for_uno
	  for_dos :
       	    
       	    #for (j = 0; j < numberOfElements - 1; j++) 
	    bge $t1,	$t6,	end_for_dos	    	
	        
	        #t4-> byte offset j*4
	        mul $t4,	$t1,	4
	        #t3 -> pointer to start of array
	        la $t3,		arr	
	        #Adding byte offset to the pointer to start of array
	        add $t3,	$t4,	$t3 
	        
	        #arrayOfCharsToSort[j] -> t4
		lw $t4,		($t3)
	        #arrayOfCharsToSort[j+1] -> t5
		lw $t5,		4($t3)
		
		
#        temporaryCharHolder = arrayOfCharsToSort[j]; -> t4

		 #if (arrayOfCharsToSort[j] > arrayOfCharsToSort[j + 1])
		ble $t4,$t5,endif
		#        arrayOfCharsToSort[j] = arrayOfCharsToSort[j + 1];
		sw $t5,($t3)
		#        arrayOfCharsToSort[j + 1] = temporaryCharHolder;
		sw $t4,4($t3)
		endif:		
		#j+++
		addi $t1, $t1,1
		j for_dos
end_for_dos :
	# j = 0
	add $t1,$zero,$zero
	#i++
	addi $t0, $t0,1
	j for_uno	

end_for_uno :
	jr $ra

main : 
	j bubble_sort
