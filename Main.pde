/*
 * Global variable space
 */

Scene scene;
int i=0; // counter for continuous rendering, just for testing

void setup() {
  /*
   * Setup scene
   */
  size(1000, 800);
  scene = new Scene(width, height);
  scene.setGrid(3, 3);
  scene.setBackgroundColor(46, 55, 71);
  scene.setForegroundColor(206, 213, 224);
  
  /*
   * Setup test graph
   */
  LineGraph lineGraph = new LineGraph("Fitness", 0, 0, 1, 1);
  lineGraph.addValue(1);
  scene.addPane(lineGraph);
}

void draw() {
  /*
   * Draw all current
   */
  scene.draw();
  
  /*
   * Testing frames
   */
  if (i % 5 == 0) {
    LineGraph g = (LineGraph) scene.panes.get(0);
    g.addValue(g.getLastValue() * random(0.5, 1.5));
  }
  i++; // Counter for testing
}