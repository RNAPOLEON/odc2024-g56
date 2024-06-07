.equ SCREEN_WIDTH,   640
.equ SCREEN_HEIGH,   480
.equ BITS_PER_PIXEL, 32

.equ GPIO_BASE,    0x3f200000
.equ GPIO_GPFSEL0, 0x00
.equ GPIO_GPLEV0,  0x34

.include "data.s"
.include "shapes.s"
.globl main

main:
	mov x25,SCREEN_WIDTH
    // x0 contiene la direccion base del framebuffer
    mov x20, x0 // Guarda la dirección base del framebuffer en x20

//------------------------------ FONDO ------------------------------//
//------------------------------ DIBUJAR EL FONDO LISO ------------------------------//

	mov x19, 40 	//COORDENADA X 
	mov x18, 0  	//COORDENADA Y 
	
	mov x21, #50 	//Coordenada x 
	mov x22, #150	//Coordenada y 

	mov x27, 0

repeat:

	movz x10, 0x40, lsl 16
	movk x10, 0x4040, lsl 00 // Color de fondo

	mov x0,x20
	mov x2, SCREEN_HEIGH        // Y Size 

loop1:
	mov x1, 480         // X Size
loop0:
	stur x10,[x0]  // Colorear el pixel N 
	add x0,x0,4    // Siguiente pixel    
	sub x1,x1,1    // Decrementar contador X 
	cbnz x1,loop0  // Si no terminó la fila, salto (hago lo mismo hasta que se termine la fila)
	sub x2,x2,1    // Decrementar contador Y (si se termina la fila paso a la siguiente columna) 	
	cbnz x2,loop1 	// Si no es la última fila, salto 

endloop:


//------------------------------ SUELO ------------------------------//

	movz x1, 0					// Coordenada X
	movz x2, 380				// Coordenada Y
	movz x3, SCREEN_WIDTH		// Width 
	movz x4, 100				// Heigh 
	movz x10, 0xB3B3, 	lsl 16	// Color
	movk x10, 0xB3B3,	 lsl 00 // Color 
	bl rectangle

//------------------------------ VENTANA FONDO ------------------------------//

	movz x1, 370				// Coordenada X
	movz x2, 110				// Coordenada Y
	movz x3, 185				// Width (ancho) 
	movz x4, 140				// Heigh (largo) 
	movz x10, 0x48, lsl 16		// Color
	movk x10, 0x3D8B, lsl 00	// Color	 
	bl rectangle

//------------------------------ LUNA ------------------------------//

	mov x3, #50					// Radio del circulo
	mul x4, x3, x3	 
	mov x2, x21					// Coordenada X (centro del circulo)
	mov x1, #150				// Coordenada Y
	movz x10, 0xD2, lsl 16
	movk x10, 0xB48C, lsl 00
	bl circle

	mov x3, #50                // Radio del circulo 
	add x2, x21, 300		   // Coordenada X (centro del circulo)
	mov x1, #150		   // Coordenada Y
	bl circle

	//------------------------------ PARED LUNA ------------------------------//

	movz x1, 0					// Coordenada X
	movz x2, 0					// Coordenada Y
	movz x3, 370				// Width (ancho) 
	movz x4, 390				// Heigh (largo) 
	movz x10, 0x40, lsl 16
	movk x10, 0x4040, lsl 00 	// Color de fondo	 
	bl rectangle

	movz x1, 555				// Coordenada X
	movz x2, 0					// Coordenada Y
	movz x3, 180				// Width (ancho) 
	movz x4, 390 				// Heigh (largo) 
	bl rectangle

	movz x1, 370				// Coordenada X
	movz x2, 250					// Coordenada Y
	movz x3, 190				// Width (ancho) 
	movz x4, 100 				// Heigh (largo) 
	bl rectangle


	


//------------------------------ MARCO VENTANA------------------------------//

	movz x1, 455				// Coordenada X
	movz x2, 95					// Coordenada Y
	movz x3, 15					// Width (ancho) 
	movz x4, 155 				// Heigh (largo) 
	movz x10, 0x69, lsl 16		// Color
	movk x10, 0x6969, lsl 00 	// Color	 
	bl rectangle
	
//------------------------------ EDIFICIOS ------------------------------//

    movz x1, 370				// Coordenada X
	movz x2, 135				// Coordenada Y
	movz x3, 15					// Width (ancho) 
	movz x4, 115 				// Heigh (largo) 
	movz x10, 0x00, lsl 16		// Color
	movk x10, 0x0000, lsl 00 	// Color	 
	bl rectangle

	movz x1, 380  				// Coordenada X
	movz x2, 165				// Coordenada Y
	movz x3, 15					// Width (ancho) 
	movz x4, 85 				// Heigh (largo) 
	bl rectangle

	movz x1, 385				// Coordenada X
	movz x2, 185				// Coordenada Y
	movz x3, 25					// Width (ancho) 
	movz x4, 65 				// Heigh (largo) 
	bl rectangle

	movz x1, 405  				// Coordenada X
	movz x2, 200				// Coordenada Y
	movz x3, 50					// Width (ancho) 
	movz x4, 50 				// Heigh (largo) 
	bl rectangle

	movz x1, 480  				// Coordenada X
	movz x2, 135				// Coordenada Y
	movz x3, 15					// Width (ancho) 
	movz x4, 115 				// Heigh (largo) 
	bl rectangle

	movz x1, 470  				// Coordenada X
	movz x2, 165				// Coordenada Y
	movz x3, 15					// Width (ancho) 
	movz x4, 85 				// Heigh (largo) 
	bl rectangle

	movz x1, 495  				// Coordenada X
	movz x2, 205				// Coordenada Y
	movz x3, 30					// Width (ancho) 
	movz x4, 45 				// Heigh (largo)  
	bl rectangle

	movz x1, 520  				// Coordenada X
	movz x2, 175				// Coordenada Y
	movz x3, 35					// Width (ancho) 
	movz x4, 75 				// Heigh (largo) 
	bl rectangle

	movz x1, 405  				// Coordenada X
	movz x2, 200				// Coordenada Y
	movz x3, 50					// Width (ancho) 
	movz x4, 50 				// Heigh (largo) 
	bl rectangle

