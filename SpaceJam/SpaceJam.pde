import processing.sound.*;
SoundFile pumpUp;

Player player;
Progression level;
SecretStuff quick;
Carrot jump;
PImage menuImg, menuImg2, left, up, right, jumbo;
PImage[] running = new PImage[2];
PImage[] court = new PImage[2];
PImage[] backg = new PImage[2];
PFont font, spaceJam;
PShape arrow, arrow2;
boolean alive;
float courtTopLeft, courtTopLeft2;

void setup()
{
  //size(1000, 750, P2D);
  fullScreen(P2D);
  menu = 3;
  enemies = new ArrayList<Obstacle>();
  reset();
  menuImg = loadImage("menuPic.png");
  menuImg.resize(width, height);
  font = createFont("3Dventure", 60);
  spaceJam = createFont("GROBOLD", 60);
  menuImg2 = loadImage("menuPic2.png");
  menuImg2.resize(width, height);
  left = loadImage("left.png");
  left.resize(width / 25, height / 14);
  up = loadImage("up.png");
  up.resize(width / 25, height / 14);
  right = loadImage("right.png");
  right.resize(width / 25, height / 14);
  
  //Creating arrow to return 1 menu page
  arrow = createShape();
  arrow.beginShape();
  arrow.noStroke();
  arrow.fill(12, 143, 247);
  arrow.vertex(width * 0.06, height * 0.1);
  arrow.vertex(width * 0.1, height * 0.06);
  arrow.vertex(width * 0.1, height * 0.09);
  arrow.vertex(width * 0.14, height * 0.09);
  arrow.vertex(width * 0.14, height * 0.11);
  arrow.vertex(width * 0.1, height * 0.11);
  arrow.vertex(width * 0.1, height * 0.14);
  arrow.endShape(CLOSE);
  
  arrow2 = createShape();
  arrow2.beginShape();
  arrow2.noStroke();
  arrow2.fill(247, 141, 0);
  arrow2.vertex(width * 0.06, height * 0.1);
  arrow2.vertex(width * 0.1, height * 0.06);
  arrow2.vertex(width * 0.1, height * 0.09);
  arrow2.vertex(width * 0.14, height * 0.09);
  arrow2.vertex(width * 0.14, height * 0.11);
  arrow2.vertex(width * 0.1, height * 0.11);
  arrow2.vertex(width * 0.1, height * 0.14);
  arrow2.endShape(CLOSE);
  
  running[0] = loadImage("run1.png");
  running[1] = loadImage("run2.png");
  surfaceHeight = height - height / 20;
  level = new Progression();
  for(int i = 0; i < 2; i++)
  {
    court[i] = loadImage("court.png");
    court[i].resize(width, height / 10);
  }
  for(int i = 0; i < 2; i++)
  {
    backg[i] = loadImage("background.png");
    backg[i].resize(width, height);
  }
  jumbo = loadImage("jumbotron.png");
  jumbo.resize(width / 4, height / 3);
  pumpUp = new SoundFile(this, "PumpUpTheJam.mp3");
}

void reset()
{
  score = 0;
  player = new Player(width / 4, height / 2, width / 21, height / 9.6);
  enemies.clear();
  courtTopLeft = 0;
  courtTopLeft2 = width;
  alive = true;
  quick = new SecretStuff(width * (float)random(2.5, 4.5), height * 0.6);
  jump = new Carrot(width * (float)random(2, 4), height * 0.6);
  sStuffCountdown = 3;
  carrotCountdown = 3;
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
      
      if (mousePressed)
      {
        menu = 3;
      }
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
      
      if (mousePressed)
      {
        menu = 2;
      }
    }
  }
  else if (menu == 2)
  {
    background(menuImg2);
    
    image(left, width * 0.15, height * 0.7);
    image(up, width * 0.225, height * 0.7);
    image(right, width * 0.3, height * 0.7);
    
    image(quick.sStuff, width * 0.625, height * 0.65, (width / 7.45) / 8, (height / 1.4) / 8);
    image(jump.carrot, width * 0.725, height * 0.65, (width / 5.5) / 5, (height / 2.52) / 5);
    
    textAlign(LEFT, CENTER);
    textFont(font);
    textSize(width / 45);
    fill(255);
    text("Use the arrow keys to move Michael around the screen to avoid the Monstars.", width * 0.1, height * 0.7, width / 3, height / 3);
    text("Collect Michael's secret stuff to double your speed!\nCollect the carrot to "
          + "jump like Buggs Bunny!", width * 0.55, height * 0.7, width / 2.75, height / 3);
    
    fill(23, 250, 157);
    strokeWeight(3);
    stroke(247, 141, 0);
    rect(width * 0.05, height * 0.05, width * 0.1, height * 0.1);
    shape(arrow, 0, 0);
    
    if (mouseX > width * 0.05 && mouseX < width * 0.15
          && mouseY > height * 0.05 && mouseY < height * 0.15)
    {
      fill(12, 143, 247);
      strokeWeight(3);
      stroke(23, 250, 157);
      rect(width * 0.05, height * 0.05, width * 0.1, height * 0.1);
      shape(arrow2, 0, 0);
      
      if (mousePressed)
      {
        menu = 1;
      }
    }
  }
  else if (menu == 3)
  {
    background(255);
    image(backg[0], courtTopLeft, 0);
    image(backg[1], courtTopLeft2, 0, backg[1].width +2, backg[1].height);
    image(court[0], courtTopLeft, height - height / 10);
    image(court[1], courtTopLeft2, height - height / 10, court[1].width +2, court[1].height);
    if (alive)
    {
      courtTopLeft -= 2.5;
      courtTopLeft2 -= 2.5;
    }
    if (courtTopLeft <= 0 - width)
    {
      courtTopLeft = width;
    }
    
    if (courtTopLeft2 <= 0 - width)
    {
      courtTopLeft2 = width;
    }
    image(jumbo, width / 2.75, 0);
    fill(23, 250, 157);
    textFont(spaceJam);
    textAlign(CENTER);
    textSize(width / 27);
    text("Score: " + score, width/2.05, height / 8);
  
    player.display();
    player.update();
    player.addVelocity();
    player.assignCollisionPoints();
    
    quick.display();
    if (alive)
    {
      quick.update();
      quick.playerCollision();
    }
    
    jump.display();
    if (alive)
    {
      jump.update();
      jump.playerCollision();
    }
  
    for (int i = enemies.size() - 1; i >= 0; i --)
    {
      Obstacle e = enemies.get(i);
      e.display();
      if (alive)
      {
        e.update();
        e.updateScore();
        e.playerCollision();
      }
    }
  
    level.wave1();
    level.wave2();
    level.wave3();
    level.wave4();
    level.wave5();
    level.changeFrame();
    
    if (!alive)
    {
      fill(255);
      textFont(font);
      textAlign(CENTER, CENTER);
      textSize(width / 30);
      text("Press E to return to the menu or R replay", width / 2, height * 0.75);
      if (keyPressed)
      {
        if (key == 'e' || key == 'E')
        {
          menu = 1;
        }
        else if (key == 'r' || key == 'R')
        {
          reset();
        }
      }
      if (frameCount % 30 == 0)
      {
        blink = !blink;
      }
    
      if (blink)
      {
        fill(255);
        textFont(font);
        textAlign(CENTER, CENTER);
        textSize(width / 15);
        text("GAME OVER", width / 2, height / 2);
      }
    }
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