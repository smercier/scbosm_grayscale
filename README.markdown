== Grayscale Scribe OSM map ==

Get Scribeui up and running, git this and enjoy OSM.  This map is still work in progress.  Landusage and Places are not in it.

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
    
    ## import osm shapefiles(processed_p,shoreline_300 )  for land cover
    sudo make
    
    ## download osm source file and process it with osmosis and imposm
	sudo make imposm
    
    ## clean up tmp and zip/bz2 files
	sudo make clean
    