//------------------------------ LUCES EDIFICIOS ------------------------------//
//1

	
	movz x1, 370  				// Coordenada X
	movz x2, 140				// Coordenada Y
	movz x3, 5					// Width (ancho) 
	movz x4, 5 					// Heigh (largo) 
	movz x10, 0xFF, lsl 16		// Color
	movk x10, 0xFF00, lsl 00 	// Color
	bl rectangle

	
	movz x1, 380  				// Coordenada X
	movz x2, 150				// Coordenada Y
	movz x3, 5					// Width (ancho) 
	movz x4, 5 					// Heigh (largo) 
	movz x10, 0xFF, lsl 16		// Color
	movk x10, 0xFF00, lsl 00 	// Color
	bl rectangle

	
	movz x1, 380  				// Coordenada X
	movz x2, 200				// Coordenada Y
	movz x3, 5					// Width (ancho) 
	movz x4, 5 					// Heigh (largo) 
	movz x10, 0xFF, lsl 16		// Color
	movk x10, 0xFF00, lsl 00 	// Color
	bl rectangle

	
	movz x1, 370  				// Coordenada X
	movz x2, 230				// Coordenada Y
	movz x3, 5					// Width (ancho) 
	movz x4, 5 					// Heigh (largo) 
	movz x10, 0xFF, lsl 16		// Color
	movk x10, 0xFF00, lsl 00 	// Color
	bl rectangle

//2
	
	movz x1, 390  				// Coordenada X
	movz x2, 170				// Coordenada Y
	movz x3, 5					// Width (ancho) 
	movz x4, 5 					// Heigh (largo) 
	movz x10, 0xFF, lsl 16		// Color
	movk x10, 0xFF00, lsl 00 	// Color
	bl rectangle

	
	movz x1, 390  				// Coordenada X
	movz x2, 205				// Coordenada Y
	movz x3, 5					// Width (ancho) 
	movz x4, 5 					// Heigh (largo) 
	movz x10, 0xFF, lsl 16		// Color
	movk x10, 0xFF00, lsl 00 	// Color
	bl rectangle

	
	movz x1, 390  				// Coordenada X
	movz x2, 235				// Coordenada Y
	movz x3, 5					// Width (ancho) 
	movz x4, 5 					// Heigh (largo) 
	movz x10, 0xFF, lsl 16		// Color
	movk x10, 0xFF00, lsl 00 	// Color
	bl rectangle

//3

	
	movz x1,  400 				// Coordenada X
	movz x2, 200				// Coordenada Y
	movz x3, 5					// Width (ancho) 
	movz x4, 5 					// Heigh (largo) 
	movz x10, 0xFF, lsl 16		// Color
	movk x10, 0xFF00, lsl 00 	// Color
	bl rectangle

	movz x1, 400  				// Coordenada X
	movz x2, 240				// Coordenada Y
	movz x3, 5					// Width (ancho) 
	movz x4, 5 					// Heigh (largo) 
	movz x10, 0xFF, lsl 16		// Color
	movk x10, 0xFF00, lsl 00 	// Color
	bl rectangle

//4

	movz x1, 415  				// Coordenada X
	movz x2, 240				// Coordenada Y
	movz x3, 5					// Width (ancho) 
	movz x4, 5 					// Heigh (largo) 
	movz x10, 0xFF, lsl 16		// Color
	movk x10, 0xFF00, lsl 00 	// Color
	bl rectangle

	movz x1, 415  				// Coordenada X
	movz x2, 205				// Coordenada Y
	movz x3, 5					// Width (ancho) 
	movz x4, 5 					// Heigh (largo) 
	movz x10, 0xFF, lsl 16		// Color
	movk x10, 0xFF00, lsl 00 	// Color
	bl rectangle

	movz x1, 440  				// Coordenada X
	movz x2, 230				// Coordenada Y
	movz x3, 5					// Width (ancho) 
	movz x4, 5 					// Heigh (largo) 
	movz x10, 0xFF, lsl 16		// Color
	movk x10, 0xFF00, lsl 00 	// Color
	bl rectangle

	movz x1, 425  				// Coordenada X
	movz x2, 220				// Coordenada Y
	movz x3, 5					// Width (ancho) 
	movz x4, 5 					// Heigh (largo) 
	movz x10, 0xFF, lsl 16		// Color
	movk x10, 0xFF00, lsl 00 	// Color
	bl rectangle

	movz x1, 440  				// Coordenada X
	movz x2, 205				// Coordenada Y
	movz x3, 5					// Width (ancho) 
	movz x4, 5 					// Heigh (largo) 
	movz x10, 0xFF, lsl 16		// Color
	movk x10, 0xFF00, lsl 00 	// Color
	bl rectangle

//5

	movz x1, 470  				// Coordenada X
	movz x2, 205				// Coordenada Y
	movz x3, 5					// Width (ancho) 
	movz x4, 5 					// Heigh (largo) 
	movz x10, 0xFF, lsl 16		// Color
	movk x10, 0xFF00, lsl 00 	// Color
	bl rectangle

	movz x1, 470  				// Coordenada X
	movz x2, 220				// Coordenada Y
	movz x3, 5					// Width (ancho) 
	movz x4, 5 					// Heigh (largo) 
	movz x10, 0xFF, lsl 16		// Color
	movk x10, 0xFF00, lsl 00 	// Color
	bl rectangle

	movz x1, 475  				// Coordenada X
	movz x2, 170				// Coordenada Y
	movz x3, 5					// Width (ancho) 
	movz x4, 5 					// Heigh (largo) 
	movz x10, 0xFF, lsl 16		// Color
	movk x10, 0xFF00, lsl 00 	// Color 
	bl rectangle

	movz x1, 475  				// Coordenada X
	movz x2, 235				// Coordenada Y
	movz x3, 5					// Width (ancho) 
	movz x4, 5 					// Heigh (largo) 
	movz x10, 0xFF, lsl 16		// Color
	movk x10, 0xFF00, lsl 00 	// Color
	 
	bl rectangle

