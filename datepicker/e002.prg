/*
 * Ejemplo DatePicker n° 2
 * Autor: Fernando Yurisich <fernando.yurisich@gmail.com>
 * Licenciado bajo The Code Project Open License (CPOL) 1.02
 * Ver <http://www.codeproject.com/info/cpol10.aspx>
 *
 * Este ejemplo muestra como definir formatos personalizados.
 *
 * Visítenos en https://github.com/fyurisich/OOHG_Samples o en
 * http://oohg.wikia.com/wiki/Object_Oriented_Harbour_GUI_Wiki
 */

#include "oohg.ch"

FUNCTION Main

   SET DATE BRITISH
   SET LANGUAGE TO SPANISH

   DEFINE WINDOW Form_1 ;
      AT 0, 0 ;
      WIDTH 600 ;
      HEIGHT 400 ;
      TITLE "ooHG - Demo DatePicker" ;
      MAIN

      @ 10,10 DATEPICKER Dtp_1 ;
         VALUE CToD("01/01/2001") ;
         TOOLTIP "Control DatePicker" ;
         DATEFORMAT "'Elegido: 'hh':'mm':'ss ddddMMMdd', 'yyy" ;
         WIDTH 290

      @ 10,400 DATEPICKER Dtp_2 OBJ oDtp2 ;
         VALUE CToD("01/01/2001") ;
         TOOLTIP "Control DatePicker ShowNone RightAlign" ;
         SHOWNONE ;
         RIGHTALIGN ;
         DATEFORMAT "dd'.'MM'.'yyy"

      @ 100,10 DATEPICKER Dtp_3 ;
         VALUE CToD("01/01/2001") ;
         TOOLTIP "Control DatePicker" ;
         WIDTH 290 ;
         DATEFORMAT "dddd'--'MMM'--'yy"

      @ 100,400 DATEPICKER Dtp_4 OBJ oDtp4 ;
         VALUE CToD("01/01/2001") ;
         TOOLTIP "Control DatePicker ShowNone RightAlign" ;
         SHOWNONE ;
         RIGHTALIGN

      @ 230, 010 BUTTON but_1 CAPTION "Borrar 2" ACTION oDtp2:Value := CToD( "//" )
      @ 230, 310 BUTTON but_2 CAPTION "Borrar 4" ACTION oDtp4:Value := 0
      @ 270, 010 BUTTON but_3 CAPTION "Cambiar 2 actual" ACTION oDtp2:Value := Date()

      ON KEY ESCAPE ACTION ThisWindow.Release()
   END WINDOW

   CENTER WINDOW Form_1
   ACTIVATE WINDOW Form_1

RETURN Nil

/*
 * EOF
 */
