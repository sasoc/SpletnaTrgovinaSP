#!/bin/bash 
cd ..
cd SpletnaTrgovina
rake db:create
rake db:migrate
rake db:seed