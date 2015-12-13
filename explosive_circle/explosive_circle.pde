import processing.pdf.*;

// Sketch Settings
float circRadius = 300;
float degreeStep = radians(2);

// Global Variables
float currentStep;
PVector originPoint;

void setup() {
  size(1190, 842);
  
  beginRecord(PDF, "frame1.pdf");

  background(255);
  fill(0);
  
  // calculate origin point
  originPoint = new PVector(
    width / 2 + circRadius * cos(radians(360)),
    height / 2 + circRadius * sin(radians(360))
  );
}

void draw() {
  
  PVector drawCoords = drawCircle();
  
  // draw lines
  line(drawCoords.x, drawCoords.y, originPoint.x, originPoint.y);
  
  // increment values
  currentStep += 1;
  
  // stop loop
  if (currentStep * degreeStep >= TWO_PI) {
    endRecord();
    exit();
    noLoop(); 
  }
  
}

PVector drawCircle() {
  
  // calculate values
  float theta =  currentStep * degreeStep;
  float drawX = width / 2 + circRadius * cos(theta);
  float drawY = height / 2 + circRadius * sin(theta);
  
  return new PVector(drawX, drawY);
  
}

void keyPressed() {
  if (key == 'r') {
    background(255);
  }
}
