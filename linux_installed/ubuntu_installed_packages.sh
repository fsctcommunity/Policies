#!/bin/bash

installed_packages=$(apt list --installed)

echo ${installed_packages} > /tmp/installed_packages.log
echo ${installed_packages}