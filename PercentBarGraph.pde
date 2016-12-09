/**
 * Graph-type.
 * Creates one bar split into percents depending on the values.
 */
class PercentBarGraph extends ValueGraph {
  
  /**
   * Most basic constructor.
   */
  public PercentBarGraph(String name) {
    this(name, 0, 0);
  }
  
  /**
   * Simple constructor.
   * Params x and y place the graph in the grid.
   */
  public PercentBarGraph(String name, int x, int y) {
    this(name, x, y, 1, 1);
  }
  
  /**
   * Complete constructor.
   * Params x and y place the graph in the grid.
   * Params width and height set the grid-span.
   */
  public PercentBarGraph(String name, int x, int y, int width, int height) {
    super(name, x, y, width, height);
  }
  
  /**
   * Draws everything specific to this graph.
   */
  public void draw(float offsetX, float offsetY, float width, float height, float[] backgroundColor, float[] foregroundColor) {
    super.draw(offsetX, offsetY, width, height, backgroundColor, foregroundColor);
    
    stroke(foregroundColor[0], foregroundColor[1], foregroundColor[2]);
    fill(foregroundColor[0], foregroundColor[1], foregroundColor[2], 255 / this.getValues().size());
    
    float x1 = offsetX;
    float y1 = offsetY;
    float x2 = offsetX + width;
    float y2 = offsetY + height;
    
    float sum = 0;
    for (int i = 0; i < this.getValues().size(); i++) {
      sum += this.getValues().get(i).value;
    }
    
    rect(x1, y1, x2 - x1 - 1, y2 - y1 - 1); // -1 with both second coords so that the lines stay in the field.
    for (int i = 0; i < this.getValues().size(); i++) {
      x1 += this.getValues().get(i).value / sum * (width - 1); // -1 so it stays in border
      
      rect(x1, y1, x2 - x1 - 1, y2 - y1 - 1); // -1 with both second coords so that the lines stay in the field.
    }
  }
  
}