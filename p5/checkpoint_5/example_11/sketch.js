var x;
var y;
var from;
var to;

function setup() {
  createCanvas(480, 480);
  x = width / 2;
  y = -50;
  from = color(15, 90, 120); // yale blue
  to = color(135, 206, 235); // sky blue
}

function draw() {
  var hasSunSet = y > height + 50;

  from = color(red(from) - 0.3, green(from) - 0.3, blue(from) - 0.3);
  to = color(red(to) - 0.3, green(to) - 0.3, blue(to) - 0.3);

  // If the "to" has transitioned all the way to black,
  // then reset the animation.
  if (red(to) == 0 && green(to) == 0 && blue(to) == 0) {
    y = -50;
    from = color(15, 90, 120); // yale blue
    to = color(135, 206, 235); // sky blue
  }

  drawVerticalGradient(from, to);

  if (!hasSunSet) {
    drawSun(x, y);
    y = y + 2;
  }
}

function drawSun(x, y) {
  fill(255, 255, 0);
  ellipse(x, y, 100, 100);
}

function drawVerticalGradient(fromColor, toColor, a) {
  var stepCount = 10;
  var h = height / stepCount;

  var r = red(fromColor);
  var rStep = (red(toColor) - r) / stepCount;
  var g = green(fromColor);
  var gStep = (green(toColor) - g) / stepCount;
  var b = blue(fromColor);
  var bStep = (blue(toColor) - b) / stepCount;

  noStroke();

  var i = 0;
  var y = 0;
  while (i < stepCount) {
    fill(r, g, b, a);
    rect(0, y, width, h);

    y = y + h;
    r = r + rStep;
    g = g + gStep;
    b = b + bStep;
    i++;
  }
}
