# 10.1
# Loop cluster top10 genes


# Read the Seurat object
seurat <- readRDS(here("data/rds_files/9_seurat_dim_reduction.rds"))

# Get the number of clusters
num_clusters <- length(unique(Idents(seurat)))

# Create a progress bar
pb <- progress_bar$new(
  format = "[:bar] :current/:total (:percent) Elapsed: :elapsedfull",
  total = num_clusters,
  clear = FALSE,
  width = 60
)

# Loop through each cluster and perform the analysis
for (i in 1:num_clusters) {
  pb$tick()
  
  # Find markers for the current cluster
  cluster_markers <- FindMarkers(seurat, ident.1 = i)
  
  # Display the top markers
  print(head(cluster_markers))
  
  # Get the top 10 markers for the current cluster
  top_markers <- head(rownames(cluster_markers), 10)
  print(top_markers)
  
  # Visualize the top marker genes
  Featureplot1 <- FeaturePlot(seurat, features = top_markers)
  Vlnplot <- VlnPlot(seurat, features = top_markers, pt.size = 0.1)
  
  # Filter Seurat object to include only cells from the current cluster
  seurat_cluster <- subset(seurat, idents = i)
  
  # Visualize the top marker genes with FeaturePlot
  Featureplot2 <- FeaturePlot(seurat_cluster, features = top_markers, pt.size = 0.1, cols = brewer.pal(n = 8, name = "Set1"), label = TRUE)
  
  # Save images
  ggsave(
    filename = here("data/plots/cluster_", i, "_topmarkers.png"), 
    plot = Featureplot1,
    width = 1667 / 100, 
    height = 667 / 100, 
    dpi = 100,
    limitsize = FALSE
  )
  
  ggsave(
    filename = here("data/plots/cluster_", i, "_Vlnplot.png"), 
    plot = Vlnplot,
    width = 1667 / 100, 
    height = 667 / 100, 
    dpi = 100,
    limitsize = FALSE
  )
  
  ggsave(
    filename = here("data/plots/cluster_", i, "_top10markers.png"), 
    plot = Featureplot2,
    width = 1667 / 100, 
    height = 667 / 100, 
    dpi = 100,
    limitsize = FALSE
  )
}

# Clear environment
rm(seurat, Featureplot1, Vlnplot, Featureplot2)
rm(list = ls())
gc()
.rs.restartR()