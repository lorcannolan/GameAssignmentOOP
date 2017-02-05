class Green extends Obstacle
{
  PImage greenMon;
  
  Green()
  {
    picWidth = (width / 2.8) / 4;
    picHeight = (height / 1.25) / 5;
    location = new PVector(width * 0.6, surfaceHeight - picHeight);
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
      enemies.remove(this);
    }
  }
  
  // when a green enemy hits the player
  void playerCollision()
  {
    if (player.topRightBody.x >= location.x + picHeight * 0.05 && player.bottomRightBody.y >= location.y
          && player.bottomLeftBody.y >= location.y)
    {
      if (player.bottomLeftBody.y >= location.y + (picWidth * 0.05) && player.topLeftBody.x < location.x + picWidth)
      {
        noLoop();
      }
    }
  }
}