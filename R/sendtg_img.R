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
#' sendtg_img("my_awesome_pic.png")
#' }
#'
sendtg_img <- function(img = NULL, ...) {

  if (!is.character(img)) {
    stop("text parameter must be character string length 1")
  }

  if (!("bot" %in% ls())) {
    bot <- telegram.bot::Bot(token = telegram.bot::bot_token("RTelegramBot"))
    chatid <- Sys.getenv("chat")
  }

  if (telegram.bot::is.Bot(bot)) {
    bot$sendPhoto(chat_id = chatid,
                     photo = img, ...)
  }

}
