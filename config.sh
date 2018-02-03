#=============================================================#
# Name:         Infinity Music                                #
# Description:  Recursively grabs random list of music files  #
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

##REQUIRED SETTINGS
#replace this with your installation folder
ROOT_FOLDER="/Users/terry/Work/music"
#replace this with your Root music folder
MUSIC_FOLDER="/Users/terry/Documents/MUSIC"
#this is where your music files will be copied to
MUSIC_FILES="/Users/terry/Work/music/playlist"

#number of songs you would like to use in your playlist
NUMBER_OF_SONGS=250

#don't edit below ------------------
playList="$ROOT_FOLDER/playlist.txt"