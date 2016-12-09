/**
 * Abstract class for any kind of Pane displayable on screen. 
 * Graphs and text fields for example.
 * Follows the grid layout of the scene.
 */
abstract class Pane {
  
  /*
   * Dimensions and position in grid.
   */
  private int x;
  private int y;
  private int width;
  private int height;
  
  /**
   * Complete constructor.
   * Params x and y place the pane in the grid.
   * Params width and height define the span of the pane in the grid.
   */
  public Pane(int x, int y, int width, int height) {
    this.setX(x);
    this.setY(y);
    this.setWidth(width);
    this.setHeight(height);
  }
  
  /**
   * Method that draws all necessities.
   */
  public abstract void draw(float offsetX, float offsetY, float width, float height, float[] backgroundColor, float[] foregroundColor);
  
  /**
   * Set x coord in grid.
   */
  public void setX(int x) {
    this.x = x;
  }
  
  /**
   * X coord in grid.
   */
  public int getX() {
    return this.x;
  }
  
  /**
   * Set y coord in grid.
   */
  public void setY(int y) {
    this.y = y;
  }
  
  /**
   * Y coord in grid.
   */
  public int getY() {
    return this.y;
  }
  
  /**
   * Set columnspan in grid
   */
  public void setWidth(int width) {
    this.width = width;
  }
  
  /**
   * Columnspan in grid.
   */
  public int getWidth() {
    return this.width;
  }
  
  /**
   * Set rowspan in grid.
   */
  public void setHeight(int height) {
    this.height = height;
  }
  
  /**
   * Rowspan in grid.
   */
  public int getHeight() {
    return this.height;
  }
  
}