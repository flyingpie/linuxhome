#!/bin/bash

echo "Removing current origin..."
git remote remove origin

echo "Adding ssh origin..."
git remote add origin git@github.com:FlyingPie/linuxhome.git
