/* @pjs preload="data/bute.jpg; */

/**
 * FALL 2018 SEMESTER FINAL PROJECT - BREAKOUT
 * TEAM: bryan . litz. 
 * DATE: 12 - 3- 18
 */

import processing.sound.SoundFile;
public final int BALL_RADIUS = 8;
public final int BALL_DIAMETER = BALL_RADIUS * 2;
public final int PADDLE_WIDTH = 100;
public final int PADDLE_HEIGHT = 10;
public final int BRICK_WIDTH = 44;
public final int BRICK_HEIGHT = 20;
private PImage bac;
private SoundFile bounceoffpaddle ;
private SoundFile breakblock ;
private SoundFile techno;
private int score;
private int level = 2;

private Ball ball;

public Brick[] redBricks = new Brick[10];
public Brick[] blueBricks = new Brick[10];

public Brick[] orangeBricks = new Brick[10];
public Brick[] yellowBricks = new Brick[10];
public Brick[] greenBricks = new Brick[10];
// TODO: put the rest of the rows here

public boolean hasGameStarted = false;
public boolean isGameOver = false;
public int paddleX;
public int paddleY;
public int lives ;

public void level1()
{
  for (int i = 0; i < redBricks.length; i++)
  {
    Brick b = new Brick(48 * i + 2, 5, color(133, 133, 173));
    redBricks[i] = b;
  } 
  for (int i = 0; i < orangeBricks.length; i++)
  {
    Brick b = new Brick(48 * i + 2, 30, color(205, 100, 0));
    orangeBricks[i] = b;
  }
  for (int i = 0; i < yellowBricks.length; i++)
  {
    Brick b = new Brick(48 * i + 2, 55, color(255, 195, 0));
    yellowBricks[i] = b;
  }
  for (int i = 0; i < greenBricks.length; i++)
  {
    Brick b = new Brick(48 * i + 2, 80, color(0, 51, 204));
    greenBricks[i] = b;
  }
  for (int i = 0; i < blueBricks.length; i++)
  {
    Brick b = new Brick(48 * i + 2, 105, color(0, 102, 153));
    blueBricks[i] = b;
  }
}
public void level2()
{
  orangeBricks = new Brick[4];
  redBricks = new Brick[4];
  yellowBricks = new Brick[3];
  blueBricks = new Brick[4];
  greenBricks = new Brick[8];
  
  Brick a = new Brick( 48, 96, color(205, 100, 0));
  orangeBricks[0] = a;
  Brick b = new Brick( 48, 144, color(205, 100, 0));
  orangeBricks[1] = b;
  Brick c = new Brick( 48, 192, color(205, 100, 0));
  orangeBricks[2] = c;
  Brick d = new Brick( 48, 240, color(205, 100, 0));
  orangeBricks[3] = d;
  Brick e = new Brick( 48, 288, color(205, 100, 0));
  
  redBricks[0] = e;
  Brick f = new Brick( 96, 96, color(205, 100, 0));
  redBricks[1] = f;
  Brick g = new Brick( 96, 192, color(205, 100, 0));
  redBricks[2] = g;
  Brick h = new Brick( 96, 288, color(205, 100, 0));
  redBricks[3] = h;
  
  Brick i = new Brick( 144, 144, color(205, 100, 0));
  yellowBricks[0] = i;
  Brick j = new Brick( 144, 240, color(205, 100, 0));
  yellowBricks[1] = j;
  Brick k = new Brick( 192, 96, color(205, 100, 0));
  yellowBricks[2] = k;
  
  Brick l = new Brick( 192, 192, color(205, 100, 0));
  blueBricks[0] = l;
  Brick m = new Brick( 192, 288, color(205, 100, 0));
  blueBricks[1] = m;
  Brick n = new Brick( 240, 144, color(205, 100, 0));
  blueBricks[2] = n;
  Brick o = new Brick( 240, 240, color(205, 100, 0));
  blueBricks[3] = o;
  
  
  Brick p = new Brick( 288, 96, color(205, 100, 0));
  greenBricks[0] = p;
  Brick q = new Brick( 288, 192, color(205, 100, 0));
  greenBricks[1] = q;
  Brick r = new Brick( 288, 288, color(205, 100, 0));
  greenBricks[2] = r;
  Brick s = new Brick( 336, 96, color(205, 100, 0));
  greenBricks[3] = s;
  Brick u = new Brick( 336, 144, color(205, 100, 0));
  greenBricks[4] = u;
  Brick v = new Brick( 336, 192, color(205, 100, 0));
  greenBricks[5] = v;
   Brick t = new Brick( 336, 240, color(205, 100, 0));
  greenBricks[6] = t;
   Brick w = new Brick( 336, 288, color(205, 100, 0));
  greenBricks[7] = w;
  
  
}

