# fruit data plots December 2019

setwd("~/caicedo/tomato_fruit_traits")

# use pacman to load packages
#install.packages("pacman", repos="https://cloud.r-project.org")
pacman::p_load(ggplot2, ggrepel, dplyr, update = F)

#################################
# create a function to calculate the number of observations per species
give.n <- function(x){
  return(c(y = median(x)*0.1, label = length(x)))
}
#################################


################# start seeds per fruit #################
# import spreadsheet with max 5 spf values per replicate
data_spf_max5 <- read.csv("seeds_per_fruit_farm_max5_sep22.csv", header=T, stringsAsFactors = F)
# check to see if the numbers were imported as numeric
str(data_spf_max5)
# remove rows with no diameter measurements
data_spf_max5_no_nas <- data_spf_max5[complete.cases(data_spf_max5), ]
# add a column with seeds_per_fruit / diameter ratio
data_spf_max5_no_nas$spf_diam_ratio <- as.numeric(data_spf_max5_no_nas$seeds_per_fruit / data_spf_max5_no_nas$diameter_mm)

# plot the data by accession - seeds per fruit
data_spf_max5 %>%
  dplyr::mutate(accession = factor(accession,
                                   levels = c("SPE-21","SPE-20","SPE-19","SPE-16",
                                              "SH-12","SH-10","SH-5","SH-1",
                                              "SPV-11","SPV-9","SPV-4","SPV-2",
                                              "SN-16","SN-8","SN-6","SN-2",
                                              "SCM-11","SCM-9","SCM-3","SCM-1",
                                              "SPM-B61","SPM-B53","SPM-10","SPM-1",
                                              "SLC-B89","SLC-B59","SLC-B01","SLC-10",
                                              "SL-SAK","SL-B62",
                                              "SG-30","SG-29","SG-23","SG-15",
                                              "SC-42","SC-31","SC-22","SC-19"))) %>%
  
  ggplot(aes(x=accession, y=seeds_per_fruit)) + 
  geom_boxplot() +
  geom_jitter(aes(color=species, shape=bed), size = 1.9) +
  scale_shape_manual(values=c(16,9)) +
  stat_summary(fun.data = give.n, geom = "text", fun.y = median, 
               position = position_nudge(x=0, y=0)) +
  coord_flip() +
  # remove the legend from the side
  theme(legend.position="none") +
  # align the caption to the left side of the graph with hjust = 0
  theme(plot.caption = element_text(hjust =0)) +
  labs(caption = "Seeds per fruit for South Deerfield farm tomatoes collected summer 2019. 
          Colored points represent individual fruits;
              circle = north bed replicate, diamond = south bed replicate.
          Numbers to the left of the boxplots are total fruits measured per accession.
          Each accession had either 1 or 2 replicates (north or south bed).
          This data set limited to max. 5 fruits per replicate. 
          Updated 14 Dec 2019")
################## end seeds per fruit #####################


################# start diameter ##################
#import spreadsheet with the most diameter measurements
data_spf_all <- read.csv("seeds_per_fruit_farm_sep22.csv", header=T, stringsAsFactors = F)
# check to see if the numbers were imported as numeric
str(data_spf_all)
# create a function to remove NAs from one column only
completeFun <- function(data, desiredCols) {
  completeVec <- complete.cases(data[, desiredCols])
  return(data[completeVec, ])
}
# remove NAs in diameter_mm column only
data_spf_diam_only <- completeFun(data_spf_all, "diameter_mm")
# add a column with diameter/height ratio
data_spf_diam_only$diam_height_ratio <- as.numeric(data_spf_diam_only$diameter_mm / data_spf_diam_only$height_mm)

# plot the data by accession - diameter
data_spf_diam_only %>%
  dplyr::mutate(accession = factor(accession,
                                   levels = c("SPE-21","SPE-20","SPE-19","SPE-16",
                                              "SH-12","SH-10","SH-5","SH-1",
                                              "SPV-11","SPV-9","SPV-4","SPV-2",
                                              "SN-16","SN-8","SN-6","SN-2",
                                              "SCM-11","SCM-9","SCM-3","SCM-1",
                                              "SPM-B61","SPM-B53","SPM-10","SPM-1",
                                              "SLC-B89","SLC-B59","SLC-B01","SLC-10",
                                              "SL-SAK","SL-B62",
                                              "SG-30","SG-29","SG-23","SG-15",
                                              "SC-42","SC-31","SC-22","SC-19"))) %>%
  
  ggplot(aes(x=accession, y=diameter_mm)) + 
  geom_boxplot() +
  geom_jitter(aes(color=species, shape=bed), size = 1.9) +
  scale_shape_manual(values=c(16,9)) +
  stat_summary(fun.data = give.n, geom = "text", fun.y = median, 
               position = position_nudge(x=0, y=5)) +
  coord_flip() +
  # remove the legend from the side
  theme(legend.position="none") +
  # align the caption to the left side of the graph with hjust = 0
  theme(plot.caption = element_text(hjust =0)) +
  labs(caption = "Diameter (mm) for South Deerfield farm tomatoes collected summer 2019. 
          Colored points represent individual fruits;
              circle = north bed replicate, diamond = south bed replicate.
          Numbers to the left of the boxplots are total fruits measured per accession.
          Each accession had either 1 or 2 replicates (north or south bed).
          This data set includes all fruits measured. 
          Updated 15 Dec 2019")
##################### end diameter ##################

############ start diameter / height ratio ###########
# plot the data by accession - diameter / height ratio
data_spf_diam_only %>%
  dplyr::mutate(accession = factor(accession,
                                   levels = c("SPE-21","SPE-20","SPE-19","SPE-16",
                                              "SH-12","SH-10","SH-5","SH-1",
                                              "SPV-11","SPV-9","SPV-4","SPV-2",
                                              "SN-16","SN-8","SN-6","SN-2",
                                              "SCM-11","SCM-9","SCM-3","SCM-1",
                                              "SPM-B61","SPM-B53","SPM-10","SPM-1",
                                              "SLC-B89","SLC-B59","SLC-B01","SLC-10",
                                              "SL-SAK","SL-B62",
                                              "SG-30","SG-29","SG-23","SG-15",
                                              "SC-42","SC-31","SC-22","SC-19"))) %>%
  
  ggplot(aes(x=accession, y=diam_height_ratio)) + 
  geom_boxplot() +
  geom_jitter(aes(color=species, shape=bed), size = 1.9) +
  scale_shape_manual(values=c(16,9)) +
  stat_summary(fun.data = give.n, geom = "text", fun.y = median, 
               position = position_nudge(x=0, y=0.55)) +
  coord_flip() +
  # remove the legend from the side
  theme(legend.position="none") +
  # align the caption to the left side of the graph with hjust = 0
  theme(plot.caption = element_text(hjust =0)) +
  labs(caption = "Diameter / height ratio for South Deerfield farm tomatoes collected summer 2019. 
          Colored points represent individual fruits;
              circle = north bed replicate, diamond = south bed replicate.
          Numbers to the left of the boxplots are total fruits measured per accession.
          Each accession had either 1 or 2 replicates (north or south bed).
          This data set includes all fruits measured. 
          Updated 15 Dec 2019")


############# start % water content ##################
data_wc <- read.csv("water_content_farm_sep22.csv", header=T, stringsAsFactors = F)
# check to see if the numbers were imported as numeric
str(data_wc)
# convert columns from character to numeric
# data_wc$water_content_percent <- as.numeric(data_wc$water_content_percent)

# plot the data by accession - % water content
data_wc %>%
  dplyr::mutate(accession = factor(accession,
                                   levels = c("SPE-21","SPE-20","SPE-19","SPE-16",
                                              "SH-12","SH-10","SH-5","SH-1",
                                              "SPV-11","SPV-9","SPV-4","SPV-2",
                                              "SN-16","SN-8","SN-6","SN-2",
                                              "SCM-11","SCM-9","SCM-3","SCM-1",
                                              "SPM-B61","SPM-B53","SPM-10","SPM-1",
                                              "SLC-B89","SLC-B59","SLC-B01","SLC-10",
                                              "SL-SAK","SL-B62",
                                              "SG-30","SG-29","SG-23","SG-15",
                                              "SC-42","SC-31","SC-22","SC-19"))) %>%
  
  ggplot(aes(x=accession, y=water_content_percent)) + 
  geom_boxplot() +
  geom_jitter(aes(color=species, shape=bed), size = 1.9) +
  scale_shape_manual(values=c(16,9)) +
  stat_summary(fun.data = give.n, geom = "text", fun.y = median, 
               position = position_nudge(x=0, y=72)) +
  coord_flip() +
  # remove the legend from the side
  theme(legend.position="none") +
  # align the caption to the left side of the graph with hjust = 0
  theme(plot.caption = element_text(hjust =0)) +
  labs(caption = "Percent water content for South Deerfield farm tomatoes collected summer 2019. 
          Colored points represent individual fruits;
              circle = north bed replicate, diamond = south bed replicate.
          Numbers to the left of the boxplots are total fruits measured per accession.
          Each accession had either 1 or 2 replicates (north or south bed).
          This data set limited to max. 3 fruits per replicate. 
          Updated 14 Dec 2019")
######################### end % water content ##################

#################### start fresh weight ###########
# plot the data by accession - fresh weight - all species
data_wc %>%
  dplyr::mutate(accession = factor(accession,
                                   levels = c("SPE-21","SPE-20","SPE-19","SPE-16",
                                              "SH-12","SH-10","SH-5","SH-1",
                                              "SPV-11","SPV-9","SPV-4","SPV-2",
                                              "SN-16","SN-8","SN-6","SN-2",
                                              "SCM-11","SCM-9","SCM-3","SCM-1",
                                              "SPM-B61","SPM-B53","SPM-10","SPM-1",
                                              "SLC-B89","SLC-B59","SLC-B01","SLC-10",
                                              "SL-SAK","SL-B62",
                                              "SG-30","SG-29","SG-23","SG-15",
                                              "SC-42","SC-31","SC-22","SC-19"))) %>%
  
  ggplot(aes(x=accession, y=fresh_weight_g)) + 
  geom_boxplot() +
  geom_jitter(aes(color=species, shape=bed), size = 1.9) +
  scale_shape_manual(values=c(16,9)) +
  stat_summary(fun.data = give.n, geom = "text", fun.y = median, 
               position = position_nudge(x=0, y=0)) +
  coord_flip() +
  # remove the legend from the side
  theme(legend.position="none") +
  # align the caption to the left side of the graph with hjust = 0
  theme(plot.caption = element_text(hjust =0)) +
  labs(caption = "Fresh weight in grams for South Deerfield farm tomatoes collected summer 2019. 
          Colored points represent individual fruits;
              circle = north bed replicate, diamond = south bed replicate.
          Numbers to the left of the boxplots are total fruits measured per accession.
          Each accession had either 1 or 2 replicates (north or south bed).
          This data set limited to max. 3 fruits per replicate. 
          Updated 14 Dec 2019")


# plot the data by accession - fresh weight - remove cultivated tomatoes
# remove cultivated tomatoes
data_wc_no_sl <- data_wc[data_wc$species!="SL", ]

data_wc_no_sl %>%
  dplyr::mutate(accession = factor(accession,
                                   levels = c("SPE-21","SPE-20","SPE-19","SPE-16",
                                              "SH-12","SH-10","SH-5","SH-1",
                                              "SPV-11","SPV-9","SPV-4","SPV-2",
                                              "SN-16","SN-8","SN-6","SN-2",
                                              "SCM-11","SCM-9","SCM-3","SCM-1",
                                              "SPM-B61","SPM-B53","SPM-10","SPM-1",
                                              "SLC-B89","SLC-B59","SLC-B01","SLC-10",
                                              "SG-30","SG-29","SG-23","SG-15",
                                              "SC-42","SC-31","SC-22","SC-19"))) %>%
  
  ggplot(aes(x=accession, y=fresh_weight_g)) + 
  geom_boxplot() +
  geom_jitter(aes(color=species, shape=bed), size = 1.9) +
  scale_shape_manual(values=c(16,9)) +
  stat_summary(fun.data = give.n, geom = "text", fun.y = median, 
               position = position_nudge(x=0, y=0)) +
  coord_flip() +
  # remove the legend from the side
  theme(legend.position="none") +
  # align the caption to the left side of the graph with hjust = 0
  theme(plot.caption = element_text(hjust =0)) +
  labs(caption = "Fresh weight in grams for South Deerfield farm tomatoes collected summer 2019. 
          Colored points represent individual fruits;
              circle = north bed replicate, diamond = south bed replicate.
          Numbers to the left of the boxplots are total fruits measured per accession.
          Each accession had either 1 or 2 replicates (north or south bed).
          This data set limited to max. 3 fruits per replicate. 
          Cultivated tomatoes were removed for this plot due to their high fresh weights.
          Updated 15 Dec 2019")
################### end fresh weight #################3
