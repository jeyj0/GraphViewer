Scene scene;

void setup() {
  size(1000, 800);
  scene = new Scene(width, height);
  scene.setGrid(3, 3);
  scene.setBackgroundColor(46, 55, 71);
  scene.setForegroundColor(206, 213, 224);
  
  LineGraph lineGraph = new LineGraph("Fitness", 0, 0, 1, 1);
  lineGraph.addValue(1);
  scene.addGraph(lineGraph);
}

int i=0;
void draw() {
  scene.draw();
  if (i % 5 == 0) {
    LineGraph g = (LineGraph) scene.graphs.get(0);
    g.addValue(g.getLastValue() * random(0.5, 1.5));
  }
  i++;
}