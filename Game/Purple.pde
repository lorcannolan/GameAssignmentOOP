class Purple extends Obstacle
{
  PImage purpleMon;
  
  Purple()
  {
    picWidth = (width / 2.8) / 4;
    picHeight = (height / 1.25) / 5.5;
    location = new PVector(width * 2, surfaceHeight - picHeight);
    purpleMon = loadImage("purpleMonstar.png");
  }
  
  void display()
  {
    image(purpleMon, location.x, location.y, picWidth, picHeight);
  }
  
  void update()
  {
    location.x -= speed;
    println("red location.x = " + location.x);
    if (location.x + picWidth <= 0)
    {
      location.x = (width * 2) + picWidth;
    }
    
    // check if purple and blue enemies are too close or intersecting
    if (blue.location.x - (location.x + picWidth) <= width / 4 && 
                (blue.location.x + blue.picWidth) - location.x >= -(width / 4) )
    {
      location.x = blue.location.x + blue.picWidth + (width / 4);
    }
    // check if purple and green enemies are too close or intersecting
    if (green.location.x - (location.x + picWidth) <= width / 4 && 
                (green.location.x + green.picWidth) - location.x >= -(width / 4) )
    {
      location.x = green.location.x + green.picWidth + (width / 4);
    }
    // check if purple and red enemies are too close or intersecting
    if (red.location.x - (location.x + picWidth) <= width / 4 && 
                (red.location.x + red.picWidth) - location.x >= -(width / 4) )
    {
      location.x = red.location.x + red.picWidth + (width / 4);
    }
    // check if purple and orange enemies are too close or intersecting
    if (orange.location.x - (location.x + picWidth) <= width / 4 && 
                (orange.location.x + orange.picWidth) - location.x >= -(width / 4) )
    {
      location.x = orange.location.x + orange.picWidth + (width / 4);
    }
  }
}