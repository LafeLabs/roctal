import processing.pdf.*;

int side = 5;

int bitIndex = 0;
int X,Y;
int numberofColumns = 16;
int ones, eights, sixtyfours;
int columnIndex,rowIndex;

int ASCIIint;

int globalIndex = 0;
String inputString = " ";


void setup() {
  size(400, 400, PDF, "tetrahedronroctal.pdf");
  background(255);
  noFill();
  strokeWeight(0.01);
}

void draw() {
  fill(0);

 numberofColumns = 16;
 globalIndex = 0;
 byte b[] = loadBytes("tetrahedron1.stl");  
 //String lines[] = loadStrings("USC.txt");//copy this code into this text file
// inputString = join(lines, "");
 for(rowIndex = 0;rowIndex < 20;rowIndex++){
   for(columnIndex = 0;columnIndex < numberofColumns;columnIndex++){
     if(globalIndex < b.length){
       ASCIIint = b[globalIndex];
       charWrite(4*side*columnIndex,rowIndex*4*side,ASCIIint);
       globalIndex++;
     }
     else{
       break;
     }
   }
 }

  // Exit the program 
  println("Finished.");
  exit();
}



void charWrite(int localX, int localY,int localInt){//stripped down version
  ones = localInt&7;
  eights = (localInt>>3)&7;
  sixtyfours = (localInt>>6)&7;
  rect(localX, localY,side,side);//alignment and calibration bit
  fill(0,0,255);
  rect(localX, localY + side,side,3*side);
  rect(localX + side,localY,3*side,side);
  fill(0);
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