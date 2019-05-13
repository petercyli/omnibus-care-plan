#!/bin/bash

# Declare methods start
function defaultConfig() {
    export OCP_BASE_PATH=/usr/local
    export ENV_APP_PROFILE=oneserver

    # UAA Database details
    export UAA_BASE_PATH=/usr/local
    export UAA_DB_USER=postgres
    export UAA_DB_PASSWORD=

    export UAA_DB_PORT=5432
    export UAA_DB_HOST=uaa-db.ocp.com

    export FHIR_DB_PASSWORD=

    # UAA_APP default port is 80, need to configured as not to conflict with OCP_EDGE_Server
    export UAA_APP_PORT=8080

    # SMTP details
    export UAA_SMTP_HOST=smtp.gmail.com
    export UAA_SMTP_PORT=587
    export UAA_SMTP_USER=consent2share@gmail.com
    export UAA_SMTP_PASSWORD=m0vyVUUgfR5u

    # Edge Server configuration
    export OCP_APP_PORT=80

    export HOST_IP=ocp-apps-elb-811293208.us-east-2.elb.amazonaws.com
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

    # Edge Server configuration
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


