cry_code <- silver
cry_done <- green
cry_note <- cyan
cry_warn <- magenta
cry_err <- red

# Adapted from cli::cat_line
cat_line <- function(...) {
  out <- paste0(..., collapse = "\n")
  cat(out, "\n", sep = "", append = TRUE)
}

# Adapted from cli::cat_bullet
cat_bullet <- function(..., col = NULL, bullet = "*") {
  out <- paste0(...)
  cat_line(paste(bullet, out))
}
