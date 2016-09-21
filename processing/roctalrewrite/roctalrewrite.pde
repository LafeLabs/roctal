float x,y;
int side = 5;
char myChar = 'A';
int n = int(myChar);
int thisBit = 0;

void setup(){
 size(200,1000); 
 rectMode(CENTER);
}

void draw(){
  background(255);
  for(int letterIndex = 0;letterIndex < 26;letterIndex++){
    writeChar(int('A') +letterIndex,10*side,10*side + 4*side*letterIndex);
  }
  for(int letterIndex = 0;letterIndex < 26;letterIndex++){
    writeChar(int(random(127)),20*side,10*side + 4*side*letterIndex);
  }

  //println(int(random(127)));
}



void drawCursor(){
  x = mouseX;
  y = mouseY;
  noFill();
  stroke(0);
  for(int digitIndex = 0;digitIndex < 7;digitIndex++){
    rect(x - side*(digitIndex%3),y - side*(digitIndex/3),side,side);
  }
  fill(0);
  rect(x - 3*side,y - 3*side,side,side);
  noFill();  
}


void writeChar(int myIntLocal,int xLocal,int yLocal){
  for(int digitIndex = 0;digitIndex < 7;digitIndex++){
    thisBit = (myIntLocal>>digitIndex)&1;
    if(thisBit ==1){
      fill(0);
    }
    else{
      noFill();
    }
    rect(xLocal - side*(digitIndex%3),yLocal - side*(digitIndex/3),side,side);
  }  
  fill(0);
  rect(xLocal - 3*side,yLocal - 3*side,side,side);
  noFill();  
  rect(xLocal - 1.5*side,yLocal - 1.5*side,4*side,4*side);
  rect(xLocal - 1*side,yLocal - 1*side,3*side,3*side);
}

void keyPressed(){
 myChar = key;
 n = int(myChar);
  
}