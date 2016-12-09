/**
 * Graph-type.
 * Creates straight lines from each value to the next and puts dots at each value. 
 * Rescales as needed.
 */
class LineGraph extends ValueGraph {
  
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
  }
  
  /**
   * Draws everything specific to this graph.
   */
  public void draw(float offsetX, float offsetY, float width, float height, float[] backgroundColor, float[] foregroundColor) {
    super.draw(offsetX, offsetY, width, height, backgroundColor, foregroundColor);
    
    stroke(foregroundColor[0], foregroundColor[1], foregroundColor[2]);
    fill(foregroundColor[0], foregroundColor[1], foregroundColor[2]);
    
    float scaleX = (width - width / 5) / this.getValues().size();
    
    float maxY = 0;
    for (int i = 0; i < this.getValues().size(); i++)
      if (this.getValues().get(i).value > maxY)
        maxY = this.getValues().get(i).value;
    float scaleY = (height - height / 5) / (maxY + 1);
    
    float x1 = 0;
    float y1 = 0;
    float x2 = 0;
    float y2 = 0;
    for (int i = 0; i < this.getValues().size() - 1; i++) {
      x1 = offsetX + width / 10 + (i + 0.5) * scaleX;
      y1 = offsetY + height - height / 10 - this.getValues().get(i).value * scaleY;
      x2 = offsetX + width / 10 + (i + 1.5) * scaleX;
      y2 = offsetY + height - height / 10 - this.getValues().get(i + 1).value * scaleY;
      
      // draw line from one dot to the next
      line(x1, y1, x2, y2);
      
      // draw first dot of line
      ellipse(x1, y1, 4, 4);
    }
    
    // draw the very last dot
    ellipse(x2, y2, 4, 4);
  }
  
}