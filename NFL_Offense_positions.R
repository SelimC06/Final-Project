library(readxl)
library(tidyverse)
library(scales)
NFL_Offense_plot <- read_excel("NFL4.xlsx")
NFL_Offense_plot$Position = factor(NFL_Offense_plot$Position, levels = c("QB", "C", "WR", "TE", "RB"))
NFL_Offense_plot <- NFL_Offense_plot |>
  ggplot(aes(x = Year, y = `Average Salary`, color = Position)) + 
  geom_line(size = 2) + geom_point(alpha = 0.7, size =3, color = "Black") +
  scale_y_continuous(labels=scales::dollar_format()) + 
  labs(title = "Average Salary of Offensive Players",
       y = "Salary", fill = "Position",
       caption = "Source: Sportrac")

write_rds(NFL_Offense_plot, "NFL_Offense_plot.rds")
