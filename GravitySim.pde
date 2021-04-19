/* CONFIG */
int N; // Number of particles
float r; // Radius
float mass;
float G;
float restitution;

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
  N = 2000;
  r = 2;
  mass = 1;
  G = 0.003; // Gravitational constant
  restitution = 0.2;

  // Graphics
  size(800, 800, P2D);
  fill(255);
  stroke(255);
  noStroke();
  textAlign(RIGHT, BOTTOM);
  textSize(24);

  circle = createShape(ELLIPSE, 0, 0, 2 * r, 2 * r);

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
    particles[i] = new Particle(new Vector(random(-width/2, width/2), random(-height/2, height/2)));
    particles[i].vel.x = random(-1, 1);
    particles[i].vel.y = random(-1, 1);
  }
}