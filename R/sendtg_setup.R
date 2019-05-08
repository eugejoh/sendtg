#' Getting Started with Telegram API in R Setup
#'
#' This function opens the .Renviron file and outlines the steps needed to take to insert the appropriate Telegram API token.
#'
#' @return opens .Renviron file and prints instructions
#'
#' @importFrom usethis "edit_r_environ"
#' @export
#'
#' @examples
#' \dontrun{
#' sendtg_setup()
#' }
#'

sendtg_setup <- function() {
  message("1. Follow the instructions to setup a Telegram bot: https://core.telegram.org/bots#6-botfather\n")

  message("2. Add the token to your .REnviron file using the following lines R_TELEGRAM_BOT_RTelegramBot = TOKEN\n")

  message("example: R_TELEGRAM_BOT_RTelegramBot = 110201543:AAHdqTcvCH1vGWJxfSeofSAs0K5PALDsaw\n")

  message("\n3. Add the chat ID your .REnviron file using the following lines chat = your_chat_id\n")

  message("example: chat = 123456789\n")

  usethis::edit_r_environ()
  message("\n4. Restart your R session and run `sendtg_check`")

}
