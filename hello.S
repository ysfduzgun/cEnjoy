; constants and defined variables
section .data
	; db: define byte array, cumle:label, 0xA:\n
	cumle db 'S.A. Assembly', 0xA
	; equ: define constant variable lenght of the text
	; $: gives current address 
	; $ - cumle : calculates lenght of diff between the cumle tag and current address
	cumle_len equ $ - cumle 

; defines the code section of program
section .text
	; set _basla label to global, linker set program start from this
	; linker : takes object files from compiler than create new program, dynamic library or something :)
	global _basla



