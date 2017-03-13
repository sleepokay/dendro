boolean paused = false;

PShape rings = new PShape();

void setup() {
  size (800, 800, P2D);
  frameRate(24);
  background(255);
  textSize(11);
}


void draw() {

  if (!paused)
    update();
}

void update() {
}

void keyPressed() {  
  if (key == ' ')
    paused = !paused;
}