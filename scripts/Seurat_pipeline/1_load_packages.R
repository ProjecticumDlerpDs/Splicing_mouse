# 1
# Load libraries

library(dplyr)
library(ggplot2)
library(pheatmap)
library(tidyr)
library(RColorBrewer)
library(ggrepel)
library(Seurat)
library(Matrix)
library(here)
library(future)
library(future.apply)
library(pryr)
library(progress)


# Increase the allowed size for globals to 1000 MiB
options(future.globals.maxSize = 1000 * 1024^2)  # 1000 MiB

# Set up to use 16 cores for smoother processing and dividing memory
plan(multicore, workers = 16)



