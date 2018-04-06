/*
 * Ejemplo BLOB n° 2
 * Autor: Fernando Yurisich <fernando.yurisich@gmail.com>
 * Licenciado bajo The Code Project Open License (CPOL) 1.02
 * Ver <http://www.codeproject.com/info/cpol10.aspx>
 *
 * Este ejemplo muestra cómo guardar una imagen en un campo BLOB
 * y cómo mostrarla usando un control IMAGE.
 *
 * Visítenos en https://github.com/oohg/ejemplos
 *
 *
 * El archivo Input.ico puede descargarse desde:
 * https://github.com/oohg/ejemplos/tree/master/BlobFiles
 */

#include "oohg.ch"
#include "blob.ch"

FUNCTION Main

   LOCAL aStruct := { {"CODE", "N", 3, 0}, {"IMAGE", "M", 10, 0} }
   LOCAL cInput  := "Input.ico"
   LOCAL cOutput := "Output.ico"
   LOCAL oForm
   LOCAL oImage

   REQUEST DBFCDX, DBFFPT
   RDDSETDEFAULT( "DBFCDX")

   DBCREATE( "IMAGES", aStruct )

   USE IMAGES NEW
   APPEND BLANK
   REPLACE code with 1

   // Import
   IF ! BLOBIMPORT( FIELDPOS( "IMAGE" ), cInput )
      ? "Error importando !!!"
      RETURN NIL
   ENDIF

   // Show
   DEFINE WINDOW Form_1 ;
      OBJ oForm ;
      AT 0,0 ;
      WIDTH 588 ;
      HEIGHT 480 ;
      TITLE 'Mostrar imagen desde un archivo BLOB' ;
      MAIN ;
      ON RELEASE ( DBCLOSEALL(), DBCOMMITALL() )

      @ 10, 10 IMAGE Img_1 ;
         OBJ oImage ;
         IMAGESIZE ;
         PICTURE "demo.ico"

      @ 80, 10 BUTTON Btn_1 ;
         CAPTION "Cambiar imagen" ;
         ACTION oImage:Buffer := BLOBGET( FIELDPOS( "IMAGE" ) )

      ON KEY ESCAPE ACTION oForm:Release()
   END WINDOW

   oForm:Center()
   oForm:Activate()

   CLOSE DATABASES

RETURN NIL

/*
 * EOF
 */
