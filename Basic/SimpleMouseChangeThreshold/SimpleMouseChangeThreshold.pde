import org.openkinect.processing.*;

Kinect kinect;
PImage img;
int[] depth;
boolean thresholdState = true;
float minThreshold = 10;
float maxThreshold = 500;

void setup(){
  size(640,480);
  kinect = new Kinect(this);
  kinect.initDepth();
  img = createImage(kinect.width, kinect.height, RGB);
}

void draw(){
  background(0);
  img.loadPixels();
  if(thresholdState == true){
    minThreshold = map(mouseX, 0, width, 0, 4800);
    maxThreshold = map(mouseY, 0, height, 0 ,4800);
  }
  depth = kinect.getRawDepth();
  //index each of depth pixels
  for(int x = 0; x< kinect.width; x++){
    for(int y = 0; y< kinect.height; y++){
      int index = x + y * kinect.width;
      int d = depth[index];
      if (d > minThreshold && d < maxThreshold){
        img.pixels[index] = color(255,0,55);
      }else{
        img.pixels[index] = color(0);
      }
    }
  }
  img.updatePixels();
  image(img, 0, 0);
  fill(255);
  text("Min:"+minThreshold+",Max:"+maxThreshold,10,20);
}
void mousePressed(){
  if(mouseButton == LEFT){
    thresholdState = false;
    println("Set Threshold="+minThreshold+","+maxThreshold);
  }else if(mouseButton == RIGHT){
    thresholdState = true;
    println("Unlock");
  }
}