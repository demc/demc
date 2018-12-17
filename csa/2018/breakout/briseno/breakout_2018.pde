/* @pjs preload="data/doubleP.png,data/unnamed.png",data/merry.jpg; */

/**
 * FALL 2018 SEMESTER FINAL PROJECT - BREAKOUT
 * TEAM:
 * DATE:
 */

public final int BALL_RADIUS = 8;
public final int BALL_DIAMETER = BALL_RADIUS * 2;
public final int PADDLE_WIDTH = 100;
public final int PADDLE_HEIGHT = 10;
public final int SHRINK_PADDLE_WIDTH = 50;
public final int BRICK_WIDTH = 44;
public final int BRICK_HEIGHT = 20;

private final int RED_NUMBERS_HITS = 3;
private int[]redBricksHits = new int[10];

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
public int points = 0;

private PImage bg;

private SoundFile hitBrick;
private SoundFile hitWall;
private SoundFile pauseSong;
private SoundFile song;

private PImage doubleP;
private float dpx = -100;
private float dpy = 240;
private boolean isDoublePActive = false;
private float dpSpeedY = 1.0;
private int dpCounter = 0;

private PImage plusLive;
private float plx = -100;
private float ply = 240;
private float plSpeedY = 1.0;

private boolean isPaused = false;


public void setup()
{
  size(480, 480);
  //pixelDensity(2);

  doubleP = loadImage("data/doubleP.png");
  doubleP.resize(40, 0);

  plusLive = loadImage("data/unnamed.png");
  plusLive.resize(20, 0);

  bg = loadImage("data/merry.jpg");
  bg.resize(480, 480);

  hitBrick = new SoundFile(this, "hit.wav");
  hitWall = new SoundFile(this, "pipe.wav");
  pauseSong = new SoundFile(this, "wiiMusic.mp3");
  song = new SoundFile(this, "starWars.mp3");

  // Initial ball position
  ball = new Ball(width / 2, height - PADDLE_HEIGHT - BALL_RADIUS);

  paddleX = width / 2 - PADDLE_WIDTH / 2;
  paddleY = height - PADDLE_HEIGHT;

  // TODO: create the red bricks
  for (int i = 0; i < redBricks.length; i++)
  {
    Brick b = new Brick(48 * i + 2, 5, color(255, 0, 0));
    redBricks[i] = b;
  }
  //TODO: create the oranges bricks
  for (int i = 0; i < orangeBricks.length; i++)
  {
    Brick b = new Brick(48 * i + 2, 30, color(255, 215, 0));
    orangeBricks[i] = b;
  }
  // TODO: create the yellow bricks
  for (int i = 0; i < yellowBricks.length; i++)
  {
    Brick b = new Brick(48 * i + 2, 55, color(255, 255, 0));
    yellowBricks[i] = b;
  }
  // TODO: create the green bricks
  for (int i = 0; i < greenBricks.length; i++)
  {
    Brick b = new Brick(48 * i + 2, 80, color(34, 139, 34));
    greenBricks[i] = b;
  }
  // TODO: create the blue bricks
  for (int i = 0; i < blueBricks.length; i++)
  {
    Brick b = new Brick(48 * i + 2, 105, color(135, 206, 250));
    blueBricks[i] = b;
  }
}

