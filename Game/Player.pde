class Player
{
  PVector location;
  float playerWidth, playerHeight;
  PVector velocity;
  float jumpForce = -(height/60);
  float gravityDivisor = height * 3;
  float gravity = height / gravityDivisor;
  float speed = height * 0.002;
  float surfaceSlowdown = 0.65;
  float airSlowdown = 0.7;
  
  Player(float x, float y, float playerWidth, float playerHeight)
  {
    location = new PVector(x, y);
    this.playerWidth = playerWidth;
    this.playerHeight = playerHeight;
    velocity = new PVector(0,0);
  }
  
  void display()
  {
    stroke(0);
    strokeWeight(2);
    fill(127);
    rect(location.x, location.y, playerWidth, playerHeight);
  }
  
  void update()
  {
    // If bottom of square is higher than the surface, apply downward force
    if (location.y + playerHeight < surfaceHeight)
    {
      velocity.y += gravity;
    }
    // as the velocity will push bottom of square beyond the surface, set the
    // position of the bottom of the square to the surface level
    if (location.y + playerHeight >= surfaceHeight)
    {
      velocity.y = 0;
      location.y = surfaceHeight - playerHeight;
    }
    println("Top left corner = " + location.y);
    println("Bottom of mover = " + (location.y + playerHeight));
    println("x-coordinate = " + location.x);
    println("velocity.x, velocity.y" + " " + velocity.x + " " + velocity.y);
    // player can only jump once when they are at the surface
    if (checkKey(UP) && location.y + playerHeight == surfaceHeight)
    {
      velocity.y += jumpForce;
    }
    else if (checkKey(LEFT))
    {
      velocity.x -= speed;
    }
    else if (checkKey(RIGHT))
    {
      velocity.x += speed;
    }
    
    // if player is in the air, the slowdown rate is higher due to less friction
    if (location.y + playerHeight >= surfaceHeight)
    {
      velocity.x *= surfaceSlowdown;
      // when on the ground, if velocity.x is less than .25 in either direction, force stop!
      if (velocity.x < 0.25 && velocity.x > 0)
      {
        velocity.x = 0;
      }
      else if (velocity.x > -0.25 && velocity.x < 0)
      {
        velocity.x = 0;
      }
    }
    else if (location.y + playerHeight < surfaceHeight)
    {
      velocity.x *= airSlowdown;
    }
    
    // boundaries for player
    if (location.x <= 0 - width / 2)
    {
      location.x = 0 - width / 2;
    }
    else if (location.x + playerWidth >= width + width / 2)
    {
      location.x = (width + width / 2) - playerWidth;
    }
  }
  
  // change the velocity values
  void addVelocity()
  {
    location.add(velocity);
  }
}