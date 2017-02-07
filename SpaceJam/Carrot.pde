class Carrot extends PowerUp
{
  PImage carrot;
  int theta;
  boolean angleUp, angleDown;
  float startPos;
  boolean collected;
  
  Carrot(float x, float y)
  {
    location = new PVector(x, y);
    carrot = loadImage("carrot.png");
    this.powerupW = (width / 5.5) / 6;
    this.powerupH = (height / 2.52) / 6;
    this.theta = 20;
    startPos = location.x;
    collected = false;
  }
  
  void display()
  {
    if (!collected)
    {
      pushMatrix();
      // move the origin to the pivot point
      translate(location.x, location.y);
      
      // then pivot the grid
      rotate(radians(theta));
      
      // and display the image at the origin
      image(carrot, -(powerupW / 2), -(powerupH / 2), powerupW, powerupH);
      popMatrix();
      
      // change the pivot angle of the powerup
      if (theta <= -70)
      {
        angleUp = true;
        angleDown = false;
      }
      else if (theta >= 20)
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
  }
  
  void update()
  {
    location.x -= width / height;
    if (location.x + powerupW < 0)
    {
      location.x = startPos * (float)random(0.7, 1);
    }
  }
  
  void playerCollision()
  {
    if (player.topRightBody.x >= location.x && player.topRightBody.y <= location.y + powerupH * 0.8)
    {
      if (player.topLeftBody.x + player.playerWidth * 0.2 <= location.x + powerupW)
      {
        collected = true;
      }
    }
  }
}