library(magrittr)
library(dplyr)
library(tibble)
library(tidytext)
library(ggplot2)
library(scales)
library(tidyr)


tidy_bts_songs_df <- read_csv("data/tidy_data/tidy_BTS_songs.csv")

tidy_bts_songs_freq <- tidy_bts_songs_df %>%
  filter(eng==1) %>%
  count(word, sort = TRUE) %>%
  mutate(proportion = n/sum(n))


tidy_bts_songs_freq %>%
  ggplot(aes(x = proportion, y = proportion)) +
  geom_jitter(color = "#FE769C", alpha = 0.4, size = 2.5, width = 0.5, height = 0.5) +
  geom_text(aes(label = word), check_overlap = TRUE, vjust = 0.5) +
  scale_x_log10(labels = percent_format()) +
  scale_y_log10(labels = percent_format()) +
  scale_color_gradient(limits = c(0, 0.001), low = "#c9bbbf", high = "#FE769C") +
  ggtitle("English Words in All BTS's Albums")

