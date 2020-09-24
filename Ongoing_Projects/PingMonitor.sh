#!/usr/bin/expect -fi
# Version 0.1
### Usage: expect PingMonitor.sh <ip>

# Grab ip addr from argument. No input sanitation yet.
set hostname [lindex $argv 0]

 # Disable Timeout
set timeout -1

# Set Text Status colors
set RED "\033\[0;31m"
set GREEN "\033\[0;32m"
set NC "\033\[0m"

#Create log file to review
log_file -a Results/$hostname

# Conducts Ping and puts output
send_user ">>>>>> Pinging Host: $hostname @ [exec date] <<<<<<\n"
spawn ping $hostname
  expect {
      " Unknown Host" {puts "${RED}$hostname Is A Unknown Host${NC}"}
      " Unreachable " {puts "${RED}$hostname Is Unreachable${NC}"}
      " No Reply " {puts "${RED}There Is No Reply From $hostname"}
  }
send_user ">>>>>> Ping complete <<<<<<\n"
