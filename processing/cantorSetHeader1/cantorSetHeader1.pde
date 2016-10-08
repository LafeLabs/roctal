import processing.pdf.*;

int side = 10;

int bitIndex = 0;
int X,Y;
int numberofColumns = 10;
int ones, eights, sixtyfours;
int columnIndex;
int currentTextSize = 64;

void setup() {
  size(1000, 2000, PDF, "cantorHeader.pdf");
  background(255);
  noFill();
  strokeWeight(0.01);
}

void draw() {
  fill(0);

  numberofColumns = 4;
  side = width/(numberofColumns*4);
 for(columnIndex = 0;columnIndex < numberofColumns;columnIndex++){
   int ASCIIint = 65 + columnIndex%26;
   charWrite(4*side*columnIndex,5*side,ASCIIint);
 }
 currentTextSize /= 2;
  numberofColumns = 8;
  side = width/(numberofColumns*4);
 for(columnIndex = 0;columnIndex < numberofColumns;columnIndex++){
   int ASCIIint = 65 + columnIndex%26;
   charWrite(4*side*columnIndex,22*side,ASCIIint);//5*side*2 + 14 side
 }
 currentTextSize /= 2;
  numberofColumns = 16;
  side = width/(numberofColumns*4);
 for(columnIndex = 0;columnIndex < numberofColumns;columnIndex++){
   int ASCIIint = 65 + columnIndex%26;
   charWrite(4*side*columnIndex,60*side,ASCIIint);
 }
 currentTextSize /= 2;
  numberofColumns = 32;
  side = width/(numberofColumns*4);
 for(columnIndex = 0;columnIndex < numberofColumns;columnIndex++){
   int ASCIIint = 65 + columnIndex%26;
   charWrite(4*side*columnIndex,147*side,ASCIIint);
 }
 currentTextSize /= 2;
 numberofColumns = 64;
 side = width/(numberofColumns*4);
 for(columnIndex = 0;columnIndex < numberofColumns;columnIndex++){
   int ASCIIint = 65 + columnIndex%26;
   charWrite(4*side*columnIndex,370*side,ASCIIint);
 }
 currentTextSize /= 2;
 numberofColumns = 128;
 side = width/(numberofColumns*4);
 for(columnIndex = 0;columnIndex < numberofColumns;columnIndex++){
   int ASCIIint = 65 + columnIndex%26;
   charWrite(4*side*columnIndex,1150*side,ASCIIint);
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
  textSize(currentTextSize);
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