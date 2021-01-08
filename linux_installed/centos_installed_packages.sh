#!/bin/bash

installed_packages=$(yum list installed)

echo ${installed_packages} > /tmp/installed_packages.log
echo ${installed_packages}