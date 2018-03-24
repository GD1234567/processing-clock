//2018.3.24 By GD.The QQ of zuthor is 642705520.
int s;
int m;
int h;
boolean display = true;
int x, y, px, py;
float[] xx;
float[] yy;
int howMany = 120;
float[] x1 = new float[howMany];
float[] y1 = new float[howMany];
float[] speed = new float[howMany];  
float[] c = new float[howMany];
void setup() {
  size(900, 900);
  smooth();
  x = 440; 
  y = 480; 
  px = 2;
  py = 3;
  xx=new float[13];
  yy=new float[13];
  float angle =0;
  for (int i=0; i < 13; i++) {
    xx[i]=245*cos(angle-PI/2);
    yy[i]=245*sin(angle-PI/2);
    angle +=2*PI/12;
  }
  textAlign(CENTER, CENTER);
  int i = 0;
  while (i<howMany) {
    x1[i] = random(0, width);
    y1[i] =random(0, height);
    c[i] =random(255);
    speed[i] = random(4, 15);
    i +=1;
  }
  stroke(255);
}

void draw() {
  background(0);
  s = second();  // values from 0 - 59
  m = minute();  // values from 0 - 59
  h = hour();    // values from 0 - 23
  x = x + px; 
  y= y + py;

  if (x <= 290 || x>= width-290) {
    px = px*-1;
  }
  if (y <= 290 ||y>= height-290) {
    py = py*-1;
  }
  translate(x, y);
  drawCenterPin();
  drawName();
  drawNumbers();
  drawTicks();
  if (display)
    drawSecondsHand();
  drawMinutesHand(s, m);
  drawHoursHand(s, m, h);
  translate(-x, -y);
  int i = 0;
  strokeWeight(1);
  stroke(255);
  while (i < howMany) {
    line(x1[i]-5, y1[i], x1[i]+5, y1[i]);
    line(x1[i], y1[i]-5, x1[i], y1[i]+5);
    line(x1[i]-3, y1[i]-3, x1[i]+3, y1[i]+3);
    line(x1[i]-3, y1[i]+3, x1[i]+3, y1[i]-3);
    y1[i] += speed[i]/4;
    if (y1[i] > height) {
      y1[i] = 0;
    }
    i +=1;
  }
  while (i<howMany) {
    x1[i] = random(0, width);
    y1[i] =random(0, height);
    c[i] =random(255);
    speed[i] = random(4, 15);
    i +=1;
  }
}
void drawSecondsHand() {
  pushMatrix();
  rotate(radians(map(s, 0, 60, 0, 360)));
  stroke(255, 0, 0);
  strokeWeight(1);
  line(0, 0, 0, -225);
  popMatrix();
}
void drawMinutesHand(int s, int m) {
  pushMatrix();
  rotate(radians(map(m + s / 60.0, 0.0, 60.0, 0.0, 360.0)));
  stroke(0, 0, 255);
  strokeWeight(5);
  line(0, 0, 0, -200);
  popMatrix();
}
void drawHoursHand(int s, int m, int h) {
  pushMatrix();
  if (h > 12) h -= 12;
  rotate(radians(map(h + m / 60.0, 0.0, 12, 0.0, 360.0)));
  strokeWeight(5);
  stroke(0, 255, 0);
  line(0, 0, 0, -100);
  popMatrix();
}
void drawCenterPin() {
  fill(#B2A244);
  stroke(208, 196, 206);
  ellipse(0, 0, 570, 570);
  fill(0);
  noStroke();
  ellipse(0, 0, 15, 15);
}
void keyPressed() {
  if (key == 's' ||key == 'S')
    if (display)
      display = false;
    else
      display = true;
}
void drawName() {
  fill(0,30);
  textSize(25);
  text("Love You", -4, -211);
  text("Fovever", 0, 211);
}
void drawNumbers() {
  fill(0);
  textSize(20);
  for (int i = 1; i<13; i++) {
    text(i, xx[i], yy[i]);
  }
}
void drawTicks() {
  stroke(255, 0, 0);
  strokeWeight(1);
  for (int i = 0; i<60; i++) {
    rotate(2*PI/60);
    line(260, 56, 277, 59);
  }
}