// Alison Lee, Thomas Lin
// APCS2 pd4
// HW40 -- All That Bouncin'
// 2017-05-12

int numBalls = 10;
Ball[] balls = new Ball[numBalls];

void setup() {
  size(640, 480);
  for (int i = 0; i < numBalls; i++) {
    balls[i] = new Ball();
  }
}

void draw() {
  background(0);
  for (Ball b : balls) {
    b.move();
    b.display();
  }
}


class Ball {
  float x ;
  float y ;
  color c ; 
  float dx ;
  float dy ;
  int state ;
  float d;

  Ball() {
    x = random(width - d);
    y = random(height - d);
    dx = random(10);
    dy = random(10);
    float r = random(256);
    float g = random(256);
    float b = random(256);
    c = color(r, g, b);
    state = 0;
    d = 20;
  }

  void move() {
    x = x + dx ;
    y = y + dy ;
    bounce() ;
  }

  void bounce() {
    if (x + d/2 > width || x - d/2 < 0) {
      dx *= -1;
    }
    if (y + d/2 > height|| y - d/2 < 0) {
      dy *= -1;
    }
  }

  void display() {
    ellipse(x, y, d, d); 
    stroke(c);
    fill(c);
  }
}