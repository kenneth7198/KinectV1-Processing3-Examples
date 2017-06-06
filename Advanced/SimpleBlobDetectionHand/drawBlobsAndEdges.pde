void drawBlobsAndEdges(boolean drawBlobs, boolean drawEdges)
{
  noFill();
  Blob b;
  EdgeVertex eA, eB;

  for (int n=0; n<theBlobDetection.getBlobNb(); n++)
  {
    b=theBlobDetection.getBlob(n);
    if (b!=null)
    {
      // Edges
      if (drawEdges)
      {
        strokeWeight(1);
        stroke(0, 255, 0);
        for (int m=0; m<b.getEdgeNb(); m++)
        {
          eA = b.getEdgeVertexA(m);
          eB = b.getEdgeVertexB(m);
          if (eA !=null && eB !=null)
            line(
              eA.x*width, eA.y*height, 
              eB.x*width, eB.y*height
              );
        }
      }

      // Blobs
      if (drawBlobs)
      {
        strokeWeight(3);
        float box_X = b.xMin*width;
        float box_Y = b.yMin*height;
        float box_W = b.w*width;
        float box_H = b.h*height;

        if (box_W > 150 && box_H > 100 && box_W < 350 && box_H < 250 ) {
          stroke(72, 91, 219);
          rect(box_X, box_Y, box_W, box_H);
          fill(255);
          ellipse(box_W / 2 + box_X, box_H / 2 + box_Y, 30, 30);
        }
      }
    }
  }
}

//void drawBlobsAndEdges(boolean drawBlobs, boolean drawEdges)
//{
//  noFill();
//  Blob b;
//  EdgeVertex eA, eB;
//  for (int n=0; n<theBlobDetection.getBlobNb(); n++)
//  {
//    b=theBlobDetection.getBlob(n);
//    if (b!=null)
//    {
//      // Edges
//      if (drawEdges)
//      {
//        strokeWeight(1);
//        stroke(0, 255, 0);
//        for (int m=0; m<b.getEdgeNb(); m++)
//        {
//          eA = b.getEdgeVertexA(m);
//          eB = b.getEdgeVertexB(m);
//          if (eA !=null && eB !=null)
//            line(
//              eA.x*width, eA.y*height, 
//              eB.x*width, eB.y*height
//              );
//        }
//      }

//      // Blobs
//      if (drawBlobs)
//      {
//        strokeWeight(1);
//        stroke(255, 0, 0);
//        rect(
//          b.xMin*width, b.yMin*height, 
//          b.w*width, b.h*height
//          );
//      }
//    }
//  }
//}