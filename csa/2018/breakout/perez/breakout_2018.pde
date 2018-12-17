/* @pjs preload="data/space.jpg; */

/**
 * FALL 2018 SEMESTER FINAL PROJECT - BREAKOUT
 * TEAM: ROsa, Lucy, Jessica
 * DATE: 12/3/18
 */

public final int BALL_RADIUS = 8;

public final int BALL_DIAMETER = BALL_RADIUS * 2;

public final int PADDLE_WIDTH = 100;
public final int PADDLE_HEIGHT = 10;
public final int BRICK_WIDTH = 44;
public final int BRICK_HEIGHT = 20;

private Ball[] balls = new Ball[2];

public Brick[] redBricks = new Brick[10];
// TODO: put the rest of the rows here
public Brick[] orangeBricks = new Brick[10];
public Brick[] yellowBricks = new Brick[10];
public Brick[] greenBricks = new Brick[10];
public Brick[] blueBricks = new Brick[10];

public boolean hasGameStarted = false;
public boolean isGameOver = false;
public boolean playerDidWin = false;
public int paddleX; 
public int paddleY; 
private PImage space;
private SoundFile clearday;
private int lifeC = 3;
private PFont zalfino;
public int live;
private int score = 0;


public void setup()
{
  size(400, 400);

  live = 3;

  space = loadImage("data/space.jpg");
  space.resize(400, 400);
  //pixelDensity(2);

  zalfino = loadFont("data/Zapfino-16.vlw");
  textFont(zalfino);

  clearday = new SoundFile(this, "clear.mp3");

  clearday.play();

  for (int i = 0; i< redBricks.length; i++)
  {
    Brick b = new Brick( 48 * i, 0, color (255, 0, 0));
    redBricks[i] = b;
  }

  // Initial ball position
  balls [0]= new Ball(width / 2, height - PADDLE_HEIGHT - BALL_RADIUS);
  balls [1] = new Ball(width / 2, height - PADDLE_HEIGHT - BALL_RADIUS);


  paddleX = width / 2 - PADDLE_WIDTH / 2;
  paddleY = height - PADDLE_HEIGHT;

  // TODO: create the red bricks

  // TODO: create the oranges bricks
  for (int i = 0; i< orangeBricks.length; i++)
  {
    Brick b = new Brick( 48 * i, 25, color (255, 140, 0));
    orangeBricks[i] = b;
  }

  // TODO: create the yellow bricks
  for (int i = 0; i< yellowBricks.length; i++)
  {
    Brick b = new Brick( 48 * i, 50, color (255, 255, 0));
    yellowBricks[i] = b;
  }

  // TODO: create the green bricks
  for (int i = 0; i< greenBricks.length; i++)
  {
    Brick b = new Brick( 48 * i, 75, color (64, 255, 0));
    greenBricks[i] = b;
  }

  // TODO: create the blue bricks
  for (int i = 0; i< blueBricks.length; i++)
  {
    Brick b = new Brick( 48 * i, 100, color (51, 51, 255));
    blueBricks[i] = b;
  }
}

public void draw()
{


  if (!isGameOver)
  {


    background(space);

    fill(255);
    text("Lives: "+ live, 300, 350);

    fill(255, 0, 0);
    text("Score: " + score, 300, 200);
    //setFace(Unlock);
    // Draw the ball.
    for (Ball ball : balls) {
      ball.drawBall();
    }

    if ( isOutOfBounds ()) {  
      live -= 1;
    } 




    // Draw the paddle.
    fill(165, 42, 42);
    rect(paddleX, paddleY, PADDLE_WIDTH, PADDLE_HEIGHT);

    // TODO: check for wall collisions

    didHitSide();
    didHitTop();


    if (isOutOfBounds())
    {
      lifeC -=1;
    }

    if (areAllBricksBroken())
    {
      println("ALL DA BRIKS BE BROKE");
      gameOver(true);
    }

    // TODO: draw the bricks
    for ( int i = 0; i < redBricks.length; i++)
    {
      if ( redBricks[i] != null )
      {
        Brick myBrick = redBricks[i];
        myBrick.drawBrick();
      }
    }




    for ( int i = 0; i < orangeBricks.length; i++)
    {
      if ( orangeBricks[i] != null )
      {
        Brick myBrick = orangeBricks[i];
        myBrick.drawBrick();
      }
    }

    for ( int i = 0; i < yellowBricks.length; i++)
    {
      if ( yellowBricks[i] != null )
      {
        Brick myBrick = yellowBricks[i];
        myBrick.drawBrick();
      }
    }

    for ( int i = 0; i < greenBricks.length; i++)
    {
      if ( greenBricks[i] != null )
      {
        Brick myBrick = greenBricks[i];
        myBrick.drawBrick();
      }
    }

    for ( int i = 0; i < blueBricks.length; i++)
    {
      if ( blueBricks[i] != null )
      {
        Brick myBrick = blueBricks[i];
        myBrick.drawBrick();
      }
    }

    // TODO: check for brick collisions
    checkForCollisions();



    // TODO: check for paddle collision
    isBallCollidingWithPaddle();


    if (live == 0) {
      gameOver(false);
    }
  } else
  {
    fill(255);
    textSize(21);
    if (playerDidWin== false) {
      text("Game Over", 200, height /2);
    } else {
      text("Won", 200, height /2);
    }
  }
}


