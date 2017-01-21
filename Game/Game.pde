Player player;

void setup()
{
  size(500, 500);
  player = new Player(width / 2, height / 2, width / 10); 
}

void draw()
{
  background(255);
  player.display();
}