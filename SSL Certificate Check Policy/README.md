#CounterACT Forescout Device SSL Certificate expiration policies

These policies help to locate all machines listening on Port 443/TCP and then using openSSL on the managaging CounterACT
appliance to pull back the certificate information. The policy then looks for text on the expiration. These policies can be altered
to reflect anything about the ssl certificate you want.

Use Case: We used these policies to hunt out wildcard SSL certificates that were getting ready to expire within the month.
We searched for a specific *.acme.local certificate that had an expiration of MM/DD/YY and then to populate an external
DB and Google Spreadsheet with the devices that needed to be updated.

The first gathers all systems with open ports 443/TCP (I replicated these for other ports like 8443 also). 
On all the systems with 443/tcp open I'm executing a script on the counteract appliances to run an open_ssl 
command against the {ip}:443 hosts to pull back all the cert details (i.e name and expiration). 
It writes these results to /tmp/sslexpire/{ip}:443 on the counteract appliances (i.e. /tmp/sslexpire/192.168.1.1:443)

Policy #2 also runs a command on the counteract appliances that cats in the results of /tmp/sslexpire/{ip}:443 and 
looks for the text I'm after. For example is *.acme.net the cert and does expire=April 15. Once I've gathered all 
those devices I wrote a dex action to update a Google spreadsheet which was shared with the entire IT team.