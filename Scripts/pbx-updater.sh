#!/usr/bin/expect -f
# Version 2.2
### Usage: expect pbx-updater.sh <host> <pwd>

set hostname [lindex $argv 0]

log_file -a results/$hostname

send_user ">>>>>> Working on $hostname @ [exec date] <<<<<<\n"
spawn ssh -o StrictHostKeyChecking=no root\@$hostname

expect {
  timeout { send_user "\nTimeout Exceeded - Check Host\n"; exit 1 }
  eof { send_user "\SSH Connection to $hostname Failed\n"; exit 1 }
  "*assword: " { send "[lindex $argv 1]\r" }
}

# ------- In this section, comment/un-comment the commands needed ------

# --- Update Modules ---
expect "*#" { send "amportal a ma upgradeall\r"}
expect "*command not found" {send "fwconsole ma upgradeall\r"}

# --- Pull IPtables ---
#expect "*#" { send "iptables -L -v -n\r" }

# --- Check drives ---
#expect "*#" {send "hdparm -I /dev/sda | grep Model\r"}
## When no device is found, it shows "No such file or directory"
#expect "*#" {
#  send "hdparm -I /dev/sda | grep Model\r"
#  expect "*#" {
#    send "hdparm -I /dev/sdb | grep Model\r"
#    expect "*#" {send "exit\r"}
#  }
#}

expect "*" {send "exit\r"}
interact
