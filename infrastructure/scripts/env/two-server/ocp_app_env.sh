#!/bin/bash

# Declare methods start
function defaultConfig() {
    export OCP_BASE_PATH=/usr/local
    export ENV_APP_PROFILE=your_profile_name

    # UAA Database details
    export UAA_BASE_PATH=/usr/local
    export UAA_DB_USER=your_db_username
    export UAA_DB_PASSWORD=your_db_password
    export UAA_DB_PORT=your_db_port # default port is 5432
    export UAA_DB_HOST=your_db_host

    export FHIR_DB_PORT=your_db_port # default port is 5432
    export FHIR_DB_HOST=your_db_host

    # UAA_APP default port is 80, need to configured as not to conflict with OCP_EDGE_Server
    export UAA_APP_PORT=your_port

    # SMTP details
    export UAA_SMTP_HOST=your_mail_host
    export UAA_SMTP_PORT=your_mail_port
    export UAA_SMTP_USER=your_mail_username
    export UAA_SMTP_PASSWORD=your_mail_password

    # Edge Server configuraiton
    export OCP_APP_PORT=80

    export C2S_SOF_HOST=your_c2s_sof_host
   }

function OCPVersions(){
    export OCP_CONFIG_SERVER_VERSION=0.1.0
    export OCP_DISCOVERY_SERVER_VERSION=0.1.0
    export OCP_EDGE_SERVER_VERSION=0.4.0
    export OCP_FIS_VERSION=0.18.0
    export OCP_UI_VERSION=0.18.0
    export OCP_UI_API_VERSION=0.18.0
    export SMART_CORE_VERSION=0.4.0
    export SMART_GATEWAY_VERSION=0.3.0
    export C2S_SOF_API_VERSION=0.6.0
    export C2S_SOF_UI_VERSION=0.6.0
    export OCP_UAA_VERSION=4.8.0-10
}

# Start Method
function appServerConfig() {
    defaultConfig
    OCPVersions

    # Edge Server configuraiton
    export OCP_APP_HOST=your_app_server_host

    # Config Server Configuration
    export BASIC_AUTH_USER=your_basic_auth_user
    export BASIC_AUTH_PASSWORD=your_basic_auth_password

    # This variable is only required to give server environment specific profile
    # data added in config-data repository
    # export ENV_APP_PROFILE=your_app_Server_specific_profile

    # This variable is only required if encrypted values are available in the server environment specific profile
    # conofig data variables
    #export CONFIG_DATA_ENCRYPT_KEY=your_config_data_encrypt
 }

appServerConfig


