section	.text
    global _start            ; должно быть объявлено для использования gcc
	
_start:	                    ; сообщаем линкеру входную точку
    mov EAX, 10
    mov EDX, 15

	CMP EAX, EDX
	JG LARGE; EAX больше переходим к LARGE
	JL LESS;  EAX меньше переходим к LESS

LARGE:
   ;Если больше, то выполняем следующий код
   mov eax, 4 
   mov ebx, 1
   mov ecx, msg_one
   mov edx, len_one
   int 80h
   jmp exit
	
LESS:
	;Если меньше, то выполняем следующий
   mov eax, 4
   mov ebx, 1
   mov ecx, msg_two
   mov edx, len_two
   int 80h
	
exit:
   mov eax, 1
   mov ebx, 0
   int 80h
	
section	.data
	msg_one dw '----EAX больше !----',0xa
	len_one equ $ - msg_one

	msg_two dw '----EAX меньше ----',0xa
	len_two equ $ - msg_two
