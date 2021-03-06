% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/facebook.R
\name{fb_ads}
\alias{fb_ads}
\title{Facebook Ads API}
\usage{
fb_ads(
  token,
  which,
  start = Sys.Date() - 31,
  end = Sys.Date(),
  api_version = "v3.3"
)
}
\arguments{
\item{token}{Character. This must be a valid access token with sufficient 
privileges. Visit the Facebook API Graph Explorer to acquire one}

\item{which}{Character. This is the ad account, campaign, adset, 
or ad ID to be queried}

\item{start}{Character. The first full day to report, in the 
format "YYYY-MM-DD"}

\item{end}{Character. The last full day to report, in the 
format "YYYY-MM-DD"}

\item{api_version}{Character. Facebook API version}
}
\description{
This returns all available FB ads for any account, campaign, or ad set id.
For more information on Ad' API, go to the 
\href{https://developers.facebook.com/docs/marketing-api/reference/adgroup}{original documentaion}
}
\details{
This function was based on FBinsightsR.
}
\seealso{
Other Scrapper: 
\code{\link{fb_accounts}()},
\code{\link{fb_insights}()},
\code{\link{fb_posts}()},
\code{\link{fb_post}()},
\code{\link{geoStratum}()},
\code{\link{holidays}()},
\code{\link{ip_country}()},
\code{\link{readGS4}()},
\code{\link{readGS}()},
\code{\link{trendsRelated}()},
\code{\link{writeGS}()},
\code{\link{yt2mp3}()}

Other API: 
\code{\link{bring_api}()},
\code{\link{fb_accounts}()},
\code{\link{fb_creatives}()},
\code{\link{fb_insights}()},
\code{\link{fb_posts}()},
\code{\link{fb_post}()}

Other Facebook: 
\code{\link{fb_accounts}()},
\code{\link{fb_creatives}()},
\code{\link{fb_insights}()},
\code{\link{fb_posts}()},
\code{\link{fb_post}()}
}
\concept{API}
\concept{Facebook}
\concept{Scrapper}
