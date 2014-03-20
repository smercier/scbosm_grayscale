== Grayscale Scribe OSM map ==

Get Scribeui up and running, git this and enjoy OSM

Require
-------

  * Mapserver 6.x
  * Postgresql/Postgis 2.x
  * imposm
  * osmosis

imposm
------
Mapping of OSM data import from imposm. Edit makefile to download your source data file from Geofabrik and clip it with osmosis:
	
    cd osmbase
    ## edit database connexion in makefile
	sudo vim makefile
    ## import shapefiles context data
    sudo make
    ## download osm source and process it
	sudo make imposm
    ## After validation
	sudo make clean