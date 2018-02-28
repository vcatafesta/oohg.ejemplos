/*
 * Ejemplo RichEditBox n° 3
 * Autor: Fernando Yurisich <fernando.yurisich@gmail.com>
 * Licenciado bajo The Code Project Open License (CPOL) 1.02
 * Ver <http://www.codeproject.com/info/cpol10.aspx>
 *
 * Este ejemplo muestra cómo destacar el texto seleccionado.
 *
 * Visítenos en https://github.com/oohg/ejemplos
 */

#include "oohg.ch"

FUNCTION Main

   LOCAL oWnd, oRch

   DEFINE WINDOW Win_1 OBJ oWnd ;
      AT 0,0 ;
      WIDTH 600 ;
      HEIGHT 400 ;
      TITLE 'Control Richedit - Destacar texto seleccionado'

      ON KEY ESCAPE ACTION oWnd:Release()

      @ 20,20 RICHEDITBOX rch_edit ;
         OBJ oRch ;
         WIDTH 500 ;
         HEIGHT 250

      @ 280, 20 BUTTON btn_Destacar ;
         CAPTION "Destacar" ;
         ACTION {|| Destacar( oRch )}

      @ 280, 130 BUTTON btn_Normal ;
         CAPTION "Normal" ;
         ACTION {|| Normal( oRch )}

   END WINDOW

   ownd:Center()
   ownd:Activate()

RETURN NIL


FUNCTION Destacar( oRch )

   oRch:SetSelectionTextColor( RGB( RED[ 1 ], RED[ 2 ], RED[ 3 ] ) )
   oRch:SetSelectionBackColor( RGB( GREEN[ 1 ], GREEN[ 2 ], GREEN[ 3 ] ) )

RETURN NIL


FUNCTION Normal( oRch )

    oRch:SetSelectionTextColor( oRch:FontColor )
    oRch:SetSelectionBackColor( oRch:BackColor )

RETURN NIL

/*
 * EOF
 */
