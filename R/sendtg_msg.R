
#' Send Message via Telegram
#'
#' This function sends an file attachment to your chat ID via the \code{telegram.bot} package.
#'
#' @param text a single \code{character} string containing your message
#' @param ... other parameters for the \code{sendMessage} function
#'
#' @return a message is sent to the chat ID contained in the .Renviron file
#' @export
#'
#' @examples
#' \dontrun{
#' sendtg_msg("hello world")
#' }
#'
sendtg_msg <- function(text = NULL, ...) {

  if (!is.character(text)) {
    stop("text parameter must be character string length 1")
  }

  if (!("bot" %in% ls())) {
    bot <- telegram.bot::Bot(token = telegram.bot::bot_token("RTelegramBot"))
    updates <- bot$getUpdates()
    chatid <- updates[[1L]]$from_chat_id()
  }

  if (telegram.bot::is.Bot(bot)) {
    bot$sendMessage(chat_id = chatid,
                    text = text, ...)
  }

}

