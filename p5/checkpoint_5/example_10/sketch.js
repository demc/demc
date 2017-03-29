var bumpPos = 0;

function setup() {
  createCanvas(480, 480);
  frameRate(6);
}

function draw() {
  background(122);
  drawCaterpillar(160, 240, 1);
  bumpPos = bumpPos + 1;

  if (bumpPos > 8) {
    bumpPos = 0;
  }
}

function drawCaterpillar(originX, originY, s) {
  push();
  translate(originX, originY);
  scale(s);

  noStroke();

  // draw body
  var x = 0;
  var y = 0;
  var i = 0;

  while (i < 8) {
    if (i % 2 == 0) {
      // light green
      fill(154, 205, 50);
    }
    else {
      // dark green;
      fill(85, 107, 47);
    }

    if (bumpPos == i) {
      ellipse(x, y - 20, 40, 80);
      fill(128, 0, 0);
      ellipse(x, y + 20, 18, 15);
    }
    else if (bumpPos - 1 == i || bumpPos + 1 == i) {
      ellipse(x, y - 10, 40, 80);
      fill(128, 0, 0);
      ellipse(x, y + 30, 18, 15);
    }
    else {
      ellipse(x, y, 40, 80);
      fill(128, 0, 0);
      ellipse(x, y + 40, 18, 15);
    }

    x = x + 20;
    i++;
  }

  // draw head
  if (bumpPos == 8) {
    // right eye
    fill(255);
    ellipse(x + 20, y - 30, 30, 40);
    fill(0);
    ellipse(x + 30, y - 35, 10, 15);

    fill(154, 205, 50);
    ellipse(x, y - 20, 40, 80);

    // left eye
    fill(255);
    ellipse(x, y - 30, 30, 40);
    fill(0);
    ellipse(x + 10, y - 35, 10, 15);

    // mouth
    triangle(x + 10, y + 10, x, y, x + 20, y);
  }
  else {
    // right eye
    fill(255);
    ellipse(x + 20, y - 10, 30, 40);
    fill(0);
    ellipse(x + 30, y - 15, 10, 15);

    fill(154, 205, 50);
    ellipse(x, y, 40, 80);

    // left eye
    fill(255);
    ellipse(x, y - 10, 30, 40);
    fill(0);
    ellipse(x + 10, y - 15, 10, 15);

    // mouth
    triangle(x + 10, y + 30, x, y + 20, x + 20, y + 20);
  }


  pop();
}
