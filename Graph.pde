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
    stroke(255);
    fill(0, 0, 0, 0);
    rect(offsetX, offsetY, width, height);
    
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