class Obstacle
{
  PVector location;
  float picWidth, picHeight;
  float speed;
  PShape enemy;
  
  Obstacle()
  {
    picWidth = (width / 2.8) / 4;
    picHeight = (height / 1.25) / 4;
    location = new PVector(width, surfaceHeight - picHeight);
    speed = width * 0.003;
  }
  
  void display()
  {
    stroke(127);
    fill(255, 0, 0);
    //triangle(location.x, location.y, (location.x - obstacleSize/2), surfaceHeight, (location.x + obstacleSize/2), surfaceHeight);
    image(blue, location.x, location.y, picWidth, picHeight);
  }
  
  void update()
  {
    location.x -= speed;
    println("enemy location.x = " + location.x);
    if (location.x + picWidth + (width / 25) <= 0)
    {
      location.x = width + picWidth;
    }
  }
}