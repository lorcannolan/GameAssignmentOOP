class Red extends Obstacle
{
  PImage redMon;
  boolean moveDown, moveUp;
  
  Red()
  {
    picWidth = (width / 2.8) / 8;
    picHeight = (height / 1.25) / 8;
    location = new PVector(width * 1.2, surfaceHeight - picHeight);
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
    
    // move red enemy up and down
    if (location.y <= surfaceHeight - (picHeight * 2))
    {
      moveUp = false;
      moveDown = true;
    }
    else if (location.y + picHeight >= surfaceHeight)
    {
      moveUp = true;
      moveDown = false;
    }
    
    // only move when score is higher than 13
    if (moveUp && score > 13)
    {
      location.y -= 3;
    }
    else if (moveDown && score > 13)
    {
      location.y += 3;
    }
  }
  
  // when a red enemy hits the player
  void playerCollision()
  {
    if (player.topRightBody.x >= location.x + picHeight * 0.05 && player.bottomRightBody.y >= location.y
          && player.bottomLeftBody.y >= location.y)
    {
      if (player.topLeftBody.x < location.x + picWidth)
      {
        noLoop();
      }
    }
  }
}