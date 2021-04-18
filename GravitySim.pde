/* CONFIG */
int N; // Number of particles
float r; // Radius


/* GRAHPICS */
// Camera stuff
float camx, camy, tox, toy;
float zoom, tozoom;
float dzoom = 0.5; // Change in zoom amount
float xOffset, yOffset;

/* VARIABLES */
Particle[] particles;

void setup() {
  // Graphics
  size(800, 800);
  ellipseMode(CENTER);
  fill(255);
  noStroke();
  textAlign(RIGHT, BOTTOM);
  textSize(24);

  // Camera
  tox = width / 2;
  toy = height / 2;
  camx = width / 2;
  camy = height / 2;
  zoom = 1;
  tozoom = 1;
  xOffset = 0;
  yOffset = 0;

  // Config
  N = 100000;
  r = 1;

  // Variables
  particles = new Particle[N];
  for (int i = 0; i < N; i++) {
    particles[i] = new Particle(new Vector(random(-width/2, width/2), random(-height/2, height/2)), r);
    particles[i].vel.x = random(-1, 1);
    particles[i].vel.y = random(-1, 1);
  }
}