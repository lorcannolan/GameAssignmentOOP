Player player;
Obstacle blue, green, red, orange, purple;
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
  red = new Red();
  orange = new Orange();
  purple = new Purple();
  court = loadImage("court.png");
  score = 0;
}

int score;
float surfaceHeight;
boolean[] keys = new boolean[1000];

void draw()
{
  background(255);
  image(court, 0, height - height / 10, width, height / 10);
  fill(0);
  textAlign(CENTER);
  textSize(50);
  text("Score: " + score, width/2, height / 20);
  
  player.display();
  player.update();
  player.addVelocity();
  
  if (score >= 0 && score < 11)
  {
    red.display();
    red.update();
    orange.display();
    orange.update();
  }
  else
  {
    blue.display();
    blue.update();
    green.display();
    green.update();
    purple.display();
    purple.update();
  }
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