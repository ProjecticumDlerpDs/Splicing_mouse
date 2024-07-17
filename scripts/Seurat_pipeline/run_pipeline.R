# Function to check memory usage
check_memory <- function(step_name) {
  cat(paste("Memory usage at step", step_name, ":\n"))
  system("free -h")
}

# Function to run R script and check for errors
run_rscript <- function(script, step_name) {
  cat(paste("Running", step_name, "...\n"))
  tryCatch({
    if (!file.exists(script)) {
      stop(paste("File not found:", script))
    }
    source(script, local = TRUE)
    check_memory(step_name)
  }, error = function(e) {
    cat(paste("Error:", script, "failed at step", step_name, "\n"))
    cat("Error message:\n", conditionMessage(e), "\n")
    stop(e)
  })
}

# Set the working directory (adjust as necessary)
setwd("~/projecticum/splicing/scripts/Seurat_pipeline")

# Print working directory and list files to ensure correct paths
cat("Current working directory:", getwd(), "\n")
cat("Files in the working directory:\n")
print(list.files())

# Run each R script in sequence with error handling and memory checks
tryCatch({
  run_rscript("1_load_packages.R", "load_packages")
  run_rscript("2_load_data.R", "load_data")
  run_rscript("3_create_seurat_object.R", "create_seurat_object")
  run_rscript("4_data_quality.R", "data_quality")
  run_rscript("5_normalize.R", "normalize")
  run_rscript("6_variablefeatures.R", "Variable_features")
  run_rscript("7_scaling.R", "scaling")
  run_rscript("8_PCA.R", "PCA")
  run_rscript("9_UMAP.R", "dimensionality_reduction")
  
  cat("Pipeline completed successfully.\n")
}, error = function(e) {
  cat("Pipeline failed with error:\n")
  cat(conditionMessage(e), "\n")
})


