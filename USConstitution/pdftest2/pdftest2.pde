import processing.pdf.*;

int side = 12;

int bitIndex = 0;
int X,Y;
int numberofColumns = 16;
int ones, eights, sixtyfours;


void setup() {
  size(1000, 2000, PDF, "rect2.pdf");
  background(255);
  noFill();
  strokeWeight(0.01);
}

void draw() {
  fill(0);
 for(int ASCIIint = 32;ASCIIint < 127;ASCIIint++){
  charWrite(5*side + 4*side*((ASCIIint-32)%numberofColumns),5*side + 10*side*((ASCIIint - 32)/numberofColumns),ASCIIint);
 }
  // Exit the program 
  println("Finished.");
  exit();
}

void charWrite(int localX, int localY,int localInt){
  ones = localInt&7;
  eights = (localInt>>3)&7;
  sixtyfours = (localInt>>6)&7;
  rect(localX, localY,side,side);
  textSize(16);
  text(char(localInt),localX+side,localY+side);
  text(char(48 + sixtyfours),localX,localY + 2*side); 
  text(char(48 + eights),localX,localY + 3*side); 
  text(char(48 + ones),localX,localY + 4*side); 

  rect(localX, localY - 2*side,4*side,side);
  bitIndex = 8;
  for(int indexY = 1;indexY < 4;indexY++){
    for(int indexX = 1;indexX < 4;indexX++){
      if((localInt & int(pow(float(2),float(bitIndex)))) >> bitIndex == 1){
        rect(localX + indexX*side,localY + indexY*side,side,side);          
      }      
      bitIndex--;
    }
  } 
}