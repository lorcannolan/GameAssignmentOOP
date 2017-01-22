class Player
{
  PVector location;
  float playerSize;
  PVector velocity;
  PVector acceleration;
  
  Player(float x, float y, float playerSize)
  {
    location = new PVector(x, y);
    this.playerSize = playerSize;
    velocity = new PVector(0,0);
  }
  
  void display()
  {
    stroke(0);
    strokeWeight(2);
    fill(127);
    rect(location.x, location.y, playerSize, playerSize);
  }
  
  void update()
  {
    // Created a vector that has x value of location PVector and surfaceHeight value
    PVector ground = new PVector(location.x, surfaceHeight);
    // created a PVector with values of ground - location
    // acceleration.x = (ground.x - location.x, i.e. 0)
    // acceleration.y = (ground.y - location.y, i.e. 200)
    PVector acceleration = PVector.sub(ground,location);
    // set magnitude of acceleration
    acceleration.setMag(.2);
    // velocity will change by adding value of acceleration PVector
    velocity.add(acceleration);
    // If bottom of square is higher than the surface, apply downward force
    if (location.y + playerSize < surfaceHeight)
    {
      location.add(velocity);
      // as the velocity will push bottom of square beyond the surface, set the
      // position of the bottom of the square to the surface level
      if (location.y + playerSize > surfaceHeight)
      {
        location.y = surfaceHeight - playerSize;
      }
    }
    // when the bottom of the square is at the surface height, reset the downward force
    if (location.y == surfaceHeight - playerSize)
    {
      velocity.set(0, 0);
    }
    println("Top left corner = " + location.y);
    println("Bottom of mover = " + (location.y + playerSize));
    println("x-coordinate = " + location.x);
    println("velocity.x, velocity.y" + velocity.x + " " + velocity.y);
    // player can only jump once when they are at the surface
    if (checkKey(UP) && location.y + playerSize == surfaceHeight)
    {
      location.y -= height/5;
    }
    else if (checkKey(LEFT))
    {
      location.x -= width/250;
    }
    else if (checkKey(RIGHT))
    {
      location.x += width/250;
    }
    
    if (location.x + playerSize < 0)
    {
      location.x = width;
    }
    else if (location.x > width)
    {
      location.x = 0 - playerSize;
    }
  }
}