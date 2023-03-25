---
id: '612'
title: How to Convert SHP to KML with GDAL
languages:
- bash
tags:
---
After reading [Google's advice](https://developers.google.com/kml/articles/vector) on the matter we add the following to **~/.bash\_profile** (see GDAL ReadMe.rtf for details):


```bash
export PATH=/Library/Frameworks/GDAL.framework/Programs:$PATH
```
    

We can now convert SHP file to KML:


```bash
ogr2ogr -f “KML" -where “qs_adm0_a3=’FIN’" ~/Downloads/xxx.kml ~/Downloads/qs_adm1_region/qs_adm1_region.shp

ogr2ogr -f “KML" -where “qs_adm0=’Finland’" ~/Downloads/xxx.kml ~/Downloads/qs_adm1_region/qs_adm1_region.shp

ogr2ogr -f “KML" -where “qs_adm0=’Finland’ and qs_level=’adm1_region’" ~/Downloads/xxx.kml ~/Downloads/qs_adm1_region/qs_adm1_region.shp

ogr2ogr -f “KML" ~/Downloads/all.kml ~/Downloads/qs_adm1_region/qs_adm1_region.shp
```
    

Notice the "where" query. It pulls out data from the XML file where the SimpleData tag matches your query:


```bash
<SimpleData name="qs_adm0_a3">BEL</SimpleData>
```
    

Render the data with with [Python](http://gis.stackexchange.com/questions/61862/visualize-shapefile-in-python), [TileMill](http://mapbox.com/tilemill/), or [QuantumGis](http://www.qgis.org/)

