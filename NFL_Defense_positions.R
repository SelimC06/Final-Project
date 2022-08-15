library(readxl)
library(tidyverse)
library(scales)
NFL_Defense_plot <- read_excel("NFL3.xlsx")
NFL_Defense_plot$Position = factor(NFL_Defense_plot$Position, labels = c("Defensive End", "Free Safety", "Defensive Attack", "Strong Safety", "Cornerback") ,levels = c("DE", "FS", "DT", "SS", "CB"))
NFL_Defense_plot <- NFL_Defense_plot |>
  ggplot(aes(x = Year, y = `Average Salary`, color = Position)) + 
  geom_line(size = 2) + geom_point(alpha = 0.7,size =3, color = "Black") +
  scale_y_continuous(labels=scales::dollar_format()) +
  labs(title = "Average Salary of Defensive Players",
       y = "Salary", fill = "Position",
       caption = "Source: Sportrac")

write_rds(NFL_Defense_plot, "NFL_Defense_plot.rds")
