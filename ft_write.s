; ssize_t write(int rdi, const void *rsi, size_t rdx);

section .text
    global _ft_write
    extern ___error

_ft_write:
	mov     rax, 0x2000004
	syscall
	jc		_error
	ret

_error:
	push rax            ;push errno to stack
	call ___error       ;return errno address and put it in rax
	pop rdi				;pop errno value from stack and put it into rdi
	mov [rax], rdi
	mov rax, -1
	ret
