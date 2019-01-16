if (!require(cliapp)) {
  install.packages("cliapp")
}

cliapp::cli_h1("This script creates the basic project structure.")

cliapp::cli_text(crayon::red(clisymbols::symbol$bullet)," {strong Building ...}")
cliapp::cli_text()

if (!dir.exists("codes")) {
  dir.create("codes")
}
if (!dir.exists("R")) {
  dir.create("R")
}
cliapp::cli_alert_success("Create {file ./codes} for {strong R scripts} and {file ./R} for {strong  R funs}")


if (!dir.exists("data")) {
  dir.create("data")
}
cliapp::cli_alert_success("Create {file ./data} for {strong Data Sources}")

if (!dir.exists("imgs")) {
  dir.create("imgs")
}
cliapp::cli_alert_success("Create {file ./imgs} for {strong images}")

if (!dir.exists("result")) {
  dir.create("result")
}
cliapp::cli_alert_success("Create {file ./result} for {strong Result Output}")
cliapp::cli_text()
cliapp::cli_alert_success("{strong DONE !}")
