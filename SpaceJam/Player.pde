class Player
{
  PVector location, velocity;
  PVector topLeftBody, bottomLeftBody, topRightBody, bottomRightBody;
  float playerWidth, playerHeight;
  float jumpForce = -(height/60);
  float gravityDivisor = height * 2.5;
  float gravity = height / gravityDivisor;
  float speed = width * 0.0003;
  float slowdown = 0.85;
  int counter;
  
  Player(float x, float y, float playerWidth, float playerHeight)
  {
    location = new PVector(x, y);
    this.playerWidth = playerWidth;
    this.playerHeight = playerHeight;
    velocity = new PVector(0,0);
    this.counter = 1;
  }
  
  void display()
  {
    if (location.y + playerHeight == surfaceHeight)
    {
      image(running[counter], location.x, location.y, playerWidth, playerHeight);
      if (frameCount % 20 == 0)
      {
        counter ++;
        if (counter>1) 
        {
          counter = 0;
        }
      }
    }
    else if (location.y + playerHeight < surfaceHeight)
    {
      image(running[0], location.x, location.y, playerWidth, playerHeight);
    }
  }
  
  void update()
  { 
    // If bottom of player is higher than the surface, apply downward force
    if (location.y + playerHeight < surfaceHeight)
    {
      velocity.y += gravity;
    }
    // as the velocity will push bottom of player beyond the surface, set the
    // position of the bottom of the player to the surface level
    if (location.y + playerHeight >= surfaceHeight)
    {
      velocity.y = 0;
      location.y = surfaceHeight - playerHeight;
    }
    
    // player can only jump once when they are at the surface
    if (checkKey(UP) && location.y + playerHeight == surfaceHeight)
    {
      velocity.y += jumpForce;
    }
    else if (checkKey(LEFT) && location.x >= 0)
    {
      velocity.x -= speed / 2;
      if (location.x < 0)
      {
        velocity.x = 0;
        location.x = 0;
      }
    }
    else if (checkKey(RIGHT) && location.x + playerWidth <= width / 2)
    {
      velocity.x += speed;
      if (location.x > width / 2)
      {
        velocity.x = 0;
        location.x = width / 2;
      }
    }
    velocity.x *= slowdown;
    
    if (velocity.x < 0.25 && velocity.x > 0)
    {
      velocity.x = 0;
    }
    
    // if michael's secret stuff is collected
    if (quick.collected)
    {
      player.speed = width * 0.0006;
    }
    else
    {
      player.speed = width * 0.0003;
    }
    
    // if carrot is collected
    if (jump.collected)
    {
      jumpForce = -(height/50);
    }
    else
    {
      jumpForce = -(height/60);
    }
  }
  
  // change the velocity values
  void addVelocity()
  {
    location.add(velocity);
  }
  
  void assignCollisionPoints()
  {
    topLeftBody = new PVector(location.x + (playerWidth * 0.125), location.y + (playerHeight * 0.35));
    bottomLeftBody = new PVector(topLeftBody.x, location.y + (playerHeight * 0.85));
    topRightBody = new PVector(location.x + (playerWidth * 0.85), topLeftBody.y);
    bottomRightBody = new PVector(topRightBody.x, location.y + (playerHeight * 0.925));
  }
}