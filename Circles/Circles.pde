
// Sketch Settings
int circleCount = 100;
float circleDiameter = 200;
int maxStep = 10;

// Global Variables
float[] posX = new float[circleCount];
float[] posY = new float[circleCount];
int currentStep;

void setup() {
  size(1190, 842);

  background(255);
  noFill();
  
  // get random locations
  getRandomLoc();
}

void draw() {
  
  for (int i = 0; i < circleCount; i++) {
   
    float drawX = posX[i] + random(-20, 20);
    float drawY = posY[i] + random(-20, 20);
    float drawSize = circleDiameter + random(-20, 20);
    
    ellipse(drawX, drawY, drawSize, drawSize);
    
  }
  
  currentStep += 1;
  
  if (currentStep > maxStep) {
    noLoop(); 
  }
  
}

void getRandomLoc() {
  for (int i = 0; i < circleCount; i++) {
    posX[i] = random(0, width);
    posY[i] = random(0, height); 
  }
}

void keyPressed() {
  if (key == 'r') {
    background(255);
    currentStep = 0;
    getRandomLoc();
    loop();
  }
}
