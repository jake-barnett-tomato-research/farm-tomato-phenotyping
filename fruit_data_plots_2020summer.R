# exploratory plots of summer 2020 fruit size data

# setwd("~/caicedo/2020_summer_farm_data")

# use pacman to load packages
#install.packages("pacman", repos="https://cloud.r-project.org")
pacman::p_load(ggplot2, ggrepel, dplyr, update = F)

###
# create a function to calculate the number of observations per species
give.n <- function(x){
  return(c(y = median(x)*0.1, label = length(x)))
}
###

###
# create object with colors for each species minus SLY
default_colors_14_phylo = c(
                            "SPE"="#9590FF", 
                            "SH"="#39B600", 
                            "SCH"="#CFE11CFF", 
                            "SCR"="#00BCD8", 
                            "SPV"="#FF62B6",
                            "SHY"="#C99800", 
                            "SN"="#00B0F6", 
                            "SA"="seagreen4", 
                            "SCM"="#D89000", 
                            "SPM"="#E76BF3", 
                            "SLC"="#00BFC4",
                            "SL"="#00BF7D", 
                            "SG"="#A3A500", 
                            "SC"="#F8766D")
# create object with 2020 accessions listed in reverse phylogenetic order
acc_phylo_order <- c("SPE-21", "SPE-20", "SPE-16",
                         "SH-05", "SH-02", "SH-01",
                         "SCH-08", "SCH-06",
                         "SCR-09", "SCR-08", "SCR-07",
                         "SPV-09", "SPV-04", "SPV-02",
                         "SHY-03", "SHY-02", "SHY-01",
                         "SN-08", "SN-06", "SN-02",
                         "SA-18", "SA-09", "SA-05",
                         "SCM-11", "SCM-03", "SCM-01",
                         "SPM-B6", "SPM-B5", "SPM-01",
                         "SLC-B8", "SLC-B5", "SLC-10",
                         "SL-SK", "SL-GD", "SL-AC",
                         "SG-30", "SG-23", "SG-15",
                         "SC-31", "SC-22", "SC-19"
)

###

#### import data ====
# import csv file with 2020 size measurement only, with unripes removed
data_size <- read.csv("data_2020farm_size_only_unripes_removed.csv", header=T, stringsAsFactors = F)
# check to see if the numbers were imported as numeric
str(data_size)

# check the species names
unique(data_size$Species)
# fix issue with some SPE having an extra space
data_size$Species <- gsub(" ", "", data_size$Species)

# add a column for species-accession combined name
data_size$sp_ac <- paste(data_size$Species, data_size$Accession, sep = "-")
# check this new column
unique(data_size$sp_ac)


#### boxplot of diameter ====
# plot data by accession
diam_plot <- data_size %>%
  # order the accessions list phylogenetically
  dplyr::mutate(sp_ac = factor(sp_ac,
                                   levels = acc_phylo_order)) %>%
  
  ggplot(aes(x=sp_ac, y=Diameter_mm)) + 
  geom_boxplot() +
  geom_jitter(aes(color=Species, shape=Rep), size=2) +
  scale_shape_manual(values=c(16,9,8)) +
  scale_color_manual(values = default_colors_14_phylo) +
  stat_summary(fun.data = give.n, geom = "text", fun = median,
               position = position_nudge(x = 0, y = -0.2)) +
  coord_flip() +
  # remove the legend from the side
  theme(legend.position="none") +
  # align the caption to the left side of the graph with hjust = 0
  theme(plot.caption = element_text(hjust =0)) +
  labs(caption = "Colored points represent individual fruits; 
                    shapes represent different replicates (plants).
                  Numbers to left of boxplots are total fruits measured per accession. 
                  Updated 23 Oct 2020") +
  ggtitle("Diameter - summer 2020 data")

diam_plot


#### boxplot of diameter_height_ratio ====
# plot data by accession
diam_ht_plot <- data_size %>%
  # order the accessions list phylogenetically
  dplyr::mutate(sp_ac = factor(sp_ac,
                               levels = acc_phylo_order)) %>%
  
  ggplot(aes(x=sp_ac, y=Diam_hgt_ratio)) + 
  geom_boxplot() +
  geom_jitter(aes(color=Species, shape=Rep), size=2) +
  scale_shape_manual(values=c(16,9,8)) +
  scale_color_manual(values = default_colors_14_phylo) +
  stat_summary(fun.data = give.n, geom = "text", fun = median,
               position = position_nudge(x = 0, y = -0.2)) +
  #coord_cartesian(xlim = c(0.6, 1.6)) +
  scale_y_continuous(limits = c(0.6,1.6)) +
  coord_flip() +
  # remove the legend from the side
  theme(legend.position="none") +
  # align the caption to the left side of the graph with hjust = 0
  theme(plot.caption = element_text(hjust =0)) +
  labs(caption = "Colored points represent individual fruits; 
                    shapes represent different replicates (plants).
                  Numbers to left of boxplots are total fruits measured per accession. 
                  Updated 23 Oct 2020") +
  ggtitle("Diameter/height ratio - summer 2020 data")

diam_ht_plot
