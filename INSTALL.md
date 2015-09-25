Install Depedencies
===============================
Note: this INSTALL document is test and build under `Ubuntu 12.04` , would like to try and test other version OS next time. or called for anonymous for help to update this :P

install mapnik2
-------------------------------

ref: [Mapnik2 Installation](https://github.com/mapnik/mapnik/wiki/UbuntuInstallation)

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
sudo apt-get install libpython-dev
sudo apt-get install ttf-unifont
sudo pip install Pillow
```

Install TileStache
-------------------------------
```sh
git clone https://github.com/migurski/TileStache
cd TileStache
sudo python setup.py install
```

###test TileStache
at TileStache source code directory
```sh
./scripts/tilestache-server.py
```
and then open http://localhost:8080/osm/preview.html at your browser for test TileStache

Install PostgreSQL and PostGIS
-------------------------------
```sh
# for ubuntu 12.04 need update apt sources list:
echo "deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main" | sudo tee /etc/apt/sources.list.d/postgis.list
wget --quiet -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update
sudo apt-get install postgresql-9.4 postgis postgresql-9.4-postgis-2.1 postgresql-9.4-postgis-scripts

# Ubuntu 14.04 LTS
sudo apt-get install postgresql postgresql-contrib postgis postgresql-9.3-postgis-2.1 postgresql-9.3-postgis-scripts

#Ubuntu 14.10+
sudo apt-get install postgresql postgresql-contrib postgis postgresql-9.4-postgis-2.1 postgresql-9.4-postgis-scripts
```
notice :
modify `/etc/postgresql/9.*/main/pg_hba.conf` or `/etc/postgresql/pg_hba.conf` change the connect opt. from peer to md5 at the row : `local  all all peer`,

and edit `/etc/postgresql/9.*/main/postgresql.conf` or `/etc/postgresql/postgresql.conf` , remove the hash flag from the `#listen_addresses = 'localhost'` line , and must re check the listening port is as default number `5432`

at last , restart the `postgresql` service
```sh
sudo service postgresql restart
```

###Create database
```sh
sudo -u postgres createuser osm -W
# typing password as `osm4326`
sudo -u postgres createdb --encoding=UTF8 --owner=osm
```

import initial db table ref. the following document , must notice your OS version
ref: [Create_database](http://wiki.openstreetmap.org/wiki/PostGIS/Installation#Create_database)

```sh
# Create database & user `osm` as password `osm4326`
sudo -u postgres psql -d postgres -c "CREATE USER osm PASSWORD 'osm4326';"
sudo -u postgres psql -d postgres -c "CREATE DATABASE osm;"

# import some function and case support for PostGIS , osm2pgsql will use them first
sudo -u postgres psql -d osm -f /usr/share/postgresql/9.4/contrib/postgis-2.1/legacy.sql
sudo -u postgres psql -d osm -f /usr/share/postgresql/9.4/contrib/postgis-2.1/legacy_gist.sql
sudo -u postgres psql -d osm -f /usr/share/postgresql/9.4/contrib/postgis-2.1/postgis.sql
sudo -u postgres psql -d osm -f /usr/share/postgresql/9.4/contrib/postgis-2.1/spatial_ref_sys.sql

# Activate PostGIS module
sudo -u postgres psql -d osm -c "CREATE EXTENSION postgis;"
sudo -u postgres psql -d osm -c "CREATE EXTENSION postgis_topology;"
sudo -u postgres psql -d osm -c "CREATE EXTENSION hstore;"

# transfer database ownshio to user `osm`
sudo -u postgres psql -d postgres -c "GRANT ALL ON DATABASE osm TO osm;"
```

###import osm map into PostGIS
```sh
apt-get install osm2pgsql
# install osm2pgsql
osm2pgsql --create --cache 800 --hstore --database osm -l -U osm -W -S /usr/share/osm2pgsql/default.style taiwan-latest.osm.bz2

# need typing the password of user `osm`
# please change the osm filename `taiwan-latest.osm.bz2` with what you have download from osm data source
# notice : at ubuntu 12.04 , the osm2pgsql version donot support the osm file type `osm.pbf` , so that you must using `osm.bz2` or other one.
# but i found that the `osm.bz2` format database donot have some table column such like `water and surface`, so we have better install last version osm2pgsql with

sudo add-apt-repository ppa:kakrueger/openstreetmap
sudo apt-get update
sudo apt-get --no-install-recommends install -y osm2pgsql

# now we can import `osm.pbf` data
osm2pgsql --create --cache 800 --hstore --database osm -l -U osm -W -S /usr/share/osm2pgsql/default.style taiwan-latest.osm.pbf
```

Test your environment
------------------------------

ref. [getting start with nik2img](http://wiki.openstreetmap.org/wiki/Zh-hant:mapnik_starter)

using nik2img for check your import map information and connect PostgreSQL/PostGIS is success or not.

```sh
# install nik2img
sudo pip install nik2img

# touch and edit new xml file as `mapstyle-dazhi.xml`
# ....
# ....

nik2img.py mapstyle-dazhi.xml dazhi-bridge.png -f png256 -b 121.54432 25.07480 121.54632 25.07780

```

Most Referance
------------------------------
1. [lastest Taiwan map](http://download.geofabrik.de/asia/taiwan.html).
1. [Manually building a tile server](https://gist.github.com/pnorman/6739765)
1. [Open Street Map Installation Tutorial](http://www.slideshare.net/MarcHuang1/osm-installation-en)
1. [build your own lab ubuntu](http://wiki.openstreetmap.org/wiki/Zh-hant:build_your_own_lab_ubuntu)


