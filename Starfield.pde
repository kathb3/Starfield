Particle[] boop = new Particle[700];

void setup(){
  size(500, 500);
  background(0,15);
  for(int i = 0; i < 10; i++){
    boop[i] = new Oddball();
  }
  for(int i = 10; i < boop.length; i++){
    boop[i] = new Particle();
  }
}

void draw(){
  background(0);
  for(int i = 0; i < boop.length; i++){
    boop[i].move();
    boop[i].show();
  }
  frameRate(100);
}

void mousePressed(){
  background(0);
  for(int i = 0; i < 10; i++){
    boop[i] = new Oddball();
    boop[i].move();
    boop[i].show();
  }
  for(int i = 10; i < boop.length; i++){
    boop[i] = new Particle();
    boop[i].move();
    boop[i].show();
  }
}

class Particle{
  float myX, myY, mySize;
  double myAngle, mySpeed;
  int myColor;
  Particle(){
    myX = mouseX;
    myY = mouseY;
    myAngle = Math.random()*(Math.random()*-1)*Math.PI;
    mySpeed = (Math.random()*3) + 2;
    myColor = color((int)(Math.random() * 255), (int)(Math.random() * 255), 0, 90); 
    mySize = (float)(Math.random() + 3);
}
  void show(){
    noStroke();
    fill(myColor);
    float size = (float)mySize * dist(250, 250, myX, myY)/30;
    ellipse((float)myX, (float)myY, size, size);
  }
  void move(){
    myX = myX + (float)(Math.cos(myAngle) * mySpeed);
    myY = myY + (float)(Math.sin(myAngle) * mySpeed);
  }
}

class Oddball extends Particle
{
  Oddball() {
    myColor = color(255, 189, 13, 90);
    mySize = 10;
    myX = myY = 250;
    myAngle = Math.random()*1* Math.PI;
    mySpeed = Math.random()*5 + 1;
  }
  void move(){
    myX += Math.cos(myAngle) * mySpeed;
    myX += Math.random() * 5 - 2;
    myY += Math.sin(myAngle) * mySpeed;
    myY += Math.random() * 5 - 2;
  }
  void enlarge(){
    mySize += .01;  
  }
  void shrink() {
    mySize -= .01;  
  }
}
