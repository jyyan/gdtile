# gdtile
鬼島圖磚服務

## 系統需求
### 軟體
* Python 2.7
* cascadenik
* mapnik2
* TileStache
* uwsgi
* PostgreSQL with PostGIS

### 資料
* OSM 台灣圖資匯入 PostGIS
* 海岸線輪廓圖資 *.shp 格式

## 怎麼架？
啟動圖磚服務
```!bash
./run-server.sh
```
預覽圖磚
```!bash
open preview.html
```
