source("scripts/01_PCA_analysis.R")
source("scripts/02_DMR_processing.R")

source("scripts/03_plot_Figure1.R")
source("scripts/04_plot_Figure2.R")
source("scripts/05_plot_Figure3.R")
source("scripts/06_plot_Figure4.R")

writeLines(capture.output(sessionInfo()), "sessionInfo.txt")
