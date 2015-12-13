import processing.pdf.*;

// Sketch Settings
int pointSize = 5;
float spacingX = 50;
float spacingY = 8;

// Global Variables
int currentStep;
int currentRow;
int totalColumns;
int totalRows;
PVector prevCoord = new PVector(0, 0);
boolean isFlipped = false;
float[] sinFactor;

void setup() {
  size(1190, 842);
  
  beginRecord(PDF, "output.pdf");

  background(255);
  strokeWeight(2);
  fill(0);
  
  totalColumns = width / int(spacingX);
  totalRows = height / int(spacingY);
  calcSinFactors();  
  
}

void draw() {
  
  while(currentRow < totalRows) {
  
    // calculate values
    float sinValue = 25 * sin(map(currentRow, 0, totalRows, 0, 4 + sinFactor[currentStep]));
    float drawX = (currentStep * spacingX) + sinValue;
    float drawY = currentRow * spacingY;
    if (isFlipped) {
      drawY += 20;
      isFlipped = !isFlipped;
    } else {
      drawY -= 20; 
      isFlipped = !isFlipped;
    }
    
    // draw lines
    line(prevCoord.x, prevCoord.y, drawX, drawY);
    
    // remember new coord
    prevCoord.x = drawX; prevCoord.y = drawY;
    
    // move to new line
    if (drawX >= width) {
      currentStep = 0;
      currentRow += 1;
      prevCoord.x = 0; prevCoord.y = currentRow * spacingY; 
      isFlipped = false;
    }
  
    // increment values
    currentStep += 1;  
  }
}

void calcSinFactors() {
  sinFactor = new float[totalColumns + 10];
  
  for (int i = 0; i < totalColumns; i++) {
    sinFactor[i] = random(-1.5, 1.5);
  }
}

void keyPressed() {
  if (key == 'r') {
    background(255);
    currentRow = 0;
    currentStep = 0;
    calcSinFactors();
  } else if (key == 'q') {
    endRecord();
    exit(); 
  }
}
