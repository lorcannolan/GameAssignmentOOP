class Progression
{
  float r;
  int frameC;
  int stage, check;
  
  Progression()
  {
    this.frameC = 210;
    stage = check;
  }
  
  void wave1()
  {
    if (alive)
    {
      if (score < 3)
      {
        if (frameCount % frameC == 0)
        {
          Obstacle red = new Red();
          enemies.add(red);
        }
      }
    }
  }
  
  void wave2()
  {
    if (alive)
    {
      if (score > 2 && score < 6)
      {
        if (frameCount % frameC == 0)
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
    }
  }
  
  void wave3()
  {
    if (alive)
    {
      if (score > 5 && score < 9)
      {
        if (frameCount % frameC == 0)
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
    }
  }
  
  void wave4()
  {
    if (alive)
    {
      if (score > 8 && score < 12)
      {
        if (frameCount % frameC == 0)
        {
          r = random(0, 1);
          if (r > 0.75)
          {
            Obstacle red = new Red();
            enemies.add(red);
          }
          else if (r > 0.5 && r < 0.75)
          {
            Obstacle orange = new Orange();
            enemies.add(orange);
          }
          else if (r > 0.25 && r < 0.5)
          {
            Obstacle purple = new Purple();
            enemies.add(purple);
          }
          else
          {
            Obstacle green = new Green();
            enemies.add(green);
          }
        }
      }
    }
  }
  
  void wave5()
  {
    if (alive)
    {
      if (score > 11)
      {
        if (frameCount % frameC == 0)
        {
          r = random(0, 1);
          if (r > 0.8)
          {
            Obstacle red = new Red();
            enemies.add(red);
          }
          else if (r > 0.6 && r < 0.8)
          {
            Obstacle orange = new Orange();
            enemies.add(orange);
          }
          else if (r > 0.4 && r < 0.6)
          {
            Obstacle purple = new Purple();
            enemies.add(purple);
          }
          else if (r > 0.2 && r < 0.4)
          {
            Obstacle green = new Green();
            enemies.add(green);
          }
          else
          {
            Obstacle blue = new Blue();
            enemies.add(blue);
          }
        }
      }
    }
  }
  
  void changeFrame()
  {
    if (score % 5 == 0)
    {
      stage = 1;
    }
    else
    {
      stage = 0;
      check = stage;
    }
    
    // update score
    if (stage == 1 && stage != check && frameC > 120)
    {
      frameC -= 10;
      check = stage;
    }
  }
}