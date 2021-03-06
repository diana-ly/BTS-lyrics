library(dplyr)
library(tibble)
library(tidytext)
library(ggplot2)
library(scales)
library(tidyr)
library(readr)


tidy_bts_songs_df <- read_csv("data/tidy_data/tidy_BTS_songs.csv")

tidy_bts_songs_freq <- tidy_bts_songs_df %>%
  filter(eng==1) %>%
  count(album_title, word) %>%
  group_by(album_title) %>%
  mutate(proportion = n/sum(n))


tidy_bts_songs_freq %>%
  ggplot(aes(x = proportion, y = proportion)) +
  geom_text(aes(label = word), check_overlap = TRUE, vjust = 0.5) +
  geom_abline(color = "gray40", lty = 2) +
  geom_jitter(aes(color="FE769C"), alpha = 0.2, size = 2.5, width = 0.6, height = 0.6,
              show.legend = F) +
  scale_x_log10(labels = percent_format()) +
  scale_y_log10(labels = percent_format()) +
  ggtitle("All English Words in All BTS's Albums")


# Filtering out stop words to extract more meaningful English words
custom_stop_words <- bind_rows(tibble(word = c("ay", "ayy", "la", "i'm", "uh", "na", "ji",
                                               "i'll", "yeah", "hey", "ap", "wo", "jh", "su"),
                                      lexicon = c("custom")),
                               stop_words)


tidy_bts_songs_meaningful_freq <- tidy_bts_songs_df %>%
  filter(eng==1) %>%
  mutate(word = gsub("\u2019", "'", word)) %>%
  anti_join(custom_stop_words) %>%
  count(album_title, word) %>%
  group_by(album_title) %>%
  mutate(proportion = n/sum(n))


tidy_bts_songs_meaningful_freq %>%
  ggplot(aes(x = proportion, y = proportion)) +
  geom_text(aes(label = word), check_overlap = TRUE, vjust = 0.5) +
  geom_abline(color = "gray40", lty = 2) +
  geom_jitter(aes(color="FE769C"), alpha = 0.2, size = 2.5, width = 0.6, height = 0.6,
              show.legend = F) +
  scale_x_log10(labels = percent_format()) +
  scale_y_log10(labels = percent_format()) +
  ggtitle("Meaningful English Words in All BTS's Albums")


tidy_bts_songs_meaningful_freq %>%
  ggplot(aes(x = proportion, y = proportion)) +
  geom_text(aes(label = word), check_overlap = TRUE, vjust = 0.5) +
  geom_abline(color = "gray40", lty = 2) +
  geom_jitter(aes(color="FE769C"), alpha = 0.5, size = 2.5, width = 0.7, height = 0.7,
              show.legend = F) +
  scale_x_log10(labels = percent_format()) +
  scale_y_log10(labels = percent_format()) +
  facet_wrap(~ album_title, nrow=4) +
  ggtitle("Comparison of All Album's Meaningful English Words")
