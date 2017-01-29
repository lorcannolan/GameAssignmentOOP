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
      location.x = width + picWidth;
    }
    
    // check if blue and green enemies are too close or intersecting
    if (green.location.x - (location.x + picWidth) <= width / 2 && 
                (green.location.x + green.picWidth) - location.x >= -(width / 2) )
    {
      location.x = green.location.x + green.picWidth + (width / 2);
    }
  }
}