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
    picWidth = (height / 2.8) / 5;
    picHeight = (width / 1.25) / 7;
    //location = new PVector(width/2, surfaceHeight - picHeight);
    location = new PVector(width, surfaceHeight - picHeight);
    speed = height * 0.002;
  }
  
  void display()
  {
    stroke(127);
    fill(255, 0, 0);
    //triangle(location.x, location.y, (location.x - obstacleSize/2), surfaceHeight, (location.x + obstacleSize/2), surfaceHeight);
    image(blue, location.x - picWidth, location.y, picWidth, picHeight);
    //ellipse(location.x, location.y, 20, 20);
  }
  
  void update()
  {
    location.x += speed;
    println("enemy location.x = " + location.x);
    if (location.x - picWidth >= width)
    {
      location.x = width + picWidth;
      speed = -speed;
    }
    else if (location.x <= 0)
    {
      location.x = 0;
      speed = -speed;
    }
  }
}