public void mouseMoved(MouseEvent event)
{

  int x = mouseX;
  paddleX = x - PADDLE_WIDTH / 2;

  if (!hasGameStarted)
  {
    for (Ball ball : balls) {
      ball.setX(x);
    }
  }
}

public void mouseReleased(MouseEvent event)
{

  for (Ball ball : balls)
  {
    if (ball.speedX == 0.0 && ball.speedY == 0.0)
    {
      ball.setSpeedX(random(-5, 5));
      ball.setSpeedY(-3);
    }
  }

  if (!hasGameStarted)
  {

    hasGameStarted = true;
  }
}

/**
 * Return true if the ball has hit the left or right sides.
 */
public boolean didHitSide()
{
  // TODO
  for (Ball ball : balls) {

    if (ball.getX() < 0 || ball.getX() > width)
    {
      ball.reverseSpeedX();
      return true;
    }
  }

  return false;
}

/**
 * Return true if the ball has hit the top side.
 */
public boolean didHitTop()
{
  // TODO
  for (Ball ball : balls) {
    if (ball.getY() < 0 )
    {
      ball.reverseSpeedY();
      return true;
    }
  }

  return false;
}

/**
 * Return true with the ball passed through the bottom.
 */
public boolean isOutOfBounds()
{
  // TODO
  for (Ball ball : balls) {
    if (ball.getY() > height)
    {
      ball.setSpeedX(0);
      ball.setSpeedY(0);
      ball.setX(paddleX - PADDLE_WIDTH/2);
      ball.setY(height - PADDLE_HEIGHT - BALL_RADIUS);
      return true;
    }
  }
  return false;
}



/**
 * Return true when the ball is colliding with the paddle.
 */
public void isBallCollidingWithPaddle()
{
  for (Ball ball : balls)
  {
    if (isBallCollidingWithRect(ball, paddleX, paddleY, PADDLE_WIDTH, PADDLE_HEIGHT))
    {
      ball.reverseSpeedY();
    }
  }
}

/**
 * Detects whether the ball is colliding with a brick.
 * Use a loop to check every brick for collisions.
 * If a brick has been hit, remove it and return true.
 * If not bricks are being hit, return false.
 */
public void checkForCollisions()
{
  for (Ball ball : balls) {
    // TODO
    for ( int i = 0; i < redBricks.length; i++)
    {
      if ( redBricks[i] != null )
      {
        Brick myBrick = redBricks[i];
        if (myBrick.isCollidingWithBall())
        {
          score+= 50;
          redBricks [i] = null;
          ball.reverseSpeedY();
        }
      }
    }

    for ( int i = 0; i < orangeBricks.length; i++)
    {
      if ( orangeBricks[i] != null )
      {
        Brick myBrick = orangeBricks[i];
        if (myBrick.isCollidingWithBall())
        {
          score+= 40;
          orangeBricks [i] = null;
          ball.reverseSpeedY();
        }
      }
    }

    for ( int i = 0; i < yellowBricks.length; i++)
    {
      if ( yellowBricks[i] != null )
      {
        Brick myBrick = yellowBricks[i];
        if (myBrick.isCollidingWithBall())
        {
          score+= 30;
          yellowBricks [i] = null;
          ball.reverseSpeedY();
        }
      }
    }

    for ( int i = 0; i < greenBricks.length; i++)
    {
      if ( greenBricks[i] != null )
      {
        Brick myBrick = greenBricks[i];
        if (myBrick.isCollidingWithBall())
        {
          score+= 20;
          greenBricks [i] = null;
          ball.reverseSpeedY();
        }
      }
    }

    for ( int i = 0; i < blueBricks.length; i++)
    {
      if ( blueBricks[i] != null )
      {
        Brick myBrick = blueBricks[i];
        if (myBrick.isCollidingWithBall())
        {
          score+= 10;
          blueBricks [i] = null;
          ball.reverseSpeedY();
        }
      }
    }
  }
}

//  if ( ball == blueBricks)
//  {
//    return true;
//  }
//  return false;
//}

/**
 * Loops over every brick. If an unbroken brick is found, true false.
 * If every brick has been broken, return true.
 */
public boolean areAllBricksBroken()
{
  for (int i = 0; i < 10; i++)
  {
    if (redBricks[i] != null)
    {
      return false;
    }
  }

  for (int i = 0; i < 10; i++)
  {
    if (orangeBricks[i] != null)
    {
      return false;
    }
  }
  for (int i = 0; i < 10; i++)
  {
    if (yellowBricks[i] != null)
    {
      return false;
    }
  }
  for (int i = 0; i < 10; i++)
  {
    if (greenBricks[i] != null)
    {
      return false;
    }
  }

  for (int i = 0; i < 10; i++)
  {
    if (blueBricks[i] != null)
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
  playerDidWin = didWin;
  hasGameStarted = false;
  isGameOver = true;
  clearday.stop();
}

public void greenPoints()
{
}

/**
 * Restarts the game by reseting all of the instance variables.
 */
public void restartGame()
{
  // TODO
  balls[0] = new Ball(width / 2, height - PADDLE_HEIGHT - BALL_RADIUS);
  balls[1] = new Ball(width / 2, height - PADDLE_HEIGHT - BALL_RADIUS);

  paddleX = width / 2 - PADDLE_WIDTH / 2;
  paddleY = height - PADDLE_HEIGHT;
}
