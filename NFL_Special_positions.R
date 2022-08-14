library(readxl)
library(tidyverse)
library(scales)
NFL_Special_plot <- read_excel("NFL5.xlsx")
NFL_Special_plot$Position = factor(NFL_Special_plot$Position, levels = c("K", "P", "LS"))
NFL_Special_plot <- NFL_Special_plot |>
  ggplot(aes(x = Year, y = `Average Salary`, color = Position)) + 
  geom_line(size = 2) + geom_point(alpha = 0.7, size =3, color = "Black") +
  scale_y_continuous(labels=scales::dollar_format()) + 
  labs(title = "Average Salary of Special Players",
       y = "Salary", fill = "Position",
       caption = "Source: Sportrac")

write_rds(NFL_Special_plot, "NFL_Special_plot.rds")
