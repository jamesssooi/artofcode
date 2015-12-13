import processing.pdf.*;

// Sketch Settings
int pointSize = 5;
float spacingValue = 5;
float lineLength = 30;
float rotationValue = radians(2);

// Global Variables
int currentX = 10;
int currentY = 10;
float currentRotation = radians(0);
boolean isFlipped = false;

void setup() {
  size(1190, 842);
  
  beginRecord(PDF, "frame1.pdf");

  background(255);
  fill(0);
  strokeWeight(1.5);
}

void draw() {
  
  while(currentY < height) {
    pushMatrix();
    
    // translate and rotate grid to new position
    translate(currentX, currentY + 0.5 * lineLength);
    rotate(currentRotation);
    
    // draw line
    line(0, 0, 0, 0 + lineLength);
    
    // increment values
    currentX += spacingValue;
    if (isFlipped) {
      currentRotation -= rotationValue; 
    } else {
      currentRotation += rotationValue; 
    }
    
    // flip rotation
    if (currentRotation > radians(180)) {
       isFlipped = !isFlipped; 
    } else if (currentRotation < radians(0)) {
       isFlipped = !isFlipped; 
    }
    
    // move to new line
    if (currentX > width) {
      currentX = 10;
      currentY += lineLength * 3; 
    }
    popMatrix();
  }
  
}

void keyPressed() {
  if (key == 'r') {
    background(255);
    currentX = 5; currentY = 5;
  } else if (key == 'q') {
    endRecord();
    exit(); 
  }
}
