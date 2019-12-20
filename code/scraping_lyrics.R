library(rvest)
library(dplyr)
library(stringr)

source("./code/functions.r")

read_page <- read_html('https://colorcodedlyrics.com/2014/01/bts-lyrics-index')

# capturing the URLs
all_href <- read_page %>%
  html_nodes("a") %>%
  html_attr("href")

korean_songs <- all_href[35:200]
korean_songs <- korean_songs[!is.na(korean_songs)]

# capturing text of each album
album_info <- read_page %>%
  html_nodes("td") %>%
  html_text()

album_info <- gsub('\n', ' ', album_info)
album_titles <- str_extract(album_info, "(?<=]\\s)(.*?)(?=\\sRelease)")
release_dates <- str_extract(album_info, "\\d{4}.\\d{2}.\\d{2}")

# capturing song titles
song_titles <- read_page %>%
  html_nodes("a") %>%
  html_text()

song_titles <- song_titles[35:200]
song_titles <- song_titles[song_titles != ""]


bts_songs_df <- tibble('url' = korean_songs,
                       'song_title' = song_titles,
                       'album_title' = NA,
                       'release_date' = NA)


dark_and_wild <- 1:14
bts_songs_df$album_title[1:14] <- album_titles[1]
bts_songs_df$release_date[1:14] <- release_dates[1]

young_forever_songs <- 15:31
bts_songs_df$album_title[15:31] <- album_titles[2]
bts_songs_df$release_date[15:31] <- release_dates[2]

wings_songs <- 32:46
bts_songs_df$album_title[32:46] <- album_titles[4]
bts_songs_df$release_date[32:46] <- release_dates[4]

ynwa_songs <- 47:64
bts_songs_df$album_title[47:64] <- album_titles[5]
bts_songs_df$release_date[47:64] <- release_dates[5]

ly_tear_songs <- 65:75
bts_songs_df$album_title[65:75] <- album_titles[6]
bts_songs_df$release_date[65:75] <- release_dates[6]

ly_answer_songs <- 76:98
bts_songs_df$album_title[76:98] <- album_titles[7]
bts_songs_df$release_date[76:98] <- release_dates[7]

orul82_songs <- 99:107
bts_songs_df$album_title[99:107] <- album_titles[9]
bts_songs_df$release_date[99:107] <- release_dates[9]

skool_luv_songs <- 108:116
bts_songs_df$album_title[108:116] <- album_titles[10]
bts_songs_df$release_date[108:116] <- release_dates[10]

mbm_pt1_songs <- 117:124
bts_songs_df$album_title[117:124] <- album_titles[11]
bts_songs_df$release_date[117:124] <- release_dates[11]

mbm_pt2_songs <- 125:132
bts_songs_df$album_title[125:132] <- album_titles[12]
bts_songs_df$release_date[125:132] <- release_dates[12]

ly_her_songs <- 133:141
bts_songs_df$album_title[133:141] <- album_titles[13]
bts_songs_df$release_date[133:141] <- release_dates[13]

map_of_soup_songs <- 142:149
bts_songs_df$album_title[142:149] <- album_titles[14]
bts_songs_df$release_date[142:149] <- release_dates[14]

skool_luv_add_songs <- 150:159
bts_songs_df$album_title[150:159] <- album_titles[15]
bts_songs_df$release_date[150:159] <- release_dates[15]

cool4skool_songs <- 160:162
bts_songs_df$album_title[160:162] <- album_titles[16]
bts_songs_df$release_date[160:162] <- release_dates[16]

lyrics_title_df <- tibble('song_lyrics'=NA)

for (i in 1:nrow(bts_songs_df)) {
  song_url <- read_html(bts_songs_df$url[i])
  song_lyrics <- song_url %>%
    html_nodes("td:nth-child(2)") %>%
    html_text_collapse()
  song_lyrics <- gsub("\n", "  ", song_lyrics[3])
  temp_df <- tibble('song_lyrics'=song_lyrics)
  lyrics_title_df <- rbind(lyrics_title_df, temp_df)
}

lyrics_title_df <- lyrics_title_df[!is.na(lyrics_title_df$song_lyrics), ]

bts_songs_df <- add_column(bts_songs_df, 'song_lyrics' = lyrics_title_df$song_lyrics)

write.csv(bts_songs_df, "data/raw_data/raw_BTS_songs.csv", row.names=FALSE, col.names=TRUE)
