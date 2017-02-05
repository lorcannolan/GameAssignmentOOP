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
  
  // when a purple enemy hits the player
  void playerCollision()
  {
    if (player.topRightBody.x >= location.x && player.bottomRightBody.y >= location.y)
    {
      // to account for the purple monster's triangular shape
      if (player.bottomLeftBody.y >= location.y + (picWidth * 0.5) && player.topLeftBody.x < location.x + picWidth)
      {
        noLoop();
      }
    }
  }
}