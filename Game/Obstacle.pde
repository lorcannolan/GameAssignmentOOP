class Obstacle
{
  PVector location;
  float obstacleSize, picWidth, picHeight;
  float speed;
  PShape enemy;
  
  Obstacle()
  {
    //location = new PVector(width + width/10, surfaceHeight);
    //obstacleSize = height / 10;
    picWidth = 179;
    picHeight = 401;
    location = new PVector(width/2, surfaceHeight - (picHeight - height / 2));
    speed = 1;
  }
  
  void display()
  {
    stroke(127);
    fill(255, 0, 0);
    //triangle(location.x, location.y, (location.x - obstacleSize/2), surfaceHeight, (location.x + obstacleSize/2), surfaceHeight);
    image(blue, location.x, location.y, picWidth - (width / 2), picHeight - (height / 2));
  }
  
  void update()
  {
    location.x += speed;
    println("Speed = " + speed);
    if (location.x >= width)
    {
      location.x = width;
      speed = -speed;
    }
    else if (location.x<= 0)
    {
      location.x = 0;
      speed = -speed;
    }
  }
}