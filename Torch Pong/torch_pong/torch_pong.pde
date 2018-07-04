import processing.serial.*;
int x, circleX, circleY, xB=3, yB=4, score, d=1,gameState=1,v,rT;
Serial myPort;  
String distance="";


void setup() {
  size(400, 400);
  myPort=new Serial(this, "COM4", 9600);
  myPort.bufferUntil('\n');
}

void draw() {
  if (gameState==1) {
    background(0);
    int data = int(distance);
    rect(x, height-10, 50, 10);
    ellipse(circleX, circleY, 10, 10);
    circleX+=xB;
    circleY+=yB;
    if (circleX>width||circleX<0)xB=-xB;
    if (circleY<0)yB=-yB;
    //if(keyPressed&&key=='k')x-=5;
    if (data==1)x-=5;
    else x+=5;
    if (x>width-50)x=width-50;
    if (x<0)x=0;
    if (circleY+5>height-10&&circleX-5>x&&circleX+5<x+50&&circleY<height&&d==1) {
      yB=-yB;
      score+=100;
      d=0;
    } else d=1;
    if(circleY-5>height)gameState=0;
    text(score, width/2, height/2);
  }
  if(gameState==0){
    background(0);
    rT++;
    text("GAME OVER!!!",width/2,height/2);
    if(rT>50){
      gameState=1;
      circleX=0;
      circleY=0;
      score=0;
      rT=0;
    }
  }
}

void serialEvent (Serial myport)

{

  distance =myPort.readStringUntil('\n');

  if (distance != null)

  {

    distance=trim(distance);
  }
}