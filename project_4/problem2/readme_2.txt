Hi, Robert.

For this project I have provided the directory: 'vendors' which contains a few text files meant to represent vendor information of some kind.
 
The files each ucontain a series of arbitrary numbers. Well, we are using them as strings of course but it keeps is simple.

Each file contains an entry for the numbers '1984' and '1550'so that we can have a couple of consistent search targets.

I've added a couple more text tools into the select statement for the user to choose from, as well as a 'faketool' option that is intentionally null.

I've put in a nexted if-then statement that tests if the user's tool selection is in fact installed and executable.
If so, it opens the appropriate file with the chosen text manipulation tool. If not, it displays a message and exits.

If I were righting this for a specific distribution I would probably include an option to actually install the tool.
But for now it just prompts the user to do so. Maybe I will continue to improve it.

The 'faketool' option is there in order to test error handling if the script can't find what the user selects,
since many people will probably actually have all the text tools listed in the menu installed of their system.
