class Scene {

  private int width;
  private int height;
  private int columns;
  private int rows;
  private ArrayList<Graph> graphs;
  
  private float[] backgroundColor;
  private float[] foregroundColor;

  public Scene() {
    this(500, 400);
  }

  public Scene(int width, int height) {
    this(width, height, 1, 1);
  }

  public Scene(int width, int height, int columns, int rows) {
    this.setWidth(width);
    this.setHeight(height);
    this.setGrid(columns, rows);
    
    this.setBackgroundColor(255, 255, 255);
    this.setForegroundColor(0, 0, 0);

    graphs = new ArrayList<Graph>();
  }

  public void draw() {
    background(this.backgroundColor[0], this.backgroundColor[1], this.backgroundColor[2]);
    
    float scaleX = this.getWidth() / this.getGridColumns();
    float scaleY = this.getHeight() / this.getGridRows();

    for (Graph graph : graphs) {
      graph.draw(graph.getX() * scaleX, 
                 graph.getY() * scaleY, 
                 graph.getWidth() * scaleX, 
                 graph.getHeight() * scaleY,
                 this.backgroundColor,
                 this.foregroundColor);
    }
  }
  
  public void addGraph(Graph graph) {
    this.graphs.add(graph);
  }
  
  public void removeGraph(Graph graph) {
    this.graphs.remove(graph);
  }

  public void setWidth(int width) {
    this.width = width;
  }

  public int getWidth() {
    return this.width;
  }

  public void setHeight(int height) {
    this.height = height;
  }

  public int getHeight() {
    return this.height;
  }

  public void setGrid(int columns, int rows) {
    this.setGridColumns(columns);
    this.setGridRows(rows);
  }

  public void setGridColumns(int columns) {
    this.columns = columns;
  }

  public void setGridRows(int rows) {
    this.rows = rows;
  }

  public int getGridColumns() {
    return this.columns;
  }

  public int getGridRows() {
    return this.rows;
  }
  
  public void setBackgroundColor(float r, float g, float b) {
    this.backgroundColor = new float[]{r, g, b};
  }
  
  public void setForegroundColor(float r, float g, float b) {
    this.foregroundColor = new float[]{r, g, b};
  }
  
}