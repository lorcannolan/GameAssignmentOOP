import processing.sound.*;
SoundFile pumpUp;

Player player;
Progression level;
SecretStuff quick;
Carrot jump;
PImage court, menuImg, menuImg2;
PImage[] running = new PImage[2];
PFont font, spaceJam;

void setup()
{
  //size(1000, 750, P2D);
  fullScreen(P2D);
  menu = 0;
  menuImg = loadImage("menuPic.png");
  menuImg.resize(width, height);
  font = createFont("3Dventure", 60);
  spaceJam = createFont("GROBOLD", 60);
  menuImg2 = loadImage("menuPic2.png");
  menuImg2.resize(width, height);
  running[0] = loadImage("run1.png");
  running[1] = loadImage("run2.png");
  surfaceHeight = height - height / 20;
  player = new Player(width / 4, height / 2, width / 21, height / 9.6);
  level = new Progression();
  enemies = new ArrayList<Obstacle>();
  quick = new SecretStuff(width * (float)random(2.5, 4.5), height * 0.6);
  jump = new Carrot(width * (float)random(2, 4), height * 0.6);
  court = loadImage("court.png");
  score = 0;
  sStuffCountdown = 3;
  carrotCountdown = 3;
  pumpUp = new SoundFile(this, "PumpUpTheJam.mp3");
}

int score, sStuffCountdown, carrotCountdown, menu;
boolean blink;
float surfaceHeight;
boolean[] keys = new boolean[1000];
ArrayList<Obstacle> enemies;

void draw()
{
  if (menu == 0)
  {
    background(menuImg);
    if (frameCount % 20 == 0)
    {
      blink = !blink;
    }
    
    if (blink)
    {
      textAlign(CENTER);
      fill(255);
      textFont(font);
      textSize(width / 30);
      text("Press Space To Continue", width / 2, height / 2.75);
    }
    
    if (keyPressed)
    {
      if (key == ' ')
      {
        menu = 1;
      }
    }
  }
  else if (menu == 1)
  {
    background(menuImg2);
    textAlign(CENTER, CENTER);
    textFont(spaceJam);
    textSize(width / 20);
    stroke(247, 141, 0);
    fill(23, 250, 157);
    strokeWeight(3);
    rect(width / 4 - ((width / 5) / 2), height * 0.85, width / 5, height * 0.1);
    fill(12, 143, 247);
    text("PLAY", width / 4, height * 0.9);
    stroke(247, 141, 0);
    fill(23, 250, 157);
    rect(width * 0.75 - (width / 5), height * 0.85, (width / 5) * 2, height * 0.1);
    fill(12, 143, 247);
    text("INSTRUCTIONS", width * .75, height * 0.9);
    
    if (mouseX > width / 4 - ((width / 5) / 2) && mouseX < width / 4 + ((width / 5) / 2)
          && mouseY > height * 0.85 && mouseY < height * 0.95)
    {
      stroke(23, 250, 157);
      fill(12, 143, 247);
      strokeWeight(3);
      rect(width / 4 - ((width / 5) / 2), height * 0.85, width / 5, height * 0.1);
      fill(247, 141, 0);
      text("PLAY", width / 4, height * 0.9);
    }
    
    if (mouseX > width * 0.75 - (width / 5) && mouseX < width * 0.75 + (width / 5)
          && mouseY > height * 0.85 && mouseY < height * 0.95)
    {
      stroke(23, 250, 157);
      fill(12, 143, 247);
      strokeWeight(3);
      rect(width * 0.75 - (width / 5), height * 0.85, (width / 5) * 2, height * 0.1);
      fill(247, 141, 0);
      text("INSTRUCTIONS", width * .75, height * 0.9);
    }
  }
  else if (menu == 3)
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
    
    quick.display();
    quick.update();
    quick.playerCollision();
    
    jump.display();
    jump.update();
    jump.playerCollision();
  
    for (int i = enemies.size() - 1; i >= 0; i --)
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
  }
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