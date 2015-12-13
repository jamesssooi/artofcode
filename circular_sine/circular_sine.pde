
// Sketch Settings
float baseRandomness = 100;
float spacingValue = 10;
float circRadius = 20;

// Global Variables
int currentStep = 0;
int currentX = 0;
int currentY = 0;
float translation = 0;
float maxDistance;

void setup() {
  size(1190, 842);

  background(255);
  fill(0);
  
  maxDistance = dist(0, 0, width / 2, height / 2);
}

void draw() {
  
  while (currentY <= height) {
   
    // calculate values
    float distance = dist(currentX, currentY, width / 2, height / 2);
    float distRatio = map(distance, 0, maxDistance, 1, 0);
    currentX += circRadius + spacingValue;
    float translationRatio = map(translation, 0, 1, 0, TWO_PI);
    float drawSize = sin(map(distRatio, 1, 0, 0, TWO_PI) + translationRatio);
       
    // draw ellipse
    ellipse(currentX, currentY, circRadius * drawSize, circRadius * drawSize);
    
    // increment values
    currentStep += 1;
    
    // move to new line
    if (currentX >= width) {
      currentX = 0;
      currentStep = 0;
      currentY += spacingValue + circRadius;
    }
  
  }
  
}

void keyPressed() {
  if (key == 'r') {
    background(255);
    translation += 0.05;
    currentY = 0;
    currentX = 0;
  }
}
