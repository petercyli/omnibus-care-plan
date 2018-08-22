#!/bin/bash
echo "This script is used to setup server configuration for Omnibus Care Plan."

# server option to setup
serverOption[1]="1. OCP App Server"

#function will be executed based on choice
serverConfig[1]=AppServerConfig


for each in "${serverOption[@]}"
do
  echo "$each"
done

echo -n "Please select a server to setup:"
read serverEnv

if [[ -z "$serverEnv" ]]
  then
    echo "No server option selected. "
    exit 1
fi

sudo su << SudoUser
    # Declare methods start

    function defaultConfig() {
        # OCP_PROPS Directories
        mkdir /usr/local/java/
        mkdir /usr/local/java/OCP_PROPS/
    }

    function defaultAppServerConfig() {
        defaultConfig
        # OCP_PROPS Directories
        mkdir /usr/local/java/OCP_PROPS/uaa
        mkdir /usr/local/java/keystore

        ## Fetch uaa.yml from ocp-uaa repo and place it under uaa directory
        curl https://github.com/FEISystems/ocp-uaa/blob/master/external-configuration/uaa.yml > /usr/local/java/OCP_PROPS/uaa/uaa.yml

        ## Clone the ocp configuration data rep to '/usr/local/java' sub folder.
        cd /usr/local/java/OCP_PROPS
        git clone https://github.com/FEISystems/ocp-config-data
     }

    function AppServerConfig() {
        defaultAppServerConfig

        ## Copy the docker compose file to ‘/usr/local/java’ sub folder
        curl https://github.com/FEISystems/omnibus-care-plan/blob/master/infrastructure/deployment/docker-compose_ocp_app.yml > /usr/local/java/docker-compose.yml

        ## Copy the environment variables file to ‘/etc/profile.d’ sub folder
        curl https://github.com/FEISystems/omnibus-care-plan/blob/master/infrastructure/scripts/env/ocp_app_env.sh > /etc/profile.d/ocp_env.sh

     }

    # Declare methods end

    # Start running script
    echo "Server env " : ${serverOption[$serverEnv]}
    ${serverConfig[$serverEnv]}
SudoUser