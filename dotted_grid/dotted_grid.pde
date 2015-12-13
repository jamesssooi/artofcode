
// Sketch Settings
int pointSize = 5;
float spacingValue = 10;

// Global Variables
int currentX = 5;
int currentY = 5;

void setup() {
  size(1190, 842);

  background(255);
  fill(0);
}

void draw() {
  
  while(currentY < height) {
    if (random(0, 100) > currentY * 0.1) {
      ellipse(currentX, currentY, pointSize, pointSize);
    }
    
    currentX += spacingValue;
    
    // move to new line
    if (currentX > width) {
      currentY += spacingValue;
      currentX = 5; 
    }
  }
  
}

void keyPressed() {
  if (key == 'r') {
    background(255);
    currentX = 5; currentY = 5;
  }
}
