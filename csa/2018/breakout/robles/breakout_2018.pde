/* @pjs preload="data/galaxy.jpg; */

/**
 * FALL 2018 SEMESTER FINAL PROJECT - BREAKOUT
 * TEAM:David Robles
 * DATE:12/3/18
 */
import processing.sound.SoundFile;
private SoundFile music;

public final int BALL_RADIUS = 8;
public final int BALL_DIAMETER = BALL_RADIUS * 2;
public final int PADDLE_WIDTH = 100;
public final int PADDLE_HEIGHT = 10;
public final int BRICK_WIDTH = 44;
public final int BRICK_HEIGHT = 20;

private Ball ball;
private PImage galaxy;

public Brick[] firstBricks;
public Brick[] secondBricks;
public Brick[] thirdBricks;
public Brick[] forthBricks;
public Brick[] fifthBricks;
// TODO: put the rest of the rows here


public boolean hasGameStarted = false;
public boolean isGameOver = false;
public int paddleX;
public int paddleY;
public int lives;
public boolean didPlayerWin = false;
public String end = "";
public String end2 = "";
public int score;
public int level = 1;


public void level1Set()
{
  // TODO: create the red bricks
  firstBricks = new Brick[10];
  secondBricks = new Brick[10];
  thirdBricks = new Brick[10];
  forthBricks = new Brick[10];
  fifthBricks = new Brick[10];
  for (int i = 0; i < firstBricks.length; i++)
  {
    Brick b = new Brick(48 * i, 0, color(0, 163, 204));
    firstBricks[i] = b;
  }
  //TODO: create the oranges bricks
  for (int i = 0; i < secondBricks.length; i++)
  {
    Brick b = new Brick(48 * i, 25, color(0, 204, 255));
    secondBricks[i] = b;
  }
  // TODO: create the yellow bricks
  for (int i = 0; i < thirdBricks.length; i++)
  {
    Brick b = new Brick(48 * i, 50, color(51, 214, 255));
    thirdBricks[i] = b;
  }
  // TODO: create the green bricks
  for (int i = 0; i < forthBricks.length; i++)
  {
    Brick b = new Brick(48 * i, 75, color(102, 224, 255));
    forthBricks[i] = b;
  }
  // TODO: create the blue bricks
  for (int i = 0; i < fifthBricks.length; i++)
  {
    Brick b = new Brick(48 * i, 100, color(153, 235, 255));
    fifthBricks[i] = b;
  }
}  



