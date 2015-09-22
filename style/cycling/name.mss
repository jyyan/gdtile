.rivers.name name,
.natural.name name,
.artificial.name name,
.roads.name name,
.rails.name name
{
  text-face-name: "unifont Medium";
  text-fill: #000;
  text-spacing: 0;
  text-avoid-edges: true;
  text-allow-overlap: true;
  text-halo-fill: #fff;
}

.rivers.name name,
.roads.name name,
.rails.name name
{
  text-placement: line;
}

/* Zoom: 12 */
.roads.name[highway='motorway'][zoom>=12] name,
.rails.name[railway='rail'][zoom>=12] name
{
  text-size: 11;
  text-halo-radius: 2;
}

/* Zoom: 13 */
.rivers.name[zoom>=13] name,
.natural.name[zoom>=13] name,
.roads.name[highway='cycleway'][zoom>=13] name,
.rails.name[railway='subway'][zoom>=13] name
{
  text-size: 11;
  text-halo-radius: 2;
}

/* Zoom: 15 */
.roads.name[highway='trunk'][zoom>=15] name,
.roads.name[highway='primary'][zoom>=15] name,
.roads.name[highway='secondary'][zoom>=15] name
{
  text-size: 11;
  text-halo-radius: 2;
}

/* Zoom: 16 */
/* .artificial.name[zoom>=16] name, */
.roads.name[highway='tertiary'][zoom>=16] name
{
  text-size: 11;
  text-halo-radius: 2;
}

/* Zoom: 17 */
.roads.name[highway='service'][zoom>=17] name,
.roads.name[highway='unclassified'][zoom>=17] name,
.roads.name[highway='residential'][zoom>=17] name,
.roads.name[highway='footway'][zoom>=17] name
{
  text-size: 9;
  text-halo-radius: 2;
}