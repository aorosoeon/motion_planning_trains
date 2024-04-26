raster2pgsql -I -C -M output_USGS30m.tif -F -t 100x100 -s 4269 public.elevation > elev.sql
psql -U postgres -d dem_ontario_quebec -f elev.sql