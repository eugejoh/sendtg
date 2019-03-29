#' Send Images via Telegram
#'
#' This function sends a message to your chat ID via the \code{telegram.bot} package.
#'
#' @param img a \code{character} string containing the \code{path} for your image. URLs can also be used
#' @param ... other parameters for the \code{sendPhoto} function
#'
#' @return sends an image to your chat ID as an attachment
#' @export
#'
#' @examples
#' \dontrun{
#' sendtg_img("my_awesome_meme.gif")
#' }
#'
sendtg_img <- function(img = NULL, ...) {

  if (!is.character(img)) {
    stop("text parameter must be single character string")
  }

  if (!("bot" %in% ls())) {
    bot <- telegram.bot::Bot(token = telegram.bot::bot_token("RTelegramBot"))
    updates <- bot$getUpdates()
    chatid <- updates[[1L]]$from_chat_id()
  }

  if (all(class(bot) == c("Bot", "R6"))) {
    bot$sendPhoto(chat_id = chatid,
                     photo = img, ...)
  }

}
