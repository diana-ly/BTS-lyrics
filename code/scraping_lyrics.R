library(rvest)
library(magrittr)
library(dplyr)
library(xml2)
library(tibble)
library(stringr)
library(ggplot2)
library(tidyr)
library(curl)


source("./code/functions.r")

# Dark & Wild

dark_wild_songs <- tibble('url'= c("https://colorcodedlyrics.com/2014/08/bts-bangtansonyeondan-intro-what-am-i-to-you",
                     "https://colorcodedlyrics.com/2014/08/bts-bangtansonyeondan-danger",
                     "https://colorcodedlyrics.com/2014/08/bts-bangtansonyeondan-hormone-war-holeumonjeonjaeng",
                     "https://colorcodedlyrics.com/2014/08/bts-bangtansonyeondan-hip-hop-lover-hibhabseongaeja",
                     "https://colorcodedlyrics.com/2014/08/bts-let-me-know",
                     "https://colorcodedlyrics.com/2014/08/bts-bangtansonyeondan-rain",
                     "https://colorcodedlyrics.com/2015/06/bts-bangtansonyeondan-bts-cypher-pt-3-killer-ft-supreme-boi",
                     "https://colorcodedlyrics.com/2014/08/bts-bangtansonyeondan-interlude-what-are-you-doing-interlude-mwohae",
                     "https://colorcodedlyrics.com/2014/08/bts-bangtansonyeondan-can-you-turn-off-your-phone-haendeupon-jom-ggeojullae",
                     "https://colorcodedlyrics.com/2015/02/bts-bangtansonyeondan-blanket-kick-ibulkig",
                     "https://colorcodedlyrics.com/2015/06/bts-bangtansonyeondan-24-7-heaven",
                     "https://colorcodedlyrics.com/2015/11/bts-bangtansonyeondan-look-here-yeogi-bwa",
                     "https://colorcodedlyrics.com/2015/06/bts-bangtansonyeondan-second-grade-2hagnyeon",
                     "https://colorcodedlyrics.com/2014/08/bts-bangtansonyeondan-outro-does-that-make-sense-outro-geuge-mali-dwae")
)

dark_wild_songs <- add_column(dark_wild_songs, 'album_title'='DARK & WILD',
                              'release_date'=gsub("\\.", "\\/", '2014.08.20'))


# The Most Beautiful Moment In Life - Young Forever

young_forever_songs <- tibble('url'=c("https://colorcodedlyrics.com/2015/06/bts-bangtansonyeondan-intro-in-the-mood-for-love-hwayangyeonhwa",
                         "https://colorcodedlyrics.com/2015/04/bts-bangtansonyeondan-i-need-u",
                         "https://colorcodedlyrics.com/2015/06/bts-bangtansonyeondan-hold-me-tight-jabajwo",
                         "https://colorcodedlyrics.com/2015/11/bts-bangtansonyeondan-dead-leaf-goyeob",
                         "https://colorcodedlyrics.com/2015/11/bts-bangtansonyeondan-butterfly",
                         "https://colorcodedlyrics.com/2015/11/bts-bangtansonyeondan-run",
                         "https://colorcodedlyrics.com/2015/11/bts-bangtansonyeondan-ma-city",
                         "https://colorcodedlyrics.com/2015/11/bts-bangtansonyeondan-crow-tit-try-hard-baebsae",
                         "https://colorcodedlyrics.com/2015/06/bts-bangtansonyeondan-sick-jjeoleo",
                         "https://colorcodedlyrics.com/2016/05/bts-bangtansonyeondan-fire-bultaoreune",
                         "https://colorcodedlyrics.com/2016/05/bts-bangtansonyeondan-save-me-28",
                         "https://colorcodedlyrics.com/2016/04/bts-bangtansonyeondan-epilogue-young-forever",
                         "https://colorcodedlyrics.com/2015/09/bts-bangtansonyeondan-converse-high",
                         "https://colorcodedlyrics.com/2015/06/bts-bangtansonyeondan-isa-move",
                         "https://colorcodedlyrics.com/2015/11/bts-bangtansonyeondan-whalien-52",
                         "https://colorcodedlyrics.com/2015/11/bts-bangtansonyeondan-butterfly",
                         "https://colorcodedlyrics.com/2015/11/bts-bangtansonyeondan-outro-house-of-cards")
)

young_forever_songs <- add_column(young_forever_songs, 'album_title'='화양연화 (The Most Beautiful Moment In Life) Young Forever',
                                  'release_date'=gsub("\\.", "\\/", "2016.05.02"))


