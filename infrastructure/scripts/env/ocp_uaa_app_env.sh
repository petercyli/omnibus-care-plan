#!/bin/bash

# Declare methods start
function defaultConfig() {
    # UAA Database details
    export UAA_BASE_PATH=/usr/local
    export UAA_DB_USER=your_db_username
    export UAA_DB_PASSWORD=your_db_password
    export UAA_DB_PORT=your_db_port # default port is 5432
    export UAA_DB_HOST=your_db_host

    # Edge Server configuration
    # default port is 80, need to configured as not to conflict with OCP_EDGE_Server, if UAA APP is deployed as the same server as OCP APP
    export UAA_APP_PORT=your_port 

    # SMTP details
    export UAA_SMTP_HOST=your_mail_host
    export UAA_SMTP_PORT=your_mail_port
    export UAA_SMTP_USER=your_mail_username
    export UAA_SMTP_PASSWORD=your_mail_password
   }

# Start Method
defaultConfig


