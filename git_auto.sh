#!/bin/bash
#======================================== ==================================
#     FILE:                                git_auto.sh
#     AUTHOR:                        Helpi_Stone
#     EMAIL:                             helpi9007@gmail.com
#     CREATED:                      2017-10-09
#
#     MODIFIED BY:                Helpi_Stone
#     MODIFIED DATE:           2017-10-09
#
#     DESCRIPTION:               "Beschreibung"
#
#     VERSION:                        1.0
#======================================== ==================================

git add -A
git commit -m "$0"
git pull
git push
