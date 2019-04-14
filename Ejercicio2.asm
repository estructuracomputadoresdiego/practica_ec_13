	.data
	
cad1: .asciiz "\nIntroduzca un numero\n"
cad2: .asciiz "\nEl resultado de la suma es: "

	.globl main
	.text

main:

	li $v0, 4
	la $a0, cad1	#Muestra cad1
	syscall
	
	li $v0, 5	#Lee un entero
	syscall
	
	move $t0, $v0	#Almacena en t0 el valor leido en el syscall anterior
	
	li $t1, 0	#Inicializa el contador a 1 en t1
	li $t2, 0	#Inicializa el resultado a 0
	
	bucle:
		addi $t1, $t1, 1
		bgt $t1, $t0, fin
		add $t2, $t2, $t1
		j bucle
	
fin:

	li $v0, 4
	la $a0, cad2
	syscall
	
	li $v0, 1
	move $a0, $t2
	syscall	

	li $v0, 10
	syscall
