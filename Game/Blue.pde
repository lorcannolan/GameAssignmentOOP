class Blue extends Obstacle
{
  PImage blueMon;
  
  Blue()
  {
    picWidth = (width / 2.8) / 6;
    picHeight = (height / 1.25) / 4;
    location = new PVector(width * 1.2, surfaceHeight - picHeight);
    blueMon = loadImage("blueMonstar.png");
  }
  
  void display()
  {
    image(blueMon, location.x, location.y, picWidth, picHeight);
  }
  
  void update()
  {
    location.x -= speed;
    println("blue location.x = " + location.x);
    if (location.x + picWidth <= 0)
    {
      enemies.remove(this);
    }
  }
}