
float dt; //the time between two integration steps
int mouseStartX;
int mouseStartY;
ArrayList<Bullet> bullets;
boolean mouseDown = false;

void setup()
{
  size(900,480, P2D); // how large the window/screen is for the game
   
  frameRate(60); // this means draw() will be called 24 times per second
  dt = 1.0 / 60.0;
  bullets = new ArrayList<Bullet>();
  
}


void draw()
{
  background(255);
    
  for(int i = 0; i < bullets.size(); ++i)
  {
    Bullet b = bullets.get(i);
    b.update(dt);
    if(b.outsideScreen())
    {
      bullets.remove(i);
    }
    else
    {
      b.draw();
    }
  }
  stroke(0);
  if(mouseDown)
  {
    line(mouseStartX, mouseStartY, mouseX, mouseY);
  }
}

void mousePressed()
{
  mouseStartX = mouseX;
  mouseStartY = mouseY;
  mouseDown = true;
}

void mouseReleased()
{
  final int dirX = mouseX - mouseStartX;
  final int dirY = -(mouseY - mouseStartY);
  Bullet b = new Bullet(mouseStartX, mouseStartY, dirX, dirY);
  bullets.add(b);
  mouseDown = false;
}