//6

	movz x1, 485  				// Coordenada X
	movz x2, 145				// Coordenada Y
	movz x3, 5					// Width (ancho) 
	movz x4, 5 					// Heigh (largo) 
	movz x10, 0xFF, lsl 16		// Color
	movk x10, 0xFF00, lsl 00 	// Color 
	bl rectangle

	movz x1, 485  				// Coordenada X
	movz x2, 195				// Coordenada Y
	movz x3, 5					// Width (ancho) 
	movz x4, 5 					// Heigh (largo) 
	movz x10, 0xFF, lsl 16		// Color
	movk x10, 0xFF00, lsl 00 	// Color
	bl rectangle

	movz x1, 485  				// Coordenada X
	movz x2, 215				// Coordenada Y
	movz x3, 5					// Width (ancho) 
	movz x4, 5 					// Heigh (largo) 
	movz x10, 0xFF, lsl 16		// Color
	movk x10, 0xFF00, lsl 00 	// Color
	bl rectangle

	movz x1, 485  				// Coordenada X
	movz x2, 235				// Coordenada Y
	movz x3, 5					// Width (ancho) 
	movz x4, 5 					// Heigh (largo) 
	movz x10, 0xFF, lsl 16		// Color
	movk x10, 0xFF00, lsl 00 	// Color
	bl rectangle

//7

	movz x1, 495  				// Coordenada X
	movz x2, 205				// Coordenada Y
	movz x3, 5					// Width (ancho) 
	movz x4, 5 					// Heigh (largo) 
	movz x10, 0xFF, lsl 16		// Color
	movk x10, 0xFF00, lsl 00 	// Color 
	bl rectangle

	movz x1, 495  				// Coordenada X
	movz x2, 230				// Coordenada Y
	movz x3, 5					// Width (ancho) 
	movz x4, 5 					// Heigh (largo) 
	movz x10, 0xFF, lsl 16		// Color
	movk x10, 0xFF00, lsl 00 	// Color
	bl rectangle

	movz x1, 505  				// Coordenada X
	movz x2, 215				// Coordenada Y
	movz x3, 5					// Width (ancho) 
	movz x4, 5 					// Heigh (largo) 
	movz x10, 0xFF, lsl 16		// Color
	movk x10, 0xFF00, lsl 00 	// Color 
	bl rectangle

	movz x1, 515  				// Coordenada X
	movz x2, 235				// Coordenada Y
	movz x3, 5					// Width (ancho) 
	movz x4, 5 					// Heigh (largo) 
	movz x10, 0xFF, lsl 16		// Color
	movk x10, 0xFF00, lsl 00 	// Color
	bl rectangle

//8

	movz x1, 525  				// Coordenada X
	movz x2, 195				// Coordenada Y
	movz x3, 5					// Width (ancho) 
	movz x4, 5 					// Heigh (largo) 
	movz x10, 0xFF, lsl 16		// Color
	movk x10, 0xFF00, lsl 00 	// Color
	bl rectangle

	movz x1, 525  				// Coordenada X
	movz x2, 235				// Coordenada Y
	movz x3, 5					// Width (ancho) 
	movz x4, 5 					// Heigh (largo) 
	movz x10, 0xFF, lsl 16		// Color
	movk x10, 0xFF00, lsl 00 	// Color
	bl rectangle

	movz x1, 545  				// Coordenada X
	movz x2, 205				// Coordenada Y
	movz x3, 5					// Width (ancho) 
	movz x4, 5 					// Heigh (largo) 
	movz x10, 0xFF, lsl 16		// Color
	movk x10, 0xFF00, lsl 00 	// Color
	bl rectangle

	movz x1, 535  				// Coordenada X
	movz x2, 225				// Coordenada Y
	movz x3, 5					// Width (ancho) 
	movz x4, 5 					// Heigh (largo) 
	movz x10, 0xFF, lsl 16		// Color
	movk x10, 0xFF00, lsl 00 	// Color 
	bl rectangle

	movz x1, 545  				// Coordenada X
	movz x2, 240				// Coordenada Y
	movz x3, 5					// Width (ancho) 
	movz x4, 5 					// Heigh (largo) 
	movz x10, 0xFF, lsl 16		// Color
	movk x10, 0xFF00, lsl 00 	// Color
	bl rectangle



//------------------------------ DETALLES PARED ------------------------------//

	movz x1, 15  				// Coordenada X
	movz x2, 15					// Coordenada Y
	movz x3, 60					// Width (ancho) 
	movz x4, 15 				// Heigh (largo) 
	movz x10, 0x60, lsl 16		// Color
	movk x10, 0x6060, lsl 00 	// Color	 
	bl rectangle

	movz x1, 20  				// Coordenada X
	movz x2, 25					// Coordenada Y
	movz x3, 60					// Width (ancho) 
	movz x4, 15 				// Heigh (largo) 
	movz x10, 0x60, lsl 16		// Color
	movk x10, 0x6060, lsl 00 	// Color	 
	bl rectangle

	movz x1, 350  				// Coordenada X
	movz x2, 45					// Coordenada Y
	movz x3, 60					// Width (ancho) 
	movz x4, 15 				// Heigh (largo) 
	movz x10, 0x60, lsl 16		// Color
	movk x10, 0x6060, lsl 00 	// Color	 
	bl rectangle

	movz x1, 355  				// Coordenada X
	movz x2, 50					// Coordenada Y
	movz x3, 60					// Width (ancho) 
	movz x4, 15 				// Heigh (largo) 
	movz x10, 0x60, lsl 16		// Color
	movk x10, 0x6060, lsl 00 	// Color	 
	bl rectangle

	movz x1, 165  				// Coordenada X
	movz x2, 170				// Coordenada Y
	movz x3, 60					// Width (ancho) 
	movz x4, 15 				// Heigh (largo) 
	movz x10, 0x60, lsl 16		// Color
	movk x10, 0x6060, lsl 00 	// Color	 
	bl rectangle

	movz x1, 170  				// Coordenada X
	movz x2, 175				// Coordenada Y
	movz x3, 60					// Width (ancho) 
	movz x4, 15 				// Heigh (largo) 
	movz x10, 0x60, lsl 16		// Color
	movk x10, 0x6060, lsl 00 	// Color	 
	bl rectangle

	movz x1, 0  				// Coordenada X
	movz x2, 145				// Coordenada Y
	movz x3, 60					// Width (ancho) 
	movz x4, 15 				// Heigh (largo) 
	movz x10, 0x60, lsl 16		// Color
	movk x10, 0x6060, lsl 00 	// Color	 
	bl rectangle

	movz x1, 5  				// Coordenada X
	movz x2, 150				// Coordenada Y
	movz x3, 60					// Width (ancho) 
	movz x4, 15 				// Heigh (largo) 
	movz x10, 0x60, lsl 16		// Color
	movk x10, 0x6060, lsl 00 	// Color	 
	bl rectangle

