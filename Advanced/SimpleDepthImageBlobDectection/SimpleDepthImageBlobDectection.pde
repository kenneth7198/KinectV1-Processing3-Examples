import org.openkinect.processing.*;
import blobDetection.*;

Kinect kinect;
BlobDetection theBlobDetection;

PImage img;
PImage dImg;
int[] depth;
float minThreshold = 10;
float maxThreshold = 500;
int index=0;

void setup() {
  size(640, 480);
  kinect = new Kinect(this);
  kinect.initDepth();
  img = createImage(kinect.width, kinect.height, RGB);

  theBlobDetection = new BlobDetection(640, 480);
  theBlobDetection.setPosDiscrimination(true);
  theBlobDetection.setThreshold(.1f);
}

void draw() {
  background(0);
  img.loadPixels();
  dImg = kinect.getDepthImage();
  depth = kinect.getRawDepth();

  for (int x = 0; x< kinect.width; x++) {
    for (int y = 0; y< kinect.height; y++) {
      index = x + y * kinect.width;
      int d = depth[index];
      if (d > minThreshold && d < maxThreshold) {
        img.pixels[index] = color(255, 0, 55);
      } else {
        img.pixels[index] = color(0);
      }
    }
  }
  img.updatePixels();
  image(img, 0, 0);
  theBlobDetection.computeBlobs(img.pixels);
  drawBlobsAndEdges(true, true);
}