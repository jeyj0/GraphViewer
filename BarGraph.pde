/**
 * Graph-type.
 * Creates bars verticalle for each value.
 * Rescales as needed.
 */
class BarGraph extends ValueGraph {
  
  /**
   * Most basic constructor.
   */
  public BarGraph(String name) {
    this(name, 0, 0);
  }
  
  /**
   * Simple constructor.
   * Params x and y place the graph in the grid.
   */
  public BarGraph(String name, int x, int y) {
    this(name, x, y, 1, 1);
  }
  
  /**
   * Complete constructor.
   * Params x and y place the graph in the grid.
   * Params width and height set the grid-span.
   */
  public BarGraph(String name, int x, int y, int width, int height) {
    super(name, x, y, width, height);
  }
  
  /**
   * Draws everything specific to this graph.
   */
  public void draw(float offsetX, float offsetY, float width, float height, float[] backgroundColor, float[] foregroundColor) {
    super.draw(offsetX, offsetY, width, height, backgroundColor, foregroundColor);
    
    stroke(foregroundColor[0], foregroundColor[1], foregroundColor[2]);
    fill(foregroundColor[0], foregroundColor[1], foregroundColor[2]);
    
    float scaleX = width / (this.getValues().size() + 1);
    
    float maxY = 0;
    for (int i = 0; i < this.getValues().size(); i++)
      if (this.getValues().get(i).value > maxY)
        maxY = this.getValues().get(i).value;
    float scaleY = (height - height / 5) / (maxY + 1);
    
    textAlign(CENTER, CENTER);
    int textSize = (int) (0.6 * scaleX / 3);
    textSize(textSize);
    
    float x1 = 0;
    float y1 = 0;
    float x2 = 0;
    float y2 = 0;
    String valueString = "";
    for (int i = 0; i < this.getValues().size(); i++) {
      x1 = offsetX + (i + 0.7) * scaleX;
      y1 = offsetY + height - height / 10;
      x2 = offsetX + (i + 1.3) * scaleX;
      y2 = offsetY + height - height / 10 - this.getValues().get(i).value * scaleY;
      
      fill(foregroundColor[0], foregroundColor[1], foregroundColor[2]);
      rect(x1, y1, x2 - x1, y2 - y1); // bar
      
      text(String.valueOf(i), x1, y1, 0.6 * scaleX, textSize * 2); // text under bar
      
      // text in bar
      fill(backgroundColor[0], backgroundColor[1], backgroundColor[2]);
      valueString = String.format(java.util.Locale.US, "%.1f", this.getValues().get(i).value); // format to #.##
      valueString = Float.valueOf(valueString) == this.getValues().get(i).value ? valueString : "~" + valueString; // add "~" in front, if rounded
      valueString = this.getValues().get(i).value % 1 == 0 ? valueString.substring(0, valueString.length() - 2) : valueString; // if no decimal needed (=0), remove it
      text(valueString, x1, y1, x2 - x1, y2 - y1);
    }
  }
  
}