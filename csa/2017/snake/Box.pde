public class Box
{
  private float x;
  private float y;
  private float sideLength = 20;
  private int bgColor;
  private boolean edible;
  
  public Box(float initX, float initY, int initBgColor)
  {
    x = initX;
    y = initY;
    bgColor = initBgColor;
  }

  public float getX()
  {
    return x;
  }

  public void setX(float inX)
  {
    x = inX;
  }
  
  public float getY()
  {
    return y;
  }

  public void setY(float inY)
  {
    y = inY;
  }

  public void setRandomPosition()
  {
    x = random(20, width - 20);
    y = random(20, height - 20);
  }

  public boolean isEdible()
  {
    return edible;
  }
  
  public void setEdible(boolean inEdible)
  {
    edible = inEdible; 
  }

  public boolean isCollidingWith(Box other)
  {
    float cx = x + sideLength / 2;
    float cy = y + sideLength / 2;
    float ocx = other.getX() + sideLength / 2;
    float ocy = other.getY() + sideLength / 2;
    float d = dist(cx, cy, ocx, ocy);
    return d < 20;
  }

  public Box clone()
  {
    return new Box(x, y, bgColor); 
  }
  
  public String toString()
  {
    return "(" + x + ", " + y + ")";
  }
  
  public void draw()
  {
    noStroke();
    fill(bgColor);
    rect(x, y, sideLength, sideLength);
  }
}