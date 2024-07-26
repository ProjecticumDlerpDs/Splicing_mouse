#!/bin/bash

# Function to check memory usage
check_memory() {
  echo "Memory usage at step $1:"
  free -h
}

# Function to run R script and check for errors, logging stdout and stderr
run_rscript() {
  local script=$1
  local step_name=$2
  local stdout_log="${step_name}_stdout.log"
  local stderr_log="${step_name}_stderr.log"
  
  echo "Running $script at step $step_name..."
  Rscript "$script" > "$stdout_log" 2> "$stderr_log"
  
  if [ $? -ne 0 ]; then
    echo "Error: $script failed at step $step_name. Check $stderr_log for errors."
    exit 1
  fi
  
  echo "Completed $script at step $step_name."
  check_memory "$step_name"
}

# Check if Rscript is available
if ! command -v Rscript &> /dev/null
then
    echo "Error: Rscript could not be found. Make sure R is installed and in your PATH."
    exit 1
fi

# Run each R script in sequence with memory checks and logging
run_rscript 1_load_packages.R "load_packages"
run_rscript 2_load_data.R "load_data"
run_rscript 3_create_seurat_object.R "create_seurat_object"
run_rscript 4_data_quality.R "data_quality"
run_rscript 5_normalize.R "normalize"
run_rscript 6_variablefeatures.R "Variable_features"
run_rscript 7_scaling.R "scaling"
run_rscript 8_PCA.R "PCA"
run_rscript 9_UMAP.R "dimensionality_reduction"

echo "Pipeline completed successfully."

