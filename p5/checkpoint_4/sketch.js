function setup() {
  createCanvas(480, 480);
}

function draw() {
  drawCowboy(200, 200, 4);
}

function drawCowboy(x, y, s) {
  drawFace(x, y, s);
  drawCowboyHat(x, y, s);
  drawCowboyEyes(x, y, s);
  drawCowboyMouth(x, y, s);
  drawCowboyNose(x, y, s);
  drawCowbowMustache(x, y, s);
}

function drawCowboyEyes(x, y, s) {
  push();
  translate(x, y);
  scale(s);

  noStroke();

  // draw eyeballs
  fill(114, 114, 221);
  ellipse(8, 24, 2, 2);
  ellipse(16, 24, 2, 2);

  // draw eye brows
  fill(222, 184, 135);

  // left eyebrow
  beginShape();
  vertex(5, 21);
  vertex(5, 19);
  vertex(11, 20);
  vertex(11, 21);
  endShape();

  // right eyebrow
  beginShape();
  vertex(19, 21);
  vertex(19, 19);
  vertex(13, 20);
  vertex(13, 21);
  endShape();

  pop();
}

function drawCowboyNose(x, y, s) {
  push();
  translate(x, y);
  scale(s);

  noStroke();
  fill(247, 185, 185);
  beginShape();
  vertex(11, 33);
  vertex(9, 31);
  vertex(11.5, 30);
  endShape();

  fill(188, 143, 143);
  beginShape();
  vertex(12, 24);
  vertex(11, 33);
  vertex(12, 33);
  vertex(14, 32);
  vertex(15, 31);
  vertex(13, 30);
  vertex(13, 24);
  endShape();

  pop();
}

function drawCowbowMustache(x, y, s) {
  push();
  translate(x, y);
  scale(s);

  noStroke();

  fill(222, 184, 135);

  beginShape();
  vertex(12, 33.5);
  vertex(8, 35);
  vertex(4, 34);
  vertex(6, 37);

  vertex(12, 36);

  vertex(18, 37);
  vertex(20, 34);
  vertex(16, 35);
  endShape();

  pop();
}

function drawCowboyMouth(x, y, s) {
  push();
  translate(x, y);
  scale(s);

  noStroke();

  // draw mouth
  fill(255, 192, 203);
  rect(8, 37, 8, 1.5, 1);

  pop();
}

function drawCowboyHat(x, y, s) {
  push();
  translate(x, y);
  scale(s);

  noStroke();
  fill(139, 69, 19);

  beginShape();
  // start with a triangle

  // center bottom
  vertex(12, 17);

  // left side
  vertex(3, 16);
  vertex(1, 15.5);
  vertex(0, 14);
  vertex(1, 12.5);
  vertex(3, 13);

  vertex(6, 12);

  // top of hat
  vertex(8, 2.5);
  vertex(9, 0);
  vertex(12, 2);
  vertex(15, 0);
  vertex(16, 2.5);

  vertex(18, 12);

  // right side
  vertex(21, 13);
  vertex(23, 12.5);
  vertex(24, 14);
  vertex(23, 15.5);
  vertex(21, 16);

  endShape();

  // draw leather trim
  fill(165, 42, 42);
  beginShape();

  vertex(6, 12);
  vertex(12, 13);
  vertex(18, 12);
  vertex(18, 10);
  vertex(12, 11);
  vertex(6, 10);

  endShape();

  pop();
}

function drawFace(x, y, s) {
  push();
  translate(x, y);
  scale(s);

  // draw head
  noStroke();
  fill(255, 224, 189);
  beginShape();

  // weird peak of forehead
  // drawn left to right
  vertex(0, 24);
  vertex(3, 16);
  vertex(6, 14);
  vertex(12, 12);
  vertex(18, 14);
  vertex(21, 16);
  vertex(24, 24);

  // begin right side of face
  // sloping down then back up
  vertex(23, 30);
  vertex(21, 36);
  vertex(18, 40);

  // begin chin
  vertex(15, 42);
  vertex(12, 43);
  vertex(9, 42);

  // begin left side of face
  vertex(6, 40);
  vertex(3, 36);
  vertex(1, 30);

  endShape();

  pop();
}
