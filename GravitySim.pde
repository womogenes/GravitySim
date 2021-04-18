/* CONFIG */
int N; // Number of particles
float r; // Radius

/* GRAHPICS */
PShape circle;

// Camera stuff
float camx, camy, tox, toy;
float zoom, tozoom;
float dzoom = 0.5; // Change in zoom amount
float xOffset, yOffset;

/* VARIABLES */
Particle[] particles;
TreeNode root;

void setup() {
  // Config
  N = 5000;
  r = 10;

  // Graphics
  size(800, 800);
  ellipseMode(CENTER);
  fill(255);
  noStroke();
  textAlign(RIGHT, BOTTOM);
  textSize(24);

  circle = createShape(ELLIPSE, -r/2, -r/2, r, r);

  // Camera
  tox = width / 2;
  toy = height / 2;
  camx = width / 2;
  camy = height / 2;
  zoom = 1;
  tozoom = 1;
  xOffset = 0;
  yOffset = 0;

  // Variables
  particles = new Particle[N];
  for (int i = 0; i < N; i++) {
    particles[i] = new Particle(new Vector(random(-width/2, width/2), random(-height/2, height/2)), r);
    particles[i].vel.x = random(-1, 1);
    particles[i].vel.y = random(-1, 1);
  }
}