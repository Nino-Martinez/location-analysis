dir()

erie_parcels <- st_read("erie_tax_parcels.shp")


municipalities <- st_read("WNY_municipalities.shp")
buffalo <- municipalities %>% filter(NAME == "Buffalo")

st_crs(erie_transform)
st_crs(buffalo_transform)

buffalo_transform <- buffalo %>% st_transform("+proj=tmerc +lat_0=40 +lon_0=-78.58333333333333 +k=0.9999375 +x_0=350000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs")
erie_transform <- erie_parcels %>% st_transform("+proj=tmerc +lat_0=40 +lon_0=-78.58333333333333 +k=0.9999375 +x_0=350000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs")

buffalo_parcels <- st_intersection(buffalo_transform, erie_transform)

tm_shape(buffalo_parcels) + tm_polygons()
