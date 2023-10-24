#!/bin/sh
IDE=/E/itch/tic80/tic80 
CART=jetlag2023
ITCH_USER=thegrumpygamedev
ITCH_PROJECT=jetlag2023

rm -rf ./pub-linux
mkdir ./pub-linux
$BUILD --cli --fs=. --cmd "load $CART.tic & export linux ./pub-linux/$CART alone=1 & exit" 
butler push pub-linux $ITCH_USER/$ITCH_PROJECT:linux

rm -rf ./pub-windows
mkdir ./pub-windows
$BUILD --cli --fs=. --cmd "load $CART.tic & export win ./pub-windows/$CART alone=1 & exit" 
butler push pub-windows $ITCH_USER/$ITCH_PROJECT:windows

rm -rf ./pub-mac
mkdir ./pub-mac
$BUILD --cli --fs=. --cmd "load $CART.tic & export mac ./pub-mac/$CART alone=1 & exit" 
butler push pub-mac $ITCH_USER/$ITCH_PROJECT:mac

rm -rf ./pub-html
mkdir ./pub-html
$BUILD --cli --fs=. --cmd "load $CART.tic & export html ./pub-html/$CART.zip alone=1 & exit" 
butler push pub-html/$CART.zip $ITCH_USER/$ITCH_PROJECT:html

git add -A
git commit -m "shipped it!"