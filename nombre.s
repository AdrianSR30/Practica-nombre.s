@ Adrian Solis Ruiz
@ adrian.s - programa que pregunte por su nombre.
@ programa corto que obtiene la entrada del teclado y luego lo imprime de nuevo en la pantalla.


.section	.bss
.comm buffer, 48	     @ reserva buffer de 48 bytes

.section	.data
msg:
	.ascii	"** Bienvenido **\Por favor escriba su nombre: "
msgLen = . - msg
msg2:
	.ascii	"Hola "
msg2Len = . - msg2

.section	.text
.globl	_start
_start:

mov r0, $1		    @Mensaje de apertura del programa de impresion	
ldr r1, =msg
ldr r2, =msgLen
mov r7, $4
svc $0

mov r7, $3		    @ Leer syscall
mov r0, $1		
ldr r1, =buffer
mov r2, $0x30
svc $0

mov r0, $1		    @ imprime msg2
ldr r1, =msg2
ldr r2, =msg2Len
mov r7, $4
svc $0

mov r0, $1		    @ ahora imprime la entrada dle usuario
ldr r1, =buffer
mov r2, $0x30
mov r7, $4
svc $0

mov r7, $1	            @ salir de syscall
svc $0		            @ abre el kernel
.end
