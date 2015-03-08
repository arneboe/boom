class Bullet implements SceneObject
{
  
  private PShape shape;
  private PVector speed; //current speed vector in m/s
  private final float g = -9.81;
  private PVector position; //in screen coordinates
  private final float radius;
  
  //initial velocity in m/s^2
  public Bullet(final int x, final int y, final float xVel, final float yVel)
  {
    position = new PVector(x, y);
    this.speed = new PVector(xVel, yVel);
    radius = 2;
    shape = createShape(ELLIPSE, x - radius, y - radius, radius * 2.0, radius * 2.0);
    shape.setFill(color(0, 0, 0));
  }

  public void draw()
  {
    shape(shape);
  }

  public void update(final float dt)
  {
    final float ydd = g * dt;
    final float yd = speed.y * dt;
    final float xd = speed.x * dt;
    
    speed.y += ydd;
    shape.translate(xd, -yd);//-yd because screen coordinates 0/0 is top left
    position.x += xd;
    position.y -= yd;
  }
  
  public PShape getBoundingVolume()
  {
    return null;
  }
  
  public boolean outsideScreen()
  {
    final boolean xOutside = position.x < radius || position.x > width + radius;
    final boolean yOutside = position.y > height + radius;
    return xOutside || yOutside;
  }
}