public void draw()
{ 
  if (!isGameOver)
  {
    background(bg);

    // Draw the ball.
    ball.drawBall();
    image(plusLive, plx, ply);

    image(doubleP, dpx, dpy);

    if (blueBricksBroken())
    {
      dpy += dpSpeedY;
    }
    if (collideWithDP())
    {
      isDoublePActive = true;
      ball.reverseSpeedX();
      dpSpeedY = 0;
      dpx = -100;
    }
    if (dpy > height)
    {
      dpy = -50;
      dpx = random(0, width - 40);
    }

    if (ply > height)
    {
      ply = -50;
      plx = random(0, width - 40);
    }

    if (greenBricksBroken())
    {
      ply += plSpeedY;
    }

    if (collideWithPL())
    {
      ball.reverseSpeedX();
      plSpeedY = 0;
      plx = -100;
      lives++;
    }
    // Draw the paddle.
    if (yellowBricksBroken())
    {
      fill(0);
      rect(paddleX, paddleY, SHRINK_PADDLE_WIDTH, PADDLE_HEIGHT);
    } else {
      fill(0);
      rect(paddleX, paddleY, PADDLE_WIDTH, PADDLE_HEIGHT);
    }
    // TODO: Lives & Points

    fill(0);

    textSize(25);

    text("Lives: " + lives, 320, 479);
    text("Points: " + points, 320, 460);

    textSize(10);
    text("Press P to Pause", 0, 479);

    // TODO: check for wall collisions
    if (didHitSide())
    {
      hitWall.play();
      ball.reverseSpeedX();
    }

    if (isBallCollidingWithPaddle())
    {
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
      lives--;
      song.stop();
      hasGameStarted = false;
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
      if (yellowBricks[i] != null)
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
    if (lives <= 0)
    {
      lostAllLives();
    }

    if (isDoublePActive)
    {
      dpCounter++;

      if (dpCounter > 800)
      {
        isDoublePActive = false; 
        dpCounter = 0;
      }
    }

    // TODO: check for brick collisions
    if (checkForCollisions())
    {
      hitBrick.play();
      if (isDoublePActive)
      {
        points = points * 2;
      } else {
        points+= 2;
      }


      ball.reverseSpeedY();
    }

    if (areAllBricksBroken())
    {
      gameOver(true);
    }
    // TODO: check for paddle collision
    if (didHitTop())
    {
      ball.reverseSpeedY();
    }
  }
}
public void keyReleased()
{
  if (key == 'p')
  {
    isPaused = !isPaused;

    if (isPaused)
    {
      textSize(35);
      text("Pause", width/2 - 50, height/2 + 50);
      noLoop();
      pauseSong.play();
      song.stop();
    } else
    {
      pauseSong.stop();
      song.play();
      loop();
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
    ball.setY(height - PADDLE_HEIGHT - BALL_RADIUS);
  }
}

public void mouseReleased(MouseEvent event)
{

  if (!hasGameStarted)
  {
    song.play();
    ball.setSpeedX(5);
    ball.setSpeedY(-3);
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
  if (ball.getX() == paddleX && ball.getY() == paddleY) {
    return true;
  }
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
        redBricksHits[i]++;
          myBrick.setColor(color(255, random(0,50), random(0,50)));
        
        if(redBricksHits[i] == RED_NUMBERS_HITS)
        {
            redBricks[i] = null;
        }
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
    if (redBricks[i] != null)
    {
      return false;
    }
  }

  for (int i = 0; i < orangeBricks.length; i++)
  {
    if (orangeBricks[i] != null)
    {
      return false;
    }
  }
  for (int i = 0; i < yellowBricks.length; i++)
  {
    if (yellowBricks[i] != null)
    {
      return false;
    }
  }
  for (int i = 0; i < greenBricks.length; i++)
  {
    if (greenBricks[i] != null)
    {
      return false;
    }
  }
  for (int i = 0; i < blueBricks.length; i++)
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
  isGameOver = true;
  fill(255);
  background(0);
  textSize(50);
  textAlign(CENTER);
  text("You Win!", width/2, height/2);
  // TODO
}

/**
 * Restarts the game by reseting all of the instance variables.
 */
public void restartGame()
{
  hasGameStarted = false;
  isGameOver = false;
  lives = 3;
  points = 0;

  plx = -100;
  ply = 240;

  dpx = -100;
  dpy = 240;
  isDoublePActive = false;
  dpCounter = 0;
  
  plx = -100;
  ply = 240;
  plSpeedY = 1.0;

  setup();
  // TODO
}

public void lostAllLives()
{
  background(0);
  fill(255);
  textSize(50);
  text("GAMEOVER", 150, width/2);
  isGameOver = true;
}

public boolean blueBricksBroken()
{
  for (int i = 0; i < blueBricks.length; i++)
  {
    if (blueBricks[i] != null)
    {
      return false;
    }
  }
  return true;
}

public boolean collideWithDP()
{
  if (ball.getX() == dpx && ball.getY() == dpy) {
    return true;
  }
  return isBallCollidingWithRect(dpx, dpy, doubleP.width, doubleP.height);
}

public boolean greenBricksBroken()
{
  for (int i = 0; i < greenBricks.length; i++)
  {
    if (greenBricks[i] != null)
    {
      return false;
    }
  }
  return true;
}

public boolean collideWithPL()
{
  if (ball.getX() == plx && ball.getY() == ply) {
    return true;
  }
  return isBallCollidingWithRect(plx, ply, doubleP.width, doubleP.height);
}

public boolean yellowBricksBroken()
{
  for (int i = 0; i < yellowBricks.length; i++)
  {
    if (yellowBricks[i] != null)
    {
      return false;
    }
  }
  return true;
}
