#!/bin/bash

echo Provision script for PRIMARY mongodb ONLY

mongo -u admin -p 1234 admin /vagrant/init-repl.js

# done
