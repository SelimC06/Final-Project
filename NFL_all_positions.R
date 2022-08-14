library(readxl)
library(tidyverse)
library(scales)
NFL_plot <- read_excel("NFL2.xlsx")
NFL_plot$Position = factor(NFL_plot$Position, levels = c("OFFENSE", "DEFENSE", "SPECIAL_TEAMS"))
NFL_plot <- NFL_plot |>
  ggplot(aes(x = Year, y = `Average Salary`, color = Position)) + 
  geom_line(size = 2) + geom_point(alpha = 0.7, size =3, color = "Black") +
  scale_y_continuous(labels=scales::dollar_format()) + 
  labs(title = "Average Salary by Category",
       subtitle = "Over years the average salary has been increasing for all Categories",
       y = "Salary", fill = "Position",
       caption = "Source: Sportrac")
  
write_rds(NFL_plot, "NFL_plot.rds")
         