public void level2Set()
{
  firstBricks = new Brick[3];
  secondBricks = new Brick[9];
  thirdBricks = new Brick[11];
  forthBricks = new Brick[9];
  fifthBricks = new Brick[3];

  // TODO: create the red bricks
  Brick a1 = new Brick(24, 0, color(0, 163, 204));
  firstBricks[0] = a1;
  Brick b1 = new Brick(216, 0, color(0, 163, 204));
  firstBricks[1] = b1;
  Brick c1 = new Brick(408, 0, color(0, 163, 204));
  firstBricks[2] = c1;

  // TODO: create the oranges bricks
  Brick a2 = new Brick(-24, 25, color(0, 204, 255));
  secondBricks[0] = a2;
  Brick b2 = new Brick(24, 25, color(0, 204, 255));
  secondBricks[1] = b2;
  Brick c2 = new Brick(72, 25, color(0, 204, 255));
  secondBricks[2] = c2;
  Brick d2 = new Brick(168, 25, color(0, 204, 255));
  secondBricks[3] = d2;
  Brick e2 = new Brick(216, 25, color(0, 204, 255));
  secondBricks[4] = e2;
  Brick f2 = new Brick(264, 25, color(0, 204, 255));
  secondBricks[5] = f2;
  Brick g2 = new Brick(360, 25, color(0, 204, 255));
  secondBricks[6] = g2;
  Brick h2 = new Brick(408, 25, color(0, 204, 255));
  secondBricks[7] = h2;
  Brick i2 = new Brick(456, 25, color(0, 204, 255));
  secondBricks[8] = i2;

  //// TODO: create the yellow bricks
  Brick a3 = new Brick(-24, 50, color(51, 214, 255));
  thirdBricks[0] = a3;
  Brick b3 = new Brick(24, 50, color(51, 214, 255));
  thirdBricks[1] = b3;
  Brick c3 = new Brick(72, 50, color(51, 214, 255));
  thirdBricks[2] = c3;
  Brick d3 = new Brick(120, 50, color(51, 214, 255));
  thirdBricks[3] = d3;
  Brick e3 = new Brick(168, 50, color(51, 214, 255));
  thirdBricks[4] = e3;
  Brick f3 = new Brick(216, 50, color(51, 214, 255));
  thirdBricks[5] = f3;
  Brick g3 = new Brick(264, 50, color(51, 214, 255));
  thirdBricks[6] = g3;
  Brick h3 = new Brick(312, 50, color(51, 214, 255));
  thirdBricks[7] = h3;
  Brick i3 = new Brick(360, 50, color(51, 214, 255));
  thirdBricks[8] = i3;
  Brick j3 = new Brick(408, 50, color(51, 214, 255));
  thirdBricks[9] = j3;
  Brick k3 = new Brick(456, 50, color(51, 214, 255));
  thirdBricks[10] = k3;

  //TODO: create the green bricks
  Brick a4 = new Brick(-24, 75, color(102, 224, 255));
  forthBricks[0] = a4;
  Brick b4 = new Brick(24, 75, color(102, 224, 255));
  forthBricks[1] = b4;
  Brick c4 = new Brick(72, 75, color(102, 224, 255));
  forthBricks[2] = c4;
  Brick d4 = new Brick(168, 75, color(102, 224, 255));
  forthBricks[3] = d4;
  Brick e4 = new Brick(216, 75, color(102, 224, 255));
  forthBricks[4] = e4;
  Brick f4 = new Brick(264, 75, color(102, 224, 255));
  forthBricks[5] = f4;
  Brick g4 = new Brick(360, 75, color(102, 224, 255));
  forthBricks[6] = g4;
  Brick h4 = new Brick(408, 75, color(102, 224, 255));
  forthBricks[7] = h4;
  Brick i4 = new Brick(456, 75, color(102, 224, 255));
  forthBricks[8] = i4;

  //// TODO: create the blue bricks
  Brick a5 = new Brick(24, 100, color(153, 235, 255));
  fifthBricks[0] = a5;
  Brick b5 = new Brick(216, 100, color(153, 235, 255));
  fifthBricks[1] = b5;
  Brick c5 = new Brick(408, 100, color(153, 235, 255));
  fifthBricks[2] = c5;
}



public void level3Set()
{
  firstBricks = new Brick[3];
  secondBricks = new Brick[5];
  thirdBricks = new Brick[2];
  forthBricks = new Brick[9];
  fifthBricks = new Brick[3];

  Brick a1 = new Brick(0, 0, color(0, 163, 204));
  firstBricks[0] = a1;
  Brick b1 = new Brick(192, 0, color(0, 163, 204));
  firstBricks[1] = b1;
  Brick c1 = new Brick(384, 0, color(0, 163, 204));
  firstBricks[2] = c1;

  Brick a2 = new Brick(48, 25, color(0, 204, 255));
  secondBricks[0] = a2;
  Brick b2 = new Brick(144, 25, color(0, 204, 255));
  secondBricks[1] = b2;
  Brick c2 = new Brick(240, 25, color(0, 204, 255));
  secondBricks[2] = c2;
  Brick d2 = new Brick(336, 25, color(0, 204, 255));
  secondBricks[3] = d2;
  Brick e2 = new Brick(432, 25, color(0, 204, 255));
  secondBricks[4] = e2;

  Brick a3 = new Brick(96, 50, color(51, 214, 255));
  thirdBricks[0] = a3;
  Brick b3 = new Brick(288, 50, color(51, 214, 255));
  thirdBricks[1] = b3;

  Brick a4 = new Brick(48, 75, color(102, 224, 255));
  forthBricks[0] = a4;
  Brick b4 = new Brick(144, 75, color(102, 224, 255));
  forthBricks[1] = b4;
  Brick c4 = new Brick(240, 75, color(102, 224, 255));
  forthBricks[2] = c4;
  Brick d4 = new Brick(336, 75, color(102, 224, 255));
  forthBricks[3] = d4;
  Brick e4 = new Brick(432, 75, color(102, 224, 255));
  forthBricks[4] = e4;

  Brick a5 = new Brick(0, 100, color(153, 235, 255));
  fifthBricks[0] = a5;
  Brick b5 = new Brick(192, 100, color(153, 235, 255));
  fifthBricks[1] = b5;
  Brick c5 = new Brick(384, 100, color(153, 235, 255));
  fifthBricks[2] = c5;
}  

