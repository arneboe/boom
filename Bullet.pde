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
    shape = createShape(ELLIPSE, 0, 0, radius * 2.0, radius * 2.0);
    shape.setFill(color(0, 0, 0));
  }

  public void draw()
  {
    shape(shape, position.x - radius, position.y - radius);
  }

  public void update(final float dt)
  {
    final float ydd = g * dt;
    float yd = speed.y * dt;
    float xd = speed.x * dt;
       
    speed.y += ydd;
    
    //bouncing walls
    if(position.x + xd >= (width - 2 * radius))
    {
      xd = 0;
      speed.x *= -0.8;
      position.x = width - 2 * radius;
    }
    if(position.x + xd <= radius)
    {
      xd = 0;
      speed.x *= -0.8;
      position.x = radius;
    }      
    if(position.y - yd >= height - 2 * radius)
    {
      position.y = height - 2 * radius;
      speed.y *= -0.8;
      yd = 0;
    }
    
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
