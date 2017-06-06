import org.openkinect.processing.*;

Kinect kinect;
PImage img;
int[] depth;

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
  //index each of depth pixels
  for(int x = 0; x< kinect.width; x++){
    for(int y = 0; y< kinect.height; y++){
      int index = x + y * kinect.width;
      int d = depth[index];
      if (d > 10 && d < 500){
        img.pixels[index] = color(255,0,55);
      }else{
        img.pixels[index] = color(0);
      }
    }
  }
  img.updatePixels();
  image(img, 0, 0);
}