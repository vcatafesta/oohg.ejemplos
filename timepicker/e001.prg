/*
 * Ejemplo TimePicker n° 1
 * Autor: Fernando Yurisich <fernando.yurisich@gmail.com>
 * Licenciado bajo The Code Project Open License (CPOL) 1.02
 * Ver <http://www.codeproject.com/info/cpol10.aspx>
 *
 * Este ejemplo muestro cómo definir controles TimePicker
 * con formatos personalizados.
 *
 * Visítenos en https://github.com/fyurisich/OOHG_Samples o en
 * http://oohg.wikia.com/wiki/Object_Oriented_Harbour_GUI_Wiki
 */

#include "oohg.ch"

FUNCTION Main

   DEFINE WINDOW Form_1 ;
      AT 0, 0 ;
      WIDTH 600 ;
      HEIGHT 400 ;
      TITLE "ooHG - Demo TimePicker" ;
      MAIN

      @ 010, 010 LABEL Lbl_1 VALUE "1" AUTOSIZE

      @ 010, 020 TIMEPICKER Time_1 OBJ oTime1 ;
         VALUE "20:15:10" ;
         TOOLTIP "Control TimePicker" ;
         TIMEFORMAT "'Elegido: 'hh':'mm':'ss ddddMMMdd', 'yyy" ;
         WIDTH 270

      @ 055, 010 LABEL Lbl_5 VALUE "5" AUTOSIZE

      @ 055, 020 TIMEPICKER Time_5 OBJ oTime5 ;
         VALUE "20:15:10" ;
         TOOLTIP "Control TimePicker"

      @ 010, 310 LABEL Lbl_2 VALUE "2" AUTOSIZE

      @ 010, 320 TIMEPICKER Time_2 OBJ oTime2 ;
         VALUE "20:15" ;
         TOOLTIP "Control TimePicker ShowNone" ;
         SHOWNONE ;
         TIMEFORMAT "HH' y 'mm' con 'ss' segundos'" ;
         WIDTH 200

      @ 100, 010 LABEL Lbl_3 VALUE "3" AUTOSIZE

      @ 100, 020 TIMEPICKER Time_3 ;
         VALUE "20:15" ;
         TOOLTIP "Control TimePicker"

      @ 100, 390 LABEL Lbl_4 VALUE "4" AUTOSIZE

      @ 100, 400 TIMEPICKER Time_4 OBJ oTime4 ;
         VALUE "20:15" ;
         TOOLTIP "Control TimePicker ShowNone" ;
         SHOWNONE

      // Asignar "00:00:00"
      @ 190, 010 BUTTON but_1 CAPTION 'Asignar "" a 1' ACTION oTime1:Value := ""
      // Asignar "12:00:00"
      @ 230, 010 BUTTON but_2 CAPTION 'Asignar "" a 5' ACTION oTime5:Value := ""
      // Las horas inválidas son convertidas a "00:00:00"
      @ 270, 010 BUTTON but_3 CAPTION "Inválido en 2" ACTION oTime2:Value := "99:99:99"
      // Asignar una hora válida
      @ 310, 010 BUTTON but_4 CAPTION "Válido en 2" ACTION oTime2:Value := Time()
      // Desasignar
      @ 190, 310 BUTTON but_5 CAPTION 'Asignar "" a 2 (borra)' ACTION oTime2:Value := Nil
      // Asignar la hora actual (cualquier número sirve)
      @ 230, 310 BUTTON but_6 CAPTION "Actual a 4" ACTION oTime4:Value := 33
      // Desasignar
      @ 270, 310 BUTTON but_7 CAPTION 'Asignar "" a 4 (borra)' ACTION oTime4:Value := Nil

      ON KEY ESCAPE ACTION ThisWindow.Release()
   END WINDOW

   CENTER WINDOW Form_1
   ACTIVATE WINDOW Form_1

RETURN Nil

/*
 * EOF
 */