public void level4Set()
{
  firstBricks = new Brick[6];
  secondBricks = new Brick[6];
  thirdBricks = new Brick[7];
  forthBricks = new Brick[7];
  fifthBricks = new Brick[6];

  Brick a1 = new Brick(0, 0, color(0, 163, 204));
  firstBricks[0] = a1;
  Brick b1 = new Brick(96, 0, color(0, 163, 204));
  firstBricks[1] = b1;
  Brick c1 = new Brick(192, 0, color(0, 163, 204));
  firstBricks[2] = c1;
  Brick d1 = new Brick(240, 0, color(0, 163, 204));
  firstBricks[3] = d1;
  Brick e1 = new Brick(336, 0, color(0, 163, 204));
  firstBricks[4] = e1;
  Brick f1 = new Brick(432, 0, color(0, 163, 204));
  firstBricks[5] = f1;

  Brick a2 = new Brick(0, 25, color(0, 204, 255));
  secondBricks[0] = a2;
  Brick b2 = new Brick(96, 25, color(0, 204, 255));
  secondBricks[1] = b2;
  Brick c2 = new Brick(192, 25, color(0, 204, 255));
  secondBricks[2] = c2;
  Brick d2 = new Brick(240, 25, color(0, 204, 255));
  secondBricks[3] = d2;
  Brick e2 = new Brick(336, 25, color(0, 204, 255));
  secondBricks[4] = e2;
  Brick f2 = new Brick(432, 25, color(0, 204, 255));
  secondBricks[5] = f2;

  Brick a3 = new Brick(0, 50, color(51, 214, 255));
  thirdBricks[0] = a3;
  Brick b3 = new Brick(96, 50, color(51, 214, 255));
  thirdBricks[1] = b3;
  Brick c3 = new Brick(192, 50, color(51, 214, 255));
  thirdBricks[2] = c3;
  Brick d3 = new Brick(240, 50, color(51, 214, 255));
  thirdBricks[3] = d3;
  Brick e3 = new Brick(336, 50, color(51, 214, 255));
  thirdBricks[4] = e3;
  Brick f3 = new Brick(384, 50, color(51, 214, 255));
  thirdBricks[5] = f3;
  Brick g3 = new Brick(432, 50, color(51, 214, 255));
  thirdBricks[6] = g3;

  Brick a4 = new Brick(0, 75, color(102, 224, 255));
  forthBricks[0] = a4;
  Brick b4 = new Brick(96, 75, color(102, 224, 255));
  forthBricks[1] = b4;
  Brick c4 = new Brick(192, 75, color(102, 224, 255));
  forthBricks[2] = c4;
  Brick d4 = new Brick(240, 75, color(102, 224, 255));
  forthBricks[3] = d4;
  Brick e4 = new Brick(432, 75, color(102, 224, 255));
  forthBricks[4] = e4;


  Brick a5 = new Brick(0, 100, color(153, 235, 255));
  fifthBricks[0] = a5;
  Brick b5 = new Brick(48, 100, color(153, 235, 255));
  fifthBricks[1] = b5;
  Brick c5 = new Brick(144, 100, color(153, 235, 255));
  fifthBricks[2] = c5;
  Brick d5 = new Brick(240, 100, color(153, 235, 255));
  fifthBricks[3] = d5;
  Brick e5 = new Brick(288, 100, color(153, 235, 255));
  fifthBricks[4] = e5;
  Brick f5 = new Brick(432, 100, color(153, 235, 255));
  fifthBricks[5] = f5;
}  


