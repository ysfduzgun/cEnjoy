; 64-Bit Linux Hello World ASM

; section .data constants and defined variables
section .data

	; db: define byte array, hello:label, 0xA:\n
	hello db 'S.A. Assembly', 0xA

	; equ: define constant variable lenght of the text
	; $: gives current address 
	; $ - hello : calculates lenght of diff between the hello tag and current address
	hello_len equ $ - hello 

; section .txt defines the code section of program
section .text

	; set _start label to global, linker set program start from this
	; linker : takes object files from compiler than create new program,
	; 	dynamic library or something :)
	global _start

_start:
	; write(1, hello, hello_len)
	; mov copies a value into a register or memory address
	; rax a 64-bit register that holds system call types with number
	; 1 write is a system call number. This call using for write
	; 	data to file or standart output.
	mov rax, 1 
	; rdi holds the first argument for syscalls 
	; 1 file descriptor for the stdout
	mov rdi, 1
	; rsi holds the second argument for syscalls
	; hello a label pointing to string in memory
	mov rsi, hello
	; rdx holds the third argument for syscalls
	; hello_len constant defining the lenght of the string.
	;	need how many characters print 
	mov rdx, hello_len
	; execute the system call specified by the values in the registers
	; 	rax, rdi, rsi, rdx
	; in this case it runs sys_write, 
	;	which prints the hello string to the screen.
	syscall

	; exit(0)
	; 60 for the exit syscall in 64-bit linux.
	; 	this call is used to terminate program
	mov rax, 60
	; xor bitwise XOR operation, same value 0, different value 1
	; xoring the register with itself sets it to full zero
	;	when rdi is zero, it means sets the exit status 0
	xor rdi, rdi
	; execute the exit system call and ending program with exit code
	syscall

; creating relocatable elf64 object file
; $ nasm -f elf64 -o hello.o hello.S

; creating executable elf64 linked file
; $ ld -o hello hello.o