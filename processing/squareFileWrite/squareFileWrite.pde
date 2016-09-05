float side = 3;
int ones, eights, sixtyfours;
float x = side;
float y = 2*side;
float[] myColors = {0,0,0, 125,0,0, 255,0,0, 255,127,0, 255,255,0, 0,127,0, 0,0,255, 127,0,127, 255,255,255};
//                  black, brown, red,    orange,   yellow,   green,  blue, violet, white

float[] currentColor = {255,255,255};


int globalIndex = 0;

void setup(){
 size(500,1500); 
 background(255);
}


void draw(){
  String myFile[] = loadStrings("squareFileWrite.pde");//this file
  String myString = myFile[globalIndex]; 
  textSize(8);
 // myString = "void draw(){";
  for(int index = 0;index < myString.length();index++){
    printChar(myString.charAt(index));
    x += 4*side;
    if(x >= width - 4*side){
       x = side;
       y += 2*side;      
    }
  }
  x = side;
  y += 2*side;
  globalIndex += 1;
  if(globalIndex >= myFile.length){
    noLoop();
  }
}

void printChar(char a){
  int localInt = int(a);
  ones = localInt%8;
  eights = ((localInt - ones)%64)/8;
  sixtyfours = (localInt - ones - eights*8)/64;
  for(int index = 0;index < 3; index++){ 
    currentColor[index] = myColors[3*sixtyfours + index];
  }
  stroke(color(currentColor[0],currentColor[1],currentColor[2]));
  fill(color(currentColor[0],currentColor[1],currentColor[2]));
  rect(x,y,side,side);
  for(int index = 0;index < 3; index++){ 
    currentColor[index] = myColors[3*eights + index];
  }
  stroke(color(currentColor[0],currentColor[1],currentColor[2]));
  fill(color(currentColor[0],currentColor[1],currentColor[2]));
  rect(x+side,y,side,side);
  //fill(0);
  //text(a,x + 0.2*side,y + 1.6*side);
  for(int index = 0;index < 3; index++){ 
    currentColor[index] = myColors[3*ones + index];
  }
  stroke(color(currentColor[0],currentColor[1],currentColor[2]));
  fill(color(currentColor[0],currentColor[1],currentColor[2]));
  rect(x + 2*side,y,side,side);

}

void colorBar(){
  for(int index =0;index < 8;index++){
     stroke(color(myColors[3*index],myColors[3*index + 1],myColors[3*index+2]));
     fill(color(myColors[3*index],myColors[3*index + 1],myColors[3*index+2])); 
     rect(x + side*index,y,side,side);
     //fill(0);
     //text(index,x + 0.2*side + side*index,y+1.6*side);
  }
  
}