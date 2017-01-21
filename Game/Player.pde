class Player
{
  PVector location;
  float playerSize;
  PVector velocity;
  PVector acceleration;
  float topspeed;
  
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
    // Location changes by velocity
    if (location.y + playerSize < surfaceHeight)
    {
      location.add(velocity);
      if (location.y + playerSize > surfaceHeight)
      {
        location.y = surfaceHeight - playerSize;
      }
    }
    if (location.y == surfaceHeight - playerSize)
    {
      velocity.set(0, 0);
    }
    println("Top left corner = " + location.y);
    println("Bottom of mover = " + (location.y + playerSize));
    println("x-coordinate = " + location.x);
    println("velocity.x, velocity.y" + velocity.x + " " + velocity.y);
    if (checkKey(UP) && location.y + playerSize == surfaceHeight)
    {
      location.y -= 100;
      velocity.add(acceleration);
    }
    else if (checkKey(LEFT))
    {
      location.x--;
    }
    else if (checkKey(RIGHT))
    {
      location.x++;
    }
  }
}