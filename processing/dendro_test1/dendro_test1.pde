boolean paused = false;

int maxNum = 100;

ArrayList<PShape> rings;

void setup() {
  size(500, 500, P2D);
  background(255);
  textSize(11);
  smooth();
  rings = new ArrayList<PShape>();
  
  PShape ring = createShape();
  ring.beginShape();
  ring.noFill();
  ring.stroke(0);
  for (int i = 0; i < 16; i++) {
    float angle = i * ((2*PI)/16.0);
    float x = width/2 + cos(angle) * 3;
    float y = height/2 + sin(angle) * 3;
    if (i == 0 || i == 15)
      ring.curveVertex(x, y);
    ring.curveVertex(x,y);
  }
  ring.endShape();
  
  rings.add(ring);
}


void draw() {
  
  for (PShape ring : rings)
    shape(ring);
  
  if (!paused)
    update();
}

void update() {
  
}

void keyPressed() {  
  if (key == ' ')
    paused = !paused;
}