//------------------------------ MARCO MARRON ------------------------------//

	movz x1, 370  				// Coordenada X 
	movz x2, 95					// Coordenada Y
	movz x3, 185				// Width (ancho) 
	movz x4, 15 				// Heigh (largo) 
	movz x10, 0x8B, lsl 16		// Color
	movk x10, 0x4513, lsl 00 	// Color	 
	bl rectangle

//------------------------------ ESCRITORIO ------------------------------//

	movz x1, 370  				// Coordenada X 
	movz x2, 350				// Coordenada Y
	movz x3, 185				// Width (ancho) 
	movz x4, 75 				// Heigh (largo) 
	movz x10, 0x20, lsl 16		// Color
	movk x10, 0x2020, lsl 00 	// Color	 
	bl rectangle

	movz x1, 365  				// Coordenada X 
	movz x2, 345				// Coordenada Y
	movz x3, 195				// Width (ancho) 
	movz x4, 10 				// Heigh (largo) 
	movz x10, 0xFF, lsl 16		// Color
	movk x10, 0xFFFF, lsl 00 	// Color	 
	bl rectangle

//------------------------------ LAMPARA ------------------------------//

	movz x1, 250  				// Coordenada X 
	movz x2, 0					// Coordenada Y
	movz x3, 5					// Width (ancho) 
	movz x4, 55 				// Heigh (largo) 
	movz x10, 0x00, lsl 16		// Color
	movk x10, 0x0000, lsl 00 	// Color	 
	bl rectangle

	movz x1, 254  				// Coordenada X 
	movz x2, 45					// Coordenada Y
	movz x3, 5					// Width (ancho) 
	movz x4, 65 				// Heigh (largo) 
	bl rectangle

	mov x3, 20					// Radio del circulo
	mul x4, x3, x3	 
	mov x2, 255					// Coordenada X (centro del circulo)
	mov x1, 95					// Coordenada Y
	bl circle
//-------LUZ---------
	mov x3, 8					// Radio del circulo
	mul x4, x3, x3	 
	mov x2, 255		      		// Coordenada X (centro del circulo)
	mov x1, 115					// Coordenada Y
	sub x3,x3,1
	movz x10, 0xFF, lsl 16
	movk x10, 0xFF00, lsl 00
	bl circle

	mov x3, 10					// Radio del circulo
	mul x4, x3, x3	 
	mov x2, 255					// Coordenada X (centro del circulo)
	mov x1, 125					// Coordenada Y
	sub x3,x3,1
	movz x10, 0xFF, lsl 16
	movk x10, 0xFF00, lsl 00
	bl circle


//----
	movz x1, 230  				// Coordenada X 
	movz x2, 105				// Coordenada Y
	movz x3, 50					// Width (ancho) 
	movz x4, 10 				// Heigh (largo) 
	movz x10, 0x00, lsl 16		// Color
	movk x10, 0x0000, lsl 00 	// Color	 
	bl rectangle

//------------------------------ MUERTE ------------------------------//
//------------------------------ OZ ------------------------------//

	add x1, x19, 105			// Coordenada X
	add x2, x18, 215			// Coordenada Y
	movz x3, 5					// Width 
	movz x4, 15					// Heigh 
	movz x10, 0x00, lsl 16		// Color
	movk x10, 0x000, lsl 00		// Color 
	bl rectangle

	add x1, x19, 110           	// Coordenada X
	add x2, x18, 210			// Coordenada Y
	movz x3, 40					// Width 
	movz x4, 15					// Heigh 
	movz x10, 0x00, lsl 16		// Color
	movk x10, 0x000, lsl 00		// Color 
	bl rectangle

	add x1, x19, 150           	// Coordenada X
	add x2, x18, 215			// Coordenada Y
	movz x3, 5					// Width 
	movz x4, 10					// Heigh 
	movz x10, 0x00, lsl 16		// Color
	movk x10, 0x000, lsl 00		// Color 
	bl rectangle

	add x1, x19, 155            // Coordenada X
	add x2, x18, 220			// Coordenada Y
	movz x3, 5					// Width 
	movz x4, 10					// Heigh 
	movz x10, 0x00, lsl 16		// Color
	movk x10, 0x000, lsl 00		// Color 
	bl rectangle

	add x1, x19,160             // Coordenada X
	add x2, x18,225				// Coordenada Y
	movz x3, 5					// Width 
	movz x4, 5					// Heigh 
	movz x10, 0x00, lsl 16		// Color
	movk x10, 0x000, lsl 00		// Color 
	bl rectangle

	add x1, x19, 165            // Coordenada X
	add x2, x18,230				// Coordenada Y
	movz x3, 5					// Width 
	movz x4, 5					// Heigh 
	movz x10, 0x00, lsl 16		// Color
	movk x10, 0x000, lsl 00		// Color 
	bl rectangle

	add x1, x19, 100            // Coordenada X
	add x2, x18, 210			// Coordenada Y
	movz x3, 5					// Width 
	movz x4, 220				// Heigh 
	movz x10, 0x6543, lsl 16
    movk x10, 0x21, lsl 00 		// Color marrón oscuro
	bl rectangle

	add x1, x19, 15           	// Coordenada X
	add x2, x18, 265			// Coordenada Y
	movz x3, 95					// Width 
	movz x4, 15					// Heigh 
	movz x10, 0x4B4B, lsl 16
	movk x10, 0x4B4B, lsl 0 	// gris oscuro
	bl rectangle

	add x1, x19, 90           	// Coordenada X
	add x2, x18, 270			// Coordenada Y
	movz x3, 10					// Width 
	movz x4, 35					// Heigh 
	movz x10, 0x0B0B, lsl 16
	movk x10, 0x0B0B, lsl 0 	// gris oscuro
	bl rectangle

	add x1, x19, 80           	// Coordenada X
	add x2, x18, 270			// Coordenada Y
	movz x3, 10					// Width 
	movz x4, 45					// Heigh 
	movz x10, 0x4B4B, lsl 16
	movk x10, 0x4B4B, lsl 0 	// gris oscuro
	bl rectangle

