#!/bin/bash
#======================================== ==================================
#     FILE:             git_push_funwords.sh
#     AUTHOR:                        Helpi_Stone
#     EMAIL:                             helpi9007@gmail.com
#     CREATED:                      2017-10-09
#
#     MODIFIED BY:      macbook
#     MODIFIED DATE:    2017-11-04
#
#     DESCRIPTION:               "Beschreibung"
#
#     VERSION:                        1.0
#======================================== ==================================


FUN_WORDS=(Abibliophobia Absquatulate Allegator Anencephalous Argle-bargle Batrachomyomachy Billingsgate Bloviate Blunderbuss Borborygm Boustrophedon Bowyang Brouhaha Bumbershoot Callipygian Canoodle Cantankerous Catercornered Cockalorum Cockamamie Codswallop Collop Collywobbles Comeuppance Crapulence Crudivore Discombobulate Donnybrook Doozy Dudgeon Ecdysiast Eructation Fard Fartlek Fatuous Filibuster Firkin Flibbertigibbet Flummox Folderol Formication Fuddy-duddy Furbelow Furphy Gaberlunzie Gardyloo! Gastromancy Gazump Gobbledygook Gobemouche Godwottery Gongoozle Gonzo Goombah Hemidemisemiquaver Hobbledehoy Hocus-pocus Hoosegow Hootenanny Jackanapes Kerfuffle Klutz La-di-da Lagopodous Lickety-split Lickspittle Logorrhea Lollygag Malarkey Maverick Mollycoddle Mugwump Mumpsimus Namby-pamby Nincompoop Oocephalus Ornery Pandiculation Panjandrum Pettifogger Pratfall Quean Rambunctious Ranivorous Rigmarole Shenanigan Sialoquent Skedaddle Skullduggery Slangwhanger Smellfungus Snickersnee Snollygoster Snool Tatterdemalion Troglodyte Turdiform Unremacadamized Vomitory Wabbit Widdershins Yahoo)

# Pick random word
INDEX=$((RANDOM % 99))

git add -A
# git commit -m "$(date +%Y-%m-%d %H:%M:%S)"
git commit -m "${FUN_WORDS[$INDEX]}"
git push
