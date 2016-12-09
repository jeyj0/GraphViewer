abstract class Pane {
  
  private int x;
  private int y;
  private int width;
  private int height;
  
  public Pane(int x, int y, int width, int height) {
    this.setX(x);
    this.setY(y);
    this.setWidth(width);
    this.setHeight(height);
  }
  
  public abstract void draw(float offsetX, float offsetY, float width, float height, float[] backgroundColor, float[] foregroundColor);
  
  public void setX(int x) {
    this.x = x;
  }
  
  public int getX() {
    return this.x;
  }
  
  public void setY(int y) {
    this.y = y;
  }
  
  public int getY() {
    return this.y;
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
  
}