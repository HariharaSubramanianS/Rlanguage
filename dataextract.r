# Load required libraries
library(rvest)
library(httr)

# Set the URL
url <- "https://google.com"

# Send GET request
response <- GET(url)

# Parse the HTML content
page <- read_html(response)

# Get all text content
text <- page %>% html_text()

# Get all links (href attributes)
links <- page %>% html_nodes("ing") %>% html_attr("alt")

# Print first 300 characters of text
cat("Text Content:\n", substr(text, 1, 300), "\n\n")

# Print links
print("Links:")
print(links)