//------------------------------ CUERPO BASE ------------------------------//

	add x1, x19, 15           	// Coordenada X
	add x2, x18, 265			// Coordenada Y
	movz x3, 65					// Width 
	movz x4, 165				// Heigh 
	movz x10, 0x2B2B, lsl 16
	movk x10, 0x2B2B, lsl 0 	// gris oscuro
	bl rectangle

//------------------------------ TUNICA SUELO ------------------------------//

	add x1, x19, 0          	// Coordenada X
	add x2, x18, 420			// Coordenada Y
	movz x3, 15					// Width 
	movz x4, 10					// Heigh 
	movz x10, 0x2B2B, lsl 16
	movk x10, 0x2B2B, lsl 0 	// gris oscuro
	bl rectangle

	add x1, x19, 5           	// Coordenada X
	add x2, x18, 415			// Coordenada Y
	movz x3, 10					// Width 
	movz x4, 5					// Heigh 
	movz x10, 0x4B4B, lsl 16
	movk x10, 0x4B4B, lsl 0 	// gris oscuro
	bl rectangle 

	add x1, x19, 5           	// Coordenada X
	add x2, x18, 410			// Coordenada Y
	movz x3, 10					// Width 
	movz x4, 10					// Heigh 
	movz x10, 0x4B4B, lsl 16
	movk x10, 0x4B4B, lsl 0 	// gris oscuro
	bl rectangle

	add x1, x19, 10           	// Coordenada X
	add x2, x18, 405			// Coordenada Y
	movz x3, 10					// Width 
	movz x4, 10					// Heigh 
	movz x10, 0x4B4B, lsl 16
	movk x10, 0x4B4B, lsl 0 	// gris oscuro
	bl rectangle

//------------------------------ MANO SUELO ------------------------------//
	add x1, x19, 25           	// Coordenada X
	add x2, x18, 365			// Coordenada Y
	movz x3, 15					// Width 
	movz x4, 10					// Heigh 
	movz x10, 0x8B8B, lsl 16
	movk x10, 0x8B8B, lsl 0 	// gris oscuro
	bl rectangle

	add x1, x19, 10           	// Coordenada X
	add x2, x18, 345			// Coordenada Y
	movz x3, 45					// Width 
	movz x4, 20					// Heigh 
	movz x10, 0x0B0B, lsl 16
	movk x10, 0x0B0B, lsl 0 	// gris oscuro
	bl rectangle

	add x1, x19, 5           	// Coordenada X
	add x2, x18, 345			// Coordenada Y
	movz x3, 45					// Width 
	movz x4, 20					// Heigh 
	movz x10, 0x0B0B, lsl 16
	movk x10, 0x0B0B, lsl 0		// gris oscuro
	bl rectangle

	add x1, x19, 5           	// Coordenada X
	add x2, x18, 270			// Coordenada Y
	movz x3, 5					// Width 
	movz x4, 75					// Heigh 
	movz x10, 0x9B9B, lsl 16
	movk x10, 0x9B9B, lsl 0 	// gris oscuro
	bl rectangle

	add x1, x19, 10           	// Coordenada X
	add x2, x18, 240			// Coordenada Y
	movz x3, 10					// Width 
	movz x4, 115				// Heigh 
	movz x10, 0x7B7B, lsl 16
	movk x10, 0x7B7B, lsl 0 	// gris oscuro
	bl rectangle

	add x1, x19, 20           	// Coordenada X
	add x2, x18, 240			// Coordenada Y
	movz x3, 30					// Width 
	movz x4, 115				// Heigh 
	movz x10, 0x4B4B, lsl 16
	movk x10, 0x4B4B, lsl 0 	// gris oscuro
	bl rectangle

	add x1, x19, 50           	// Coordenada X
	add x2, x18, 325			// Coordenada Y
	movz x3, 5					// Width 
	movz x4, 20					// Heigh 
	movz x10, 0x0B0B, lsl 16
	movk x10, 0x0B0B, lsl 0 	// gris oscuro
	bl rectangle

	add x1, x19, 45           	// Coordenada X
	add x2, x18, 320			// Coordenada Y
	movz x3, 5					// Width 
	movz x4, 20					// Heigh 
	movz x10, 0x0B0B, lsl 16
	movk x10, 0x0B0B, lsl 0 	// gris oscuro
	bl rectangle

	add x1, x19, 40           	// Coordenada X
	add x2, x18, 310			// Coordenada Y
	movz x3, 5					// Width 
	movz x4, 10					// Heigh 
	movz x10, 0x0B0B, lsl 16
	movk x10, 0x0B0B, lsl 0 	// gris oscuro
	bl rectangle

	add x1, x19, 35           	// Coordenada X
	add x2, x18, 285			// Coordenada Y
	movz x3, 5					// Width 
	movz x4, 30					// Heigh 
	movz x10, 0x0B0B, lsl 16
	movk x10, 0x0B0B, lsl 0 	// gris oscuro
	bl rectangle

	add x1, x19, 30           	// Coordenada X
	add x2, x18, 270			// Coordenada Y
	movz x3, 5					// Width 
	movz x4, 20					// Heigh 
	movz x10, 0x0B0B, lsl 16
	movk x10, 0x0B0B, lsl 0 	// gris oscuro
	bl rectangle

	add x1, x19, 25         	// Coordenada X
	add x2, x18, 240			// Coordenada Y
	movz x3, 5					// Width 
	movz x4, 30					// Heigh 
	movz x10, 0x0B0B, lsl 16
	movk x10, 0x0B0B, lsl 0 	// gris oscuro
	bl rectangle

	add x1, x19, 25           	// Coordenada X
	add x2, x18, 265			// Coordenada Y
	movz x3, 15					// Width 
	movz x4, 5					// Heigh 
	movz x10, 0x0B0B, lsl 16
	movk x10, 0x0B0B, lsl 0 	// gris oscuro
	bl rectangle

	add x1, x19, 30           	// Coordenada X
	add x2, x18, 270			// Coordenada Y
	movz x3, 5					// Width 
	movz x4, 20					// Heigh 
	movz x10, 0x0B0B, lsl 16
	movk x10, 0x0B0B, lsl 0 	// gris oscuro
	bl rectangle


