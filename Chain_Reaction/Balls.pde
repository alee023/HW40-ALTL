// Alison Lee, Thomas Lin
// APCS2 pd4
// HW40 -- All That Bouncin'
// 2017-05-12

int moving = 0 ;
int expanding = 1 ;
int shrinking = 2 ;
int dead = 3 ;

class Ball {
  float x ;
  float y ;
  color c ; 
  float dx ;
  float dy ;
  int state ;
  float d ;

  Ball() {
    x = random(width - d);
    y = random(height - d);
    dx = random(5);
    dy = random(5);
    float r = random(256);
    float g = random(256);
    float b = random(256);
    c = color(r, g, b);
    state = 0 ;
    d = 20;
  }

  void draw() { // redraw
    ellipse(x, y, d, d); 
    stroke(c);
    fill(c);
    // move() ;
  }

  void move() {
    x = x + dx ;
    y = y + dy ;
    bounce() ;
  }

  void bounce() {
    if (x + d/2 > width || x - d/2 < 0) { // if touching sides
      dx *= -1;
    }
    if (y + d/2 > height|| y - d/2 < 0) { // if touching ceiling/floor
      dy *= -1;
    }
  }

  void state() {
    if ( state == 0 ) {
      move() ;
      draw() ;
    }
    if ( state == 1 ) {
      d += 0.2 ;
      draw() ;
      if ( d > 50 ) {
        state = 3 ;
      }
    }
    if ( state == 2 ) {
      d -= 0.2 ;
      draw() ;
      if ( d <= 0 ) {
        state = 3 ;
      }
    }
    if ( state == 3 ) {
      draw() ;
      d = 0 ;
    }
  }
  
  boolean isTouching( Ball other ) {
    if( state == 0 && ( other.state == 1 ) || other.state == 2 ) {
      return(( d/2 + other.d/2 ) > ( dist( other.x, other.y, x, y ) )) ;
    }
    return false ;
  }
  
}