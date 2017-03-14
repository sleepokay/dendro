boolean paused = false;
int maxNum = 100;
int interval = 5;
int current = 0;

ArrayList<PShape> rings;

void setup() {
  size(500, 500, P2D);
  background(255);
  textSize(11);
  smooth();
  frameRate(12);
  rings = new ArrayList<PShape>();
}

void newGrowth() {
  PShape ring = createShape();
  ring.beginShape();
  ring.noFill();
  ring.stroke(0);
  for (int i = 0; i < 16; i++) {
    float angle = i * ((2*PI)/16.0);
    float x = cos(angle) * 3;
    float y = sin(angle) * 3;
    if (i == 0)
      ring.curveVertex(x, y);
    ring.curveVertex(x, y);
  }
  ring.curveVertex(3, 0);
  ring.curveVertex(3, 0);
  ring.endShape();
  rings.add(ring);
}


void draw() {
  background(255);
  for (PShape ring : rings)
    shape(ring, width/2, height/2);
  
  if (!paused)
    update();
  
  if (current%interval == 0)
    newGrowth();
      
  current++;
}

void update() {
  for (PShape ring : rings) {
    for (int i = 0; i < ring.getVertexCount(); i++) {
      PVector v = ring.getVertex(i);
      v.setMag(v.mag() + 1);
      ring.setVertex(i, v);
    }
  }
  
}

void keyPressed() {  
  if (key == ' ')
    paused = !paused;
}