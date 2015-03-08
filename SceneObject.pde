//Root interface of all drawable objects
interface SceneObject
{
  //draws the object to the screen
  public void draw();
  /* Updates the objects state
   * @param dt Time since last call in seconds */
  public void update(final float dt);
  //Returns the approximate shape of this object
  public PShape getBoundingVolume();
  
  //returns true if the objects is fully outside the screen and will never come back
  public boolean outsideScreen();
}
