class Blue extends Obstacle
{
  PImage blueMon;
  
  Blue()
  {
    picWidth = (width / 2.8) / 6;
    picHeight = (height / 1.25) / 4;
    location = new PVector(width, surfaceHeight - picHeight);
    blueMon = loadImage("blueMonstar.png");
  }
  
  void display()
  {
    image(blueMon, location.x, location.y, picWidth, picHeight);
  }
  
  void update()
  {
    println("blue location.x = " + location.x);
    if (location.x + picWidth + (width / 25) <= player.location.x)
    {
      location.x = player.location.x + width + picWidth;
    }
  }
}