public void setup()
{

  size(480, 480);
  //pixelDensity(2);
  


  lives = 3;
  bac = loadImage("data/bute.jpg");
  bac.resize(480, 480);
  
  bounceoffpaddle = new SoundFile(this, "bounceoffpaddle.wav");
  breakblock = new SoundFile(this, "breakblock.wav");
  techno = new SoundFile(this, "techno.mp3");

  techno.play();
  techno.loop();
  // Initial ball position
  ball = new Ball(width / 2, height - PADDLE_HEIGHT - BALL_RADIUS);

  paddleX = width / 2 - PADDLE_WIDTH / 2;
  paddleY = height - PADDLE_HEIGHT;

  if ( level == 1)
  {
    level1();
  }
  if ( level == 2)
  {
    level2();
  }
}
public void draw()
{

  fill(255);

  if (!isGameOver)
  {
    background(bac); 
    if (lives == 3)
    {
      text("LIVES : 3", 420, 460);
    }
    if (lives == 2)
    {
      text("LIVES : 2", 420, 460);
    }
    if (lives == 1)
    {
      text("LIVES : 1", 420, 460);
    }

    text("SCORE : " + score, 415, 450);


    if (areAllBricksBroken())
    {
    println("ALL BRICKS BROKEN");
    background(0);
    textAlign(CENTER);
    fill(255);
    text("NEXT LEVEL", 240, 230);
    gameOver(true);
    level += 1;
    }
    
    // Draw the ball.
    ball.drawBall();

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
      bounceoffpaddle.play();
      ball.reverseSpeedY();
    }
    if (isOutOfBounds())
    {
      ball = new Ball(width / 2, height - PADDLE_HEIGHT - BALL_RADIUS);

      paddleX = width / 2 - PADDLE_WIDTH / 2;
      paddleY = height - PADDLE_HEIGHT;
      hasGameStarted = false;
      lives -= 1;
      println(lives);
    }
    if (lives == 0)
    {
      gameOver(false);
    }



    for (int i = 0; i < redBricks.length; i++)
    {
      if (  redBricks[i] != null)
      {
        Brick myBrick = redBricks[i];
        myBrick.drawBrick();
      }
    } 
    for (int i = 0; i < orangeBricks.length; i++)
    {
      if ( orangeBricks[i] != null)
      {
        Brick myBrick = orangeBricks[i];
        myBrick.drawBrick();
      }
    } 
    for (int i = 0; i < yellowBricks.length; i++)
    {
      if ( yellowBricks[i] != null)
      {
        Brick myBrick = yellowBricks[i];
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
    for (int i = 0; i < blueBricks.length; i++)
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
      score += 1;
      {
        //sound here
        breakblock.play();
        ball.reverseSpeedY();
      }
    }
    // TODO: check for paddle collision
  } else
  
  
  {  
    background(0);
    textAlign(CENTER);
    fill(255);
    text("GAME OVER", 270, 250);
   
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
    ball.setSpeedX(5);
    ball.setSpeedY(-3);
    hasGameStarted = true;
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
  for (int i = 0; i < redBricks.length; i++)
  {
    if (redBricks[i] != null)
    {
      Brick myBrick = redBricks[i];

      if (myBrick.isCollidingWithBall())
      {
        redBricks[i] = null;
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
        orangeBricks[i] = null;
        return true;
      }
    }
  }
  for (int i = 0; i < yellowBricks.length; i++)
  {
    if (yellowBricks[i] != null)
    {
      Brick myBrick = yellowBricks[i];

      if (myBrick.isCollidingWithBall())
      {
        yellowBricks[i] = null;
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
        greenBricks[i] = null;
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
        blueBricks[i] = null;
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
  for (int i = 0; i < redBricks.length; i++)
  {
    if (redBricks[i] != null)
      return false;
  }

  for (int i = 0; i < orangeBricks.length; i++)
  {
    if (orangeBricks[i] != null)
      return false;
  }
  for (int i = 0; i < yellowBricks.length; i++)
  {
    if (yellowBricks[i] != null)
      return false;
  }
  for (int i = 0; i < greenBricks.length; i++)
  {
    if (greenBricks[i] != null)
      return false;
  }
  for (int i = 0; i < blueBricks.length; i++)
  {
    if (blueBricks[i] != null)
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
  if (didWin == false)
  {
    hasGameStarted = false;
    isGameOver = true;
  } else
  {
    hasGameStarted = false;
    isGameOver = true;
  }
}


/**
 * Restarts the game by reseting all of the instance variables.
 */
public void restartGame()
{
  // TODO
}
