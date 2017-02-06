class SecretStuff extends PowerUp
{
  PImage sStuff;
  int theta;
  boolean angleUp, angleDown;
  float startPos;
  
  SecretStuff(float x, float y)
  {
    location = new PVector(x, y);
    sStuff = loadImage("secretStuff.png");
    this.powerupW = (width / 7.45) / 10;
    this.powerupH = (height / 1.4) / 10;
    this.theta = 45;
    startPos = location.x;
  }
  
  void display()
  {
    if (score > -1)
    {
      pushMatrix();
      // move the origin to the pivot point
      translate(location.x, location.y);
      
      // then pivot the grid
      rotate(radians(theta));
      
      // and display the image at the origin
      image(sStuff, -(powerupW / 2), -(powerupH / 2), powerupW, powerupH);
      popMatrix();
    }
    
    // move red enemy up and down
    if (theta <= -45)
    {
      angleUp = true;
      angleDown = false;
    }
    else if (theta >= 45)
    {
      angleUp = false;
      angleDown = true;
    }
    
    // only move when score is higher than 13
    if (angleUp)
    {
      theta++;
    }
    else if (angleDown)
    {
      theta--;
    }
  }
  
  void update()
  {
    location.x--;
    if (location.x + powerupW < 0)
    {
      location.x = startPos * 0.75;
    }
  }
}