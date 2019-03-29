# sendtg

Sending Telegram messages from R made easy!

This package contains wrapper functions built on the [`telegram.bot`](https://github.com/ebeneditos/telegram.bot) package to easily send Telegram messages using R. The primary motivation for this package was to create a simple tool to send notifications when scripts finish running, similar to the [`beepr`](https://cran.r-project.org/package=beepr).  

The primary motivation for this package was to generate notifications when "medium-long" R scripts would finish to optimize the user's time i.e. coffee breaks :coffee: :running:.  

## Resources
I suggest reading a bit on the [security](https://core.telegram.org/api#security) regarding Telegram and you can gauge whether this is relevant to you or not. I've run into issues where some IT firewalls will block R from sending Telegram messages.  

To get started you can check out the very useful tutorials based on the `telegram.bot` package on [**getting started**](https://github.com/ebeneditos/telegram.bot/wiki/Introduction-to-the-API) and other features [here](https://github.com/ebeneditos/telegram.bot/wiki).  

If you're curious more about the Telegram API and bots, you can read more on their [website](https://core.telegram.org/bots).

## Getting Started
First you'll need to create a [Telegram account](https://web.telegram.org/). Then you'll need to talk to the `@BotFather` to create a new bot. You can find the steps here at the Telegram [website](https://core.telegram.org/bots#6-botfather). 

This package contains two useful packages to help you get started, `sendtg_setup()` and `sendtg_check`. The first function `sendtg_setup()` outlines the basic steps to setup the bot token. It uses the `usethis` package to open your `.REnviron` file so you can safely store the API token. It's bad practice to put credentials or keys in R scripts, its better to place them in the `.REnviron` file. You can read more [here](https://csgillespie.github.io/efficientR/3-3-r-startup.html#renviron) and [here](https://cran.r-project.org/web/packages/httr/vignettes/api-packages.html).


```r
sendtg_setup()

#> 1. Follow the instructions to setup a Telegram bot: https://core.telegram.org/bots#6-botfather
#>
#> 2. Add the token to your .REnviron file using the following lines R_TELEGRAM_BOT_RTelegramBot = TOKEN
#>
#> example: R_TELEGRAM_BOT_RTelegramBot = 110201543:AAHdqTcvCH1vGWJxfSeofSAs0K5PALDsaw
#>
#> ● Modify '/Users/eugenejoh/.Renviron'
#> ● Restart R for changes to take effect
#>
#> 3. Restart your R session and run `sendtg_check`
```

The second function `sendtg_check()` checks whether you setup the token correctly in your `.REnviron` file and whether you can get `chatid` for your newly created Telegram bot. If everything is good you should get a similar output below (with your information obviously).  

```r
sendtg_check()

#> $id
#> [1] 845078134
#>
#> #is_bot
#> [1] TRUE
#>
#> $first_name
#> [1] "My bot's name"
#>
#> $username
#> [1] "the_name_I_used_bot"

```

## Sending A Message
Now that you're setup and ready to send yourself Telegram messages using R, you can use one of three functions: `sendtg_msg`, `sendtg_img`, and `sendtg_file`. The names are fairly self descriptive - they send either a message, an image, or a file respectively. Just remember not to send sensitive information or files through this method!

```r
library(dplyr)
library(readr)
data(iris)

iris_summary <- iris %>% 
  group_by(Species) %>% 
  summarise_at(.vars = vars(matches("Width$")), .funs = list(mean=mean, median=median))
sendtg_msg("I just finished processing iris data, see the attachement!")

readr::write_csv(x = iris_summary, path = "some_cool_output.csv")
sendtg_file("some_cool_output.csv")


```

## Closing Thoughts
This package is meant to make the Telegram API simple for R users to incorporate notifications into their R scripts. If you're interested in learning more about using R with the Telegram API, I strongly suggest checking out the [`telegram.bot` package](https://github.com/ebeneditos/telegram.bot).  

Hopefully you can go on your coffee breaks or afternoon walks without wondering if your script finished running! :walking: :coffee:
