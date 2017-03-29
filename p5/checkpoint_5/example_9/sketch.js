var x = 0;
var y = -100;
var t = 0;
var accel = 0.2;

function setup() {
  createCanvas(480, 480);
}

function draw() {
  background(0);

  var i = 0;
  while (i < 20) {
    drawRainDrop(x + i * 25, y, 1);
    i++;
  }


  y = y + 1 + (t * accel);
  t = t + 1;

  if (y > height) {
    y = -100;
    t = 0;
  }
}

function drawRainDrop(x, y, s) {
  push();
  translate(x, y);
  scale(s);

  noStroke();
  fill(135, 206, 250);

  beginShape();
  vertex(0, 0); // top tip of rain
  vertex(8, 20);
  vertex(10, 30);
  vertex(8, 35);
  vertex(4, 38);
  vertex(0, 40); // center bottom of raindrop
  vertex(-4, 38);
  vertex(-8, 35);
  vertex(-10, 30);
  vertex(-8, 20);
  endShape();

  pop();
}
