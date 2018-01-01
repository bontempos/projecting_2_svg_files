/*
  EXAMPLE
  projecting 2 SVG files in a previously calibrated environment
  2018-01-01 Anderson Sudario 
*/

import bontempos/pointerDevice.*;

PointerEnvironment env;
ArrayList<PointerDevice> pointers;
ArrayList<PointerCluster> clusters;
ArrayList<PointerCanvas> canvases;

PointerCanvas happyFaceCanvas;
PointerCanvas sadFaceCanvas;

Pshape happyFace;
Pshape sadFace;

void setup() {
  //loads calibrated environment
  env = new PointerEnvironment(this);
  env.load();

  //if few, and user knows each one of them
  pointers = env.getPointers();

  //if user knows small number of clusters containing n pointers
  clusters = env.getPointerClusters();

  happyFace = loadShape("happy face.svg");
  sadFace   = loadSahep("sad face.svg");

  //set canvas with contents
  happyFaceCanvas = new PointerCanvas( happyFace );
  //or create new empty canvas;
  sadFaceCanvas   = new PointerCanvas( sadFace.width, sadFace.width );
  //and set contents:
  sadFaceCanvas.setContents(sadFace);
  
  //assing each pointer;
  happyFaceCanvas.assign(pointers, 1);

  //OR

  //assign pointers range;
  sadFaceCanvas.assign(pointers, 4, 7);

  //OR

  //assign clusters
  happyFaceCanvas.assign(clusters.get(0));
  sadFaceCanvas.assign(clusters.get(1));

  canvases.add(happyFaceCanvas);
  canvases.add(sadFaceCanvas);
}


void draw() {
  //could be also started by a button click or whatever.
  for ( PointerCanvas canvas : canvases)
    canvas.project();
  }  
}