library(tidyverse)

url <- "https://github.com/michaelgicheru/reproducibility_presentation/raw/master/data/ira_report_2023.xlsx"

raw_data <- tempfile(fileext = ".xlsx")

download.file(url = url, destfile = raw_data, method = "auto", mode = "wb")

raw_data <- readxl::read_xlsx(
    path = raw_data,
    sheet = "APPENDIX 1",
    skip = 3,
    n_max = 38
)

final_data <- raw_data |>
    slice(-1) |>
    mutate(across(
        all_of(c(
            "Insurance Service Expense",
            "Net expenses from reinsurance contracts held"
        )),
        ~ .x * -1
    )) |>
    select(Company:`Insurance Service Result`)

write_csv(
    final_data,
    here::here("data", "data_per_company.csv")
)
