private Snake snake;
private Box food;
private final int RED = color(255, 0, 0);
private boolean gameIsOver = false;

public void setup()
{
  size(300, 300);
  snake = new Snake();

  food = new Box(0, 0, RED);
  food.setRandomPosition();
}

public void draw()
{
  background(0);
  
  
  if (!gameIsOver)
  {
    fill(255);
    textSize(12);
    textAlign(LEFT);
    text("Score: " + snake.getSize(), 5, 10);
  
    food.draw();
    snake.draw();
    
    if (snake.isHeadCollidingWith(food))
    {
      snake.grow();
      food.setRandomPosition();
    }
    
    if (snake.isHeadCollidingWithSelf())
    {
      gameIsOver = true;
    }
  }
  else
  {
    fill(255);
    textAlign(CENTER);
    textSize(32);
    text("GAME OVER\nSCORE: " + snake.getSize(), width / 2, height / 2);
  }
}

public void keyPressed(KeyEvent event)
{
  int kc = keyCode; //event.getKeyCode();
  
  if (gameIsOver)
  {
    resetGame();
  }
  
  if (kc == UP)
  {
    snake.setDirection(0);
  }
  else if (kc == LEFT)
  {
    snake.setDirection(3);
  }
  else if (kc == RIGHT)
  {
    snake.setDirection(1);
  }
  else if (kc == DOWN)
  {
    snake.setDirection(2);
  }
}

public void resetGame()
{
  snake = new Snake();
  food.setRandomPosition();
  gameIsOver = false;
}