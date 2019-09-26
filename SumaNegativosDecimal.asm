;*****************************************************
;*Programa que coloca los números -1000 y 2000
;*en las direcciones 0x000 y 0x002 y la suma de ambos
;*en la dirección 0x004
;*****************************************************

;-----------tipo de microprocesador y números por omisión-------------------
    LIST P=18F4550, r=Dec  	;LIST directiva que sirve para indicar el tipo de
                           			;microcontrolador, y en que base están los números
                           			;por omisión
;------------------------------Área de datos RAM--------------------------------
datos     idata_acs    		;directiva para separar memoria e inicializar datos en el
                      		 	;rango 0x000 a 05F forza a iniciar en 0x000
OPER1_16    dw -1000  	 	;reserva e inicia dos byte a partir de la dirección 0x000
OPER2_16    dw  2000    		;reserva e inicia  dos byte a partir de la dirección 0x002
RESUL_16    RES 2       		;reserva e inicia  dos byte a partir de la dirección 0x004

;--------inicia código----------------------------------------------------------
           
RST    CODE 0x00        		;RST: etiqueta, identifica la dirección de la memoria
                        	          		;de programa donde esta la instrucción movf OPER1_16, 0, 1
                      	          		;CODE: directiva que indica que es código lo que sigue
                       	          		;0x00: forza a que la primera instrucción se coloque en
                        	          		;la dirección 0x00 de la memoria de programa

;---suma parte baja-----------------------------------------------------------

     movf 	    OPER1_16, 0, 1 	;mueve la parte baja del primer operando el reg. W
     addwf   OPER2_16, 0, 1	;suma el contenido de W con parte baja de operando dos
     movwf  RESUL_16, 1   		;guarda resultado en ella memoria 0x004

;----suma parte alta-----------------------------------------------------------------------------------
     movf 	    OPER1_16+1, 0, 1	;mueve la parte alta del primer operando el reg. W
     addwfc OPER2_16+1, 0, 1 	;suma el contenido de W mas acareo con parte alta
     movwf RESUL_16+1, 1     	;del operando dos guarda resultado en ella memoria
                         			;0x005
        END
  
