grouped_mean2 <- function(.data, .summary_var, ...) {
  summary_var <- enquo(.summary_var)
  group_vars <- enquos(...)  # Get a list of quoted dots

  .data %>%
    group_by(!!!group_vars) %>%  # Unquote-splice the list
    summarise(mean = mean(!!summary_var))
}

grouped_mean2(mtcars, disp, cyl, am)
