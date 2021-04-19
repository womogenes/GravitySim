void draw() {
  // Customize config variables
  //restitution = (float) mouseX / width;

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
  float minX = particles[0].pos.x;
  float maxX = particles[0].pos.x;
  float minY = particles[0].pos.y;
  float maxY = particles[0].pos.y;

  for (int i = 0; i < N; i++) {
    minX = Math.min(minX, particles[i].pos.x);
    maxX = Math.max(maxX, particles[i].pos.x);
    minY = Math.min(minY, particles[i].pos.y);
    maxY = Math.max(maxY, particles[i].pos.y);
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

  text(frameRate, width - 20, height - 20);
  text(restitution, width - 20, height - 60);

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