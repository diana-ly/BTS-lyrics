# Tidying the lyrics and indicating whether the lyric is English

library(magrittr)
library(dplyr)
library(tibble)
library(tidytext)
library(tidyr)
library(readr)



bts_songs_df <- read_csv("./data/raw_data/raw_BTS_songs.csv")

tidy_bts_songs_df <- bts_songs_df %>%
  unnest_tokens(word, word) %>%
  anti_join(stop_words)


for (i in 1:length(tidy_bts_songs_df$word)) {
  if (grepl("[[:alpha:]]", tidy_bts_songs_df$word[i])) {
    tidy_bts_songs_df$eng[i] <- 1
  } else {
    tidy_bts_songs_df$eng[i] <- 0
  }
}


write.csv(tidy_bts_songs_df, "data/tidy_data/tidy_BTS_songs.csv", row.names=FALSE, col.names=TRUE)
