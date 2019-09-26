;*****************************************************
;Se hace la prueba con la suma de un numero de 16 bits
;Daddo que el registro W es de 8 bits esta suma no se 
; podrá realizar y por tanto nos dará un resultado 
; erroneo
;*****************************************************
;-----------tipo de microprocesador y números por omisión-------------------
    LIST P=18F4550, r=Dec  	;LIST directiva que sirve para indicar el tipo de
                       			;microcontrolador PIC18F4550, y en que base
                       			;están los números por omisión, decimal

;------------------------------Área de datos RAM--------------------------------
    ACCESS_OVR 0x00    		;directiva para separar memoria de datos en el
                       		       	;rango 0x000 a 05F, forzar  iniciar en 0x000


OPER1_16B    RES 2   		;reserva dos byte en RAM a partir de la dirección 0x000
OPER2_16B    RES 2   		;reserva dos byte en RAM a partir de la dirección 0x002
RESUL_16B    RES 2   		;reserva dos byte en RAM a partir de la dirección 0x004
;--------inicia código----------------------------------------------------------

RST    CODE 0x00        ;RST: etiqueta, identifica la dirección de la memoria
                        ;de programa donde esta la instrucción  movlw low 0x780
			;CODE: directiva que indica que es código lo que sigue
			;0x00: forzar a que la primera instrucción se coloque en
        		;la dirección 0x00 de la memoria de programa.
			;Recuerde la mayoría de las instrucciones son de dos byte

     movlw  0x780    		;instrucción que mueve el valor 80H registro W => movlw k
                                ; Como este es de 8 bits solo moverá los primeros 8
     movwf OPER1_16B, 0  	;mueve el contenido del WREG a la dirección de
     movlw 0x3400   		;instrucción que mueve el valor 00H registro W => movlw k
                        	; Como este es de 8 bits solo moverá los primeros 8
     movwf OPER2_16B, 0  	;mueve el contenido del WREG a la dirección de
                        	;memoria 0x002=>movwf f,  a 
;---suma---------------------------------------------------------------------------------------------
        movf OPER1_16B, 0, 1 	;mueve la parte baja del primer operando el reg. W
        addwf OPER2_16B, 0, 1	;suma el contenido de W con parte baja de operando dos
        movwf RESUL_16B, 1   	;guarda resultado en ella memoria 0x004

        END
