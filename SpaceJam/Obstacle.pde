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
      // michael's secret stuff powerup only lasts 3 scores
      if (quick.collected)
      {
        if (sStuffCountdown > 0)
        {
          sStuffCountdown -= 1;
          if (sStuffCountdown == 0)
          {
            quick.collected = false;
            sStuffCountdown = 3;
          }
        }
      }
      
      // carrot powerup only lasts 3 scores
      if (jump.collected)
      {
        if (carrotCountdown > 0)
        {
          carrotCountdown -= 1;
          if (carrotCountdown == 0)
          {
            jump.collected = false;
            carrotCountdown = 3;
          }
        }
      }
    }
  }

  void playerCollision()
  {
  }
}