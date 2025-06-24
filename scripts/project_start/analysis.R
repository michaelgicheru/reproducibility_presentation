library(tidyverse)

company_data <- read_csv(file = here::here("data", "data_per_company.csv"))

# list of companies to plot
companies <- c(
  "BRITAM GENERAL INSURANCE",
  "ICEA LION GENERAL INSURANCE",
  "CIC GENERAL INSURANCE COMPANY",
  "JUBILEE HEALTH INSURANCE"
)

# names to pivot
pivot_names <- names(company_data)[-1]

# Britam
filtered_data <- company_data |>
  filter(Company == companies[1]) |>
  select(-Company) |>
  pivot_longer(
    cols = any_of(pivot_names),
    names_to = "Line",
    values_to = "Amount"
  )

data_labels <- scales::label_number(
  accuracy = 0.1,
  style_negative = "parens",
  big.mark = ","
)(filtered_data$Amount)

britam_plot <- waterfalls::waterfall(
  .data = filtered_data,
  calc_total = FALSE,
  draw_lines = FALSE,
  total_rect_color = "green",
  rect_text_labels = data_labels
) +
  theme_minimal() +
  scale_y_continuous(
    name = "Amount",
    labels = scales::label_comma()
  ) +
  labs(
    title = "Britam",
    subtitle = "Insurance Service Result",
    x = "Line Item"
  )

# ICEA
filtered_data <- company_data |>
  filter(Company == companies[2]) |>
  select(-Company) |>
  pivot_longer(
    cols = any_of(pivot_names),
    names_to = "Line",
    values_to = "Amount"
  )

data_labels <- scales::label_number(
  accuracy = 0.1,
  style_negative = "parens",
  big.mark = ","
)(filtered_data$Amount)

icea_plot <- waterfalls::waterfall(
  .data = filtered_data,
  calc_total = FALSE,
  draw_lines = FALSE,
  total_rect_color = "green",
  rect_text_labels = data_labels
) +
  theme_bw() +
  scale_y_continuous(
    name = "Amount",
    labels = scales::label_comma()
  ) +
  labs(
    title = "ICEA",
    subtitle = "Insurance Service Result",
    x = "Line Item"
  )

# CIC
filtered_data <- company_data |>
  filter(Company == companies[3]) |>
  select(-Company) |>
  pivot_longer(
    cols = any_of(pivot_names),
    names_to = "Line",
    values_to = "Amount"
  )

data_labels <- scales::label_number(
  accuracy = 0.1,
  style_negative = "parens",
  big.mark = ","
)(filtered_data$Amount)

cic_plot <- waterfalls::waterfall(
  .data = filtered_data,
  calc_total = FALSE,
  draw_lines = FALSE,
  total_rect_color = "green",
  rect_text_labels = data_labels
) +
  theme_bw() +
  scale_y_continuous(
    name = "Amount",
    labels = scales::label_comma()
  ) +
  labs(
    title = "CIC",
    subtitle = "Insurance Service Result",
    x = "Line Item"
  )

# Jubilee
filtered_data <- company_data |>
  filter(Company == companies[4]) |>
  select(-Company) |>
  pivot_longer(
    cols = any_of(pivot_names),
    names_to = "Line",
    values_to = "Amount"
  )

data_labels <- scales::label_number(
  accuracy = 0.1,
  style_negative = "parens",
  big.mark = ","
)(filtered_data$Amount)

jubilee_plot <- waterfalls::waterfall(
  .data = filtered_data,
  calc_total = FALSE,
  draw_lines = FALSE,
  total_rect_color = "green",
  rect_text_labels = data_labels
) +
  theme_bw() +
  scale_y_continuous(
    name = "Amount",
    labels = scales::label_comma()
  ) +
  labs(
    title = "CIC",
    subtitle = "Insurance Service Result",
    x = "Line Item"
  )

# Save Plots
ggsave(
  "plots/britam_plot.pdf",
  britam_plot,
  width = 20,
  height = 10,
  units = "in"
)
ggsave("plots/icea_plot.pdf", icea_plot, width = 20, height = 10, units = "in")
ggsave("plots/cic_plot.pdf", cic_plot, width = 20, height = 10, units = "in")
ggsave(
  "plots/jubilee_plot.pdf",
  jubilee_plot,
  width = 20,
  height = 10,
  units = "in"
)
