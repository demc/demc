public boolean isBallCollidingWithRect(float x, float y, float w, float h)
{
  float closestX = max(x, min(ball.getX(), x + w));
  float closestY = max(y, min(ball.getY(), y + h));

  float distX = ball.getX() - closestX;
  float distY = ball.getY() - closestY;

  float distXSquared = distX * distX;
  float distYSquared = distY * distY;
  float radiusSquared = BALL_RADIUS * BALL_RADIUS;

  if ((distXSquared + distYSquared) < radiusSquared)
  {
    return true;
  }

  return false;
}

public int isBallCollidingWithRectSide(int x, int y, int w, int h)
{
  float closestX = max(x, min(ball.getX(), x + w));
  float closestY = max(y, min(ball.getY(), y + h));

  float distX = ball.getX() - closestX;
  float distY = ball.getY() - closestY;

  float distXSquared = distX * distX;
  float distYSquared = distY * distY;
  float radiusSquared = BALL_RADIUS * BALL_RADIUS;

  if ((distXSquared + distYSquared) < radiusSquared)
  {
    if (closestX == x )
    {
      return 1;
    } else if (closestX == x+w)
    {
      return 2;
    } else 
    {
      return 3;
    }
  }

  return 0;
}
