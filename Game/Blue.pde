class Blue extends Obstacle
{
  PImage blueMon;
  
  Blue()
  {
    picWidth = (width / 2.8) / 6;
    picHeight = (height / 1.25) / 4;
    location = new PVector(width * 2.2, surfaceHeight - picHeight);
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
      location.x = (width * 2.2) + picWidth;
    }
    
    // check if blue and green enemies are too close or intersecting
    if (green.location.x - (location.x + picWidth) <= width / 4 && 
                (green.location.x + green.picWidth) - location.x >= -(width / 4) )
    {
      location.x = green.location.x + green.picWidth + (width / 4);
    }
  }
}