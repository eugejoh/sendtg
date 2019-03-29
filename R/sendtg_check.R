#' Checking the Telegram API Setup in R
#'
#' This function checks whether the setup with your .REnviron was done correctly.
#' It uses the `telegram.bot::getMe()` to return the relevant information.
#' If the setup was done incorrectly, it will return an error. Most likely a token issue.
#'
#' @return returns a list with `id`, `is_bot`, `first_name`, and `username`
#'
#' @importFrom telegram.bot "Bot"
#' @importFrom telegram.bot "bot_token"
#' @export
#'
#' @examples
#' \dontrun{
#' sendtg_check()
#' }
#'
#'
sendtg_check <- function() {
  bot <- telegram.bot::Bot(token = telegram.bot::bot_token("RTelegramBot"))

  print(bot$getMe())
}
