class Green extends Obstacle
{
  PImage greenMon;
  
  Green()
  {
    picWidth = (width / 2.8) / 4;
    picHeight = (height / 1.25) / 5;
    location = new PVector(width * 1.6, surfaceHeight - picHeight);
    greenMon = loadImage("greenMonstar.png");
  }
  
  void display()
  {
    image(greenMon, location.x, location.y, picWidth, picHeight);
  }
  
  void update()
  {
    println("blue location.x = " + location.x);
    if (location.x + picWidth + (width / 25) <= player.location.x)
    {
      location.x = player.location.x + (width * 1.6) + picWidth;
    }
  }
}