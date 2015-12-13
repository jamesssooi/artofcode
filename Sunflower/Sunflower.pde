import processing.pdf.*;

// Sketch Settings
float circleCount = 300;
float largeDiameter = 300;
float largeCircumference = PI * largeDiameter;
float smallDiameter = 15;
color c1 = color(34, 83, 120);
color c2 = color(172, 240, 242);

// Global Variables
int currentStep = 0;
float centerX;
float centerY;
float phi = (sqrt(5)+1)/2 - 1;
float goldenAngle = phi * TWO_PI; 

void setup() {
  size(1190, 842);
  
  beginRecord(PDF, "output.pdf");
  
  centerX = width / 2;
  centerY = height / 2;
  
  //largeDiameter = width * 0.5;
  //smallDiameter = 10;

  background(255);
  fill(0);
  noStroke();
}

void draw() {
  
  // calculate values
  float ratio = currentStep / circleCount;
  float angle = currentStep * goldenAngle;
  float spiralRadius = ratio * largeDiameter;
  //float angle = currentStep * TWO_PI / circleCount;
  float drawX = centerX + cos(angle) * spiralRadius;
  float drawY = centerY + sin(angle) * spiralRadius;
  float drawDiameter = smallDiameter - (currentStep * 0.05);
  float colorRatio = map(drawDiameter, 0, smallDiameter, 0, 1);
  fill(lerpColor(c1, c2, colorRatio));
  
  // draw circle
  if (drawX < width + 30 || drawX > 0 - 30) {
    ellipse(drawX, drawY, drawDiameter, drawDiameter);
  }
  // increment values
  currentStep += 1;
  
}

void calcSin() {
   
   
  
}

void keyPressed() {
  if (key == 'r') {
    background(255);
  } else if (key == 'q') {
    endRecord();
    exit(); 
  }
}
