	.data
letra: .byte 'a'
cad1: .asciiz "\nIntroduzca una cadena\n"
cad2: .asciiz "\nEl numero de letras a minusculas en la cadena introducida es "
cadLeida: .space 100

	.globl main

	.text
	
main:

	li $v0, 4
	la $a0, cad1		#imprime cad1
	syscall
	
	li $v0, 8
	la $a0, cadLeida	#Lee la cadena introducida por teclado
	li $a1, 100		#maximo 100 caracteres, que es el espacio reservado
	syscall
	
	li $t0, 0		#inicializo el contador de a
	la $t1, cadLeida	#Creo un puntero que apunta a la cadena leida
	lb $t2, letra		#Cargo la letra a filtar en t2
	
	bucle:
		lb $t3, ($t1)		#cargo en t3 la letra en la posicion a la que apunta el puntero
		beqz $t3, fin		#si la el caracter es \0 salta a la etiqueta fin
		beq $t3, $t2, aumentoA	#si el caracter de la cadena es igual a 'a', salta a la etiqueta aumentoA
		addi $t1, $t1, 1	#el puntero apunta al siguiente caracter
		j bucle			#si no ha acabado la cadena vuelve al bucle
		
		aumentoA:
			addi $t0, $t0, 1	#Aumenta en uno el numero de a minusculas
			addi $t1, $t1, 1	#El puntero apunta a la siguiente posicion de  la cadena
			j bucle			#Vuelve al bucle
	fin:
		li $v0, 4	
		la $a0, cad2	#Imprime cad2
		syscall
		
		li $v0, 1
		move $a0, $t0	#Imprime el resultado almacenado en t0
		syscall
		
		li $v0, 10	#Finaliza el programa
		syscall 