% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sendtg_ani.R
\name{sendtg_ani}
\alias{sendtg_ani}
\title{Send Images via Telegram}
\usage{
sendtg_ani(ani = NULL, ...)
}
\arguments{
\item{ani}{a \code{character} string containing the \code{path} for your image. URLs can also be used}

\item{...}{other parameters for the \code{sendPhoto} function}
}
\value{
sends an animation (gif or video) to your chat ID as an attachment
}
\description{
This function sends a message to your chat ID via the \code{telegram.bot} package.
}
\examples{
\dontrun{
sendtg_ani("my_awesome_meme.png")
}

}
