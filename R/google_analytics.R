####################################################################
#' Queries on Google Analytics
#' 
#' This function lets the user query Google Analytics with its API.
#' More about the documentation and parameters in googleAnalyticsR's
#' google_analytics or Google Analytics'
#' \url{https://developers.google.com/analytics/devguides/reporting/core/dimsmets}{API}
#' 
#' @family Connection
#' @param account Character. Personal named accounts
#' @param creds Character. Credential's user (see get_credentials)
#' @param token_dir Character. Credential's user (see get_credentials)
#' @param metrics Character. Which metrics we wish to bring
#' @param dimensions Character. Which dimensions we wish to bring
#' @param met_filters,dim_filters A filter_clause_ga4 for filtering 
#' metrics/dimensions. Check googleAnalyticsR::google_analytics()
#' @param start Date. Start date for the report
#' @param end Date. End date for the report
#' @export
queryGA <- function(account = "comparamejor",
                    creds = NA, token_dir = NA,
                    metrics = "sessions",
                    dimensions = "date",
                    met_filters = NULL,
                    dim_filters = NULL,
                    start = lubridate::floor_date(Sys.Date(), "month"),
                    end = Sys.Date()){
  
  try_require("googleAnalyticsR")
  try_require("googleAuthR")
  
  #FIRST TIME
  # options(googleAuthR.scopes.selected = c("https://www.googleapis.com/auth/analytics"),
  #         googleAuthR.client_id = "XXX",
  #         googleAuthR.client_secret = "XXX")
  # gar_auth()
  
  account <- paste("google_analytics", account, sep = "_")
  vars <- get_credentials(from = account, dir = creds)
  
  options(googleAuthR.scopes.selected = c("https://www.googleapis.com/auth/analytics"),
          googleAuthR.client_id = vars$client_id,
          googleAuthR.client_secret = vars$client_secret)
  
  # Authenticate with local file
  if (!is.na(token_dir)) { 
    token <- paste0(token_dir, "/", vars$token_name) 
  } else { 
    token <- vars$token_name 
  }
  message(paste("Token:", token))
  gar_auth(token) # From googleAuthR
  
  # Query on Google Analytics
  google_analytics(
    vars$ga_id, 
    date_range = c(start, end),
    metrics = metrics,
    dimensions = dimensions,
    met_filters = met_filters,
    dim_filters = dim_filters)
}
