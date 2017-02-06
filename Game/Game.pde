Player player;
Obstacle blue, green, red, orange, purple;
Progression level;
PImage court, standR, standL;
PImage[] running = new PImage[2];

void setup()
{
  //size(1000, 750, P2D);
  fullScreen(P2D);
  standL = loadImage("mjStanding.png");
  standR = loadImage("mjStandingRight.png");
  running[0] = loadImage("run1.png");
  running[1] = loadImage("run2.png");
  surfaceHeight = height - height / 20;
  player = new Player(width / 4, height / 2, width / 21, height / 9.6);
  level = new Progression();
  enemies = new ArrayList<Obstacle>();
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
  player.assignCollisionPoints();
  
  for (int i = enemies.size() -1 ; i >= 0  ; i --)
  {
    Obstacle e = enemies.get(i);
    e.display();
    e.update();
    e.updateScore();
    e.playerCollision();
  }
  
  level.wave1();
  level.wave2();
  level.wave3();
  level.wave4();
  level.wave5();
  level.changeFrame();
  
  println("size of ArrayList = " + enemies.size());
}

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