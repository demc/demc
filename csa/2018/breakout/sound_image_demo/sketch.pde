/* @pjs preload="data/meme.jpg,data/pikachu.jpg"; */

private PImage meme;
private PImage pikachu; 
private SoundFile doorbell;

public void setup()
{
  size(400, 400);
  
  meme = loadImage("data/meme.jpg");
  meme.resize(400, 400);
  
  pikachu = loadImage("data/pikachu.jpg");
  pikachu.resize(120,0);
  
  doorbell = new SoundFile(this, "dingdong.wav");
}

public void draw()
{
  background(meme);
  image(pikachu, 280, 40);
}

public void mouseReleased()
{
  doorbell.play(); 
}