public void setLevel()
{
  if (level == 1)
  {
    level1Set();
  }
  if (level == 2)
  {
    level2Set();
  }
  if (level == 3)
  {
    level3Set();
  }
  if (level == 4)
  {
    level4Set();
  }
  if (level == 5)
  {
    level1Set();
  }
}  

public void drawlevel()
{
  // TODO: draw the bricks
  for (int i = 0; i < firstBricks.length; i++)
  {
    if (firstBricks[i] != null)
    {
      Brick myBrick = firstBricks[i];
      myBrick.drawBrick();
    }
  }

  for (int i = 0; i < secondBricks.length; i++)
  {
    if (secondBricks[i] != null)
    {
      Brick myBrick = secondBricks[i];
      myBrick.drawBrick();
    }
  }

  for (int i = 0; i < thirdBricks.length; i++)
  {
    if (thirdBricks[i] != null)
    {
      Brick myBrick = thirdBricks[i];
      myBrick.drawBrick();
    }
  }

  for (int i = 0; i < forthBricks.length; i++)
  {
    if (forthBricks[i] != null)
    {
      Brick myBrick = forthBricks[i];
      myBrick.drawBrick();
    }
  }

  for (int i = 0; i < fifthBricks.length; i++)
  {
    if (fifthBricks[i] != null)
    {
      Brick myBrick = fifthBricks[i];
      myBrick.drawBrick();
    }
  }
}

public void drawPaddle()
{
    rect(paddleX, paddleY, PADDLE_WIDTH, PADDLE_HEIGHT);
}  

public void setup()
{
  size(480, 480);
  //pixelDensity(2);  

  lives = 3;
  score = 0;
  music = new SoundFile(this, "music.wav");
  music.play();
  music.loop();
  galaxy = loadImage("data/galaxy.jpg");
  galaxy.resize(480, 480);

  // Initial ball position
  ball = new Ball(width / 2, height - PADDLE_HEIGHT - BALL_RADIUS);
  paddleX = width / 2 - PADDLE_WIDTH / 2;
  paddleY = height - PADDLE_HEIGHT;

  setLevel();
}

