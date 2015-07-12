Lineare Programmierung
======================

Zwei Hinterh�ltigkeiten waren in den Daten:

 1. Das eine Polygon ist clockwise, das andere ist counter-clockwise definiert.
 2. Das eine Polygon enth�lt den Startpunkt zweimal (Anfang und Ende), das andere nicht.

Diese Unterschiede werden am Anfang des Skripts ausgeglichen.  Die Matrix `data`
enth�lt dann alle Punkte des Polygons und den ersten Punkt am Ende noch einmal.
Die Variable `nPoints` ist allerdings die Anzahl der unterschiedlichen Punkte
des Polyogns!

Die MATLAB-Funktion `linprog` minimiert die Zielfunktion, also muss der Radius
mit `-1` gewichtet werden, dass dieser tats�chlich maximiert wird.

Das Ergebnis f�r das Testpolygon ist wie erwartet:

    ans =
    
        5.0000
        5.0000
        5.0000

Die letzte Komponente ist der Radius (vgl. MATLAB-Skript: `[ x y r ]`).

Das Ergebnis f�r das gro�e Polygon ist:

    ans =
    
      472.5705
      476.6642
      438.5922

Der Radius des gr��ten einbeschriebenen Kreises ist also `438.5922`.
