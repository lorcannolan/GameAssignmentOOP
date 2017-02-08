# GameAssignmentOOP
This GitHub repository is for an assignment from semester 2 of my Object-Oriented Programming module from my second year of college. For this assignment, I was required to make a game which should have “significant amount of clever animation or gameplay" and "multiple modes or screens". A summary of instructions on how to play the game is included in the game.

While brainstorming for this game I decided to try to make a basic platformer game. However I wanted to have a theme to base the game off. Pretty early on I decided to make the theme of the game based on the movie Space Jam. The reason for this was that there are enemies in this movie that I could base my enemies off. Also, the user could play as Michael Jordan and I had ideas for power-ups such as Michael's Secret Stuff to make the user move quicker and a power-up to make the user jump higher.

->Intro:

When the game is started, the music starts and a background image is shown. A message flashes on the screen, displaying for 20 frames then disappearing for 20 frames. The message loops in this manner until you press the space bar to continue to the menu screen.

->Menu:

The menu displays a new image, two buttons to play the game or display instructions and a message to tell you to press q to quit the game. When you hover over the play and instructions buttons they change colour. To enter each options you simply just click while you are hovered over the button.

->Instructions:

This screen displays text on the screen explaining the simple controls and what the power-ups do. It also shows an arrrow which is similar to the buttons on the main menu. When clicked it returns you to the main menu.

->Play:

While playing the game the Michael Jordan sprite is moved by using the left and right arrow keys. To jump you use the up key. The user can only move the sprite within the region of the 0 and half the width of the screen. When the user chooses to jump, a force is applied to the y velocity value which changes the y location value of the sprite. When the sprite is above ground there is a downward force applied to the y velocity value to make the player return to ground level.
There background images and floor images are put into two separate PImage arrays whch loop when the top left of the images reaches a value of -width of the screen.
The enemies are added to an array list depending on the frame count(which depends on what score the user is on) and then removed once they reach the far side of the screen. The higher the score the tougher the enemies become to overcome.
This is where the power-ups help. Collecting the carrot will increase the height of you jump and collecting Michael's Secret Stuff will double you speed.
When you hit an enemy a game over message displays and the screen freezes. If you press e during the game over screen you will return to the main menu screen. If you press r you will replay the game again.

(Recording the video slowed down the run speed of the game)
[![Video](http://img.youtube.com/vi/OXELBLF-kQk/0.jpg)](http://www.youtube.com/watch?v=OXELBLF-kQk&feature=youtu.be)
