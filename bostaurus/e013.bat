@echo off

if "%HG_ROOT%"="" set HG_ROOT=c:\oohg

Rem Si quiere utilizar hbmk2 para construir el exe, quite el comentario de la siguiente línea y comente las restantes:
Rem BuildApp e013 -i%HG_ROOT%\hb32\contrib\hbzebra

Rem Si quiere utilizar harbour y gcc para construir el exe, quite el comentario de la siguiente línea y comente las restantes:
Rem COMPILE e013 -i%HG_ROOT%\hb32\contrib\hbzebra

COMPILE e013 -i%HG_ROOT%\hb32\contrib\hbzebra
