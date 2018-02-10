# infinity_music
Bash program to help create a playlist from your music collection

This program will help you create a playlist with any number of songs you like out of all the songs you have.

Problem: My shuffle has enough space to hold 250 songs.
I have over 3000 songs in my collection, so it's too time consuming to pick out the ones I like at anyone time.
I want to be able to sample all the songs at least once, and they need to be randomized.

Solution: Create a list of songs in my collection. Pick 250 songs from the collection at random. Store the songs 
that weren't picked for the playlist and place them in a flat text file. 

When I need to create a second playlist after I'm done listening to the 250 songs, 
this app will reference from the stored flat text file, thereby, enabling me to never have to listen to the same
song twice, even if my collection grows to 10,000 songs.

#               	USAGE:
#		first, edit config.sh file
#		chmod +x infinity_music.sh
#		chmod +x rename.sh
#		chmod +x create_list.sh
#		chmod +x realpath.sh
#		create symbolic link: ln -s /your/path/realpath.sh /usr/local/bin/realpath
#		then type below to run:
#		./infinity_music.sh
