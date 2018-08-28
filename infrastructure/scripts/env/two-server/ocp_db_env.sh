#!/bin/bash

# Declare methods start
function defaultConfig() {
    # UAA Database details
    export UAA_DB_PASSWORD=your_db_password

    # UAA_APP default port is 80, need to configured as not to conflict with OCP_EDGE_Server
    export FHIR_DB_PASSWORD=your_db_password

   }

# Start Method
function appServerConfig() {
    defaultConfig
 }

appServerConfig


