# gdtile
台灣圖磚服務

## 系統需求
### 軟體
* Python 2.7
* virtualenv
* cascadenik
* Pillow
* mapnik2
* TileStache
* uwsgi
* PostgreSQL with PostGIS

### 資料
* OSM 台灣圖資匯入 PostGIS
* 海岸線輪廓圖資 *.shp 格式

## 怎麼架？
### 前置作業
you can read [INSTALL.md](INSTALL.md) there are some tips for install all dependency software/library and import osm data into PostGIS

#### 單機模式
```!bash
echo '127.0.0.1:5432:osm:osm:osm4326' > ~/.pgpass
```

#### nginx 模式
```!bash
echo '127.0.0.1:5432:osm:osm:osm4326' > ~/.pgpass
sudo cp ~/.pgpass ~root/
cp uwsgi-nginx.ini.default uwsgi-nginx.ini
```

### 啟動圖磚服務
#### 單機模式
```!bash
./run-server.py
```

#### nginx 模式
```!bash
sudo ./run-server.py nginx
```

### 預覽圖磚
```!bash
launch `http://127.0.0.1:10080`
```

### 其他
* 盾牌資料來源: https://commons.wikimedia.org/wiki/Category:Taiwan_highway_shields
* 建立圖資環境: http://wiki.openstreetmap.org/wiki/Zh-hant:Develop
