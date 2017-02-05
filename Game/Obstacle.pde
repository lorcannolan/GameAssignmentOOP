class Obstacle
{
  PVector location;
  float picWidth, picHeight;
  float speed;
  int beyond, check;
  
  Obstacle()
  {
    this.speed = width * 0.002;
    beyond = check;
  }
  
  void display()
  {
  }
  
  void update()
  {
  }
  
  void updateScore()
  {
    // check if player has jumped over enemy
    if (location.x + picWidth < player.location.x)
    {
      beyond = 1;
    }
    else 
    {
      beyond = 0;
      check = beyond;
    }
    
    // update score
    if (beyond == 1 && beyond != check)
    {
      score += 1;
      check = beyond;
    }
  }
  
  // when a green enemy hits the player
  void playerCollision()
  {
    if (player.topRightBody.x >= location.x && player.bottomRightBody.y >= location.y
          && player.bottomLeftBody.y >= location.y)
    {
      if (player.topLeftBody.x < location.x + picWidth)
      {
        noLoop();
      }
    }
  }
}