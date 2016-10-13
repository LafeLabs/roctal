import processing.pdf.*;

int side = 5;

int bitIndex = 0;
int X,Y;
int numberofColumns = 16;
int ones, eights, sixtyfours;
int columnIndex,rowIndex;
int currentTextSize = 64;

int ASCIIint;

int globalIndex = 0;
String inputString = " ";


void setup() {
  size(1000, 1000, PDF, "thisFile.pdf");
  background(255);
  noFill();
  strokeWeight(0.01);
}

void draw() {
  //1. draw Cantor Set Header
  
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

  
  
  
  //2. print ASCII file header documenting whole thing
  
   numberofColumns = 64;
 
 String lines[] = loadStrings("USC.txt");//copy this code into this text file
 inputString = join(lines, "");
 for(rowIndex = 0;rowIndex < 64;rowIndex++){
   for(columnIndex = 0;columnIndex < numberofColumns;columnIndex++){
     int ASCIIint = int('a');
     ASCIIint = int(inputString.charAt(globalIndex));
     charWrite(4*side*columnIndex,rowIndex*4*side,ASCIIint);
     globalIndex++;
     if(globalIndex >= 64*64){
        println("Finished.");
        exit(); 
     }
   }
 }
  
  //3. print actual file data
  
  
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