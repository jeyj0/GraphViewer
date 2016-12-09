abstract class Graph extends Pane {
  
  private String name;
  
  public Graph(String name) {
    this(name, 0, 0);
  }
  
  public Graph(String name, int x, int y) {
    this(name, x, y, 1, 1);
  }
    
  public Graph(String name, int x, int y, int width, int height) {
    super(x, y, width, height);
    this.setGraphName(name);
  }
  
  public void draw(float offsetX, float offsetY, float width, float height, float[] backgroundColor, float[] foregroundColor) {
    stroke(255);
    fill(0, 0, 0, 0);
    rect(offsetX, offsetY, width, height);
    
    fill(foregroundColor[0], foregroundColor[1], foregroundColor[2]);
    float textSize = height / 16;
    textSize(textSize);
    textAlign(CENTER, CENTER);
    text(this.getGraphName(), offsetX, offsetY, width, textSize * 2);
  }
  
  public void setGraphName(String name) {
    this.name = name;
  }
  
  public String getGraphName() {
    return this.name;
  }
  
}