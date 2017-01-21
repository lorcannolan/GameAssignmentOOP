Player player;

void setup()
{
  size(500, 500);
  player = new Player(width / 2, height / 2, width / 10);
  surfaceHeight = height - height / 20; 
}

float surfaceHeight;

void draw()
{
  background(255);
  
  stroke(0, 0, 255);
  strokeWeight(2);
  line(0, surfaceHeight, width, surfaceHeight);
  
  player.display();
  player.update();
}