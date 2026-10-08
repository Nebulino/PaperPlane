#!/bin/sh
echo "Cleaning .g.dart build objects."
find lib -name "*.g.dart" -type f -delete
echo "Remember to run at least once build.sh."
