// Alison Lee, Thomas Lin
// APCS2 pd4
// HW40 -- All That Bouncin'
// 2017-05-12

boolean reaction ;
Ball[] balls ;

void setup() {
  size( 600, 600 ) ;
  balls = new Ball[20] ;
  for (int i = 0; i < 20; i++) {
    balls[i] = new Ball();
  }
  reaction = false ;
}

void draw() {
  background(0);
  for ( Ball n : balls ) {
    // ellipse( n.x, n.y, n.d, n.d ) ;
    // stroke( n.c ) ;
    // fill( n.c ) ;
    // n.move() ;
    for ( Ball i : balls ) {
      if ( n.state == 0 && n.isTouching( i )) {
        n.state = 1 ;
        i.state = 1 ;
      }
    }
    n.state() ;
  }
}

void mouseClicked() {
  if ( !reaction ) { // clicking AGAIN has no effect
    balls[ 0 ].x = mouseX ;
    balls[ 0 ].y = mouseY ;
    // state of ball clicked is set to expanding
    balls[ 0 ].state = 1 ;
    reaction = true ;
  }
}