
// Sketch Settings
int pointSize = 5;
float spacingValue = 2;
float maxHeight = 10;

// Global Variables
int posX;
float currentDeg;
float translation = 0;
float currentY = 5;

void setup() {
  size(1190, 842);

  background(255);
  fill(0);
  smooth();
  rectMode(CENTER);
  
  posX = width / 2;
}

void draw() {
  
  background(255);
  
  while (currentY < height) {
    // calculate thickness
    float factor =  sin(radians(currentDeg));
    
    // draw rect
    rect(posX, currentY, width, maxHeight * factor);
    
    // increment values
    currentY += maxHeight + spacingValue;
    currentDeg += 10;
  }
  
  currentY = 5;
  translation += 3;
  currentDeg = translation;
  
}

void keyPressed() {
  if (key == 'r') {
    background(255);
    currentY = 5;
    translation += 10;
    currentDeg = translation;
  }
}
