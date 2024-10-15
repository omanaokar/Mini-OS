org 0x0
bits 16

%define ENDL 0x0D, 0x0A

start:
	; print hello world message
	mov si, msg_hello
	call puts

.halt:
	cli
	hlt

;
; Prints a string to the screen
; Params:
;	- ds:si points to a string
;
puts:
	; save registers we will modify
	push si
	push ax
	push bx

.loop:
	lodsb				; loads next character in al from si
	or al, al			; verify if next character is null? (sets zero flag)
	jz .done			; jumps to done label if zero flag is set
	

	mov ah, 0x0e		; call bios interrupt
	mov bh, 0 			; set page number to zero
	int 0x10

	jmp .loop

.done:
	pop ax
	pop si
	ret

msg_hello: db 'Hello World from KERNEL!', ENDL, 0


