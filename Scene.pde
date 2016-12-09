/**
 * The complete scene that is being displayed.
 * Basically a representation of the grid.
 * Graphs and other panes are collected here.
 */
class Scene {

  /*
   * Size in screen pixels.
   */
  private int width;
  private int height;
  
  /*
   * Size in grid fields.
   */
  private int columns;
  private int rows;
  
  /**
   * A list of all panes to graw on screen.
   */
  private ArrayList<Pane> panes;
  
  /*
   * The colors to use.
   */
  private float[] backgroundColor;
  private float[] foregroundColor;

  /**
   * Standard constructor.
   */
  public Scene() {
    this(500, 400);
  }

  /**
   * Basic constructor.
   * Creates Scene with one grid-field.
   * Params width and height set pixel dimensions.
   */
  public Scene(int width, int height) {
    this(width, height, 1, 1);
  }

  /**
   * Complete constructor.
   * Params width and height set pixel dimensions.
   * Params columns and rows set grid dimensions.
   */
  public Scene(int width, int height, int columns, int rows) {
    this.width = width;
    this.height = height;
    this.setGrid(columns, rows);
    
    this.setBackgroundColor(255, 255, 255);
    this.setForegroundColor(0, 0, 0);

    panes = new ArrayList<Pane>();
  }

  /**
   * Draws all scene-based info and panes placed in it.
   */
  public void draw() {
    background(this.backgroundColor[0], this.backgroundColor[1], this.backgroundColor[2]);
    
    float scaleX = this.getWidth() / this.getGridColumns();
    float scaleY = this.getHeight() / this.getGridRows();

    for (Pane pane : panes) {
      pane.draw(pane.getX() * scaleX, 
                pane.getY() * scaleY, 
                pane.getWidth() * scaleX, 
                pane.getHeight() * scaleY,
                this.backgroundColor,
                this.foregroundColor);
    }
  }
  
  /**
   * Adds a Pane to the list of panes.
   */
  public void addPane(Pane pane) {
    this.panes.add(pane);
  }
  
  /**
   * Removes the given pane from the scene.
   */
  public void removePane(Pane pane) {
    this.panes.remove(pane);
  }

  /**
   * The pixel width of this scene.
   */
  public int getWidth() {
    return this.width;
  }

  /**
   * The pixel height of this scene.
   */
  public int getHeight() {
    return this.height;
  }

  /**
   * Set the grid dimensions.
   * Params columns and rows sets the amount of these in the grid.
   */
  public void setGrid(int columns, int rows) {
    this.setGridColumns(columns);
    this.setGridRows(rows);
  }

  /**
   * Sets amount of visible columns in scene.
   */
  public void setGridColumns(int columns) {
    this.columns = columns;
  }

  /**
   * Sets amount of visible rows in scene.
   */
  public void setGridRows(int rows) {
    this.rows = rows;
  }

  /**
   * Amount of visible columns.
   */
  public int getGridColumns() {
    return this.columns;
  }

  /**
   * Amount of visible rows.
   */
  public int getGridRows() {
    return this.rows;
  }
  
  /**
   * Set the default background color to use for all panes.
   */
  public void setBackgroundColor(float r, float g, float b) {
    this.backgroundColor = new float[]{r, g, b};
  }
  
  /**
   * Set the default foreground color to use for all panes.
   */
  public void setForegroundColor(float r, float g, float b) {
    this.foregroundColor = new float[]{r, g, b};
  }
  
}