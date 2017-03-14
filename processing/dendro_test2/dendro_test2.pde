int steps;

int[] dendro;
float inkThreshold = 1;

void setup() {
  size(600, 600);
  frameRate(24);
  background(255);
  steps = 0;
  dendro = new int[width*height];
}

void newGrowth(int steps) {
  float angle = radians(steps%360);  
  
  if (sin(angle)+1 >= inkThreshold) {
    for (int theta = 0; theta < 360; theta++) {
      int x = (int) (cos(radians(theta)) * 5);
      int y = (int) (sin(radians(theta)) * 5);
      dendro[(width*(height/2-y))+(width/2)+x] = color(0,0,0);
    }
  }
}

void draw() {
  newGrowth(steps);
  
  update();
  
  loadPixels();
  for (int loc = 0; loc < width * height; loc++) {
    pixels[loc] = dendro[loc];
  }
  updatePixels();
  
  steps++;
}

void update() {
  
}