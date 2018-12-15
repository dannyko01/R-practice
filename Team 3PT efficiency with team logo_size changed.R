library(ggplot2)
library(ggimage)

ggplot(NBA_Team_season_1718v2, aes(x=ThPA, y=ThPPc)) + #import data, setting X and Y axis. But seems header can't be like "3PA" and "3P%"?
  geom_hline(aes(yintercept=mean(ThPPc))) +
  geom_vline(aes(xintercept=mean(ThPA))) +
  geom_image(aes(image=Teamlogo), size=I(NBA_Team_season_1718v2$WLPc/10)) +
  theme_minimal() + 
  labs(subtitle="3PA VS 3P%", #set up labs
       y="3P%", 
       x="3PTA", 
       title="3PT Efficiency", 
       caption = "Source: Basketball-Reference.com")