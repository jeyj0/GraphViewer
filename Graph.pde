/**
 * All graphs need to extend this class. Base for any kind of graph to display on screen.
 */
abstract class Graph extends Pane {
  
  /**
   * Name of the graph. Will be displayed as header.
   */
  private String name;
  
  /**
   * Most simple constructor for a graph.
   */
  public Graph(String name) {
    this(name, 0, 0);
  }
  
  /**
   * Simple constructor for a graph.
   * Params x and y describe position in grid.
   */
  public Graph(String name, int x, int y) {
    this(name, x, y, 1, 1);
  }
  
  /**
   * Complete constructor for a graph.
   * Params x and y describe position in grid.
   * Params width and height describe field span in grid.
   */
  public Graph(String name, int x, int y, int width, int height) {
    super(x, y, width, height);
    this.setGraphName(name);
  }
  
  /**
   * Draws the bare necessities for each graph.
   */
  public void draw(float offsetX, float offsetY, float width, float height, float[] backgroundColor, float[] foregroundColor) {
    // Show box (border lines)
    /*stroke(255);
    fill(0, 0, 0, 0);
    rect(offsetX, offsetY, width - 1, height - 1);*/
    
    // Show header
    fill(foregroundColor[0], foregroundColor[1], foregroundColor[2]);
    float textSize = height / 16;
    textSize(textSize);
    textAlign(CENTER, CENTER);
    text(this.getGraphName(), offsetX, offsetY, width, textSize * 2);
  }
  
  /**
   * Sets the graph's name.
   */
  public void setGraphName(String name) {
    this.name = name;
  }
  
  /**
   * The graph's name as displayed as header.
   */
  public String getGraphName() {
    return this.name;
  }
  
}

/**
 * Super class for simple graphs that store a unknown number of values without keys.
 */
abstract class ValueGraph extends Graph {
  
  /**
   * List of values to display.
   */
  private ArrayList<Value> values;
  
  /**
   * Most basic constructor.
   */
  public ValueGraph(String name) {
    this(name, 0, 0);
  }
  
  /**
   * Simple constructor.
   * Params x and y place the graph in the grid.
   */
  public ValueGraph(String name, int x, int y) {
    this(name, x, y, 1, 1);
  }
  
  /**
   * Complete constructor.
   * Params x and y place the graph in the grid.
   * Params width and height set the grid-span.
   */
  public ValueGraph(String name, int x, int y, int width, int height) {
    super(name, x, y, width, height);
    this.values = new ArrayList<Value>();
  }
  
  /**
   * And ArrayList of values of this graph.
   */
  public ArrayList<Value> getValues() {
    return this.values;
  }
  
  /**
   * Removes most right entry and pushes new one in on the left.
   */
  public void translateRight(float y) {
    this.removeLast();
    this.addFirst(y);
  }
  
  /**
   * Removes most left entry and pushes new one in on the right.
   */
  public void translateLeft(float y) {
    this.removeFirst();
    this.addValue(y);
  }
  
  /**
   * Adds a value to the left.
   */
  public void addFirst(float y) {
    this.values.add(0, new Value(y));
  }
  
  /**
   * Adds a value to the right.
   */
  public void addValue(float y) {
    this.values.add(new Value(y));
  }
  
  /**
   * Removes most left value.
   */
  public void removeFirst() {
    this.values.remove(0);
  }
  
  /**
   * Removes most right value.
   */
  public void removeLast() {
    this.values.remove(this.values.size() - 1);
  }
  
  /**
   * Returns most right value.
   */
  public float getLastValue() {
    return this.values.get(this.values.size() - 1).value;
  }
  
}