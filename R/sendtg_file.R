#'  Send File via Telegram
#'
#' @param path a single \code{character} string containing the file fpath
#' @param ... other arguments fo the \code{sendDocument} function
#'
#' @return a message is sent to the chat ID contained in the .Renviron file with the file
#' @export
#'
#' @examples
#' \dontrun{
#' send_file("important_output.csv")
#' }
#'
sendtg_file <- function(path = NULL, ...) {

  if (!is.character(path)) {
    stop("text parameter must be character string length 1")
  }

  if (!("bot" %in% ls())) {
    bot <- telegram.bot::Bot(token = telegram.bot::bot_token("RTelegramBot"))
    chatid <- Sys.getenv("chat")
  }

  if (telegram.bot::is.Bot(bot)) {
    bot$sendDocument(chat_id = chatid,
                     document = path, ...)
  }

}
