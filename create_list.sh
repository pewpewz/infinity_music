#!/bin/bash

#=============================================================#
# Name:         Infinity Music                                #
# Description:  Recursively grab a random list of mp3 files   #
#				from your collection of music to create       #
#				a playlist.                                   #
# Version:      ver 1.0                                       #
# Data:         02.02.2018                                    #
# Author:       Terry Lee                                     #
# Author URI:   http://hoooked.com                            #
# Email:        terry@skimpon.com                             #
# License:      GNU General Public License, version 3 (GPLv3) #
# License URI:  http://www.gnu.org/licenses/gpl-3.0.html      #
#=============================================================#

source config.sh

function aggregateAllMusicFiles {

	musicFiles=()
	cd $MUSIC_FOLDER
	for file in $(find $MUSIC_FOLDER -name '*.mp3'); do
		dir=$(realpath "${file}")
   		musicFiles+=("$dir")
   		echo "$dir" >> $playList
	done
}

function createPlayListFile {
	cd $ROOT_FOLDER
	touch "playlist.txt"
}

createPlayListFile
aggregateAllMusicFiles
