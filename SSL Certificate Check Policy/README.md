# SSL Certificate Expriration

## Use Case

These policies can be used to locate all machines listening on Port 443/TCP and then using openSSL on the managing appliace to pull back the certificate information. The policy then looks for text on the expiration. An example would be using the policy to search for a specific *.acme.local certificate that had an expiration of MM/DD/YY and then populate to an external DB and Google Spreadsheet with the devices that needed to be updated.

## Needed for the policy

- Template -- SSL Check (Port 443.xml)

  - Gathers all systems with Open Ports (443/TCP) (NOTE: This can be duplicated for other ports like 8443 also). A run script is then done to run an opensll command against the {ip}:443 hosts to pull back all the certification details (i.e name and exp) and writes those to /tmp/sslexpire/{ip}:443 on the appliance.

- Template -- SSL Expired (Port 443).xml

  - Runs a command on the appliance to look in the results of /tmp/sslexpire/{ip}:8443 and looks for a specific date range. Information gathered can be sent to a Google Spreadsheet or something else.