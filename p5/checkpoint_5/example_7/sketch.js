var angle = 0;
var DEGREES_PER_FRAME = 0.5;

function setup() {
  createCanvas(480, 480);
  ellipseMode(RADIUS);
  angleMode(DEGREES);
}

function draw() {
  background(1);

  angle = angle + DEGREES_PER_FRAME;
  drawWheelFrame(240, 240, 50, 12, angle);
}

function drawWheelFrame(x, y, radius, spokeCount, angle) {
  push();

  translate(x, y);
  rotate(angle);

  drawWheel(0, 0, 100, 13);
  pop();
}

function drawWheel(x, y, radius, spokeCount) {
  var degreesPerTurn = 360 / spokeCount;
  var i = 0;

  push();
  translate(x, y);

  stroke(139, 69, 19);
  strokeWeight(2);
  noFill();

  ellipse(0, 0, radius, radius);

  while (i < spokeCount) {
    line(0, 0, 0, 0 - radius);
    rotate(degreesPerTurn);
    i++;
  }

  pop();
}
