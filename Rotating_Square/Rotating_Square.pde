
// Sketch Settings
int pointSize = 5;
float spacingValue = 20;
float squareSize = 40;

// Global Variables
int currentX = 30;
int currentY = 30;
float currentDeg = 0;

void setup() {
  size(1190, 842);

  background(255);
  fill(0);
  noStroke();
}

void draw() {
  
  pushMatrix();
  translate(currentX, currentY);
  //rotate(radians(currentDeg));
  //translate(-squareSize / 2, -squareSize / 2);
  
  // draw rect
  float drawSize = squareSize * noise(currentX, currentY);
  //drawSize = squareSize;
  rect(0, 0, drawSize, drawSize);
  
  popMatrix();
  
  // increment values
  currentX += squareSize + spacingValue;
  currentDeg += 0.5;
  
  // move to new line
  if (currentX > width) {
    currentX = 30;
    currentY += squareSize + spacingValue; 
  }
  
  // stop drawing
  if (currentY > height) {
    noLoop(); 
  }
  
}

void keyPressed() {
  if (key == 'r') {
    background(255);
    currentX = 5; currentY = 5;
  }
}
