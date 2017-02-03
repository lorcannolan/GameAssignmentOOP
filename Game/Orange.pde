class Orange extends Obstacle
{
  PImage orangeMon;
  
  Orange()
  {
    picWidth = (width / 2.8) / 4;
    picHeight = (height / 1.25) / 6;
    location = new PVector(width * 0.8, surfaceHeight - picHeight);
    orangeMon = loadImage("orangeMonstar.png");
  }
  
  void display()
  {
    image(orangeMon, location.x, location.y, picWidth, picHeight);
  }
  
  void update()
  {
    location.x -= speed;
    println("red location.x = " + location.x);
    if (location.x + picWidth <= 0)
    {
      enemies.remove(this);
    }
    
    // check if orange and blue enemies are too close or intersecting
    //if (blue.location.x - (location.x + picWidth) <= width / 4 && 
    //            (blue.location.x + blue.picWidth) - location.x >= -(width / 4) )
    //{
    //  location.x = blue.location.x + blue.picWidth + (width / 4);
    //}
    //// check if orange and green enemies are too close or intersecting
    //if (green.location.x - (location.x + picWidth) <= width / 4 && 
    //            (green.location.x + green.picWidth) - location.x >= -(width / 4) )
    //{
    //  location.x = green.location.x + green.picWidth + (width / 4);
    //}
    // check if orange and red enemies are too close or intersecting
    //if (red.location.x - (location.x + picWidth) <= width / 4 && 
    //            (red.location.x + red.picWidth) - location.x >= -(width / 4) )
    //{
    //  location.x = red.location.x + red.picWidth + (width / 4);
    //}
  }
}