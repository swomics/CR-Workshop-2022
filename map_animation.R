library(ggmap)
library(gganimate)
library(gifski)


Points <- data.frame(ID=c("Liverpool","Costa Rica"),lon=c(53.4121774,9.9355152),lat=c(-2.9160587,-84.2567069))

lons <- seq(from = 53.4121774, to = 9.9355152, length.out = 50)
lats <- seq(from = -2.9160587, to = -84.2567069, length.out = 50)
df2 <- data.frame(lons=lons, lats=lats)
df2$time <- as.numeric(row.names(df2))

mapImage <- get_stamenmap(bbox = c(left = -110, bottom = 0, right = 31,top = 60), zoom = 4, maptype = c("watercolor"),force=T)


p <- ggmap(mapImage) + geom_point(data=df2,aes(y=lons,x=lats),col="darkred",size=6) + theme_bw()

q <- p + transition_time(df2$time) + shadow_wake(wake_length = 0.2, alpha = FALSE)

anim_save("map.gif", q)
