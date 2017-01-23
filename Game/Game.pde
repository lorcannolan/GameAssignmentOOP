Player player;
Obstacle obstacle;

void setup()
{
  size(500, 500, P2D);
  //fullScreen(P2D);
  player = new Player(width / 2, height / 2, height / 20);
  surfaceHeight = height - height / 20;
  obstacle = new Obstacle();
}

float surfaceHeight;
boolean[] keys = new boolean[1000];

void draw()
{
  background(255);
  
  stroke(0, 0, 255);
  strokeWeight(2);
  line(0, surfaceHeight, width, surfaceHeight);
  
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