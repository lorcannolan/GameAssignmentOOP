class Progression
{
  float r;
  
  Progression()
  {
    this.r = r;
  }
  
  void wave1()
  {
    if (score < 3)
    {
      if (frameCount % 200 == 0)
      {
        Obstacle red = new Red();
        enemies.add(red);
      }
    }
  }
  
  void wave2()
  {
    if (score > 2 && score < 6)
    {
      if (frameCount % 200 == 0)
      {
        r = random(0, 1);
        if (r > .5)
        {
          Obstacle red = new Red();
          enemies.add(red);
        }
        else
        {
          Obstacle orange = new Orange();
          enemies.add(orange);
        }
      }
    }
    println("r2 = " + r);
  }
  
  void wave3()
  {
    if (score > 5)
    {
      if (frameCount % 200 == 0)
      {
        r = random(0, 1);
        if (r > 0.66666)
        {
          Obstacle red = new Red();
          enemies.add(red);
        }
        else if (r > 0.33333 && r < 0.66666)
        {
          Obstacle orange = new Orange();
          enemies.add(orange);
        }
        else
        {
          Obstacle purple = new Purple();
          enemies.add(purple);
        }
      }
    }
    println("r3 = " + r);
  }
}