//------------------------------ CAPUCHA ------------------------------//

	add x1, x19, 10           	// Coordenada X
	add x2, x18, 225			// Coordenada Y
	movz x3, 25					// Width 
	movz x4, 20					// Heigh 
	movz x10, 0x6B6B, lsl 16
	movk x10, 0x6B6B, lsl 0		// gris oscuro
	bl rectangle

	add x1, x19, 15           	// Coordenada X
	add x2, x18, 205			// Coordenada Y
	movz x3, 25					// Width 
	movz x4, 20					// Heigh 
	movz x10, 0x6B6B, lsl 16
	movk x10, 0x6B6B, lsl 0 	// gris oscuro
	bl rectangle

	add x1, x19, 20           	// Coordenada X
	add x2, x18, 200			// Coordenada Y
	movz x3, 25					// Width 
	movz x4, 15					// Heigh 
	movz x10, 0x6B6B, lsl 16
	movk x10, 0x6B6B, lsl 0 	// gris oscuro
	bl rectangle
	
	add x1, x19, 25           	// Coordenada X
	add x2, x18, 190			// Coordenada Y
	movz x3, 25					// Width 
	movz x4, 10					// Heigh 
	movz x10, 0x6B6B, lsl 16
	movk x10, 0x6B6B, lsl 0 	// gris oscuro
	bl rectangle
	
	add x1, x19, 30           	// Coordenada X
	add x2, x18, 180			// Coordenada Y
	movz x3, 15					// Width 
	movz x4, 10					// Heigh 
	movz x10, 0x6B6B, lsl 16
	movk x10, 0x6B6B, lsl 0 	// gris oscuro
	bl rectangle
	
	add x1, x19, 35           	// Coordenada X
	add x2, x18, 165			// Coordenada Y
	movz x3, 35					// Width 
	movz x4, 20					// Heigh 
	movz x10, 0x6B6B, lsl 16
	movk x10, 0x6B6B, lsl 0 	// gris oscuro
	bl rectangle
	
	add x1, x19, 40        		// Coordenada X
	add x2, x18, 160			// Coordenada Y
	movz x3, 25					// Width 
	movz x4, 5					// Heigh 
	movz x10, 0x6B6B, lsl 16
	movk x10, 0x6B6B, lsl 0 	// gris oscuro
	bl rectangle
	
	add x1, x19, 45          	// Coordenada X
	add x2, x18, 155			// Coordenada Y
	movz x3, 20					// Width 
	movz x4, 5					// Heigh 
	movz x10, 0x6B6B, lsl 16
	movk x10, 0x6B6B, lsl 0 	// gris oscuro
	bl rectangle
	
	add x1, x19, 50          	// Coordenada X
	add x2, x18, 150			// Coordenada Y
	movz x3, 15					// Width 
	movz x4, 5					// Heigh 
	movz x10, 0x6B6B, lsl 16
	movk x10, 0x6B6B, lsl 0 	// gris oscuro
	bl rectangle
	
	add x1, x19, 55          	// Coordenada X
	add x2, x18, 145			// Coordenada Y
	movz x3, 5					// Width 
	movz x4, 5					// Heigh 
	movz x10, 0x6B6B, lsl 16
	movk x10, 0x6B6B, lsl 0 	// gris oscuro
	bl rectangle
	
	add x1, x19, 50           	// Coordenada X
	add x2, x18, 170			// Coordenada Y
	movz x3, 25					// Width 
	movz x4, 40					// Heigh 
	movz x10, 0x3B3B, lsl 16
	movk x10, 0x3B3B, lsl 0 	// gris oscuro
	bl rectangle
	
	add x1, x19, 45           	// Coordenada X
	add x2, x18, 175			// Coordenada Y
	movz x3, 25					// Width 
	movz x4, 40					// Heigh 
	movz x10, 0x2B2B, lsl 16
	movk x10, 0x2B2B, lsl 0 	// gris oscuro
	bl rectangle
	
	add x1, x19, 40           	// Coordenada X
	add x2, x18, 185			// Coordenada Y
	movz x3, 25					// Width 
	movz x4, 40					// Heigh 
	movz x10, 0x2B2B, lsl 16
	movk x10, 0x2B2B, lsl 0 	// gris oscuro
	bl rectangle
	
	add x1, x19, 30           	// Coordenada X
	add x2, x18, 205			// Coordenada Y
	movz x3, 45					// Width 
	movz x4, 40					// Heigh 
	movz x10, 0x2B2B, lsl 16
	movk x10, 0x2B2B, lsl 0 	// gris oscuro
	bl rectangle
	
	add x1, x19, 30           	// Coordenada X
	add x2, x18, 225			// Coordenada Y
	movz x3, 45					// Width 
	movz x4, 40					// Heigh 
	movz x10, 0x2B2B, lsl 16
	movk x10, 0x2B2B, lsl 0 	// gris oscuro
	bl rectangle
	
	add x1, x19, 30           	// Coordenada X
	add x2, x18, 220			// Coordenada Y
	movz x3, 50					// Width 
	movz x4, 40					// Heigh 
	movz x10, 0x2B2B, lsl 16
	movk x10, 0x2B2B, lsl 0 	// gris oscuro
	bl rectangle
	
	add x1, x19, 75           	// Coordenada X
	add x2, x18, 205			// Coordenada Y
	movz x3, 5					// Width 
	movz x4, 20					// Heigh 
	movz x10, 0x0B0B, lsl 16
	movk x10, 0x0B0B, lsl 0 	// gris oscuro
	bl rectangle
	
	add x1, x19, 80           	// Coordenada X
	add x2, x18, 215			// Coordenada Y
	movz x3, 5					// Width 
	movz x4, 30					// Heigh 
	movz x10, 0x0B0B, lsl 16
	movk x10, 0x0B0B, lsl 0 	// gris oscuro
	bl rectangle
	
	add x1, x19, 25           	// Coordenada X
	add x2, x18, 245			// Coordenada Y
	movz x3, 50					// Width 
	movz x4, 20					// Heigh 
	movz x10, 0x3B3B, lsl 16
	movk x10, 0x3B3B, lsl 0 	// gris oscuro
	bl rectangle
	
	add x1, x19, 40           	// Coordenada X
	add x2, x18, 215			// Coordenada Y
	movz x3, 15					// Width 
	movz x4, 50					// Heigh 
	movz x10, 0x0B0B, lsl 16
	movk x10, 0x0B0B, lsl 0 	// gris oscuro
	bl rectangle
	
	add x1, x19, 35          	// Coordenada X
	add x2, x18, 225			// Coordenada Y
	movz x3, 15					// Width 
	movz x4, 40					// Heigh 
	movz x10, 0x0B0B, lsl 16
	movk x10, 0x0B0B, lsl 0 	// gris oscuro
	bl rectangle
	
	add x1, x19, 50           	// Coordenada X
	add x2, x18, 200			// Coordenada Y
	movz x3, 15					// Width 
	movz x4, 65					// Heigh 
	movz x10, 0x0B0B, lsl 16
	movk x10, 0x0B0B, lsl 0 	// gris oscuro
	bl rectangle
	
	add x1, x19, 65           	// Coordenada X
	add x2, x18, 210			// Coordenada Y
	movz x3, 5					// Width 
	movz x4, 55					// Heigh 
	movz x10, 0x0B0B, lsl 16
	movk x10, 0x0B0B, lsl 0 	// gris oscuro
	bl rectangle
	
	add x1, x19, 25           	// Coordenada X
	add x2, x18, 245			// Coordenada Y
	movz x3, 5					// Width 
	movz x4, 20					// Heigh 
	movz x10, 0x0B0B, lsl 16
	movk x10, 0x0B0B, lsl 0 	// gris oscuro
	bl rectangle

