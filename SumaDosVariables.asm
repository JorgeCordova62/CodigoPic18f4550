
	    
	    
	    
; ************************DECLARACIÓN DE VARIABLES************************    
W EQU 0  
ACS EQU 0

 
;UDATA_ACS: Esta directiva se utiliza para  declarar el comienzo de una sección 
 ;de datos no inicializados en memoria de acceso rápido RAM 
	    UDATA_ACS 0X00
	    
; RES:  Reserva un byte de memoria de datos en la sección indicada
OPER1 RES 1
OPER2 RES 1
RESUL RES 1
 
 
 
 
 
 ; CODE: Esta directiva se utiliza para declarar el comienzo de una sección de 
 ; código o programa en memoria de programa
	    CODE 0X00
	    

	    
;MOVLW k: Mueve la literal k (k es un valor numérico) incluido en el código de 
;la instrucción al registro W, dado que el registro W es un registro de ocho 
;bit el rango de valores que puede tomar k es 0 ≤ k ≤ 255 para números enteros 
; sin signo y para número enteros con signo es  -128 ≤ k ≤ 127. 
	
    MOVLW 0X20 ; mueve 0x20 al registro de w
    ; MOVWF: Mueve el contenido del registro W a la posición de la memoria de 
    ;datos RAM cuya dirección es identificada con f (0 ≤ f ≤ 255). 
    MOVWF OPER1,ACS ; mueve el valor del registro de w a OPER1
    MOVLW 0X26 ; mueve 0x26 al registro de w
    MOVWF OPER2, ACS ; mueve el valor del registro de w a OPER2
    ;ADDWF f,d,a: Suma el contenido del registro W con el operando  fuente f 
    ;(0 ≤ f ≤ 255), que es el contenido  una posición de la memoria de datos, 
    ;el resultado de la suma se deja  en el registro W cuando d = 0, o en la 
    ;dirección del registro  fuente f cuando d = 1
    ADDWF OPER1,W,ACS  ; Suma el valor que hay en w (que es 0x26) con el 
    ; valor que hay en OPER1 y lo deja en W 
    MOVWF RESUL, ACS ; Agrega el valor que hay en W (0x46 que es la suma) en
    ; la Variable RESUL
	
	    END ;TERMINA