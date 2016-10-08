import processing.pdf.*;

int side = 2;

char myChar = 'A';
int myInt = int(myChar);
boolean thisBit = false;
int bitIndex = 0;
int X,Y;

void setup() {
  size(1400, 100, PDF, "rect2.pdf");
  background(255);
  noFill();
  myInt = 0;
  strokeWeight(0.1);
}

void draw() {
  fill(0);
 for(int ASCIIint = 0;ASCIIint < 128;ASCIIint++){
  charWrite(10 + 4*side*ASCIIint,50,ASCIIint);
 }
  // Exit the program 
  println("Finished.");
  exit();
}

void charWrite(int localX, int localY,int localInt){
  rect(localX, localY,side,side);
  rect(localX, localY - 2*side,4*side,side);
  bitIndex = 8;
  for(int indexY = 1;indexY < 4;indexY++){
    for(int indexX = 1;indexX < 4;indexX++){
      if((localInt & int(pow(float(2),float(bitIndex)))) >> bitIndex == 1){
        thisBit = true;      
      }
      else{
        thisBit = false;
      }
      if(thisBit){
          rect(localX + indexX*side,localY + indexY*side,side,side);          
      }
      bitIndex--;
    }
  } 
}