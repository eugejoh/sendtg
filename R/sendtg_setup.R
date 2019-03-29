sendtg_setup <- function() {
  message("1. Follow the instructions to setup a Telegram bot: https://core.telegram.org/bots#6-botfather\n")

  message("2. Add the token to your .REnviron file using the following lines R_TELEGRAM_BOT_RTelegramBot = TOKEN\n")

  message("example: R_TELEGRAM_BOT_RTelegramBot = 110201543:AAHdqTcvCH1vGWJxfSeofSAs0K5PALDsaw\n")

  usethis::edit_r_environ()
  message("\n3. Restart your R session and run `sendtg_check`")

}
