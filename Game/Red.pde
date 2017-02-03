class Red extends Obstacle
{
  PImage redMon;
  
  Red()
  {
    picWidth = (width / 2.8) / 8;
    picHeight = (height / 1.25) / 8;
    location = new PVector(width * 0.9, surfaceHeight - picHeight);
    redMon = loadImage("redMonstar.png");
  }
  
  void display()
  {
    image(redMon, location.x, location.y, picWidth, picHeight);
  }
  
  void update()
  { 
    location.x -= speed;
    println("red location.x = " + location.x);
    if (location.x + picWidth <= 0)
    {
      enemies.remove(this);
    }
    
    // check if red and blue enemies are too close or intersecting
    //if (blue.location.x - (location.x + picWidth) <= width / 4 && 
    //            (blue.location.x + blue.picWidth) - location.x >= -(width / 4) )
    //{
    //  location.x = blue.location.x + blue.picWidth + (width / 4);
    //}
  }
}