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
