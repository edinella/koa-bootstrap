vagrant-node-es6
================

Node.JS environment bootstrap for testing es6 features on Node.js + MongoDB.

This repo is a bootstrap vagrant-based project using Node.js and MongoDB.

By default, it uses the quantal64 vagrant base box. To start your project, complete the following steps:

*Download and install vagrant, if you haven't already (http://downloads.vagrantup.com/)*

    git clone https://github.com/edinella/node-es6-bootstrap.git
    cd node-es6-bootstrap
    vagrant up

Wait a few moments while your VM is powered on and configured. Now you can access your VM using

    vagrant ssh
    npm start

Now you can bring up your local browser and browse to http://192.168.33.10:3000 to see your Node app in action!
