class Blue extends Obstacle
{
  PImage blueMon;
  
  Blue()
  {
    picWidth = (width / 2.8) / 6;
    picHeight = (height / 1.25) / 4;
    location = new PVector(width * 0.6, surfaceHeight - picHeight);
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
      enemies.remove(this);
    }
  }
  
  // when a blue enemy hits the player
  void playerCollision()
  {
    if (player.topRightBody.x >= location.x + picHeight * 0.05 && player.bottomRightBody.y >= location.y
          && player.bottomLeftBody.y >= location.y)
    {
      // due to shoulders being lower than head and arms slanted
      if (player.bottomLeftBody.y >= location.y + (picWidth * 0.35) && player.topLeftBody.x < location.x + picWidth * 0.95)
      {
        noLoop();
      }
    }
  }
}