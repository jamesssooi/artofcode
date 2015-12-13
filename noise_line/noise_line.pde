import processing.pdf.*;

// Sketch Settings
int spacingValue = 10;

// Global Variables
int currentX = 5;
int currentY = 5;
float yOff = 0;
PVector[] coords;

void setup() {
  size(1190, 842, P2D);
  
  beginRecord(PDF, "output.pdf");

  background(255);
  smooth();
  noFill();
  
  coords = new PVector[1190/spacingValue + 1];
  getCoords();
  
}

void draw() {
  
  if (currentY <= height) {
    beginShape();
    
    for (int i = 0; i < coords.length; i++) {
      float ratio =  map(currentY, 0, height, 0.8, 0.3);
      curveVertex(coords[i].x, (coords[i].y * ratio) + currentY);
    }
    
    endShape();
    
    // increment values
    float spacingRatio = map(currentY, 0, height, 20, 5);
    currentY += spacingRatio + random(0, 5);
  }
}

void getCoords() {
  int i = 0;
  float xOff = 0;
  for (float x = 0; x <= width; x += spacingValue) {
    float y = map(noise(xOff, yOff), 0, 1, 0, 80);
    coords[i] = new PVector(x, y);
    xOff += 0.15;
    i++;
  }
}

void keyPressed() {
  if (key == 'r') {
    background(255);
    coords = new PVector[1190/spacingValue + 1];
    yOff += 1;
    getCoords();
    currentY = 0;
  } else if (key == 'q') {
    endRecord();
    exit(); 
  }
}
