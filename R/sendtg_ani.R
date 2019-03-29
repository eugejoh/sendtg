#' Send Images via Telegram
#'
#' This function sends a message to your chat ID via the \code{telegram.bot} package.
#'
#' @param ani a \code{character} string containing the \code{path} for your image. URLs can also be used
#' @param ... other parameters for the \code{sendPhoto} function
#'
#' @return sends an animation (gif or video) to your chat ID as an attachment
#' @export
#'
#' @examples
#' \dontrun{
#' sendtg_ani("my_awesome_meme.png")
#' }
#'
sendtg_ani <- function(ani = NULL, ...) {

  if (!is.character(ani)) {
    stop("text parameter must be character string length 1")
  }

  if (!("bot" %in% ls())) {
    bot <- telegram.bot::Bot(token = telegram.bot::bot_token("RTelegramBot"))
    updates <- bot$getUpdates()
    chatid <- updates[[1L]]$from_chat_id()
  }

  if (telegram.bot::is.Bot(bot)) {
    bot$sendAnimation(chat_id = chatid,
                      animation = ani, ...)
  }

}
