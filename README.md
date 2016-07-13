# sitedbaas-docker

This cookbook stands up a simple website based on the [twitter bootstrap](http://getbootstrap.com/) framework. It utilizes *Chef Automate* to
test and deploy changes to the cookbook.

## Chef Automate - Workflow

This cookbook was created to be used with Workflow in Chef Automate. There is
a `.delivery/` subdirectory that contains a `config.json` file and a
`build-cookbook subdirectory that defines the testing for this cookbook`

## Docker

This cookbook utilizes Docker to provision ephemeral Acceptance, Union,
Rehearsal and Delivered Nodes to test changes. The dependencies to make Docker
work in Workflow are defined in the build-cookbook's default.rb

## Container configuration

The Docker AURD nodes utilized a docker container published to dockerhub that
is configured to bootstrap itself to a Chef Server. In order to leverage this
in your Workflow environment, you will need to create a docker container `TODO:
link example dockerfile here`

## supported platforms
This cookbook has been tested on:
* Ubuntu 14.04

## pre-requisites
This cookbook has a dependency on:
* [httpdbaas](https://github.com/binamov/httpdbaas) cookbook

## Usage
You can just add `recipe[sitedbaas-docker]` to the run_list of your node