# Wings
wings_songs <- tibble('url'=c("https://colorcodedlyrics.com/2016/10/bts-bangtansonyeondan-intro-boy-meets-evil",
                 "https://colorcodedlyrics.com/2016/10/bts-blood-sweat-tears-pi-ttam-nunmul",
                 "https://colorcodedlyrics.com/2016/10/bts-bangtansonyeondan-begin",
                 "https://colorcodedlyrics.com/2016/10/bts-bangtansonyeondan-lie",
                 "https://colorcodedlyrics.com/2016/10/bts-bangtansonyeondan-stigma",
                 "https://colorcodedlyrics.com/2016/10/bts-bangtansonyeondan-first-love",
                 "https://colorcodedlyrics.com/2016/10/bts-bangtansonyeondan-reflection",
                 "https://colorcodedlyrics.com/2016/10/bts-bangtansonyeondan-mama",
                 "https://colorcodedlyrics.com/2016/10/bts-bangtansonyeondan-awake",
                 "https://colorcodedlyrics.com/2016/10/bts-bangtansonyeondan-lost",
                 "https://colorcodedlyrics.com/2016/10/bts-bangtansonyeondan-bts-cypher-pt-4",
                 "https://colorcodedlyrics.com/2016/10/bts-bangtansonyeondan-wrong",
                 "https://colorcodedlyrics.com/2016/10/bts-bangtansonyeondan-21st-century-girls-21segi-sonyeo",
                 "https://colorcodedlyrics.com/2016/10/bts-bangtansonyeondan-two-three-hoping-good-days-dul-ses-geulaedo-joheun-nali-deo-manhgileul",
                 "https://colorcodedlyrics.com/2016/10/bts-bangtansonyeondan-interlude-wings")
)

wings_songs <- add_column(wings_songs, 'album_title'='WINGS',
                          'release_date'=gsub("\\.", "\\/", "2016.10.10"))

# You Never Walk Alone
ynwa_songs <- tibble('url'=c("https://colorcodedlyrics.com/2016/10/bts-bangtansonyeondan-intro-boy-meets-evil",
                "https://colorcodedlyrics.com/2016/10/bts-blood-sweat-tears-pi-ttam-nunmul",
                "https://colorcodedlyrics.com/2016/10/bts-bangtansonyeondan-begin",
                "https://colorcodedlyrics.com/2016/10/bts-bangtansonyeondan-lie",
                "https://colorcodedlyrics.com/2016/10/bts-bangtansonyeondan-stigma",
                "https://colorcodedlyrics.com/2016/10/bts-bangtansonyeondan-first-love",
                "https://colorcodedlyrics.com/2016/10/bts-bangtansonyeondan-reflection",
                "https://colorcodedlyrics.com/2016/10/bts-bangtansonyeondan-mama",
                "https://colorcodedlyrics.com/2016/10/bts-bangtansonyeondan-awake",
                "https://colorcodedlyrics.com/2016/10/bts-bangtansonyeondan-lost",
                "https://colorcodedlyrics.com/2016/10/bts-bangtansonyeondan-bts-cypher-pt-4",
                "https://colorcodedlyrics.com/2016/10/bts-bangtansonyeondan-wrong",
                "https://colorcodedlyrics.com/2016/10/bts-bangtansonyeondan-21st-century-girls-21segi-sonyeo",
                "https://colorcodedlyrics.com/2016/10/bts-bangtansonyeondan-two-three-hoping-good-days-dul-ses-geulaedo-joheun-nali-deo-manhgileul",
                "https://colorcodedlyrics.com/2017/02/bts-bangtansonyeondan-spring-day-bomnal",
                "https://colorcodedlyrics.com/2017/02/bts-bangtansonyeondan-not-today",
                "https://colorcodedlyrics.com/2016/10/bts-bangtansonyeondan-interlude-wings",
                "https://colorcodedlyrics.com/2017/02/bts-bangtansonyeondan-supplementary-story-never-walk-alone")
)

ynwa_songs <- add_column(ynwa_songs, 'album_title'='YOU NEVER WALK ALONE',
                         'release_date'=gsub("\\.", "\\/", "2017.02.13"))

# Love Yourself - Tear

ly_tear_songs <- tibble('url'=c("https://colorcodedlyrics.com/2018/05/bts-bangtansonyeondan-intro-singularity",
                   "https://colorcodedlyrics.com/2018/05/bts-bangtansonyeondan-fake-love",
                   "https://colorcodedlyrics.com/2018/05/bts-bangtansonyeondan-truth-untold-jeonhaji-moshan-jinsim-feat-steve-aoki",
                   "https://colorcodedlyrics.com/2018/05/bts-bangtansonyeondan-134340",
                   "https://colorcodedlyrics.com/2018/05/bts-bangtansonyeondan-paradise-nagwon",
                   "https://colorcodedlyrics.com/2018/05/bts-bangtansonyeondan-love-maze",
                   "https://colorcodedlyrics.com/2018/05/bts-bangtansonyeondan-magic-shop",
                   "https://colorcodedlyrics.com/2018/05/bts-bangtansonyeondan-airplane-pt-2",
                   "https://colorcodedlyrics.com/2018/05/bts-bangtansonyeondan-anpanman",
                   "https://colorcodedlyrics.com/2018/05/bts-bangtansonyeondan-so-what",
                   "https://colorcodedlyrics.com/2018/05/bts-bangtansonyeondan-outro-tear")
)