//------------------------------ HOMBRE ------------------------------//
//------------------------------ PIERNAS ------------------------------//

//PIERNA IZQUIERDA

	movz x1, 500				// Coordenada X
	movz x2, 375				// Coordenada Y
	movz x3, 10					// Width 
	movz x4, 45					// Heigh 
	movz x10, 0x2C, lsl 16		// Color
	movk x10, 0x2C23, lsl 00 	// Color 
	bl rectangle

	movz x1, 509              	// Coordenada X
	movz x2, 385				// Coordenada Y
	movz x3, 2					// Width 
	movz x4, 35					// Heigh 
	movz x10, 0x9B9B, lsl 16	// Color
	movk x10, 0x9B9B, lsl 00 	// Color 
	bl rectangle

//PIERNA DERECHA

	movz x1, 510            	// Coordenada X
	movz x2, 375				// Coordenada Y
	movz x3, 10					// Width 
	movz x4, 40					// Heigh 
	movz x10, 0x2C, lsl 16		// Color
	movk x10, 0x2C23, lsl 00 	// Color 
	bl rectangle

//------------------------------ ZAPATOS ------------------------------//

//ZAPATO IZQUIERDO

	movz x1, 495              	// Coordenada X
	movz x2, 415				// Coordenada Y
	movz x3, 15					// Width 
	movz x4, 5					// Heigh 
	movz x10, 0x32, lsl 16		// Color
	movk x10, 0x200E, lsl 00 	// Color 
	bl rectangle

//ZAPATO DERECHO 

	movz x1, 510             	// Coordenada X
	movz x2, 415				// Coordenada Y
	movz x3, 15					// Width 
	movz x4, 5					// Heigh 
	movz x10, 0x32, lsl 16		// Color
	movk x10, 0x200E, lsl 00 	// Color 
	bl rectangle

//------------------------------ TORSO ------------------------------//

	movz x1, 495             	// Coordenada X
	movz x2, 345				// Coordenada Y
	movz x3, 30					// Width 
	movz x4, 50					// Heigh 
	movz x10, 0x10, lsl 16		// Color
	movk x10, 0x100A, lsl 00 	// Color 
	bl rectangle

//HOMBROS

	movz x1, 497             	// Coordenada X
	movz x2, 335				// Coordenada Y
	movz x3, 25					// Width 
	movz x4, 10					// Heigh 
	movz x10, 0x10, lsl 16		// Color
	movk x10, 0x100A, lsl 00 	// Color 
	bl rectangle

//CAMISA

	movz x1, 502            	// Coordenada X
	movz x2, 335				// Coordenada Y
	movz x3, 15					// Width 
	movz x4, 18					// Heigh 
	movz x10, 0xFF, lsl 16		// Color
	movk x10, 0xFFFF, lsl 00 	// Color
	bl rectangle

	movz x1, 511            	// Coordenada X
	movz x2, 335				// Coordenada Y
	movz x3, 6					// Width 
	movz x4, 18					// Heigh 
	movz x10, 0xAF, lsl 16		// Color
	movk x10, 0x8E81, lsl 00 	// Color 
	bl rectangle

//CORBATA

	movz x1, 507            	// Coordenada X
	movz x2, 341				// Coordenada Y
	movz x3, 5					// Width 
	movz x4, 19					// Heigh 
	movz x10, 0xCD, lsl 16		// Color
	movk x10, 0x3329, lsl 00 	// Color 
	bl rectangle

//------------------------------ BRAZOS ------------------------------//

