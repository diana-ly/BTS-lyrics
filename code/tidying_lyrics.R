# Tidying the lyrics

library(dplyr)
library(tibble)
library(tidytext)
library(tidyr)
library(readr)


bts_songs_df <- read_csv("./data/raw_data/raw_BTS_songs.csv")

sum(duplicated(bts_songs_df$song_title))
table(bts_songs_df$song_title)

# Removing duplicate songs.
tidy_bts_songs_df <- bts_songs_df %>%
  distinct(song_title, .keep_all=TRUE)

# Tokenizing each lyric
tidy_bts_songs_df <- tidy_bts_songs_df %>%
  unnest_tokens(word, song_lyrics)

# Marking whether the lyric word is English
for (i in seq(tidy_bts_songs_df$word)) {
  if (grepl("[[:alpha:]]", tidy_bts_songs_df$word[i])) {
    tidy_bts_songs_df$eng[i] <- 1
  } else {
    tidy_bts_songs_df$eng[i] <- 0
  }
}

write.csv(tidy_bts_songs_df, "data/tidy_data/tidy_BTS_songs.csv", row.names=FALSE, col.names=TRUE)
