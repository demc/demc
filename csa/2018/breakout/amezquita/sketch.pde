/* @pjs preload="data/bg1.jpg"; */

/**
 * FALL 2018 SEMESTER FINAL PROJECT - BREAKOUT
 * TEAM:Jennifer Taheerah
 * DATE:december 14
 */

public final int BALL_RADIUS = 8;
public final int BALL_DIAMETER = BALL_RADIUS * 2;
public final int PADDLE_WIDTH = 100;
public final int PADDLE_HEIGHT = 10;
public final int BRICK_WIDTH = 44;
public final int BRICK_HEIGHT = 20;

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
public int level= 1;
private SoundFile mario;
private PImage bg;
public int lives=3;
public int points =0; 

public void setUplevel()
{
  if (level == 1)
  {
    for (int i= 0; i < orangeBricks.length; i++)
    {
      Brick b = new Brick(48*i, 25, color(255, 165, 0));
      orangeBricks[i]=b;
    }

    // TODO: create the yellow bricksfor (int i= 0; i < redBricks.length; i++)

    for (int i= 0; i < yellowBricks.length; i++)
    {
      Brick b = new Brick(48*i, 50, color(255, 255, 0));
      yellowBricks[i]=b;
    }


    // TODO: create the green bricksfor (int i= 0; i < redBricks.length; i++)
    for (int i= 0; i < greenBricks.length; i++)
    {
      Brick b = new Brick(48*i, 75, color(0, 255, 0));
      greenBricks[i]=b;
    }

    // TODO: create the blue bricks
    for (int i= 0; i < blueBricks.length; i++)
    {
      Brick b = new Brick(48*i, 100, color(0, 0, 255));
      blueBricks[i]=b;
    }
  }
}

public void setup()
{
  size(480, 480);
  //pixelDensity(2);
 lives =3;
  // Initial ball position
  ball = new Ball(width / 2, height - PADDLE_HEIGHT - BALL_RADIUS);

  paddleX = width / 2 - PADDLE_WIDTH / 2;
  paddleY = height - PADDLE_HEIGHT;

  mario = new SoundFile(this, "mario.wav");
  mario.play();
  mario.loop();
  bg = loadImage("data/bg1.jpg");
  bg.resize(480, 480);
  console.log("test");
  console.log(bg.width, bg.height);
  //bg.resize(480, 480);

  // TODO: create the red bricks
  for (int i= 0; i < redBricks.length; i++)
  {
    Brick b = new Brick(48*i, 0, color(255, 0, 0));
    redBricks[i]=b;
  }

  // TODO: create the oranges bricks
  for (int i= 0; i < orangeBricks.length; i++)
  {
    Brick b = new Brick(48*i, 25, color(255, 165, 0));
    orangeBricks[i]=b;
  }

  // TODO: create the yellow bricksfor (int i= 0; i < redBricks.length; i++)

  for (int i= 0; i < yellowBricks.length; i++)
  {
    Brick b = new Brick(48*i, 50, color(255, 255, 0));
    yellowBricks[i]=b;
  }


  // TODO: create the green bricksfor (int i= 0; i < redBricks.length; i++)
  for (int i= 0; i < greenBricks.length; i++)
  {
    Brick b = new Brick(48*i, 75, color(0, 255, 0));
    greenBricks[i]=b;
  }

  // TODO: create the blue bricks
  for (int i= 0; i < blueBricks.length; i++)
  {
    Brick b = new Brick(48*i, 100, color(0, 0, 255));
    blueBricks[i]=b;
  }
}

public void draw()

