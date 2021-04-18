void draw() {
  // Display
  display();

  // Move
  for (Particle p : particles) { p.update(); }
}

void display() {
  background(0);
  
  // Camera stuff
  camx = lerp(camx, tox, .1);
  camy = lerp(camy, toy, .1);
  zoom = lerp(zoom, tozoom, .1);

  text(frameRate, width - 20, height - 20);

  pushMatrix();
  translate(camx, camy);
  scale(zoom);
  for (Particle p : particles) { p.display(); }
  popMatrix();
}