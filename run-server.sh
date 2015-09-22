#!/bin/bash

if [ ! -d build ]; then
	mkdir build
fi

../bin/cascadenik-compile.py layers.mml build/default.xml

../bin/uwsgi --http :10080 --wsgi-file gdtile.py
