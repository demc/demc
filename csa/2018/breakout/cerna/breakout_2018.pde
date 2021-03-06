/* @pjs preload="data/mona-lisa.jpg; */

/** //<>// //<>//
 * FALL 2018 SEMESTER FINAL PROJECT - BREAKOUT
 * TEAM: Ignacio/Enrique
 * DATE:12/2/18
 */
import processing.sound.SoundFile;
private SoundFile sixnine;
private SoundFile sixnine2;
private SoundFile sixnine3;
private SoundFile sixnine4;
private PImage lisa;

public final int BALL_RADIUS = 8;
public final int BALL_DIAMETER = BALL_RADIUS * 2;
public final int PADDLE_WIDTH = 100;
public final int PADDLE_HEIGHT = 10;
public final int BRICK_WIDTH = 44;
public final int BRICK_HEIGHT = 20;

private int[]redBrickHits = new int[10];
private final int RED_NUMBER_HITS = 1;

private int[]yellowBrickHits = new int[10];
private final int YELLOW_NUMBER_HITS = 1;

private int[]orangeBrickHits = new int[10];
private final int ORANGE_NUMBER_HITS = 1;

private int[]greenBrickHits = new int[10];
private final int GREEN_NUMBER_HITS = 1;

private int[]blueBrickHits = new int[10];
private final int BLUE_NUMBER_HITS = 1;


private Ball ball;

public Brick[] redBricks = new Brick[10];
public Brick[] orangeBricks = new Brick[10];
public Brick[] yellowBricks = new Brick[10];
public Brick[] greenBricks = new Brick[10];
public Brick[] blueBricks = new Brick[10];
// TODO: put the rest of the rows here

public boolean hasGameStarted = false;
public boolean isGameOver = false;
public int paddleX;
public int paddleY;
public int lives = 3;
public int score;

public void setup()
{
  size(480, 480);
  //pixelDensity(2);

  // Initial ball position
  ball = new Ball(width / 2, height - PADDLE_HEIGHT - BALL_RADIUS);

  paddleX = width / 2 - PADDLE_WIDTH / 2;
  paddleY = height - PADDLE_HEIGHT;

  sixnine = new SoundFile(this, "sixnine.mp3");
  sixnine2 = new SoundFile(this, "sixnine2.mp3");
  lisa = loadImage("data/mona-lisa.jpg");
  lisa.resize(480, 480);

  // TODO: create the red bricks
  setupBricks();
}

public void setupBricks()
{
  for (int i =0; i < redBricks.length; i++)
  {
    Brick b = new Brick(48 * i, 0, color(255, 0, 0));
    redBricks[i] =b;
  }

  //TODO: create the oranges bricks
  for (int i =0; i < orangeBricks.length; i++)
  {
    Brick b = new Brick(48 * i, 25, color(255, 146, 3));
    orangeBricks[i] =b;
  }
  // TODO: create the yellow bricks
  for (int i =0; i < yellowBricks.length; i++)
  {
    Brick b = new Brick(48 * i, 50, color(255, 255, 0));
    yellowBricks[i] =b;
  }
  // TODO: create the green bricks
  for (int i =0; i < greenBricks.length; i++)
  {
    Brick b = new Brick(48 * i, 75, color(0, 255, 0));
    greenBricks[i] =b;
  }
  // TODO: create the blue bricks
  for (int i =0; i < blueBricks.length; i++)
  {
    Brick b = new Brick(48 * i, 100, color(0, 17, 255));
    blueBricks[i] =b;
  }
}

public void draw()
{
  if (!isGameOver)
  {
    background(lisa); 

    // Draw the ball.
    ball.drawBall();

    text("LIVES : " + lives, 400, 470);
    text("SCORE : " + score, 400, 450);

    // Draw the paddle.
    fill(165, 42, 42);
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
    if (isBallCollidingWithPaddle())
    {
      ball.reverseSpeedY();
    }
    if (isOutOfBounds())
    {
      ball = new Ball(width / 2, height - PADDLE_HEIGHT - BALL_RADIUS);
      paddleX = width / 2 - PADDLE_WIDTH / 2;
      paddleY = height - PADDLE_HEIGHT;
      sixnine.play();
      lives -= 1;
      hasGameStarted = false;
    }

    if (areAllBricksBroken())
    {
      gameOver(true);
    }

    if (lives == 0)
    {
      gameOver(false);
    }

    //sixnine.play();
    //hasGameStarted = false;

    // TODO: draw the bricks
    for (int i=0; i < redBricks.length; i++)
    {
      if (redBricks[i] != null)
      {
        Brick myBrick = redBricks[i];
        myBrick.drawBrick();
      }
    }

    for (int i=0; i < orangeBricks.length; i++)
    {
      if (orangeBricks[i] != null)
      {
        Brick myBrick = orangeBricks[i];
        myBrick.drawBrick();
      }
    }

    for (int i=0; i < yellowBricks.length; i++)
    {
      if (yellowBricks[i] != null)
      {
        Brick myBrick = yellowBricks[i];
        myBrick.drawBrick();
      }
    } 

    for (int i=0; i < greenBricks.length; i++)
    {
      if (greenBricks[i] != null)
      {
        Brick myBrick = greenBricks[i];
        myBrick.drawBrick();
      }
    }

    for (int i=0; i < blueBricks.length; i++)
    {
      if (blueBricks[i] != null)
      {
        Brick myBrick = blueBricks[i];
        myBrick.drawBrick();
      }
    }

    // TODO: check for brick collisions
    if (checkForCollisions())
    {
      score += 2;
      //int r = (int) random(0,2);

      //if (r == 0)
      //{
      //  sixnine4.play();
      //}
      //else if (r == 1)
      //{
      sixnine2.play();
      //}
      ball.reverseSpeedY();
      ball.increaseSpeed();
    }
  }
  // TODO: check for paddle collision
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
    ball.setSpeedX(random(-5, 5));
    ball.setSpeedY(-random(3, 5));
    hasGameStarted = true;
  }
  if (isGameOver)
  {
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
  if (ball.getY() < 0)
  {
    return true;
  }
  // TODO
  return false;
}

