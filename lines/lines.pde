import processing.pdf.*;

// Sketch Settings
float baseRandomness = 100;

// Global Variables
int currentX = 0;
int currentY = 0;
float maxDistance;

void setup() {
  size(1190, 842);
  
  beginRecord(PDF, "output.pdf");

  background(255);
  fill(0);
  
  maxDistance = dist(0, 0, width / 2, height / 2);
}

void draw() {
  
  while (currentY <= height) {
    // calculate values
    float distance = dist(currentX, currentY, width / 2, height / 2);
    float distanceRatio = map(distance, 0, maxDistance, 0.05, 1.5);
    currentX += random(0, baseRandomness * distanceRatio);
    float drawX = currentX + random(0, baseRandomness * distanceRatio);
    
    // set thickness
    strokeWeight(map(distanceRatio, 0.05, 1.5, 3, 0.5));
    
    // draw lines
    line(currentX, currentY, drawX, currentY);
    
    // move to new line
    if (drawX >= width) {
      currentX = 0;
      currentY += random(10, 30 * distanceRatio);
    }
  
  }
  
}

void keyPressed() {
  if (key == 'r') {
    background(255);
    currentY = 0;
    currentX = 0;
  } else if (key == 'q') {
    endRecord();
    exit(); 
  }
}
