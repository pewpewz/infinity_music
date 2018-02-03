#!/bin/bash

#=============================================================#
# Name:         Infinity Music                                #
# Description:  Recursively grabs random list of music files  #
#               from your collection of music to create       #
#               a playlist.                                   #
# Version:      ver 1.0                                       #
# Data:         02.02.2018                                    #
# Author:       Terry Lee                                     #
# Author URI:   http://hoooked.com                            #
# Email:        terry@skimpon.com                             #
# License:      GNU General Public License, version 3 (GPLv3) #
# License URI:  http://www.gnu.org/licenses/gpl-3.0.html      #
#=============================================================#

#               	USAGE:
#		first, edit config.sh file
#		chmod +x infinity_music.sh
#		chmod +x rename.sh
#		chmod +x create_list.sh
#		chmod +x realpath.sh
#		create symbolic link: ln -s /your/path/realpath.sh /usr/local/bin/realpath
#		then type below to run:
#		./infinity_music.sh

source config.sh

function organizeFiles {

	musicFiles=()

	while IFS= read line
	do
	    dir=$(realpath "${line}")
   		musicFiles+=("$dir")
	done <"$playList"
}

function printFiles {

	for file in ${musicFiles[@]}; do
  		echo ${file}
	done
}

function createPlaylist {

	i=0
	while [ $i -le $NUMBER_OF_SONGS ]; do
		echo "i:$i"
		getRandomSong
		((i+=1))
	done
}

function getRandomSong {

	randomNum=$(( $RANDOM % ${#musicFiles[@]} ))
	randomSong=${musicFiles[$randomNum]}
	echo "adding file:${randomSong}"
	#copies song
	ln -s ${randomSong} ${MUSIC_FILES}
	#removes song from array
	deleteSong ${randomSong}
}

function deleteSong {

	delete=$1
	temp=${musicFiles[@]/$delete}
	musicFiles=()
	musicFiles=($temp)
}

function updatePlayList {

	rm $playList
	touch $playList
	for file in ${musicFiles[@]}; do
		echo "new file:$file"
		echo "$file" >> $playList
	done
}


if [ ! -f $playList ]; then
	./rename.sh
	./create_list.sh
    echo "playlist.txt not found!"
    echo "creating playlist.txt... please hold, 
    this can take several minutes depending on 
    how many files you have in your music collection..."
fi
echo "updating playlist... please hold..."

cd $MUSIC_FILES
organizeFiles
createPlaylist
updatePlayList
