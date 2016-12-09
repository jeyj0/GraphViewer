class LineGraph extends Graph {
  
  private ArrayList<Value> values;
  
  public LineGraph(String name) {
    this(name, 0, 0);
  }
  
  public LineGraph(String name, int x, int y) {
    this(name, x, y, 1, 1);
  }
  
  public LineGraph(String name, int x, int y, int width, int height) {
    super(name, x, y, width, height);
    
    this.values = new ArrayList<Value>();
  }
  
  public void translateRight(float y) {
    this.removeLast();
    this.addFirst(y);
  }
  
  public void translateLeft(float y) {
    this.removeFirst();
    this.addValue(y);
  }
  
  public void addFirst(float y) {
    this.values.add(0, new Value(y));
  }
  
  public void addValue(float y) {
    this.values.add(new Value(y));
  }
  
  public void removeFirst() {
    this.values.remove(0);
  }
  
  public void removeLast() {
    this.values.remove(this.values.size() - 1);
  }
  
  public float getLastValue() {
    return this.values.get(this.values.size() - 1).value;
  }
  
  public void draw(float offsetX, float offsetY, float width, float height, float[] backgroundColor, float[] foregroundColor) {
    super.draw(offsetX, offsetY, width, height, backgroundColor, foregroundColor);
    this.drawGraph(offsetX + width / 10, offsetY + height / 10, width - width / 5, height - height / 5, backgroundColor, foregroundColor);
  }
  
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
      
      line(x1, y1, x2, y2);
      
      ellipse(x1, y1, 4, 4);
    }
    ellipse(x2, y2, 4, 4);
  }
  
}