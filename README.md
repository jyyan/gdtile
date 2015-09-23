# gdtile
鬼島圖磚服務

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
open preview.html
```