{
  fill(0);
 
  if (!isGameOver)
  {
    background(bg); 
  
    // Draw the ball.
    ball.drawBall();

    // Draw the paddle.
    fill(165, 42, 42);
    rect(paddleX, paddleY, PADDLE_WIDTH, PADDLE_HEIGHT);
    fill (0);
    textSize(30);
    text("Lives:" + lives, 0,300);
    
    text("Score:" + points ,350,300);
  

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
    // TODO: draw the bricks
    for (int i = 0; i < redBricks.length; i++)
    {
      if (redBricks[i]!= null)
      {
        Brick myBrick = redBricks[i];
        myBrick.drawBrick();
      }
    }
    for (int i = 0; i < orangeBricks.length; i++)
    {
      if (orangeBricks[i]!= null)
      {
        Brick myBrick = orangeBricks[i];
        myBrick.drawBrick();
      }
    }
    for (int i = 0; i < yellowBricks.length; i++)
    {
      if (yellowBricks[i]!= null)
      {
        Brick myBrick = yellowBricks[i];
        myBrick.drawBrick();
      }
    }
    for (int i = 0; i < greenBricks.length; i++)
    {
      if (greenBricks[i]!= null)
      {
        Brick myBrick = greenBricks[i];
        myBrick.drawBrick();
      }
    }
    for (int i = 0; i < blueBricks.length; i++)
    {
      if (blueBricks[i]!= null)
      {
        Brick myBrick = blueBricks[i];
        myBrick.drawBrick();
      }
    }
    if (checkForCollisions())
    {
      points+= 2;
      ball.reverseSpeedY();
      
    }
    if (isOutOfBounds())
    {
      paddleX = width / 2 - PADDLE_WIDTH / 2;
      paddleY = height - PADDLE_HEIGHT;


      ball.setSpeedX(0);
      ball.setSpeedY(0);

      ball.setX(width / 2);
      ball.setY(height - PADDLE_HEIGHT - BALL_RADIUS);
      

      hasGameStarted = false;
      lives--;
      if (lives == 0){
        gameOver(true);
        textSize(37);
     text("Game Over", 170, 250); 

      }
      
    }

    // TODO: check for brick collisions
    if (areAllBricksBroken()) {
      gameOver(true);
      textSize(37);
    text("You Won!", 170, 250); 

    }


    // TODO: check for paddle collision
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
    ball.setSpeedX(random(-5,8));
    ball.setSpeedY(random(7,6));
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
  if (ball.getX() < 0 || ball.getX() > width)
  {
    return true;
  }
  // TODO
  return false;
}

/**
 * Return true if the ball has hit the top side.
 */
public boolean didHitTop()
{
  if ( ball.getY() < 0 )
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
  for (int i = 0; i < redBricks.length; i++)
  {
    if (redBricks[i]!= null)
    {
      Brick myBrick = redBricks[i];
      if ( myBrick.isCollidingWithBall())
      {
        redBricks[i]=null;
        return true;
      }
    }
  }
  for (int i = 0; i < orangeBricks.length; i++)
  {
    if (orangeBricks[i]!= null)
    {
      Brick myBrick = orangeBricks[i];
      if ( myBrick.isCollidingWithBall())
      {
        orangeBricks[i]=null;
        return true;
      }
    }
  }
  for (int i = 0; i < yellowBricks.length; i++)
  {
    if (yellowBricks[i]!= null)
    {
      Brick myBrick = yellowBricks[i];
      if (myBrick.isCollidingWithBall())
      {
        yellowBricks[i]=null;
        return true;
      }
    }
  }
  for (int i = 0; i < greenBricks.length; i++)
  {
    if (greenBricks[i]!= null)
    {
      Brick myBrick = greenBricks[i];
      if (myBrick.isCollidingWithBall())
      {
        greenBricks[i]=null;
        return true;
      }
    }
  }

  for (int i = 0; i < blueBricks.length; i++)
  {
    if (blueBricks[i]!= null)
    {
      Brick myBrick = blueBricks[i];
      if (myBrick.isCollidingWithBall())
      {
        blueBricks[i]=null;
        return true;
      }
    }
  }

  // TODO
  return false;
}

/**
 * Loops over every brick. If an unbroken brick is found, true false.
 * If every brick has been broken, return true.
 */
public boolean areAllBricksBroken()
{
  for (int i = 0; i < redBricks.length; i++)
  {

    if (redBricks[i] !=null)
      return false;
  }
  for (int i = 0; i < orangeBricks.length; i++)
  {

    if (orangeBricks[i] !=null)
      return false;
  }
  for (int i = 0; i < yellowBricks.length; i++)
  {

    if (yellowBricks[i] !=null)
      return false;
  }
  for (int i = 0; i < greenBricks.length; i++)
  {

    if (greenBricks[i] !=null)
      return false;
  }
  for (int i = 0; i < blueBricks.length; i++)
  {

    if (blueBricks[i] !=null)
      return false;
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
  fill(0);
  isGameOver= true;
  

  setup();
  // TODO
}

/**
 * Restarts the game by reseting all of the instance variables.
 */
public void restartGame()
{
  hasGameStarted =false;
  isGameOver= false;
  setup();
  // TODO
}