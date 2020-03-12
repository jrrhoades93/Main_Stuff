#!/usr/bin/env python

import socket
import subprocess
import sys
from datetime import datetime

# Clear the screen
subprocess.call('clear',shell=True)

# Ask for input
remoteServer = raw_input("Enter a remote host to scan: ")
remoteServerIP = socket.gethostbyname(remoteServer)

# Display a banner with info
print "-"*60
print "Scanning remote host", remoteServerIP
print "-"*60

# Set time for start of scanner
time1 = datetime.now()

# Main block that does the Scanning
try:
    for port in range(1,1025):
        sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        result = sock.connect_ex((remoteServerIP,port))
        if result == 0:
            print "Port{}:      Open".format(port)
        sock.close()

# User interupts with Ctrl+C
except KeyboardInterrupt:
    print "Canceled Port Scan..."
    sys.exit()

except socket.gaierror:
    print "Hostname could not be resolved. Exiting..."
    sys.exit()

except socket.error:
    print "Could not connect to server..."
    sys.exit()

time2 = datetime.now()
total = time2 - time1

print "Scan completed in: ",total
