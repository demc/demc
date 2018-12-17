/* @pjs preload="data/large.jpg; */

/**
 * FALL 2018 SEMESTER FINAL PROJECT - BREAKOUT
 * TEAM:valery corral, bremelyn duran
 * DATE: 12/3/18
 */
 import processing.sound.SoundFile;
 
public final int BALL_RADIUS = 8;
public final int BALL_DIAMETER = BALL_RADIUS * 2;
public final int PADDLE_WIDTH = 100;
public final int PADDLE_HEIGHT = 10;
public final int BRICK_WIDTH = 44;
public final int BRICK_HEIGHT = 20;


private Ball ball;

public Brick[] redBricks = new Brick[10];
public Brick[] yellowBricks = new Brick[10];
public Brick[] orangeBricks = new Brick[10];
public Brick[] greenBricks = new Brick[10];
public Brick[] blueBricks = new Brick[10];
// TODO: put the rest of the rows here

public boolean hasGameStarted = false;
public boolean isGameOver = false;
public boolean didPlayerWin = false;
public String end = "";

public int paddleX;
public int paddleY;
public int Lives;
private int Level=0;

private PImage gradient;

private SoundFile pop;


public void setup()
{
  size(480, 480);
  //pixelDensity(2);

  Lives = 10;
  // Initial ball position
  ball = new Ball(width / 2, height - PADDLE_HEIGHT - BALL_RADIUS);

  gradient = loadImage("data/large.jpg");
  gradient.resize(480, 480);

  paddleX = width / 2 - PADDLE_WIDTH / 2;
  paddleY = height - PADDLE_HEIGHT;


  pop = new SoundFile(this, "pop.wav");
  // TODO: create the red bricks
  for (int i = 0; i< redBricks.length; i++)
  {
    Brick b = new Brick(48 * i, 0, color(230, 255, 255));
    redBricks[i] = b;
  }
  //TODO: create the oranges bricks
  for (int i = 0; i< orangeBricks.length; i++)
  {
    Brick b = new Brick(48 * i, 25, color(230, 230, 255));
    orangeBricks[i] = b;
  }
  // TODO: create the yellow bricks
  for (int i = 0; i< yellowBricks.length; i++)
  {
    Brick b = new Brick(48 * i, 50, color(255, 230, 255));
    yellowBricks[i] = b;
  }
  // TODO: create the green bricks
  for (int i = 0; i< greenBricks.length; i++)
  {
    Brick b = new Brick(48 * i, 75, color(255, 230, 230));
    greenBricks[i] = b;
  }
  // TODO: create the blue bricks
  for (int i = 0; i< blueBricks.length; i++)
  {
    Brick b = new Brick(48 * i, 100, color(255, 255, 230));
    blueBricks[i] = b;
  }
}
public void setupLevel()
{
  if(Level == 1)
  {
    setup1();
    
  }
    if(Level == 2)
  {
  }
}
public void setup1()
{
  redBricks = new Brick[9];
  yellowBricks = new Brick[3];
  orangeBricks = new Brick[3];
  greenBricks = new Brick[7];
  blueBricks = new Brick[4];
  
  Brick a1= new Brick(24,0,color(230, 255, 255));
  redBricks[0] = a1;
   Brick b1= new Brick(168,0,color(230, 255, 255));
  redBricks[1] = b1;
  Brick a6= new Brick(24,100,color(230, 255, 255));
  redBricks[2] = a6;
   Brick b6= new Brick(168,100,color(230, 255, 255));
  redBricks[3] = b6;
   Brick c6= new Brick(288,100,color(230, 255, 255));
  redBricks[4] = c6;
   Brick d6= new Brick(432,100,color(230, 255, 255));
  redBricks[5] = d6;
  Brick a12= new Brick(72,120,color(230, 255, 255));
  redBricks[6] = a12;
  Brick b13= new Brick(96,120,color(230, 255, 255));
  redBricks[7] = b13;
  Brick c14= new Brick(120,120,color(230, 255, 255));
  redBricks[8] = c14;
  
   Brick a2= new Brick(24,20,color(230, 230, 255));
  orangeBricks[0] = a2;
   Brick b2= new Brick(168,20,color(230, 230, 255));
  orangeBricks[1] = b2;
  Brick a7= new Brick(288,120,color(230, 255, 255));
  orangeBricks[2] = a7;
  
  Brick a3= new Brick(24,40,color(255, 230, 255));
 yellowBricks[0] = a3;
   Brick b3= new Brick(168,40,color(255, 230, 255));
  yellowBricks[1] = b3;
  Brick a8= new Brick(288,140,color(230, 255, 255));
  yellowBricks[2] = a8;
  
   Brick a4= new Brick(24,60,color(255, 230, 230));
  greenBricks[0] = a4;
   Brick b4= new Brick(168,60,color(255, 230, 230));
  greenBricks[1] = b4;
  Brick a9= new Brick(288,160,color(230, 255, 255));
  greenBricks[2] = a9;
    Brick a10= new Brick(288,180,color(230, 255, 255));
  greenBricks[3] = a10;
    Brick b10= new Brick(432,180,color(230, 255, 255));
  greenBricks[4] = b10;
  
   Brick a11= new Brick(336,200,color(230, 255, 255));
  greenBricks[5] = a11;
    Brick b11= new Brick(384,200,color(230, 255, 255));
  greenBricks[6] = b11;
  
   Brick a5= new Brick(24,80,color(255, 255, 230));
  blueBricks[0] = a5;
   Brick b5= new Brick(168,80,color(255, 255, 230));
  blueBricks[1] = b5;
    Brick c5= new Brick(336,80,color(255, 255, 230));
  blueBricks[2] = c5;
   Brick d5= new Brick(384,80,color(255, 255, 230));
  blueBricks[3] = d5;
  
    
  
   
  
   
  
  
   if (!hasGameStarted)
  {
    ball.setSpeedX(9);
    ball.setSpeedY(-5);
    hasGameStarted = true;
  }
}
public void setup2()
{
  
}
public void draw()
{
  if (!isGameOver)
  {
    background(gradient); 

  fill(0);
  
  text("Lives" +": "+Lives, 0,476);
    // Draw the ball.
    ball.drawBall();

    // Draw the paddle.
    fill(165, 42, 42);
    rect(paddleX, paddleY, PADDLE_WIDTH, PADDLE_HEIGHT);
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
    for (int i=0; i < blueBricks.length; i++)
    {
      if (blueBricks[i] != null)
      {
        Brick myBrick = blueBricks[i];
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
    for (int i=0; i < yellowBricks.length; i++)
    {
      if (yellowBricks[i] != null)
      {
        Brick myBrick = yellowBricks[i];
        myBrick.drawBrick();
      }
    }
     //TODO: check for wall collisions
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
    if (checkForCollisions())
    {
      ball.reverseSpeedY();
    }
    if (isOutOfBounds())
    {
      ball = new Ball(width / 2, height - PADDLE_HEIGHT - BALL_RADIUS);

      paddleX = width / 2 - PADDLE_WIDTH / 2;
      paddleY = height - PADDLE_HEIGHT;
      Lives -= 1;
      hasGameStarted = false;
    }
    if (areAllBricksBroken())
    {
      
      Level+= 1;
      setupLevel();
    }
    // if (areAllBricksBroken())
    //{
    //  gameOver(false);
    //}
    if (Lives == 0)
    {
      gameOver(false);
    }

    // TODO: draw the bricks

    // TODO: check for brick collisions

    // TODO: check for paddle collision
  } else
  {
    end = "Game Over";
    fill(0);
    text(end,200,height/2);
  }
  if(areAllBricksBroken())
  {
    Level++;
    if(Level<4)
    {
      setupLevel();
      hasGameStarted=false;
      ball.setSpeedX(0);
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
    ball.setSpeedX(9);
    ball.setSpeedY(-5);
    hasGameStarted = true;
  }
  if(isGameOver)
  {
    restartGame();  
  }  
}

/**
 * Return true if the ball has hit the left or right sides.
 */
public boolean didHitSide()
{
  if (ball.getX()<0|| ball.getX()> width)
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
  if (ball.getY()<0)
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
  if (ball.getY()>height)
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
  for (int i = 0; i< redBricks.length; i++)
  {
    if (redBricks[i]!= null)
    {
      Brick myBrick = redBricks[i];
      if (myBrick.isCollidingWithBall())
      {
        pop.play();
        redBricks[i]= null;
        return true;
      }
    }
  }
  for (int i = 0; i< yellowBricks.length; i++)
  {
    if (yellowBricks[i]!= null)
    {
      Brick myBrick = yellowBricks[i];
      if (myBrick.isCollidingWithBall())
      {
                pop.play();
        yellowBricks[i]= null;
        return true;
      }
    }
  }
  for (int i = 0; i< blueBricks.length; i++)
  {
    if (blueBricks[i]!= null)
    {
      Brick myBrick = blueBricks[i];
      if (myBrick.isCollidingWithBall())
      {
                pop.play();
        blueBricks[i]= null;        return true;
      }
    }
  }
  for (int i = 0; i< greenBricks.length; i++)
  {
    if (greenBricks[i]!= null)
    {
      Brick myBrick = greenBricks[i];
      if (myBrick.isCollidingWithBall())
      {
                pop.play();
        greenBricks[i]= null;
        return true;
      }
    }
  }
  for (int i = 0; i< orangeBricks.length; i++)
  {
    if (orangeBricks[i]!= null)
    {
      Brick myBrick = orangeBricks[i];
      if (myBrick.isCollidingWithBall())
      {
                pop.play();
        orangeBricks[i]= null;
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
  for (int i =0; i< blueBricks.length; i++)
  {
    if (blueBricks[i] != null )
    {
      return false;
    }
  }
  for (int i =0; i< greenBricks.length; i++)
  {
    if (greenBricks[i] != null )
    {
      return false;
    }
  }
  for (int i =0; i< yellowBricks.length; i++)
  {
    if (yellowBricks[i] != null )
    {
      return false;
    }
  }
  for (int i =0; i< orangeBricks.length; i++)
  {
    if (orangeBricks[i] != null )
    {
      return false;
    }
  }
  for (int i =0; i<redBricks.length ; i++)
  {
    if (redBricks[i] != null )
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
    didPlayerWin = didWin;
  } 
  else
  {
    hasGameStarted = false;
    isGameOver = true;
    didPlayerWin = didWin;
  }  

  // TODO
}

/**
 * Restarts the game by reseting all of the instance variables.
 */
public void restartGame()
{
  hasGameStarted = false;
  isGameOver = false;
  end = "";
  
  
  setup();
}
