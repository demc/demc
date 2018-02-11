public class Snake
{
  private ArrayList<Box> boxList;
  private final int GREEN = color(0, 255, 0); 
  private float sideLength = 20;
  private int direction = 0; // north, east, south, west
  private int timer = 0;
  private final int MOVE_INTERVAL = 6;
  
  public Snake()
  {
    boxList = new ArrayList<Box>(); 
    boxList.add(new Box(width / 2, height / 2, GREEN));
  }
  
  public void setDirection(int inDirection)
  {
    direction = inDirection;
  }
  
  public void grow()
  {
    Box tail = boxList.get(boxList.size() - 1);
    Box newTail = tail.clone();
    
    if (direction == 0)
    {
      newTail.setY(tail.getY() + 22);
    }
    else if (direction == 1)
    {
      newTail.setX(tail.getX() - 22);
    }
    else if (direction == 2)
    {
      newTail.setY(tail.getY() - 22);
    }
    else if (direction == 3)
    {
      newTail.setX(tail.getX() + 22);
    }
    
    boxList.add(newTail);
  }
  
  public int getSize()
  {
    return boxList.size();
  }
  
  public boolean isHeadCollidingWith(Box other)
  {
    Box head = boxList.get(0);
    return head.isCollidingWith(other);
  }
  
  public boolean isHeadCollidingWithSelf()
  {
    Box head = boxList.get(0);
    
    for (Box b : boxList)
    {
      if (b != head)
      {
        if (head.isCollidingWith(b))
        {
          return true;
        }
      }
    }
    
    return false;
  }
  
  public void draw()
  {  
    Box head = boxList.get(0);
    head.draw();
    
    for (Box b : boxList)
    {
      b.draw();
    }
    
    timer++;
    if (timer == MOVE_INTERVAL)
    {
      timer = 0;
      
      for (int i = boxList.size() - 1; i > 0; i--)
      {
        Box curr = boxList.get(i);
        Box next = boxList.get(i - 1);
        
        curr.setX(next.getX());
        curr.setY(next.getY());
      }
       
      if (direction == 0)
      {
        head.setY(head.getY() - sideLength);
        
        if (head.getY() < 0)
        {
          head.setY(height);
        }
      }
      else if (direction == 1)
      {
        head.setX(head.getX() + sideLength);
        
        if (head.getX() > width)
        {
          head.setX(0);
        }
      }
      else if (direction == 2)
      {
        head.setY(head.getY() + sideLength);
        
        if (head.getY() > height)
        {
          head.setY(0);
        }
      }
      else if (direction == 3)
      {
        head.setX(head.getX() - sideLength);
        
        if (head.getX() < 0)
        {
          head.setX(width);
        }
      } 
    }
  }
}