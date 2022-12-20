
require(rjson)
require(httr)
require(jsonlite)
require(dplyr)
require(purrr)

server = "your-server" #The Mastodon server you want to access, e.g., "mastodon.social"
status_id <- ('your-status') #The ID of the status you want to get replies for - it's the last part of the URL
url_handle <-
  paste0("https://", server, "/api/v1/statuses/", status_id, ":id/context/")

response <-
  httr::GET(url = url_handle)
obj <- httr::content(response, as = "text")
x <- rjson::fromJSON(obj)

dat = as.data.frame(unlist(lapply(unlist(x, recursive = FALSE), `[`, "content")))

