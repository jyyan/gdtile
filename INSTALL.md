Install Depedencies
===============================
Note: this INSTALL document is test and build under `Ubuntu 12.04` , would like to try and test other version OS next time. or called for anonymous for help to update this :P



install mapnik2
-------------------------------

ref: https://github.com/mapnik/mapnik/wiki/UbuntuInstallation

**Mapnik v2.3.x**
This is the nightly build of the upcoming 2.3.0 release

```sh
sudo apt-get install python-software-properties

sudo add-apt-repository ppa:mapnik/nightly-2.3
sudo apt-get update
sudo apt-get install libmapnik libmapnik-dev mapnik-utils python-mapnik
# also install datasource plugins if you need them
sudo apt-get install mapnik-input-plugin-gdal mapnik-input-plugin-ogr\
  mapnik-input-plugin-postgis \
  mapnik-input-plugin-sqlite \
  mapnik-input-plugin-osm
```

install Cascadenik
-------------------------------

```sh
sudo apt-get install python-pip python-cssutils python-imaging
sudo pip install cascadenik
```

Install uWSGI
-------------------------------
```sh
sudo apt-get install uwsgi-core uwsgi-plugin-python
```

Install virtualenv
-------------------------------
```sh
sudo pip install virtualenv
```

Install Pillow
-------------------------------
```sh
sudo pip install Pillow
```

Install TileStache
-------------------------------
```sh
git clone https://github.com/migurski/TileStache
cd TileStache
sudo python setup.py install
```

#test TileStache
at TileStache source code directory
```sh
./scripts/tilestache-server.py
```
and then open http://localhost:8080/osm/preview.html at your browser for test TileStache

Install PostgreSQL and PostGIS
-------------------------------
```sh
sudo apt-get install postgresql postgresql-contrib postgis postgresql-9.1-postgis
```
#Create database
```sh
sudo -u postgres createuser osm -W
# typing password as `osm4326`

sudo -u postgres createdb --encoding=UTF8 --owner=gisuser osm
sudo -u postgres createlang plpgsql osm  # note: this is obsolete with >=postgres-9.1
```

import initial db table ref. the following document , must notice your OS version
ref: http://wiki.openstreetmap.org/wiki/PostGIS/Installation#Create_database

it will such like (Ubuntu 12.04)
```sh
sudo -u postgres psql -d osm -f /usr/share/postgresql/9.1/contrib/postgis-1.5/postgis.sql
sudo -u postgres psql -d osm -f /usr/share/postgresql/9.1/contrib/postgis-1.5/spatial_ref_sys.sql
sudo -u postgres psql -d osm -f /usr/share/postgresql/9.1/contrib/postgis_comments.sql
sudo -u postgres psql -d osm -c "GRANT SELECT ON spatial_ref_sys TO PUBLIC;"
sudo -u postgres psql -d osm -c "GRANT ALL ON geometry_columns TO gisuser;"
```
the database name in the ref doc is `gis`, replase it with `osm`.

#import shp into PostGIS
use shp2pgsql-gui

or

osm2pgsql
```sh
apt-get install osm2pgsql
# install osm2pgsql
osm2pgsql -m -U osm -W -d osm -S /usr/share/osm2pgsql/default.style taiwan-latest.osm
# need typing the password of user `osm`
# please change the osm filename `taiwan-latest.osm` with what you have download from osm data source
```



