char myChar = 'C';

int x,y;

int side = 25;

void setup(){
  size(500,500); 
  rectMode(CENTER);
  x = side;
  y = side;
}  

void draw(){
 background(255); 
 
 print((int(myChar) & 64) >> 6);
 print((int(myChar) & 32) >> 5);
 print((int(myChar) & 16) >> 4);
 print((int(myChar) & 8) >> 3);
 print((int(myChar) & 4) >> 2);
 print((int(myChar) & 2) >>1);
 print(int(myChar) & 1);
 println();


  
}