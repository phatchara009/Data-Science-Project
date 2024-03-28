install.packages("rvest")
library(rvest)

web <- read_html("https://medium.com/skooldio")

web %>%
  html_node("h1") %>%
  html_text()

web %>%
  html_nodes("h2") %>%
  html_text()

web %>%
  html_nodes("h3") %>%
  html_text()