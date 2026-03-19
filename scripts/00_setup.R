# =========================================================
# Environment setup for WGBS analysis
# =========================================================

cat("Initializing environment...\n")

# -----------------------------
# 1. Load packages
# -----------------------------
required_pkgs <- c(
  "tidyverse",
  "patchwork",
  "data.table",
  "ggplot2"
)

for (pkg in required_pkgs) {
  if (!requireNamespace(pkg, quietly = TRUE)) {
    stop(paste("Package not installed:", pkg))
  }
  library(pkg, character.only = TRUE)
}

cat("All required packages loaded.\n")

# -----------------------------
# 2. Load utilities
# -----------------------------
source("scripts/utils.R")

# -----------------------------
# 3. Define directories (STANDARD)
# -----------------------------
data_root_dir        <- "data"
data_processed_dir   <- file.path(data_root_dir, "processed")
data_metadata_dir    <- file.path(data_root_dir, "metadata")

results_dir          <- "results"
results_pca_dir      <- file.path(results_dir, "PCA")
results_dmr_dir      <- file.path(results_dir, "DMR")

figures_dir          <- "figures"

# -----------------------------
# 4. Create output directories ONLY
# -----------------------------
dir_create_safe(results_dir)
dir_create_safe(results_pca_dir)
dir_create_safe(results_dmr_dir)

dir_create_safe(figures_dir)

cat("Directory structure ready.\n")
