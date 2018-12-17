/* @pjs preload="data/earth.jpg,data/galaxy.jpg"; */

/**
 * FALL 2018 SEMESTER FINAL PROJECT - BREAKOUT
 * TEAM:
 * DATE:
 */

public final int BALL_RADIUS = 8;
public final int BALL_DIAMETER = BALL_RADIUS * 2;
public final int PADDLE_WIDTH = 100;
public final int PADDLE_HEIGHT = 10;
public final int BRICK_WIDTH = 44;
public final int BRICK_HEIGHT = 20;

private Ball ball;

public Brick[] redBricks = new Brick[10];
public Brick[] blueBricks = new Brick[10];
public Brick[] greenBricks = new Brick[10];
public Brick[] yellowBricks = new Brick[10];
public Brick[] orangeBricks = new Brick[10];
// TODO: put the rest of the rows here

public boolean hasGameStarted = false;
public boolean isGameOver = false;
public int paddleX;
public int paddleY;
public boolean playerDidWin = false;

public int Lives;
public int Score;
public int Level;

private PImage bg;

private SoundFile pop;
private SoundFile theme;

public void setup()
{
  size(480, 480);
  //pixelDensity(2);
  Lives = 3;
  Score = 0;
  Level = 0;

  bg = loadImage("data/earth.jpg");
  bg.resize(480, 480);
  
  theme = new SoundFile(this, "theme.wav");
  theme.loop();

  // Initial ball position
  ball = new Ball(width / 2, height - PADDLE_HEIGHT - BALL_RADIUS);

  paddleX = width / 2 - PADDLE_WIDTH / 2;
  paddleY = height - PADDLE_HEIGHT;

  pop = new SoundFile(this, "pop.wav");

  // TODO: create the red bricks
  for (int i = 0; i < redBricks.length; i++)
  {
    Brick b = new Brick(48 * i, 0, color(0, 0, 0));
    redBricks[i] = b;
  }
  // TODO: create the oranges bricks
  for (int i = 0; i < orangeBricks.length; i++)
  {
    Brick b = new Brick(48 * i, 25, color(42, 39, 42));
    orangeBricks[i] = b;
  }
  // TODO: create the yellow bricks
  for (int i = 0; i < yellowBricks.length; i++)
  {
    Brick b = new Brick(48 * i, 50, color(75, 74, 84));
    yellowBricks[i] = b;
  }
  // TODO: create the green bricks
  for (int i = 0; i < greenBricks.length; i++)
  {
    Brick b = new Brick(48 * i, 75, color(103, 115, 129));
    greenBricks[i] = b;
  }
  // TODO: create the blue bricks
  for (int i = 0; i < blueBricks.length; i++)
  {
    Brick b = new Brick(48 * i, 100, color(130, 160, 170));
    blueBricks[i] = b;
  }
}

public void nextLevel()
{
  if (Level == 1)
  {
    levelSetUp();
  }
}

