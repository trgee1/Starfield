Particle[] pions;
Blaster pewPew;

float myFloatVal = (float)(Math.random()*301.0)+50;
public boolean explosive = false;

int points = 0;
int shots = 0;
  
void setup()
{
  size(400, 400);
  frameRate(20);
  pions = new Particle[500];
  for(int i = 0; i < pions.length; i++){
  pions[i] = new Particle();
  pions[i/4] = new OddballParticle();
  }
}

void draw()
{
 noStroke();
 background(80, 130, 50);
 pewPew = new Blaster();
 pewPew.appear();
 for(int i = 0; i < pions.length; i++){
   pions[i/4].show();
   pions[i].show();
   if(pewPew.laserY <= myFloatVal + 9 && pewPew.laserY >= myFloatVal - 9 && explosive == false && mousePressed == true){
   explosive = true;
     points++;
   }
   if(explosive == true){
   pions[i/2].explode();
   pions[i].explode();
     textAlign(CENTER, CENTER);
     textSize(20);
     text("YOU WIN!", 200, 190);
     text("ACCURACY: " + (float)points/shots * 100 + "%", 200, 210);
     }
   }
}


void mousePressed(){
  pewPew.shoot();
  shots++;
}
class Particle
{
  float myX, myY, mySpeed, myAngle, mySize;
  int myColourR, myColourG, myColourB;
  Particle(){
    myX = 300;
    myY = myFloatVal;
    mySpeed = (float)(Math.random()*2.5)-5.0;
    mySize = 4;
    myAngle = (float)(Math.random()*2*Math.PI);
    myColourR = (int)(Math.random()*31);
    myColourG = (int)(Math.random()*41)+60;
    myColourB = (int)(Math.random()*31);
}
   void explode(){
     myX += Math.cos(myAngle)*mySpeed;
     myY += Math.sin(myAngle)*mySpeed;
   }
    void show(){
      fill(myColourR, myColourG, myColourB);
      rect(myX, myY, mySize, mySize);
      if(explosive == false){
        rect(300, myFloatVal, 5, 5);
      }
}
}

class OddballParticle extends Particle
{
  OddballParticle(){
    myX = 300;
    myY = myFloatVal;
    mySpeed = (float)(Math.random()*2)-4.0;
    mySize = 10;
    myAngle = (float)(Math.random()*2*Math.PI);
    myColourR = (int)(Math.random()*21);
    myColourG = (int)(Math.random()*21)+80;
    myColourB = (int)(Math.random()*21);
  }
  void show(){
      fill(myColourR, myColourG, myColourB);
      rect(myX, myY, mySize, mySize);
      if(explosive == false){
        rect(300, myFloatVal, 5, 5);
      }
    
  }
}

class Blaster{
  //The thing you move
  int tri1x, tri1y, tri2x, tri2y, tri3x, tri3y;
  //The thing you shoot out
  int laserX, laserY, sizX, sizY, laserSpeed;
  Blaster(){
    tri1x = 70;
    tri1y = mouseY;
    tri2x = 10;
    tri2y = mouseY-10;
    tri3x = 10;
    tri3y = mouseY+10;
    
    sizX = 1;
    sizY = 4;
    laserSpeed = 5;
    laserX = tri1x-5;
    laserY = mouseY - 2;
  }
  void appear(){
    fill(20, 100, 10);
    triangle(tri1x-15, tri1y, tri2x+7, tri2y-15, tri3x+7, tri3y+15);
    fill(10, 60, 0);
    triangle(tri1x, tri1y, tri2x, tri2y, tri3x, tri3y);
  }
  void shoot(){
    fill(20, 125, 0);
    while(sizX < 500){
      sizX++;
    rect(laserX, laserY, sizX, sizY);
    }
  }
}

