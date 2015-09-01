float cloudX=650;
float cloudY=random(70, 90);
float trees=250;
float speed=0.08;
int colour=0;
int startseq=1;
int treesA=0;
int yellow=0;
int yellowSpeed=0;
void setup()
{
  frameRate(75);
  size(800, 600);
}

//before action
void startup()
{
  textSize(25);
  text("W 'Jump'",400,400);
  text("A 'Brake'",400,450);
  text("D 'Accelerate'",550,420);
  fill(220, 120, 0);
  noStroke();
  textSize(75);
  text("Amazing Brick", 150, 150);
  //flashing start
  if (colour<500)
  {
    colour=colour+5;
  } else
  {
    colour=0;
  }
  textSize(40);
  fill(0, colour);
  text("Click to Start", 280, 350);
}

void draw()
{
  background(0, 190, 205);
  fill(100);
  noStroke();
  rect(0, 500, 800, 100);
  brick();
  //road markings
  fill(#FFF695);
  rect(yellow, 545, 55, 15);
  rect(yellow+200, 545, 55, 15);
  rect(yellow+400, 545, 55, 15);
  rect(yellow+600, 545, 55, 15);
  rect(yellow+800, 545, 55, 15);
  rect(yellow+1000, 545, 55, 15);
  rect(yellow+1200, 545, 55, 15);
  yellow=yellow-yellowSpeed;
  if (yellow<-600)
  yellow=200;

  if (startseq==1)
  {
    startup();
  }
  //TRANSPARENT CLOUDS
  fill(235, 175);
  ellipse(cloudX, cloudY, 95, 40);
  ellipse(cloudX-15, cloudY, 50, 50);
  ellipse(cloudX+15, cloudY, 50, 52);
  ellipse(cloudX+150, cloudY+50, 150, 50);
  ellipse(cloudX+130, cloudY+50, 100, 70);
  ellipse(cloudX+165, cloudY+50, 100, 70);
  cloudX=cloudX-speed;

  if (cloudX<-250)
  {
    cloudX=900;
  }

  if (cloudX>950)
  {
    cloudX=-200;
  }
  //Trees
  fill(#814700);
  rect(trees, 436, 30, 65);
  fill(#019311);
  ellipse(trees+15, 400, 110, 110);
  trees=trees+treesA;
  if (trees<-100)
  {
    trees=900;
  }
}

void mouseClicked()
{
  if (startseq==1)
  {
    startseq=2;
  }
}

float jump=465;
float eyesize=0;
float blink=0;
int blinkCheck=0;
int mouthexp=0;
boolean jumpcheck;
int facejump=0;


void brick()
{
  fill(220, 120, 0);
  rect(40, jump, 60, 35);

  //EYES
  if (startseq==2)
  {
 
    fill(30,0,180);
    text(abs(treesA),90,90);
    fill(0);
    ellipse(90, jump+15, eyesize, eyesize-blink);
    ellipse(70+eyesize/1.5, jump+15, eyesize, eyesize-blink);
    if (eyesize<10)
    {
      eyesize=eyesize+0.5;
    }
    //JUMP
    if (jumpcheck)
    {
      if (jump>400)
      {
        jump=jump-10;
      } else 
      jumpcheck=false;
    }

    if (jump<465)
    {
      jump=jump+5;
    }

    //Mouth
    ellipse(83, jump+25, 15-mouthexp, 1+mouthexp);
    //Expressions
    //Blinking
    if (blinkCheck==150)
    {
      if (blink<9)
      {
        blink++;
      } else
        blinkCheck=0;
    } else 
    {
      blinkCheck++;
      blink=0;
    }
    //Yawn
    if (blink>1)
    {
      mouthexp=5;
    } else
      mouthexp=0;
  }
}

void keyTyped()
{
  if (startseq==2)
  {
    if (key=='w')
    {
      if (jump==465)
        jumpcheck=true;
    }
  }
}

void keyPressed()
{
  if (startseq==2)
  {
    if (key=='d')
    {
      yellowSpeed=yellowSpeed+2;
      speed++;
      treesA=treesA-2;
    }
    if (key=='a')
    {
      if (speed>0)
        speed--;
      if (treesA<0)
        treesA=treesA+2;
      if(yellowSpeed>0)
        yellowSpeed=yellowSpeed-2;
    }
  }
}

