/*
 * Ejemplo RichEditBox n° 1
 * Autor: Fernando Yurisich <fernando.yurisich@gmail.com>
 * Licenciado bajo The Code Project Open License (CPOL) 1.02
 * Ver <http://www.codeproject.com/info/cpol10.aspx>
 *
 * Este ejemplo muestra cómo destacar la fila corriente en un
 * control RichEditBox, utilizando los métodos GetCurrentLine,
 * GetSelection, SetSelection, SetSelectionTextColor,
 * SetSelectionBackColor, GetLineIndex y GetLineLength y el
 * evento OnSelChange.
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
      TITLE 'OOHG - Destacar Línea Actual en Control Richedit'

      ON KEY ESCAPE ACTION oWnd:Release()

      @ 20,20 RICHEDITBOX rch_edit ;
         OBJ oRch ;
         WIDTH 500 ;
         HEIGHT 250

      oRch:OnSelChange := {|| Destacar( oRch )}

   END WINDOW

   ownd:Center()
   ownd:Activate()

RETURN NIL


FUNCTION Destacar( oRch )

   LOCAL aPos, aColor, nCurrent
   STATIC nPrevious := -1

   IF Empty( oRch:Value )
      RETURN NIL
   ENDIF

   nCurrent := oRch:GetCurrentLine()
   IF nCurrent == nPrevious
      RETURN NIL
   ENDIF

   // Guardar la selección actual: [ índice del caracter inicial, número de caracteres ]
   aPos := oRch:GetSelection()

   IF nPrevious # -1
      // Seleccionar todo el texto de la línea previamente seleccionada
      oRch:SetSelection( oRch:GetLineIndex( nPrevious ), oRch:GetLineIndex( nPrevious ) + oRch:GetLineLength( nPrevious ) )

      // Restaurar los colores
      oRch:SetSelectionTextColor( oRch:FontColor )
      oRch:SetSelectionBackColor( oRch:BackColor )
   ENDIF

   // Seleccionar todo el texto en la primera línea de la selección (la línea donde se encuentra el cursor)
   oRch:SetSelection( oRch:GetLineIndex( nCurrent ), oRch:GetLineIndex( nCurrent ) + oRch:GetLineLength( nCurrent ) )

   // Cambiar los colores
   oRch:SetSelectionTextColor( RGB( RED[ 1 ], RED[ 2 ], RED[ 3 ] ) )
   oRch:SetSelectionBackColor( RGB( GREEN[ 1 ], GREEN[ 2 ], GREEN[ 3 ] ) )

   // Restaurar la selección
   oRch:SetSelection( aPos[ 1 ], aPos[ 2 ] )

   nPrevious := nCurrent

RETURN NIL

/*
 * EOF
 */
