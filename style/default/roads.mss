/**
 * 各種道路的繪圖設定
 */

/* 道路配色 */
.roads.inline[highway='motorway'],
.roads.inline[highway='motorway_link']   { line-color: #a8e; }
.roads.inline[highway='trunk'],
.roads.inline[highway='trunk_link']      { line-color: #f90; }
.roads.inline[highway='primary'],
.roads.inline[highway='secondary'],
.roads.inline[highway='tertiary'],
.roads.inline[highway='primary_link'],
.roads.inline[highway='secondary_link'],
.roads.inline[highway='tertiary_link']   { line-color: #ff7; }
.roads.inline[highway='cycleway']        { line-color: #5df; }
.roads.inline[highway='service'],
.roads.inline[highway='unclassified'],
.roads.inline[highway='residential']     { line-color: #fff; }
.roads.inline[highway='footway']         { line-color: #ddd; }
.roads.outline                           { line-color: #777; }
.rails.outline[railway='rail']           { line-color: #777; }
.rails.outline[railway='subway']         { line-color: #07d; }
.rails.inline                            { line-color: #fff; }

/* 隧道透明化 */
.roads.inline[tunnel='yes'],
.roads.outline[tunnel='yes'] { line-opacity: 0.4; }

/* Zoom: 10 */
.rails.outline[zoom>=10] { line-width: 3; }
.rails.inline[zoom>=10]  { line-width: 1; line-dasharray: 6,6; }
.roads.outline[highway='motorway'][zoom>=10],
.roads.outline[highway='trunk'][zoom>=10]      { line-width: 4; }
.roads.inline[highway='motorway'][zoom>=10],
.roads.inline[highway='trunk'][zoom>=10]       { line-width: 2; }
.roads.outline[highway='primary'][zoom>=10],
.roads.outline[highway='secondary'][zoom>=10]  { line-width: 1; }

/* Zoom: 12 */
.roads.outline[highway='primary'][zoom>=12],
.roads.outline[highway='secondary'][zoom>=12],
.roads.outline[highway='tertiary'][zoom>=12]   { line-width: 1; }
.roads.outline[highway='cycleway'][zoom>=12]   { line-width: 4; }
.roads.inline[highway='cycleway'][zoom>=12]    { line-width: 2; }

/* Zoom: 13 */
.roads.outline[highway='primary'][zoom>=13],
.roads.outline[highway='secondary'][zoom>=13],
.roads.outline[highway='tertiary'][zoom>=13]   { line-width: 4; }
.roads.inline[highway='primary'][zoom>=13],
.roads.inline[highway='secondary'][zoom>=13],
.roads.inline[highway='tertiary'][zoom>=13]    { line-width: 2; }

/* Zoom: 14 */
.rails.outline[zoom>=14] { line-width: 4; }
.rails.inline[zoom>=14]  { line-width: 2; line-dasharray: 12,12; }
.roads.outline[highway='motorway'][zoom>=14],
.roads.outline[highway='trunk'][zoom>=14]         { line-width: 6; }
.roads.inline[highway='motorway'][zoom>=14],
.roads.inline[highway='trunk'][zoom>=14]          { line-width: 4; }
.roads.outline[highway='service'][zoom>=14],
.roads.outline[highway='unclassified'][zoom>=14],
.roads.outline[highway='residential'][zoom>=14]   { line-width: 1; }
.roads.outline[highway='cycleway'][zoom>=14]      { line-width: 5; }
.roads.inline[highway='cycleway'][zoom>=14]       { line-width: 3; }

/* Zoom: 15 */
.roads.outline[highway='motorway_link'][zoom>=15],
.roads.outline[highway='trunk_link'][zoom>=15]      { line-width: 6; }
.roads.inline[highway='motorway_link'][zoom>=15],
.roads.inline[highway='trunk_link'][zoom>=15]       { line-width: 4; }
.roads.outline[highway='primary'][zoom>=15],
.roads.outline[highway='secondary'][zoom>=15],
.roads.outline[highway='tertiary'][zoom>=15]        { line-width: 6; }
.roads.inline[highway='primary'][zoom>=15],
.roads.inline[highway='secondary'][zoom>=15],
.roads.inline[highway='tertiary'][zoom>=15]         { line-width: 4; }
.roads.outline[highway='primary_link'][zoom>=15],
.roads.outline[highway='secondary_link'][zoom>=15],
.roads.outline[highway='tertiary_link'][zoom>=15]   { line-width: 4; }
.roads.inline[highway='primary_link'][zoom>=15],
.roads.inline[highway='secondary_link'][zoom>=15],
.roads.inline[highway='tertiary_link'][zoom>=15]    { line-width: 2; }
.roads.outline[highway='service'][zoom>=15],
.roads.outline[highway='unclassified'][zoom>=15],
.roads.outline[highway='residential'][zoom>=15]     { line-width: 3; }
.roads.inline[highway='service'][zoom>=15],
.roads.inline[highway='unclassified'][zoom>=15],
.roads.inline[highway='residential'][zoom>=15]      { line-width: 1; }
.roads.outline[highway='footway'][zoom>=15]         { line-width: 1; }

/* Zoom: 16 */
.roads.outline[highway='motorway'][zoom>=16],
.roads.outline[highway='trunk'][zoom>=16]           { line-width: 10; }
.roads.inline[highway='motorway'][zoom>=16],
.roads.inline[highway='trunk'][zoom>=16]            { line-width: 8; }
.roads.outline[highway='motorway_link'][zoom>=16],
.roads.outline[highway='trunk_link'][zoom>=16]      { line-width: 8; }
.roads.inline[highway='motorway_link'][zoom>=16],
.roads.inline[highway='trunk_link'][zoom>=16]       { line-width: 6; }
.roads.outline[highway='primary'][zoom>=16],
.roads.outline[highway='secondary'][zoom>=16],
.roads.outline[highway='tertiary'][zoom>=16]        { line-width: 8; }
.roads.inline[highway='primary'][zoom>=16],
.roads.inline[highway='secondary'][zoom>=16],
.roads.inline[highway='tertiary'][zoom>=16]         { line-width: 6; }
.roads.outline[highway='primary_link'][zoom>=16],
.roads.outline[highway='secondary_link'][zoom>=16],
.roads.outline[highway='tertiary_link'][zoom>=16]   { line-width: 6; }
.roads.inline[highway='primary_link'][zoom>=16],
.roads.inline[highway='secondary_link'][zoom>=16],
.roads.inline[highway='tertiary_link'][zoom>=16]    { line-width: 4; }
.roads.outline[highway='service'][zoom>=16],
.roads.outline[highway='unclassified'][zoom>=16],
.roads.outline[highway='residential'][zoom>=16],
.roads.outline[highway='footway'][zoom>=16]         { line-width: 4; }
.roads.inline[highway='service'][zoom>=16],
.roads.inline[highway='unclassified'][zoom>=16],
.roads.inline[highway='residential'][zoom>=16],
.roads.inline[highway='footway'][zoom>=16]          { line-width: 2; }
.roads.outline[highway='cycleway'][zoom>=16]        { line-width: 8; }
.roads.inline[highway='cycleway'][zoom>=16]         { line-width: 6; }

/* Zoom: 17 */
.roads.outline[highway='motorway'][zoom>=17],
.roads.outline[highway='trunk'][zoom>=17]           { line-width: 13; }
.roads.inline[highway='motorway'][zoom>=17],
.roads.inline[highway='trunk'][zoom>=17]            { line-width: 10; }
.roads.outline[highway='motorway_link'][zoom>=17],
.roads.outline[highway='trunk_link'][zoom>=17]      { line-width: 11; }
.roads.inline[highway='motorway_link'][zoom>=17],
.roads.inline[highway='trunk_link'][zoom>=17]       { line-width: 8; }
.roads.outline[highway='primary'][zoom>=17],
.roads.outline[highway='secondary'][zoom>=17],
.roads.outline[highway='tertiary'][zoom>=17]        { line-width: 11; }
.roads.inline[highway='primary'][zoom>=17],
.roads.inline[highway='secondary'][zoom>=17],
.roads.inline[highway='tertiary'][zoom>=17]         { line-width: 8; }
.roads.outline[highway='primary_link'][zoom>=17],
.roads.outline[highway='secondary_link'][zoom>=17],
.roads.outline[highway='tertiary_link'][zoom>=17]   { line-width: 9; }
.roads.inline[highway='primary_link'][zoom>=17],
.roads.inline[highway='secondary_link'][zoom>=17],
.roads.inline[highway='tertiary_link'][zoom>=17]    { line-width: 6; }
.roads.outline[highway='service'][zoom>=17],
.roads.outline[highway='unclassified'][zoom>=17],
.roads.outline[highway='residential'][zoom>=17],
.roads.outline[highway='footway'][zoom>=17]         { line-width: 6; }
.roads.inline[highway='service'][zoom>=17],
.roads.inline[highway='unclassified'][zoom>=17],
.roads.inline[highway='residential'][zoom>=17],
.roads.inline[highway='footway'][zoom>=17]          { line-width: 4; }
.roads.outline[highway='cycleway'][zoom>=17]        { line-width: 11; }
.roads.inline[highway='cycleway'][zoom>=17]         { line-width: 8; }

/* 移動軌跡 */
.track.outline { line-width: 4; line-color: #fff; }
.track.inline  { line-width: 2; line-color: #f00; }