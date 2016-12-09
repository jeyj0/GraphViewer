Scene scene;

void setup() {
  size(1000, 800);
  scene = new Scene(width, height);
  scene.setGrid(3, 3);
  scene.setBackgroundColor(46, 55, 71);
  scene.setForegroundColor(206, 213, 224);
  
  LineGraph lg = new LineGraph("Fitness", 1, 1, 1, 1);
  for (int i = 0; i < 100; i++)
    lg.addValue(random(1));
  // lg.addValue(2);
  // lg.addValue(4);
  // lg.addValue(5);
  // lg.addValue(5.5);
  scene.addGraph(lg);
}

int i=0;
void draw() {
  scene.draw();
  if (i % 5 == 0) {
    LineGraph g = (LineGraph) scene.graphs.get(0);
    g.translateLeft(g.getLastValue() * random(0.6, 1.5));
  }
  i++;
}