import org.openkinect.processing.*;

Kinect kinect;
PImage img;
PImage dImg;
int[] depth;
float minThreshold = 10;
float maxThreshold = 500;
int index=0;
int areaX = 250;
int areaY = 250;
float sumX=0;
float sumY=0;
float totalPixels = 0;  
boolean hotspotClicked = false;

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
  sumX=0; sumY=0; totalPixels = 0;  
  for(int x = 0; x< kinect.width; x++){
    for(int y = 0; y< kinect.height; y++){
      index = x + y * kinect.width;
      int d = depth[index];
      if (d > minThreshold && d < maxThreshold){
        img.pixels[index] = color(255,0,55);
        totalPixels++;
        sumX += x;
        sumY += y;
      }else{
        img.pixels[index] = dImg.pixels[index];
      }
    }
  }
  img.updatePixels();
  image(img, 0, 0);
  drawHotspot();
  if(hotspotClicked==false){
    drawCenter(0);
  }else{
    drawCenter(1);
  }
}
void mouseClicked(){
  if(mouseButton == LEFT){
    areaX = mouseX;
    areaY = mouseY;
  }
}
void drawHotspot(){
  fill(252,247,242);
  ellipse(mouseX, mouseY, 25, 25);
  fill(193,13,79);
  ellipse(areaX,areaY,35,35);
}
void drawCenter(int c){
  float avgX = sumX / totalPixels;
  float avgY = sumY / totalPixels;
  if(avgX > ( areaX- 50) && avgX < (areaX + 50) &&
     avgY > (areaY - 50) && avgY < (areaY + 50)){
       hotspotClicked = true;
  }else{
       hotspotClicked = false;
  }
  if(c == 0){
    fill(237,165,71);
  }else{
    fill(13,73,193);
  }
  ellipse(avgX, avgY, 60, 60);
}