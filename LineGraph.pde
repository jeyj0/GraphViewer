/**
 * Graph-type.
 * Create straight lines from each value to the next and puts dots at each value. 
 * Rescales as needed.
 */
class LineGraph extends Graph {
  
  /**
   * List of values to display.
   */
  private ArrayList<Value> values;
  
  /**
   * Most basic constructor.
   */
  public LineGraph(String name) {
    this(name, 0, 0);
  }
  
  /**
   * Simple constructor.
   * Params x and y place the graph in the grid.
   */
  public LineGraph(String name, int x, int y) {
    this(name, x, y, 1, 1);
  }
  
  /**
   * Complete constructor.
   * Params x and y place the graph in the grid.
   * Params width and height set the grid-span.
   */
  public LineGraph(String name, int x, int y, int width, int height) {
    super(name, x, y, width, height);
    
    this.values = new ArrayList<Value>();
  }
  
  /**
   * Draws everything specific to this graph.
   */
  public void draw(float offsetX, float offsetY, float width, float height, float[] backgroundColor, float[] foregroundColor) {
    super.draw(offsetX, offsetY, width, height, backgroundColor, foregroundColor);
    this.drawGraph(offsetX + width / 10, offsetY + height / 10, width - width / 5, height - height / 5, backgroundColor, foregroundColor);
  }
  
  /**
   * Draws the graph itself.
   */
  private void drawGraph(float offsetX, float offsetY, float width, float height, float[] backgroundColor, float[] foregroundColor) {
    stroke(foregroundColor[0], foregroundColor[1], foregroundColor[2]);
    fill(foregroundColor[0], foregroundColor[1], foregroundColor[2]);
    
    float scaleX = width / (this.values.size());
    
    float maxY = 0;
    for (int i = 0; i < this.values.size(); i++)
      if (this.values.get(i).value > maxY)
        maxY = this.values.get(i).value;
    float scaleY = height / (maxY + 1);
    
    float x1 = 0;
    float y1 = 0;
    float x2 = 0;
    float y2 = 0;
    for (int i = 0; i < this.values.size() - 1; i++) {
      x1 = offsetX + (i + 0.5) * scaleX;
      y1 = offsetY + height - this.values.get(i).value * scaleY;
      x2 = offsetX + (i + 1.5) * scaleX;
      y2 = offsetY + height - this.values.get(i + 1).value * scaleY;
      
      // draw line from one dot to the next
      line(x1, y1, x2, y2);
      
      // draw first dot of line
      ellipse(x1, y1, 4, 4);
    }
    
    // draw the very last dot
    ellipse(x2, y2, 4, 4);
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