class Red extends Obstacle
{
  PImage redMon;
  
  Red()
  {
    picWidth = (width / 2.8) / 8;
    picHeight = (height / 1.25) / 8;
    location = new PVector(width * 0.6, surfaceHeight - picHeight);
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
  }
  
  // when a red enemy hits the player
  void playerCollision()
  {
    if (player.topRightBody.x >= location.x && player.bottomRightBody.y >= location.y
          && player.bottomLeftBody.y >= location.y)
    {
      if (player.topLeftBody.x < location.x + picWidth)
      {
        background(0);
      }
    }
  }
}