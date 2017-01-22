class Obstacle
{
  PVector location;
  float obstacleSize;
  float speed;
  PShape enemy;
  
  Obstacle()
  {
    //location = new PVector(width + width/10, surfaceHeight);
    obstacleSize = height / 10;
    location = new PVector(width/2, surfaceHeight - obstacleSize);
    speed = 1;
  }
  
  void display()
  {
    stroke(127);
    fill(255, 0, 0);
    triangle(location.x, location.y, (location.x - obstacleSize/2), surfaceHeight, (location.x + obstacleSize/2), surfaceHeight);
  }
  
  void update()
  {
    location.x += speed;
    println("Speed = " + speed);
    if (location.x + obstacleSize/2 >= width)
    {
      location.x = width - obstacleSize/2;
      speed = -speed;
    }
    else if (location.x - obstacleSize/2 <= 0)
    {
      location.x = 0 + obstacleSize/2;
      speed = -speed;
    }
  }
}