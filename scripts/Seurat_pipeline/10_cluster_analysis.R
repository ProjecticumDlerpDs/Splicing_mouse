#10
# Cluster analyse

seurat <- readRDS(here("data/rds_files/9_seurat_dim_reduction.rds"))


#Subset cluster identification
cluster_markers <- FindMarkers(seurat, ident.1 = 2)


# Display the top markers
print(head(cluster_markers))


# Get the top 10 markers for cluster #
top_markers <- head(rownames(cluster_markers), 10)
print(top_markers)

# Visualize the top marker genes
Featureplot1 <- FeaturePlot(seurat, features = top_markers)
Vlnplot <- VlnPlot(seurat, features = top_markers, pt.size = 0.1)


# Filter Seurat object to include only cells from cluster 13
seurat_cluster <- subset(seurat, idents = "2")

# Get the top 10 markers for cluster 13
top_markers <- head(rownames(cluster_markers), 10)

# Visualize the top marker genes with FeaturePlot
Featureplot2 <- FeaturePlot(seurat_cluster, features = top_markers, pt.size = 0.1, cols = brewer.pal(n = 8, name = "Set1"), label = TRUE)

saveRDS(seurat_cluster, here("data/rds_files/seurat_cluster_2.rds"))

# save images

ggsave(
  here("data/plots/10_topmarkers_C2.png"), 
  plot = Featureplot1,
  width = 1667/ 100, 
  height = 667/ 100, 
  dpi = 100,
  limitsize = FALSE
)

ggsave(
  here("data/plots/10_Vlnplot_cluster_C2.png"), 
  plot = Vlnplot,
  width = 1667/ 100, 
  height = 667/ 100, 
  dpi = 100,
  limitsize = FALSE
)

ggsave(
  here("data/plots/10_top10markers_C2.png"), 
  plot = Featureplot2,
  width = 1667/ 100, 
  height = 667/ 100, 
  dpi = 100,
  limitsize = FALSE
)

# Clear environment
rm(seurat, Featureplot1, Vlnplot, Featureplot2)
rm(list = ls())
gc()
.rs.restartR()