/**
 * Return true with the ball passed through the bottom.
 */
public boolean isOutOfBounds()
{
  if (ball.getY() > height)
  {
    return true;
  }
  // TODO
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
  //TODO
  for (int i=0; i < redBricks.length; i++)
  {
    if (redBricks[i] != null)
    {
      Brick myBrick = redBricks[i];
      if (myBrick.isCollidingWithBall())
      {
        redBrickHits[i]++;

        //myBrick.setColor(color(random(0, 255)));
        myBrick.setColor(color(random(0, 255), random(0, 255), color(random(0, 255))));

        if (redBrickHits[i]==RED_NUMBER_HITS)
        {
          redBricks[i] = null;
        }
        return true;
      }
    }
  }

  for (int i=0; i < orangeBricks.length; i++)
  {
    if (orangeBricks[i] != null)
    {
      Brick myBrick = orangeBricks[i];
      if (myBrick.isCollidingWithBall())
      {
        orangeBrickHits[i]++;

        //myBrick.setColor(color(random(0, 255)));
        myBrick.setColor(color(random(0, 255), random(0, 255), color(random(0, 255))));

        if (orangeBrickHits[i]==ORANGE_NUMBER_HITS)
        {
          orangeBricks[i] = null;
        }
        return true;
      }
    }
  }

  for (int i=0; i < yellowBricks.length; i++)
  {
    if (yellowBricks[i] != null)
    {
      Brick myBrick = yellowBricks[i];
      if (myBrick.isCollidingWithBall())
      {
        yellowBrickHits[i]++;

        //myBrick.setColor(color(random(0, 255)));
        myBrick.setColor(color(random(0, 255), random(0, 255), color(random(0, 255))));

        if (yellowBrickHits[i]==YELLOW_NUMBER_HITS)
        {
          yellowBricks[i] = null;
        }
        return true;
      }
    }
  }

  for (int i=0; i < greenBricks.length; i++)
  {
    if (greenBricks[i] != null)
    {
      Brick myBrick = greenBricks[i];
      if (myBrick.isCollidingWithBall())
      {
        greenBrickHits[i]++;

        //myBrick.setColor(color(random(0, 255)));
        myBrick.setColor(color(random(0, 255), random(0, 255), color(random(0, 255))));

        if (greenBrickHits[i]==GREEN_NUMBER_HITS)
        {
          greenBricks[i] = null;
        }
        return true;
      }
    }
  } 

  for (int i=0; i < blueBricks.length; i++)
  {
    if (blueBricks[i] != null)
    {
      Brick myBrick = blueBricks[i];
      if (myBrick.isCollidingWithBall())
      {
        blueBrickHits[i]++;

        //myBrick.setColor(color(random(0, 255)));
        myBrick.setColor(color(random(0, 255), random(0, 255), color(random(0, 255))));

        if (blueBrickHits[i]==BLUE_NUMBER_HITS)
        {
          blueBricks[i] = null;
        }
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
  for (int i=0; i < blueBricks.length; i++)
  {
    if (blueBricks[i] != null)
    {
      return false;
    }
  }
  for (int i=0; i < redBricks.length; i++)
  {
    if (redBricks[i] != null)
    {
      return false;
    }
  }
  for (int i=0; i < yellowBricks.length; i++)
  {
    if (yellowBricks[i] != null)
    {
      return false;
    }
  }
  for (int i=0; i < orangeBricks.length; i++)
  {
    if (orangeBricks[i] != null)
    {
      return false;
    }
  }

  for (int i=0; i < greenBricks.length; i++)
  {
    if (greenBricks[i] != null)
    {
      return false;
    }
  }
  return true;
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
  if (didWin == false)
  {
    hasGameStarted = false;
    isGameOver = true;
    fill(255);
    background(0);
    textAlign(CENTER);
    text("You win!!!", 270, 250);
  } else {
    hasGameStarted = false;
    isGameOver = true;
    fill(255);
    background(0);
    textAlign(CENTER);
    text("You win!!!", 270, 250);
  }
}

/**
 * Restarts the game by reseting all of the instance variables.
 */
public void restartGame()
{
  hasGameStarted = false;
  isGameOver = false;
  lives = 3;
  score = 0;
  setupBricks();
  paddleX = width / 2 - PADDLE_WIDTH / 2;
  paddleY = height - PADDLE_HEIGHT;
  ball = new Ball(width / 2, height - PADDLE_HEIGHT - BALL_RADIUS);
}