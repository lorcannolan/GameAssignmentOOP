class Player
{
  PVector location;
  float playerWidth, playerHeight;
  PVector velocity;
  float jumpForce = -(height/60);
  float gravityDivisor = height * 3;
  float gravity = height / gravityDivisor;
  boolean picLeft = false;
  
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
    image(standR, location.x, location.y, playerWidth, playerHeight);
    //rect(location.x, location.y, playerWidth, playerHeight);
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
    println("velocity.x, velocity.y" + " " + velocity.x + " " + velocity.y);
    // player can only jump once when they are at the surface
    if (checkKey(UP) && location.y + playerHeight == surfaceHeight)
    {
      velocity.y += jumpForce;
    }
  }
  
  // change the velocity values
  void addVelocity()
  {
    location.add(velocity);
  }
}