public class Ball
{
  private float x;
  private float y;
  private float speedX;
  private float speedY;

  public Ball(int ix, int iy)
  {
    x = ix;
    y = iy;
  }

  public float getX()
  {
    return x; 
  }
  
  public float getY()
  {
    return y;
  }

  public void setX(float ix)
  {
    x = ix;
  }

  public void setY(float iy)
  {
    y = iy;
  }

  public void reverseSpeedX()
  {
    speedX = -speedX;
  }

  public void reverseSpeedY()
  {
    speedY = -speedY;
  }

  public void setSpeedX(float isx)
  {
    speedX = isx;
  }

  public void setSpeedY(float isy)
  {
    speedY = isy;
  }

  public void drawBall()
  {
    x += speedX;
    y += speedY;

    fill(30, 144, 255);
    noStroke();
    ellipse(x, y, BALL_DIAMETER, BALL_DIAMETER);
  }
}