public void levelSetUp()
{
  for (int i = 0; i < redBricks.length; i++)
  {
    Brick b = new Brick(48 * i, 0, color(0, 0, 0));
    redBricks[i] = b;
  }
  // TODO: create the oranges bricks
  for (int i = 0; i < orangeBricks.length; i++)
  {
    Brick b = new Brick(48 * i, 25, color(42, 39, 42));
    orangeBricks[i] = b;
  }
  // TODO: create the yellow bricks
  for (int i = 0; i < yellowBricks.length; i++)
  {
    Brick b = new Brick(48 * i, 50, color(75, 74, 84));
    yellowBricks[i] = b;
  }
  // TODO: create the green bricks
  for (int i = 0; i < greenBricks.length; i++)
  {
    Brick b = new Brick(48 * i, 75, color(103, 115, 129));
    greenBricks[i] = b;
  }
  // TODO: create the blue bricks
  for (int i = 0; i < blueBricks.length; i++)
  {
    Brick b = new Brick(48 * i, 100, color(130, 160, 170));
    blueBricks[i] = b;
  }
}
public void draw()
{ 
  if (!isGameOver)
  {
    background(bg); 

    text("Lives: " + Lives, 400, 470);
    text("Score: " + Score, 400, 420);

    // Draw the ball.
    ball.drawBall();

    // Draw the paddle.
    fill(163, 207, 205);
    rect(paddleX, paddleY, PADDLE_WIDTH, PADDLE_HEIGHT);

    // TODO: check for wall collisions
    if (didHitSide())
    {
      ball.reverseSpeedX();
    }

    if (didHitTop())
    {
      ball.reverseSpeedY();
    }

    if (Score == 5000)
    {
      gameOver(true);
    }
    // TODO: draw the bricks
    for (int i = 0; i < redBricks.length; i++)
    {
      if (redBricks[i] != null)
      {
        Brick myBrick = redBricks[i];
        myBrick.drawBrick();
      }
    }
    for (int i = 0; i < blueBricks.length; i++)
    {
      if (blueBricks[i] != null)
      {
        Brick myBrick = blueBricks[i];
        myBrick.drawBrick();
      }
    }

    for (int i = 0; i < greenBricks.length; i++)
    {
      if (greenBricks[i] != null)
      {
        Brick myBrick = greenBricks[i];
        myBrick.drawBrick();
      }
    }
    for (int i = 0; i < orangeBricks.length; i++)
    {
      if (orangeBricks[i] != null)
      {
        Brick myBrick = orangeBricks[i];
        myBrick.drawBrick();
      }
    }
    for (int i = 0; i < yellowBricks.length; i++)
    {
      if (yellowBricks[i] != null) {
        Brick myBrick = yellowBricks[i];
        myBrick.drawBrick();
      }
    }
    // TODO: check for brick collisions
    if (checkForCollisions())
    {
      ball.reverseSpeedY();
    }
    // TODO: check for paddle collision
    if (isBallCollidingWithPaddle())
    {
      ball.reverseSpeedY();
    }
    if (isOutOfBounds())
    {
      ball = new Ball(width / 2, height - PADDLE_HEIGHT - BALL_RADIUS);
      paddleX = width / 2 - PADDLE_WIDTH / 2;
      paddleY = height - PADDLE_HEIGHT;
      hasGameStarted = false;
      isGameOver = false;
    }
    if (Lives == 0) {
      gameOver(false);
    }
  } else
  {
    if (Score == 5000)
    {
      textAlign(CENTER);
      fill(255, 255, 255);
      text("Congratulations", width / 2, 300);
    } else
    {
      textAlign(CENTER);
      fill(255, 255, 255);
      text("GAME OVER", width / 2, height / 2);
      text("Boo", width / 2, 300 );
    }
  }
}

public void mouseMoved(MouseEvent event)
{
  int x = mouseX;
  paddleX = x - PADDLE_WIDTH / 2;

  if (!hasGameStarted)
  {
    ball.setX(x);
  }
}

public void mouseReleased(MouseEvent event)
{
  if (!hasGameStarted)
  {
    ball.setSpeedX(8);
    ball.setSpeedY(-3);
    hasGameStarted = true;
  }
  if (isGameOver == true) {
    restartGame();
  }
}

/**
 * Return true if the ball has hit the left or right sides.
 */
public boolean didHitSide()
{
  // TODO
  if (ball.getX() < 0 || ball.getX() > width)
  {
    return true;
  }
  return false;
}

/**
 * Return true if the ball has hit the top side.
 */
public boolean didHitTop()
{
  // TODO
  if (ball.getY() < 0)
  {
    return true;
  }
  return false;
}

/**
 * Return true with the ball passed through the bottom.
 */
public boolean isOutOfBounds()
{
  // TODO
  if (ball.getY() > height)
  {
    Lives = Lives - 1;
    return true;
  }
  return false;
}

/**
 * Return true when the ball is colliding with the paddle.
 */
public boolean isBallCollidingWithPaddle()
{
  return isBallCollidingWithRect(paddleX, paddleY, PADDLE_WIDTH, PADDLE_HEIGHT);
}

/**
 * Detects whether the ball is colliding with a brick.
 * Use a loop to check every brick for collisions.
 * If a brick has been hit, remove it and return true.
 * If not bricks are being hit, return false.
 */