//BRAZO IZQUIERDO

	movz x1, 488             	// Coordenada X
	movz x2, 342				// Coordenada Y
	movz x3, 8					// Width 
	movz x4, 39					// Heigh 
	movz x10, 0x38, lsl 16		// Color
	movk x10, 0x332D, lsl 00 	// Color 
	bl rectangle

	movz x1, 495             	// Coordenada X
	movz x2, 345				// Coordenada Y
	movz x3, 7					// Width 
	movz x4, 10					// Heigh 
	movz x10, 0x38, lsl 16		// Color
	movk x10, 0x332D, lsl 00 	// Color 
	bl rectangle

	movz x1, 495             	// Coordenada X
	movz x2, 335				// Coordenada Y
	movz x3, 7					// Width 
	movz x4, 10					// Heigh 
	movz x10, 0x38, lsl 16		// Color
	movk x10, 0x332D, lsl 00 	// Color 
	bl rectangle

	movz x1, 500             	// Coordenada X
	movz x2, 353				// Coordenada Y
	movz x3, 7					// Width 
	movz x4, 20					// Heigh 
	movz x10, 0x38, lsl 16		// Color
	movk x10, 0x332D, lsl 00 	// Color 
	bl rectangle

	movz x1, 500             	// Coordenada X
	movz x2, 353				// Coordenada Y
	movz x3, 3					// Width 
	movz x4, 30					// Heigh 
	movz x10, 0x38, lsl 16		// Color
	movk x10, 0x332D, lsl 00 	// Color 
	bl rectangle

	movz x1, 512             	// Coordenada X
	movz x2, 353				// Coordenada Y
	movz x3, 5					// Width 
	movz x4, 25					// Heigh 
	movz x10, 0x38, lsl 16		// Color
	movk x10, 0x332D, lsl 00 	// Color 
	bl rectangle

	movz x1, 515             	// Coordenada X
	movz x2, 353				// Coordenada Y
	movz x3, 9					// Width 
	movz x4, 10					// Heigh 
	movz x10, 0x38, lsl 16		// Color
	movk x10, 0x332D, lsl 00 	// Color 
	bl rectangle

	movz x1, 517             	// Coordenada X
	movz x2, 342				// Coordenada Y
	movz x3, 7					// Width 
	movz x4, 11					// Heigh 
	movz x10, 0x38, lsl 16		// Color
	movk x10, 0x332D, lsl 00 	// Color 
	bl rectangle

//BRAZO DERECHO

	movz x1, 524            	// Coordenada X
	movz x2, 342				// Coordenada Y
	movz x3, 8					// Width 
	movz x4, 38					// Heigh 
	movz x10, 0x10, lsl 16		// Color
	movk x10, 0x100A, lsl 00 	// Color 
	bl rectangle

//------------------------------ MANOS ------------------------------//

//MANO IZQUIERDA

	movz x1, 488             	// Coordenada X
	movz x2, 380				// Coordenada Y
	movz x3, 7					// Width 
	movz x4, 7					// Heigh 
	movz x10, 0xCB, lsl 16		// Color
	movk x10, 0x9C6E, lsl 00 	// Color 
	bl rectangle

//MANO DERECHA

	movz x1, 525             	// Coordenada X
	movz x2, 380				// Coordenada Y
	movz x3, 7					// Width 
	movz x4, 7					// Heigh 
	movz x10, 0xCB, lsl 16		// Color
	movk x10, 0x9C6E, lsl 00 	// Color 
	bl rectangle

//------------------------------ ROSTRO ------------------------------//

//CUELLO

	movz x1, 502            	// Coordenada X
	movz x2, 330				// Coordenada Y
	movz x3, 15					// Width 
	movz x4, 7					// Heigh 
	movz x10, 0xBF, lsl 16		// Color
	movk x10, 0x8A5A, lsl 00 	// Color 
	bl rectangle

	movz x1, 512            	// Coordenada X
	movz x2, 330				// Coordenada Y
	movz x3, 5					// Width 
	movz x4, 7					// Heigh 
	movz x10, 0x85, lsl 16		// Color
	movk x10, 0x5D49, lsl 00 	// Color 
	bl rectangle

//CABEZA

	movz x1, 497             	// Coordenada X
	movz x2, 310				// Coordenada Y
	movz x3, 25					// Width 
	movz x4, 20					// Heigh 
	movz x10, 0xBF, lsl 16		// Color
	movk x10, 0x8A5A, lsl 00 	// Color 
	bl rectangle

	movz x1, 514             	// Coordenada X
	movz x2, 310				// Coordenada Y
	movz x3, 8					// Width 
	movz x4, 20					// Heigh 
	movz x10, 0x85, lsl 16		// Color
	movk x10, 0x5D49, lsl 00 	// Color 
	bl rectangle

//SOMBRERO

	movz x1, 493             	// Coordenada X
	movz x2, 305				// Coordenada Y
	movz x3, 33					// Width 
	movz x4, 7					// Heigh 
	movz x10, 0x38, lsl 16		// Color
	movk x10, 0x332D, lsl 00 	// Color 
	bl rectangle

	movz x1, 500             	// Coordenada X
	movz x2, 305				// Coordenada Y
	movz x3, 26					// Width 
	movz x4, 7					// Heigh 
	movz x10, 0x10, lsl 16		// Color
	movk x10, 0x100A, lsl 00 	// Color 
	bl rectangle

	movz x1, 497             	// Coordenada X
	movz x2, 295				// Coordenada Y
	movz x3, 25					// Width 
	movz x4, 10					// Heigh 
	movz x10, 0x38, lsl 16		// Color
	movk x10, 0x332D, lsl 00 	// Color 
	bl rectangle

	movz x1, 515             	// Coordenada X
	movz x2, 295				// Coordenada Y
	movz x3, 7					// Width 
	movz x4, 10					// Heigh 
	movz x10, 0x10, lsl 16		// Color
	movk x10, 0x100A, lsl 00 	// Color 
	bl rectangle

//CIGARRILLO

	movz x1, 530             	// Coordenada X
	movz x2, 383				// Coordenada Y
	movz x3, 12					// Width 
	movz x4, 3					// Heigh 
	movz x10, 0xCC, lsl 16		// Color
	movk x10, 0x6600, lsl 00 	// Color 
	bl rectangle

	movz x1, 535             	// Coordenada X
	movz x2, 383				// Coordenada Y
	movz x3, 8					// Width 
	movz x4, 3					// Heigh 
	movz x10, 0xFF, lsl 16		// Color
	movk x10, 0xFFFF, lsl 00 	// Color 
	bl rectangle

	movz x1, 543             	// Coordenada X
	movz x2, 383				// Coordenada Y
	movz x3, 3					// Width 
	movz x4, 3					// Heigh 
	movz x10, 0x80, lsl 16		// Color
	movk x10, 0x8080, lsl 00 	// Color 
	bl rectangle
	


    // Infinite Loop
InfLoop:
    b InfLoop