public void draw()
{
  //backMusic.play();
  if (!isGameOver)
  {
    background(galaxy); 
    score += 1;

    text(end, 200, height / 2);
    text(end, 200, (height / 2) + 50 );
    text("score: " + score, 400, 480);
    if (lives == 3)
    {
      text("Lives: 3", 420, 460);
    }
    if (lives == 2)
    {
      text("Lives: 2", 420, 460);
    }
    if (lives == 1)
    {
      text("Lives: 1", 420, 460);
    }

    // Draw the ball.
    ball.drawBall();

    drawlevel();

    // Draw the paddle.
    fill(165, 42, 42);
    if(level == 1)
    {
      rect(paddleX, paddleY, PADDLE_WIDTH, PADDLE_HEIGHT);
    }
    if(level == 2)
    {
      rect(paddleX, paddleY, PADDLE_WIDTH - 15, PADDLE_HEIGHT);
    }
    if(level == 3)
    {
      rect(paddleX, paddleY, PADDLE_WIDTH - 30, PADDLE_HEIGHT);
    }
    if(level == 4)
    {
      rect(paddleX, paddleY, PADDLE_WIDTH - 45, PADDLE_HEIGHT);
    }
    // TODO: check for wall collisions
    if (didHitSide())
    {
      ball.reverseSpeedX();
    }

    if (didHitTop())
    {
      ball.reverseSpeedY();
    }

    if (isOutOfBounds())
    {
      paddleX = width / 2 - PADDLE_WIDTH / 2;
      paddleY = height - PADDLE_HEIGHT;
      ball = new Ball(width / 2, height - PADDLE_HEIGHT - BALL_RADIUS);
      lives -= 1;
      hasGameStarted = false;
    }

    if (areAllBricksBroken())
    {
      gameOver(true);
      level += 1;
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

    if (lives == 0)
    {
      gameOver(false);
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
  if (level == 2 && didPlayerWin == true)
  {
    restartGame();
    didPlayerWin = false;
  }
  if (level == 3 && didPlayerWin == true)
  {
    restartGame();
    didPlayerWin = false;
  }
  if (level == 4 && didPlayerWin == true)
  {
    restartGame();
    didPlayerWin = false;
  }
  if (!hasGameStarted)
  {
    ball.setSpeedX(6);
    ball.setSpeedY(-6);
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
  // TODO
  if (ball.getY() < 0 )
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

  // TODO
  for (int i = 0; i < firstBricks.length; i++)
  {
    if (firstBricks[i] != null)
    {
      Brick myBrick = firstBricks[i];
      if (myBrick.isCollidingWithBall())
      {
        firstBricks[i] = null;
        return true;
      }
    }
  }

  for (int i = 0; i < secondBricks.length; i++)
  {
    if (secondBricks[i] != null)
    {
      Brick myBrick = secondBricks[i];
      if (myBrick.isCollidingWithBall())
      {
        secondBricks[i] = null;
        return true;
      }
    }
  }

  for (int i = 0; i < thirdBricks.length; i++)
  {
    if (thirdBricks[i] != null)
    {
      Brick myBrick = thirdBricks[i];
      if (myBrick.isCollidingWithBall())
      {
        thirdBricks[i] = null;
        return true;
      }
    }
  }

  for (int i = 0; i < forthBricks.length; i++)
  {
    if (forthBricks[i] != null)
    {
      Brick myBrick = forthBricks[i];
      if (myBrick.isCollidingWithBall())
      {
        forthBricks[i] = null;
        return true;
      }
    }
  }

  for (int i = 0; i < fifthBricks.length; i++)
  {
    if (fifthBricks[i] != null)
    {
      Brick myBrick = fifthBricks[i];
      if (myBrick.isCollidingWithBall())
      {
        fifthBricks[i] = null;
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
  for (int i = 0; i < firstBricks.length; i++)
  {
    if (firstBricks[i] != null)
    {
      return false;
    }
  }
  for (int i = 0; i < secondBricks.length; i++)
  {
    if (secondBricks[i] != null)
    {
      return false;
    }
  }
  for (int i = 0; i < thirdBricks.length; i++)
  {
    if (thirdBricks[i] != null)
    {
      return false;
    }
  }
  for (int i = 0; i < forthBricks.length; i++)
  {
    if (forthBricks[i] != null)
    {
      return false;
    }
  }
  for (int i = 0; i < fifthBricks.length; i++)
  {
    if (fifthBricks[i] != null)
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
  // TODO
  if (didWin == false)
  {
    hasGameStarted = false;
    isGameOver = true;
    didPlayerWin = didWin;
    end = "Game Over";
    end2 = "Click to Restart";
    text(end, 200, height / 2);
    text(end2, 185, (height / 2) + 10 );
  } else
  {
    hasGameStarted = false;
    isGameOver = true;
    didPlayerWin = didWin;
    end = "You Win";
    end2 = "click to restart";
    text(end, 200, height / 2);
    text(end2, 185, (height / 2) + 10 );
  }
}

/**
 * Restarts the game by reseting all of the instance variables.
 */

public void setUpBricks()
{
}  

public void restartGame()
{
  // TODO
  hasGameStarted = false;
  isGameOver = false;
  end = "";


  setup();
}
