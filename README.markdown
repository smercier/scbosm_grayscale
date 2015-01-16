== Grayscale Scribe OSM map ==

Get Scribeui up and running, git this and enjoy OSM.  You need to install data with ScribeUI Makefile.

Require
-------

  * Mapserver 6.x
  * Postgresql/Postgis 2.x
  * imposm3

Build Database 
---------------
    
	sudo su postgres -c'createdb -E UTF8 -T template0 template_postgis'
	sudo su postgres -c'psql -U postgres -d template_postgis -c"CREATE EXTENSION postgis;"'
	sudo su postgres -c'psql -U postgres -d template_postgis -c "GRANT ALL ON geometry_columns TO PUBLIC;"'
	sudo su postgres -c'psql -U postgres -d template_postgis -c "GRANT ALL ON spatial_ref_sys TO PUBLIC;"'
	sudo su postgres -c'psql -U postgres -d template_postgis -c "GRANT ALL ON geography_columns TO PUBLIC;"'
	sudo su postgres -c'psql -U postgres -c "CREATE USER osm WITH PASSWORD '"'"'osm'"'"';"'
	##sudo su postgres -c'dropdb osm'
	sudo su postgres -c'createdb -E utf8 -T template_postgis -O osm osm'
	sudo su postgres -c'psql -U postgres -c "GRANT ALL PRIVILEGES ON DATABASE osm to osm;"'
    
Install and run imposm3
-----------------------
	sudo mkdir data && cd data
	sudo wget http://imposm.org/static/rel/imposm3-0.1dev-20140624-cf8c196-linux-x86-64.tar.gz
	sudo tar -xvf imposm3-0.1dev-20140624-cf8c196-linux-x86-64.tar.gz
	sudo mv imposm3-0.1dev-20140624-cf8c196-linux-x86-64 imposm3bin
	sudo cd imposm3bin && mkdir cache
	sudo wget http://download.geofabrik.de/north-america/canada/quebec-latest.osm.pbf
	sudo ./imposm3 import -config ../../osmbase/imposm_config.json -read quebec-latest.osm.pbf -diff -overwritecache
	sudo ./imposm3 import -config ../../osmbase/imposm_config.json -write -diff -optimize
	sudo ./imposm3 import -config ../../osmbase/imposm_config.json -deployproduction
        
      