ly_tear_songs <- add_column(ly_tear_songs, 'album_title'='LOVE YOURSELF 轉 \'Tear\'',
                            'release_date'=gsub("\\.", "\\/", "2018.05.18"))

# Love Yourself - Answer

ly_answer_songs <- tibble('url'=c("https://colorcodedlyrics.com/2018/04/bts-bangtansonyeondan-intro-euphoria",
                     "https://colorcodedlyrics.com/2018/08/bts-bangtansonyeondan-trivia-just-dance",
                     "https://colorcodedlyrics.com/2017/09/bts-bangtansonyeondan-intro-serendipity",
                     "https://colorcodedlyrics.com/2017/09/bts-bangtansonyeondan-dna",
                     "https://colorcodedlyrics.com/2017/09/bts-bangtansonyeondan-dimple-bojogae",
                     "https://colorcodedlyrics.com/2018/08/bts-bangtansonyeondan-trivia-love",
                     "https://colorcodedlyrics.com/2017/09/bts-bangtansonyeondan-outro",
                     "https://colorcodedlyrics.com/2018/05/bts-bangtansonyeondan-intro-singularity",
                     "https://colorcodedlyrics.com/2018/05/bts-bangtansonyeondan-fake-love",
                     "https://colorcodedlyrics.com/2018/05/bts-bangtansonyeondan-truth-untold-jeonhaji-moshan-jinsim-feat-steve-aoki",
                     "https://colorcodedlyrics.com/2018/08/bts-bangtansonyeondan-trivia-seesaw",
                     "https://colorcodedlyrics.com/2018/05/bts-bangtansonyeondan-outro-tear",
                     "https://colorcodedlyrics.com/2018/08/bts-bangtansonyeondan-epiphany",
                     "https://colorcodedlyrics.com/2018/08/bts-bangtansonyeondan-m-fine",
                     "https://colorcodedlyrics.com/2018/08/bts-bangtansonyeondan-idol",
                     "https://colorcodedlyrics.com/2018/08/bts-bangtansonyeondan-answer-love-myself",
                     "https://colorcodedlyrics.com/2018/05/bts-bangtansonyeondan-magic-shop",
                     "https://colorcodedlyrics.com/2017/09/bts-bangtansonyeondan-best-of-me",
                     "https://colorcodedlyrics.com/2018/05/bts-bangtansonyeondan-airplane-pt-2",
                     "https://colorcodedlyrics.com/2017/09/bts-bangtansonyeondan-go-go-gominboda-go",
                     "https://colorcodedlyrics.com/2018/05/bts-bangtansonyeondan-anpanman",
                     "https://colorcodedlyrics.com/2017/09/bts-bangtansonyeondan-mic-drop")
)

ly_answer_songs <- add_column(ly_answer_songs, 'album_title'='LOVE YOURSELF 結 \'Answer\'',
                              'release_date'=gsub("\\.", "\\/", "2018.08.24"))



bts_songs_df <- rbind(dark_wild_songs, ly_answer_songs, ly_tear_songs,
                        wings_songs, ynwa_songs, young_forever_songs)



lyrics_title_df <- tibble('song_lyrics'=NA,'song_title'=NA,'url'=NA)

for (i in 1:nrow(bts_songs_df)) {
  song_url <- read_html(bts_songs_df$url[i])
  song_lyrics <- song_url %>%
    html_nodes("td:nth-child(2)") %>%
    html_text_collapse()
  song_lyrics <- gsub("\n", "  ", song_lyrics[3])
  song_title <- song_url %>%
    html_nodes("tr td h2") %>%
    html_text()
  temp_df <- tibble('song_lyrics'=song_lyrics,'song_title'=song_title,'url'=bts_songs_df$url[i])
  lyrics_title_df <- rbind(lyrics_title_df, temp_df)
}


lyrics_title_df <- lyrics_title_df[!is.na(lyrics_title_df$song_lyrics), ]

bts_songs_df <- bts_songs_df %>%
  left_join(lyrics_title_df)

write.csv(bts_songs_df, "data/raw_data/raw_BTS_songs.csv", row.names=FALSE, col.names=TRUE)
