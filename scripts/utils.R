# =========================================================
# Utility functions for reproducible workflow
# =========================================================

# -----------------------------
# Safe directory creation
# -----------------------------
dir_create_safe <- function(path) {
  if (!dir.exists(path)) {
    dir.create(path, recursive = TRUE)
    message("[OK] Directory created: ", path)
  } else {
    message("[OK] Directory exists: ", path)
  }
}

# -----------------------------
# Check file existence
# -----------------------------
check_file_exists <- function(file, msg = NULL) {
  if (!file.exists(file)) {
    stop(
      ifelse(
        is.null(msg),
        paste("File not found:", file),
        msg
      )
    )
  } else {
    message("[OK] File found: ", file)
  }
}

# -----------------------------
# Check multiple files
# -----------------------------
check_files_exist <- function(files) {
  missing <- files[!file.exists(files)]
  
  if (length(missing) > 0) {
    stop(
      paste(
        "Missing required files:\n",
        paste(missing, collapse = "\n")
      )
    )
  } else {
    message("[OK] All required files are present.")
  }
}

# -----------------------------
# Download file with validation
# -----------------------------
fetch_figshare <- function(url, dest, overwrite = FALSE) {

  if (file.exists(dest) && !overwrite) {
    message("[SKIP] File already exists: ", dest)
    return(invisible(dest))
  }

  message("[DOWNLOAD] ", url)

  tryCatch({

    download.file(url, dest, mode = "wb", quiet = FALSE)

    if (!file.exists(dest)) {
      stop("Download failed: file not found after download.")
    }

    # check file size
    if (file.info(dest)$size == 0) {
      stop("Downloaded file is empty: ", dest)
    }

    message("[OK] Download completed: ", dest)

  }, error = function(e) {
    stop("Error downloading file:\n", url, "\n", e$message)
  })

  return(invisible(dest))
}
