/*
 * Global variable space
 */

Scene scene;

LineGraph lineGraph;
BarGraph barGraph;
PercentBarGraph percentBarGraph;

void setup() {
  // Setup scene
  size(1000, 800);
  scene = new Scene(width, height);
  scene.setGrid(10, 10);
  scene.setBackgroundColor(46, 55, 71);
  scene.setForegroundColor(169, 192, 229);
  
  // Setup test line-graph
  lineGraph = new LineGraph("Line Graph", 0, 0, 5, 5);
  lineGraph.addValue(1);
  scene.addPane(lineGraph);
  
  // Setup test bar-graph
  barGraph = new BarGraph("Bar Graph", 5, 0, 5, 5);
  barGraph.addValue(0.4123456789);
  barGraph.addValue(1);
  barGraph.addValue(2);
  barGraph.addValue(3);
  barGraph.addValue(7.3957392);
  barGraph.addValue(3);
  barGraph.addValue(5);
  scene.addPane(barGraph);
  
  // Setup test percent-bar-graph
  percentBarGraph = new PercentBarGraph("Percent Bar Graph", 1, 6, 8, 3);
  percentBarGraph.addValue(7);
  percentBarGraph.addValue(1);
  percentBarGraph.addValue(5);
  percentBarGraph.addValue(3);
  percentBarGraph.addValue(5);
  scene.addPane(percentBarGraph);
}

void draw() {
  // Draw all current
  scene.draw();
  
  // Testing frames
  if (frameCount % 2 == 0) {
    if (lineGraph.getValues().size() < 100)
      lineGraph.addValue(lineGraph.getLastValue() * random(0.573, 1.5));
    else
      lineGraph.translateLeft(lineGraph.getLastValue() * random(0.573, 1.5));
    
    int index = (int) random(barGraph.getValues().size() - 0.01);
    barGraph.getValues().set(index, new Value(barGraph.getValues().get(index).value * random(0.9, 1.1)));
    
    index = (int) random(percentBarGraph.getValues().size() - 0.01);
    percentBarGraph.getValues().set(index, new Value(percentBarGraph.getValues().get(index).value * random(0.9, 1.1)));
  }
}