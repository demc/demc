var count = 0;

function setup() {
  createCanvas(480, 480);
  angleMode(DEGREES);
  strokeCap(PROJECT);
  frameRate(1);
  noFill();
}

function draw() {
  background(0);

  if (count >= 1) {
    drawOGlow();
  }

  if (count >= 2) {
    drawPGlow();
  }

  if (count >= 3) {
    drawEGlow();
  }

  if (count >= 4) {
    drawNGlow();
  }

  // blur the letters to make a glow effect
  filter(BLUR, 40);

  if (count >= 1) {
    drawO();
  }

  if (count >= 2) {
    drawP();
  }

  if (count >= 3) {
    drawE();
  }

  if (count >= 4) {
    drawN();
  }

  count = count + 1;

  if (count == 5) {
    count = 0;
  }
}

function drawE() {
  push();
  stroke(145, 227, 255);
  strokeWeight(5);

  // E
  line(275, 150, 275, 250);
  line(275, 150, 310, 150); // top
  line(275, 250, 310, 250); // bottom
  line(275, 180, 300, 180); // middle

  pop();
}

function drawEGlow() {
  push();
  stroke(70, 173, 212);
  strokeWeight(40);

  // E
  line(275, 150, 275, 250);
  line(275, 150, 310, 150); // top
  line(275, 250, 310, 250); // bottom
  line(275, 180, 300, 180); // middle

  pop();
}

function drawN() {
  push();
  stroke(145, 227, 255);
  strokeWeight(5);

  // N
  line(340, 150, 340, 250); // left
  line(385, 150, 385, 250); // right
  line(340, 150, 385, 250); // across

  pop();
}

function drawNGlow() {
  push();
  stroke(70, 173, 212);
  strokeWeight(40);

  // N
  line(340, 150, 340, 250); // left
  line(385, 150, 385, 250); // right
  line(340, 150, 385, 250); // across

  pop();
}

function drawO() {
  push();
  stroke(145, 227, 255);
  strokeWeight(5);

  // 0
  ellipse(150, 200, 60, 100);

  pop();
}

function drawOGlow() {
  push();
  stroke(70, 173, 212);
  strokeWeight(40);

  // O blur
  ellipse(150, 200, 60, 100);

  pop();
}

function drawP(x, y) {
  push();
  stroke(145, 227, 255);
  strokeWeight(5);

  // P
  line(210, 150, 210, 250);
  arc(211, 188, 75, 75, 270, 90);

  pop();
}

function drawPGlow(x, y) {
  push();
  stroke(70, 173, 212);
  strokeWeight(40);

  // P blur
  line(210, 150, 210, 250);
  arc(211, 188, 75, 75, 270, 90);

  pop();
}
