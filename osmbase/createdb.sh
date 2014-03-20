sudo su postgres -c'createdb -E UTF8 --lc-ctype en_CA.UTF-8 -T template0 template_postgis'
sudo su postgres -c'createlang -d template_postgis plpgsql;'
sudo su postgres -c'psql -U postgres -d template_postgis -c"CREATE EXTENSION postgis;"'
sudo su postgres -c'psql -U postgres -d template_postgis -c"CREATE EXTENSION hstore;"'
sudo su postgres -c'psql -U postgres -d template_postgis -c"SELECT PostGIS_full_version();"'
sudo su postgres -c'psql -U postgres -d template_postgis -c "GRANT ALL ON geometry_columns TO PUBLIC;"'
sudo su postgres -c'psql -U postgres -d template_postgis -c "GRANT ALL ON spatial_ref_sys TO PUBLIC;"'
sudo su postgres -c'psql -U postgres -d template_postgis -c "GRANT ALL ON geography_columns TO PUBLIC;"'
sudo su postgres -c'createdb -E utf8 -T template_postgis osm'
sudo su postgres -c'psql -U postgres -d osm -c "CREATE USER osm WITH PASSWORD '$1';"'
sudo su postgres -c'psql -U postgres -d osm -c "GRANT ALL PRIVILEGES ON DATABASE osm to osm;"'