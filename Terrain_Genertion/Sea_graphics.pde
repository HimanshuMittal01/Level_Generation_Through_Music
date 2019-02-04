//If you want to run acceleromter uncomment some of the lines

import processing.serial.*;

Serial myPort;  // Create object from Serial class
int val;      // Data received from the serial port

float angle;

int rows, cols;
int w = 3000;
int h = 1600;
int scl = 20;

float flying = 0;

float[][] terrain;
void setup(){
  size(900, 600, P3D);
  
  //String portName = Serial.list()[0];
  //myPort = new Serial(this, portName, 9600);
  
  cols = floor(w/scl);
  rows = floor(h/scl);
  terrain = new float[cols][rows];
}

void draw() {
  /*
  if ( myPort.available() > 0) {  // If data is available,
    val = myPort.read();         // read it and store it in val
  }*/
  
  flying -= 0.1;
  
  //keeping angle boundaries in check
  if (angle > PI/4) {
    angle = PI/4;
  } else if (angle < -PI/4) {
    angle = -PI/4;
  }
  
  
  float yoff = flying;
  for (int y=0; y<rows; y++) {
    float xoff = 0;
    for (int x=0; x<cols; x++) {
      terrain[x][y] = map(noise(xoff, yoff), 0, 1, -100, 100);
      xoff += 0.1;
    }
    yoff += 0.1;
  }
  
  background(0);
  stroke(255);
  noFill();
  
  translate(width/2, height/2);
  rotateX(PI/6);
  
  //of course we can change the way it moves through accelerometer
  /*
  if(val==2){
    rotateY(angle);
    angle -= 0.01;
  }else if(val==0){
    rotateY(angle);
    angle += 0.01;
  } else{
    float beforeState = angle;
    if (angle>0) {
      rotateY(angle);
      angle -= 0.01;
    } else if(angle<0) {
      rotateY(angle);
      angle += 0.01;
    }
    float afterState = angle;
    if (beforeState*afterState < 0){
      angle = 0;
    }
  }
  
  */
  translate(-w/2, -h/2);
  
  //designing my wave
  //how it looks like
  
  
  
  for (int y=0; y<rows-1; y++) {
    beginShape(TRIANGLE_STRIP);
    for (int x=0; x<cols; x++) {
      
      if (abs(x-cols/2) >= 1 && abs(x-cols/2) < 3 && y  + 3> rows/2) {
        fill(splitWater(x, y));
      } else{
        fill(50, 50, abs(terrain[x][y])+100);
      }
      
      noStroke();
      
      vertex(x*scl, y*scl, terrain[x][y]);
      vertex(x*scl, (y+1)*scl, terrain[x][y+1]);
    }
    endShape();
  }
}

float splitWater(int rno, int cno) {
  float rNormalized = (float) rno/rows;
  float cNormalized = (float) cno/cols;
  
  if (rNormalized - 0.5 >0.2 && cNormalized - 0.5 < 0.2 && cNormalized > 0.5 - 0.2) {
    return sqrt(pow(rNormalized, 2) + pow(cNormalized, 2))*255;
  } else {
    return terrain[rno][cno];
  }
}
