import org.openkinect.processing.*;

Kinect kinect;
PImage img;
PImage dImg;
int[] depth;
float minThreshold = 10;
float maxThreshold = 700;
int index=0;
int areaX = 250;
int areaY = 250;

void setup(){
  size(640,480);
  kinect = new Kinect(this);
  kinect.initDepth();
  img = createImage(kinect.width, kinect.height, RGB);
}

void draw(){
  background(0);
  img.loadPixels();
  dImg = kinect.getDepthImage();
  depth = kinect.getRawDepth();
  
  for(int x = 0; x< kinect.width; x++){
    for(int y = 0; y< kinect.height; y++){
      index = x + y * kinect.width;
      int d = depth[index];
      if (d > minThreshold && d < maxThreshold){
        img.pixels[index] = color(255,0,55);
      }else{
        img.pixels[index] = dImg.pixels[index];
      }
    }
  }
  img.updatePixels();
  image(img, 0, 0);
  fill(252,247,242);
  ellipse(mouseX, mouseY, 25, 25);
  fill(198,229,22);
  ellipse(areaX,areaY,35,35);
  
}
void mouseClicked(){
  if(mouseButton == LEFT){
    areaX = mouseX;
    areaY = mouseY;
  }
}