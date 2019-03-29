sendtg_check <- function() {
  bot <- telegram.bot::Bot(token = telegram.bot::bot_token("RTelegramBot"))

  print(bot$getMe())
}
