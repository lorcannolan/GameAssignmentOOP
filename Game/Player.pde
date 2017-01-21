class Player
{
  PVector location;
  float playerSize;
  
  Player(float x, float y, float playerSize)
  {
    location = new PVector(x, y);
    this.playerSize = playerSize;
  }
  
  void display()
  {
    stroke(0);
    strokeWeight(2);
    fill(127);
    rect(location.x, location.y, playerSize, playerSize);
  }
}