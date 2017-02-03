class Green extends Obstacle
{
  PImage greenMon;
  
  Green()
  {
    picWidth = (width / 2.8) / 4;
    picHeight = (height / 1.25) / 5;
    location = new PVector(width * 1.2, surfaceHeight - picHeight);
    greenMon = loadImage("greenMonstar.png");
  }
  
  void display()
  {
    image(greenMon, location.x, location.y, picWidth, picHeight);
  }
  
  void update()
  {
    location.x -= speed;
    println("green location.x = " + location.x);
    if (location.x + picWidth <= 0)
    {
      enemies.remove(this);
    }
  }
}