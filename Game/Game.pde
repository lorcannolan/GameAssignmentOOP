Player player;
Obstacle obstacle;
PImage court, blue, standR, standL;

void setup()
{
  //size(500, 500, P2D);
  fullScreen(P2D);
  standL = loadImage("mjStanding.png");
  standR = loadImage("mjStandingRight.png");
  surfaceHeight = height - height / 20;
  player = new Player(0, height / 2, (width / 2.8) / 8, (height / 1.25) / 6);
  blue = loadImage("blueMonstar.png");
  obstacle = new Obstacle();
  court = loadImage("court.png");
}

float surfaceHeight;
boolean[] keys = new boolean[1000];

void draw()
{
  background(255);
  
  stroke(0, 0, 255);
  strokeWeight(2);
  image(court, 0, height - height / 10, width, height / 10);
  //line(0, surfaceHeight, width, surfaceHeight);
  
  
  translate(-player.location.x + (width / 25), 0);
  
  player.display();
  player.update();
  player.addVelocity();
  obstacle.display();
  obstacle.update();
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