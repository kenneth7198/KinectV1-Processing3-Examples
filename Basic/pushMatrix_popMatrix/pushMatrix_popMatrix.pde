PImage img ;
void setup(){
  size(640,480);
  img = loadImage("grid.gif");
}
void draw(){
  translate(100,100);
  image(img, 0, 0);
}

/*
PImage img ;
void setup(){
  size(640,480);
  img = loadImage("grid.gif");
}
void draw(){
  pushMatrix();  
  translate(100,100);
  image(img, 0, 0);
  fill(261,15,53);
  rect(0,0,50,50);  
  popMatrix();
  
  fill(1,15,213);
  rect(0,0,50,50);
}

*/