abstract class PowerUp
{
  PVector location;
  float powerupW, powerupH;
  
  PowerUp()
  {
  }
  
  abstract void display();
  abstract void update();
}