# This script is to autonamte configuration of webservers on multiple vms with different Operating Systems.

In this example we are installing webservers Httpd and Apache2 on 2 different instances with different OS, and deploying application on them from local machine.

- We run the websetup.sh script from our local machine, which:
    Reads ip addresses of servers from remhosts file and then runs the script in websetup.sh.
    - Which copies the multi_host_config.sh bash file into server and runs the script.
multi_host_config.sh: script to identify servertype and deploys application.

commands:

- $ bash websetup.sh
- Then pickup the ip address and paste on the browser you will get a website.