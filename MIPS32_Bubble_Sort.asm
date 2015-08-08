.data
	arr: .word 10, 6, 2, 1, 7
	size: .word 5
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
	
	add $t0, $zero, $zero
	add $t1, $zero, $zero
	lw $t2, size
	addi $t6,$t2,-1	
	
for_uno :
	la $t3, arr	
	bge $t0, $t2, end_for_uno
	  for_dos :
	  #for dos

	    bge $t1, $t6, end_for_dos	    	
	        
	        mul $t4, $t1,4
	        la $t3, arr	
	        add $t3,$t4,$t3 
	        #arrayOfCharsToSort[j] -> t4
		lw $t4, ($t3)
	        #arrayOfCharsToSort[j+1] -> t5
		lw $t5, 4($t3)
		
	 #if (arrayOfCharsToSort[j] > arrayOfCharsToSort[j + 1]) {
#        temporaryCharHolder = arrayOfCharsToSort[j];
#        arrayOfCharsToSort[j] = arrayOfCharsToSort[j + 1];
#        arrayOfCharsToSort[j + 1] = temporaryCharHolder;
#      }
#    }
#  }
		
		ble $t4,$t5,endif
		sw $t5,($t3)
		sw $t4,4($t3)
		endif:		
		addi $t1, $t1,1
		j for_dos
end_for_dos :
	add $t1,$zero,$zero
	addi $t0, $t0,1
	j for_uno	

end_for_uno :
	jr $ra

main : 
	j bubble_sort
