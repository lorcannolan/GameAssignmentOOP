Player player;
Obstacle obstacle;
Environment world;
PImage court, blue;

void setup()
{
  size(500, 500, P2D);
  //fullScreen(P2D);
  player = new Player(0, height / 2, height / 20);
  surfaceHeight = height - height / 20;
  obstacle = new Obstacle();
  world = new Environment(width * 2, height * 2, height / 10, height / 10);
  court = loadImage("court.png");
  blue = loadImage("blueMonstar.png");
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
  
  if (player.location.x >= 0 && player.location.x <= width)
  {
    translate(-player.location.x + width / 2, 0);
  }
  else if (player.location.x < 0)
  {
    translate(width / 2, 0);
  }
  else if (player.location.x > width)
  {
    translate(-(width / 2), 0);
  }
  
  player.display();
  player.update();
  player.addVelocity();
  obstacle.display();
  obstacle.update();
  world.ground();
  world.displayGround();
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