/**
 * 各種地貌的繪圖設定
 *
 * - TODO: 建築物與地面重疊問題
 * - TODO: 碧湖公園的湖
 */

/* 不分離海陸 */
/* Map { map-bgcolor: #ffffe0; } */

/* 分離海陸 */
Map { map-bgcolor: #7ce; }
#lands_lres {
  polygon-fill: #f0f0f0;
}

/* ================================================== */
/*                   各類自然景觀配色                   */
/* ================================================== */

/* 地貌預設顏色 */
#natural[zoom>=12] {
  polygon-fill: #fee;
}

/* 河川流域線(沒有輪廓的，如景美溪) */
#rivers[zoom>=12] { line-width: 3; line-color: #7ce; }
#rivers[zoom>=14] { line-width: 4; }
#rivers[zoom>=16] { line-width: 6; }

/* 河川 */
#natural[natural='water'],     /* 新式 */
#natural[waterway='riverbank'] /* 舊式 */
{ polygon-fill: #7ce; line-width: 0; }

/* 森林(幾乎都在山區) */
#natural[natural='wood'], #natural[landuse='forest'] { polygon-fill: #d0e0d0; line-width: 1; line-color: #50a050; }

/* 矮樹(焚化爐周邊掩埋場) */
#natural[natural='scrub'] { polygon-fill: #5a5; }

/* 濕地(關渡/社子) */
#natural[natural='wetland'] { polygon-fill: #996; }

/* 草叢(洲美) */
#natural[natural='grassland'] { polygon-fill: #6c6; }

/* 湖 */
#lakes { polygon-fill: #5af; }

/* ================================================== */
/*                   各類人造景觀配色                   */
/* ================================================== */

/*
SELECT landuse, count(landuse) cnt
FROM planet_osm_polygon WHERE (
  "natural" IS NULL AND
  waterway IS NULL AND
  boundary IS NULL AND
  (landuse!='forest' OR landuse IS NULL)
)
AND way && ST_MakeEnvelope(121.440, 25.167, 121.665, 24.969)
GROUP BY landuse
ORDER BY cnt DESC
*/

/*
#artificial[zoom>=15] { 
  line-width: 1;
  line-color: #ddd;
  polygon-fill: #f0f0f0;
}
*/

/* 住宅 (335) */
/*
#artificial[landuse='residential'][zoom>=15] { polygon-fill: #e0e0f0; }
*/

/* 綠地 (225) */
#artificial[landuse='grass'][zoom>=15] { polygon-fill: #7d0; }

/* 施工中 (114) */
#artificial[landuse='construction'][zoom>=15] { polygon-fill: #ddd; }

/* 墓仔坡 (100) */
#artificial[landuse='cemetery'][zoom>=15] { polygon-fill: #faa; }

/* 軍營 (90) */
#artificial[landuse='military'][zoom>=15] {
  line-color: #d00;
  line-dasharray: 6,3;
  polygon-fill: #faa;
  polygon-opacity: 0.3;
}

/* 種田 (50) */
/*
#artificial[landuse='farmland'][zoom>=15] { polygon-fill: #eee; }
*/

/*
SELECT leisure, count(leisure) cnt
FROM planet_osm_polygon WHERE (
  "natural" IS NULL AND
  waterway IS NULL AND
  boundary IS NULL AND
  (landuse!='forest' OR landuse IS NULL)
)
AND way && ST_MakeEnvelope(121.440, 25.167, 121.665, 24.969)
GROUP BY leisure
ORDER BY cnt DESC
*/

/* 公園 (727) */
/*
#artificial[leisure='park'][zoom>=15] { polygon-fill: #dfc; }
*/

/* 球場 (612) */
/*
#artificial[leisure='pitch'][zoom>=15] { polygon-fill: #282; }
*/

/* 軌道,幾乎都是操場 (155) */
/*
#artificial[leisure='track'][zoom>=15] { polygon-fill: #b00; }
*/

/* 運動中心 (42) */
/*
#artificial[leisure='sport_centre'][zoom>=15] { polygon-fill: #000; }
*/

/* 游泳池 (42) */
/*
#artificial[leisure='swimming_pool'][zoom>=15] { polygon-fill: #8bf; }
*/

/* 花園 (36) */
/*
#artificial[leisure='garden'][zoom>=15] { polygon-fill: #d5f; }
*/

/* 松山機場 */
/*
#artificial[aeroway='aerodrome'][zoom>=15] { polygon-fill: #bbb; }
*/