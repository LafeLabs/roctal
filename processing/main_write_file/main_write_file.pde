import processing.pdf.*;

int side = 5;

int bitIndex = 0;
int X,Y;
int numberofColumns = 32;
int numberofRows = 32;
int columnIndex,rowIndex;

int globalIndex = 0;
int[] blockArray = new int[1024];


void setup() {
  size(740,740, PDF, "thisFile.pdf");
  background(255);
  strokeWeight(0.01);
  fill(0);
  for(int localIndex = 0;localIndex < 1024;localIndex++){
    blockArray[localIndex] = 0;
  }
  rect(0,0,4*side,12*side);
  rect(0,0,12*side,4*side);

  rect(140*side,140*side,4*side,4*side);
  rect(140*side,140*side,4*side,4*side);


}

void draw() {

 byte b[] = loadBytes("description2.txt");  
 for(int localIndex = 0;localIndex < b.length && localIndex < 1024;localIndex++){
    blockArray[localIndex] = b[localIndex];
 }

  
 globalIndex = 0;
 for(rowIndex = 0;rowIndex < numberofRows;rowIndex++){
   for(columnIndex = 0;columnIndex < numberofColumns;columnIndex++){
     charWrite(8*side + 4*side*columnIndex,8*side + rowIndex*4*side,blockArray[globalIndex]);
     globalIndex++;
   }
 }

  // Exit the program 
  println("Finished.");
  exit();
}



void charWrite(int localX, int localY,int localInt){//stripped down version
  fill(0);
  rect(localX, localY,side,side);//alignment and calibration bit
  rect(localX, localY + side,side/4,3*side);
  rect(localX+side/2, localY + side,side/4,3*side);
  rect(localX + side,localY,3*side,side/4);

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