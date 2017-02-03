Player player;
Obstacle blue, green, red, orange, purple;
Progression level;
PImage court, standR, standL;

void setup()
{
  size(1000, 750, P2D);
  //fullScreen(P2D);
  standL = loadImage("mjStanding.png");
  standR = loadImage("mjStandingRight.png");
  surfaceHeight = height - height / 20;
  player = new Player(width / 4, height / 2, (width / 2.8) / 8, (height / 1.25) / 6);
  level = new Progression();
  //blue = new Blue();
  //green = new Green();
  //red = new Red();
  //orange = new Orange();
  //purple = new Purple();
  enemies = new ArrayList<Obstacle>();
  //setupObstacles();
  court = loadImage("court.png");
  score = 0;
}

int score;
float surfaceHeight;
boolean[] keys = new boolean[1000];
ArrayList<Obstacle> enemies;

void draw()
{
  background(255);
  image(court, 0, height - height / 10, width, height / 10);
  fill(0);
  textAlign(CENTER);
  textSize(50);
  text("Score: " + score, width/2, height / 20);
  
  player.display();
  player.update();
  player.addVelocity();
  
  for (int i = enemies.size() -1 ; i >= 0  ; i --)
  {
    Obstacle e = enemies.get(i);
    e.display();
    e.update();
    e.updateScore();
  }
  
  level.wave1();
  level.wave2();
  level.wave3();
  
  println("size of ArrayList = " + enemies.size());
  
  //if (score >= 0 && score < 11)
  //{
  //  red.display();
  //  red.update();
  //  red.updateScore();
  //  orange.display();
  //  orange.update();
  //  orange.updateScore();
  //}
  //else
  //{
  //  blue.display();
  //  blue.update();
  //  green.display();
  //  green.update();
  //  purple.display();
  //  purple.update();
  //}
}

//void setupObstacles()
//{
//  enemies.clear();
//  for (int i = 0 ; i < 5 ; i ++)
//  {
//    // add a certain type of sub-class of Obstacle to the ArrayList depending on the score 
//    Obstacle e = null;
//    e = new Red();
//    //switch (score)
//    //{
//    //  case 0:
//    //    a = new Dog();
//    //    break;
//    //  case 1:
//    //    a = new Cat();
//    //    break;
//    //  case 2:
//    //    a = new Sheep();
//    //    break;
//    //}
//    enemies.add(e);
//  }
//}

void keyPressed()
{ 
  keys[keyCode] = true;
}
 
void keyReleased()
{
  keys[keyCode] = false; 
}

boolean checkKey(int k)
{
  if (keys.length >= k) 
  {
    return keys[k] || keys[Character.toUpperCase(k)];  
  }
  return false;
}