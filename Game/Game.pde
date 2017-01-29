Player player;
Obstacle blue, green;
PImage court, standR, standL;

void setup()
{
  //size(1000, 750, P2D);
  fullScreen(P2D);
  standL = loadImage("mjStanding.png");
  standR = loadImage("mjStandingRight.png");
  surfaceHeight = height - height / 20;
  player = new Player(width / 4, height / 2, (width / 2.8) / 8, (height / 1.25) / 6);
  blue = new Blue();
  green = new Green();
  court = loadImage("court.png");
}

float surfaceHeight;
boolean[] keys = new boolean[1000];

void draw()
{
  background(255);
  image(court, 0, height - height / 10, width, height / 10);
  
  player.display();
  player.update();
  player.addVelocity();
  blue.display();
  blue.update();
  green.display();
  green.update();
}

void keyPressed()
{ 
  keys[keyCode] = true;
}
 
void keyReleased()
{
  keys[keyCode] = false; 
}

boolean checkKey(int k)
{
  if (keys.length >= k) 
  {
    return keys[k] || keys[Character.toUpperCase(k)];  
  }
  return false;
}