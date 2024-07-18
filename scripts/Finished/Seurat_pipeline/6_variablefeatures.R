# 6
# FindVariable features
# Idenify top10 genes

seurat <- readRDS(here("data/rds_files/5_seurat_normalize.rds"))

seurat <- FindVariableFeatures(seurat, selection.method = "vst", nfeatures = 2000)
top10 <- head(VariableFeatures(seurat), 10)
plot1 <- VariableFeaturePlot(seurat) + theme(legend.position="top")
plot2 <- LabelPoints(plot = plot1, points = top10, repel = TRUE, xnudge=0, ynudge=0) + theme(legend.position="top")

plot2

# Save the Seurat object and plots
saveRDS(seurat, here("data/rds_files/6_seurat_variable_features.rds"))
saveRDS(top10, here("data/rds_files/6_top10.rds"))
saveRDS(plot1, here("data/rds_files/6_plot1.rds"))
saveRDS(plot2, here("data/rds_files/6_plot2.rds"))


ggsave(
  here("data/plots/6_Variable_features.png"), 
  plot = plot2,
  width = 1667/ 100, 
  height = 667/ 100, 
  dpi = 100,
  limitsize = FALSE
)


# Clear environment
rm(seurat, top10, plot1, plot2)
gc()