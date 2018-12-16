library(ggmap)
library(gapminder)
library(ggplot2)
library(gganimate)

p <- qmplot(Lon, Lat, data = NBA_team_win_and_location_history_with_latlon, maptype = "terrain-background", extent = "device") +
  geom_image(aes(image=TeamLogoV), size=I(NBA_team_win_and_location_history_with_latlon$W/500)) +
  theme_minimal() + 
  labs(title="NBA Team Location and Wins History, Year: {frame_time}", 
       subtitle = "Size represents wins of that year", 
       caption = "Source: Basketball-Reference.com") +
  transition_time(NBA_team_win_and_location_history_with_latlon$Year) +
  ease_aes('linear')  

anim <- animate(p, nframes = 72, fps = 1, end_pause = 2)

anim

anim_save("NBA team location and wins history .gif", anim)
