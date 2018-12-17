public class Brick
{
  private int x; 
  private int y;
  private int w = BRICK_WIDTH;
  private int h = BRICK_HEIGHT;
  private int c;

  public Brick(int initX, int initY, int initColor)
  {
    x = initX;
    y = initY;
    c = initColor;
  }

  public int getX()
  {
    return x;
  }

  public int getY()
  {
    return y;
  }

  public boolean isCollidingWithBall()
  {
    for (Ball ball : balls)
    {
      if (isBallCollidingWithRect(ball, x, y, w, h))
      {
        return true;
      }
    }
    
    return false;
  }

  public void drawBrick()
  {
    fill(c);
    noStroke();
    rect(x, y, w, h);
  }
}