public boolean checkForCollisions()
{

  // TODO
  for (int i = 0; i < redBricks.length; i++)
  {

    if (redBricks[i] != null)
    {
      Brick myBrick = redBricks[i];

      if (myBrick.isCollidingWithBall())
      {
        pop.play();
        redBricks[i] = null;
        Score = Score + 100;
        return true;
      }
    }
  }

  for (int i = 0; i < blueBricks.length; i++)
  {
    if (blueBricks[i] != null)
    {
      Brick myBrick = blueBricks[i];

      if (myBrick.isCollidingWithBall())
      {
        pop.play();
        blueBricks[i] = null;
        Score = Score + 100;
        return true;
      }
    }
  }

  for (int i = 0; i < greenBricks.length; i++)
  {
    if (greenBricks[i] != null)
    {
      Brick myBrick = greenBricks[i];

      if (myBrick.isCollidingWithBall())
      {
        pop.play();
        greenBricks[i] = null;
        Score = Score + 100;
        return true;
      }
    }
  }

  for (int i = 0; i < orangeBricks.length; i++)
  {
    if (orangeBricks[i] != null)
    {
      Brick myBrick = orangeBricks[i];

      if (myBrick.isCollidingWithBall())
      {
        pop.play();
        orangeBricks[i] = null;
        Score = Score + 100;
        return true;
      }
    }
  }

  for (int i = 0; i < yellowBricks.length; i++)
  {
    if (yellowBricks[i] != null) {
      Brick myBrick = yellowBricks[i];

      if (myBrick.isCollidingWithBall())
      {
        pop.play();
        yellowBricks[i] = null;
        Score = Score + 100;
        return true;
      }
    }
  }

  return false;
}

/**
 * Loops over every brick. If an unbroken brick is found, true false.
 * If every brick has been broken, return true.
 */
public boolean areAllBricksBroken()
{
  for (int i = 0; i < 10; i++)
  {
    if (redBricks[i] == null && orangeBricks[i] == null && yellowBricks[i] == null && greenBricks[i] == null && blueBricks[i] == null)
    {
      return true;
    }
  }
  return false;
}

/**
 * Ends the game. 
 * If param `didWin` is true, congratulate the use, else boo them.
 * Prompt the user to click to restart the game.
 * Ensure that the text is centered on the screen.
 * Remember to set `isGameOver` to true.
 */
public void gameOver(boolean didWin)
{
  playerDidWin = didWin;
  isGameOver = true;
  hasGameStarted = false;
}

/**
 * Restarts the game by reseting all of the instance variables.
 */
public void restartGame()
{
  isGameOver = false;
  hasGameStarted = false;

  Lives = 3;
  fill(255, 255, 255);
  text("Lives: " + Lives, 400, 470);
  Score = 0;
  fill(255, 255, 255);
  text("Score: " + Score, 400, 420);

  ball = new Ball(width / 2, height - PADDLE_HEIGHT - BALL_RADIUS);

  paddleX = width / 2 - PADDLE_WIDTH / 2;
  paddleY = height - PADDLE_HEIGHT;

  pop = new SoundFile(this, "pop.wav");

  for (int i = 0; i < redBricks.length; i++)
  {
    Brick b = new Brick(48 * i, 0, color(0, 0, 0));
    redBricks[i] = b;
  }
  // TODO: create the oranges bricks
  for (int i = 0; i < orangeBricks.length; i++)
  {
    Brick b = new Brick(48 * i, 25, color(42, 39, 42));
    orangeBricks[i] = b;
  }
  // TODO: create the yellow bricks
  for (int i = 0; i < yellowBricks.length; i++)
  {
    Brick b = new Brick(48 * i, 50, color(75, 74, 84));
    yellowBricks[i] = b;
  }
  // TODO: create the green bricks
  for (int i = 0; i < greenBricks.length; i++)
  {
    Brick b = new Brick(48 * i, 75, color(103, 115, 129));
    greenBricks[i] = b;
  }
  // TODO: create the blue bricks
  for (int i = 0; i < blueBricks.length; i++)
  {
    Brick b = new Brick(48 * i, 100, color(130, 160, 170));
    blueBricks[i] = b;
  }
}
