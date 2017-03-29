var swingAngle = 0;
var swingsPerFrame = .2;

var x = 240;
var y = 0;


function setup() {
  createCanvas(480, 480);
  angleMode(DEGREES);
  ellipseMode(RADIUS);
}

function draw() {
  background('lightblue');

  x = 0;
  while (x <= width) {


    push();
    swingAngle = swingAngle + swingsPerFrame;
    translate(x, y)
    rotate(swingAngle);
    swingUmbrell(0, 0, .5);

    pop();

    if (swingAngle > 25) {
      swingsPerFrame = swingsPerFrame * -1;
    }
    else if (swingAngle < -25) {
      swingsPerFrame = swingsPerFrame * -1;
    }


    y = y + .5;

    if (y > height + 100) {
      y = -100;
    }

    x = x + 120;
  }
}

function swingUmbrell(x, y, s) {
  drawUmbrella(x, y, s);
}

function drawUmbrella(x, y, s) {
  var width = 200;
  var radius = width / 2;

  push();

  // make the origin the center of the umbrella
  translate(x, y);
  scale(s);

  // draw purple umbrella
  noStroke();
  fill(138, 43, 226);

  arc(0, 0, radius, radius, 180, 0);

  push();

  // make the origin the bottom left corner of the umbrella
  translate(-radius + 20, 10);
  fill('lightblue');

  var i = 0;
  while (i < 5) {
    // draw blue circles to cut out the umbrella
    arc(40 * i, 0, 20, 20, 180, 0);
    i++;
  }

  pop();

  // draw handle
  noFill();
  strokeCap(SQUARE);
  stroke(160, 82, 45);
  strokeWeight(5);
  line(0, -9, 0, 100);

  arc(-11, 100, 12, 12, 360, 180);

  pop();
}
