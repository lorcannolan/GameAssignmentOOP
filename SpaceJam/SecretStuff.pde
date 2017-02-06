class SecretStuff extends PowerUp
{
  PImage sStuff;
  
  SecretStuff(float x, float y)
  {
    location = new PVector(x, y);
    sStuff = loadImage("secretStuff.png");
    this.powerupW = (width / 7.45) / 10;
    this.powerupH = (height / 1.4) / 10;
  }
  
  void display()
  {
    if (score > 13)
    {
      image(sStuff, location.x, location.y, powerupW, powerupH);
    }
  }
  
  void update()
  {
    location.x--;
    if (location.x + powerupW < 0)
    {
      location.x = width * 1.2;
    }
  }
}