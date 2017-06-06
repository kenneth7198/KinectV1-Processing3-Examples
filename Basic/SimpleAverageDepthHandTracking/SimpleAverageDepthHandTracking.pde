import org.openkinect.processing.*;

Kinect kinect;
PImage img;
int[] depth;
float minThreshold = 10;
float maxThreshold = 500;
float sumX = 0;
float sumY = 0;
float totalPixels = 0;

void setup(){
  size(640,480);
  kinect = new Kinect(this);
  kinect.initDepth();
  img = createImage(kinect.width, kinect.height, RGB);
}

void draw(){
  background(0);
  img.loadPixels();
  depth = kinect.getRawDepth();
  sumX = 0; sumY=0; totalPixels = 0;
  for(int x = 0; x< kinect.width; x++){
    for(int y = 0; y< kinect.height; y++){
      int index = x + y * kinect.width;
      int d = depth[index];
      if (d > minThreshold && d < maxThreshold){
        img.pixels[index] = color(255,0,55);
        totalPixels++;
        sumX += x;
        sumY += y;
      }else{
        img.pixels[index] = color(0);
      }
    }
  }
  img.updatePixels();
  image(img, 0, 0);
  drawCenter();
}
void drawCenter(){
  float avgX = sumX / totalPixels;
  float avgY = sumY / totalPixels;
  println("avgX="+avgX+",avgY="+avgY+",sX="+sumX+",sY="+sumY+",t="+totalPixels);
  fill(237,165,71);
  ellipse(avgX, avgY, 60, 60);
}