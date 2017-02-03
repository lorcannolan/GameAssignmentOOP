class Purple extends Obstacle
{
  PImage purpleMon;
  
  Purple()
  {
    picWidth = (width / 2.8) / 4;
    picHeight = (height / 1.25) / 5.5;
    location = new PVector(width * 1.2, surfaceHeight - picHeight);
    purpleMon = loadImage("purpleMonstar.png");
  }
  
  void display()
  {
    image(purpleMon, location.x, location.y, picWidth, picHeight);
  }
  
  void update()
  {
    location.x -= speed;
    println("purple location.x = " + location.x);
    if (location.x + picWidth <= 0)
    {
      enemies.remove(this);
    }
  }
}