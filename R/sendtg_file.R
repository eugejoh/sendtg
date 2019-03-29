#'  Send File via Telegram
#'
#' @param fpath a single \code{character} string containing the file fpath
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
sendtg_file <- function(fpath = NULL, ...) {

  if (!is.character(fpath)) {
    stop("text parameter must be single character string")
  }

  if (!("bot" %in% ls())) {
    bot <- telegram.bot::Bot(token = telegram.bot::bot_token("RTelegramBot"))
    updates <- bot$getUpdates()
    chatid <- updates[[1L]]$from_chat_id()
  }

  if (all(class(bot) == c("Bot", "R6"))) {
    bot$sendDocument(chat_id = chatid,
                     document = fpath, ...)
  }

}
