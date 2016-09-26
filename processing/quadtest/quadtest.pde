

int x1 = 0;
int y1 = 0;
int x2 = 0;
int y2 = 0;
int x3 = 0;
int y3 = 0;

int deltaX = 0;
int deltaY = 0;

void setup(){
  size(500,500);
}

void draw(){
  background(255);
  deltaX = x3 - x2;
  deltaY = y3 - y2;
  quad(x1,y1,x2,y2,x3,y3,x1 + deltaX,y1 + deltaY);
  quad(x1,y1,x2,y2,x3,y3,x1 + deltaX,y1 + deltaY);
}

void keyPressed(){
    if(key == 'a'){
        x1 = mouseX;
        y1 = mouseY;
    }
    if(key == 'b'){
        x2 = mouseX;
        y2 = mouseY;
    }
    if(key == 'c'){
        x3 = mouseX;
        y3 = mouseY;
    }
  
  
}