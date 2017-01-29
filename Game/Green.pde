class Green extends Obstacle
{
  PImage greenMon;
  
  Green()
  {
    picWidth = (width / 2.8) / 4;
    picHeight = (height / 1.25) / 5;
    location = new PVector(width * 2, surfaceHeight - picHeight);
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
      location.x = (width * 2) + picWidth;
    }
    
    // check if green and red enemies are too close or intersecting
    if (red.location.x - (location.x + picWidth) <= width / 4 && 
                (red.location.x + red.picWidth) - location.x >= -(width / 4) )
    {
      location.x = red.location.x + red.picWidth + (width / 4);
    }
  }
}