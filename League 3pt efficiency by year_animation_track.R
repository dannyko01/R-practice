library(gapminder)
library(ggplot2)
library(gganimate)

Year_with_three <- NBA_League_Avg_Stats[NBA_League_Avg_Stats$ThPA > 0,]
Year_with_three_B <- Year_with_three[1:40,]
ThPA_Pc <- c(Year_with_three_B$ThPA / Year_with_three_B$FGA)

p <- ggplot(Year_with_three_B, aes(ThPA_Pc, ThPPc, size = PTS)) +
  geom_point(alpha = 0.9, aes(color = "red")) +
  scale_x_continuous(limits = c(0, 0.4), label = c("0%", "10%", "20%", "30%", "40%")) +
  scale_y_continuous(limits = c(0, 0.4), label = c("0%", "10%", "20%", "30%", "40%")) +
  theme_minimal() +
  labs(title = "League 3PT Efficiency by Year: {frame_time}", 
       subtitle= "The trend of usage and capability of shooting 3-pointer",
       x = "3PT / FG Attempt", 
       y = "3PT%", 
       caption = "Source: Basketball-Reference.com",
       size = "Points Per Game") +
  guides(color=FALSE) +
  transition_time(Year_with_three_B$SeasonB) +
  shadow_mark(colour = 'red', size = 1) +
  ease_aes("linear")

anim <- animate(p, nframes = 44, fps = 2, end_pause = 4)
anim

anim_save("animation test 4.gif", anim)
