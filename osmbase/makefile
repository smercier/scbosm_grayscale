# Need unzip, ogr2ogr, shptree, imposm
#-------------------
#Connection PG

HOST = localhost
PORT = 5432
DBNAME = osm
USER = osm
PGPWD = osm

#imposm
DOWNLOAD = 'http://download.geofabrik.de/africa-latest.osm.bz2'
REGION = africa-latest.osm.bz2
IMPOSM_PGCON = postgis://$(USER):$(PGPWD)@$(HOST):$(PORT)/$(DBNAME)
BBOX = top=17.149559 left=-17.827947 bottom=11.919332 right=-11.587713
# senegal
# 11.919332, -17.827947  /  17.149559, -11.587713


all: ../data/TM_WORLD_BORDERS-0.3.shp ../data/processed_p.shp ../data/shoreline_300.shp
imposm: imposm_write

../data/processed_p.shp: processed_p.tar.bz2
	tar xmjf processed_p.tar.bz2 -C ../data
	shptree ../data/processed_p.shp
	touch ../data/processed_p.shp

../data/shoreline_300.shp: shoreline_300.tar.bz2
	tar xmjf shoreline_300.tar.bz2 -C ../data
	shptree ../data/shoreline_300.shp
	touch ../data/shoreline_300.shp

../data/TM_WORLD_BORDERS-0.3.shp: TM_WORLD_BORDERS-0.3.zip
	mkdir -p ../data
	unzip -o TM_WORLD_BORDERS-0.3.zip -d ../data
	shptree ../data/TM_WORLD_BORDERS-0.3.shp
	touch ../data/TM_WORLD_BORDERS-0.3.shp

processed_p.tar.bz2:
	wget http://tile.openstreetmap.org/processed_p.tar.bz2

shoreline_300.tar.bz2:
	wget http://tile.openstreetmap.org/shoreline_300.tar.bz2

TM_WORLD_BORDERS-0.3.zip:
	wget http://thematicmapping.org/downloads/TM_WORLD_BORDERS-0.3.zip

# Charger BD IMPOSM     
imposm_write: $(REGION) box.osm.bz2
	imposm --overwrite-cache  --read --write --optimize -m imposm-mapping.py --connection=$(IMPOSM_PGCON) box.osm.bz2
	imposm --deploy-production-tables --connection=$(IMPOSM_PGCON)
	touch imposm_write
        
box.osm.bz2: $(REGION)
	bzcat $(REGION) | osmosis  --read-xml enableDateParsing=no file=-  --bounding-box $(BBOX) --write-xml file=- | bzip2 > box.osm.bz2
	touch $@

$(REGION):
	wget $(DOWNLOAD)
	touch $@

clean:
	rm imposm_*.cache
	rm imposm_write 
	rm *.bz2
	rm *.zip
