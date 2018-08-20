#!/bin/bash

# Declare methods start
function defaultConfig() {
    export OCP_BASE_PATH=/usr/local
    export ENV_APP_PROFILE=application-aws-qa

    # Edge Server configuraiton
    export OCP_APP_PORT=80
   }

function OCPVersions(){
    export OCP_CONFIG_SERVER_VERSION=0.1.0
    export OCP_DISCOVERY_SERVER_VERSION=0.1.0
    export OCP_EDGE_SERVER_VERSION=0.3.0
    export OCP_FIS_VERSION=0.16.0
    export OCP_UI_VERSION=0.16.0
    export OCP_UI_API_VERSION=0.16.0
    export SMART_CORE_VERSION=0.3.0
    export SMART_GATEWAY_VERSION=0.3.0
    export C2S_SOF_API_VERSION=0.5.0
    export C2S_SOF_UI_VERSION=0.5.0
    export UAA_VERSION=4.8.0-08
}

# Start Method
function appServerConfig() {
    defaultConfig
    OCPVersions
    # This variable is only required in 'two-servers' deployment scenario, so it MUST be uncommented and configured accordingly in 'two-servers' deployment.
    export C2S_DB_HOST=your_db_server_host

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


