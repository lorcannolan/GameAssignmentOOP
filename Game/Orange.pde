class Orange extends Obstacle
{
  PImage orangeMon;
  
  Orange()
  {
    picWidth = (width / 2.8) / 4;
    picHeight = (height / 1.25) / 6;
    location = new PVector(width * 1.2, surfaceHeight - picHeight);
    orangeMon = loadImage("orangeMonstar.png");
  }
  
  void display()
  {
    image(orangeMon, location.x, location.y, picWidth, picHeight);
  }
  
  void update()
  {
    location.x -= speed;
    println("orange location.x = " + location.x);
    if (location.x + picWidth <= 0)
    {
      enemies.remove(this);
    }
  }
}