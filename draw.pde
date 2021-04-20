void draw() {
  // Customize config variables
  //restitution = (float) mouseX / width;

  // Inputs
  inputLoop();

  // Move
  for (Particle p : particles) { p.update(); }

  // Tree
  constructTree();

  // Gravity
  gravity();

  // Collisions
  collide();

  // Display
  display();
}

float[] getBoundingSquare() {
  // Indices
  float minX = Float.MAX_VALUE;
  float maxX = -Float.MAX_VALUE;
  float minY = Float.MAX_VALUE;
  float maxY = -Float.MAX_VALUE;

  for (int i = 0; i < N; i++) {
    minX = Math.min(minX, particles.get(i).pos.x);
    maxX = Math.max(maxX, particles.get(i).pos.x);
    minY = Math.min(minY, particles.get(i).pos.y);
    maxY = Math.max(maxY, particles.get(i).pos.y);
  }

  return new float[] { minX, minY, Math.max(maxX - minX, maxY - minY) };
}

void constructTree() {
  /*
  1. Get bounding square
  2. Insert nodes
  */
  float[] boundingSquare = getBoundingSquare();
  root = new TreeNode(boundingSquare[0], boundingSquare[1], boundingSquare[2]);

  for (Particle p : particles) { root.insert(p); }
}

void display() {
  background(0);
  
  // Camera stuff
  camx = lerp(camx, tox, .1);
  camy = lerp(camy, toy, .1);
  zoom = lerp(zoom, tozoom, .1);

  text(nf(frameRate, 2, 1) + " fps", width - 20, height - 20);
  text("N=" + N, width - 20, height - 60);

  pushMatrix();
  translate(camx, camy);
  scale(zoom);

  // Particles
  strokeWeight(2 * r);
  stroke(255);
  for (Particle p : particles) { p.display(); }

  // Quadtree
  /*
  textAlign(CENTER, CENTER);
  strokeWeight(0.5);
  root.display();
  */

  popMatrix();
}

// Interpolate from green to red given an input between 0 and 1
// From https://stackoverflow.com/questions/6394304/algorithm-how-do-i-fade-from-red-to-green-via-yellow-using-rgb-values
color getColor(float x) {
  return color(500 * x, 500 * (1 - x), 0);
}