// Quadtree!

class TreeNode {
  float x, y, w;
  TreeNode[] children; // Children
  boolean leaf;
  Particle particle;
  
  Vector totalCenter; // "Total" center of mass
  Vector center;
  float totalMass; // Total mass
  int count; // Number of particles

  public TreeNode(float x, float y, float w) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.leaf = true;
    this.particle = null;
    this.children = new TreeNode[4];

    this.totalCenter = new Vector(0, 0);
    this.center = null;
    this.totalMass = 0;
    this.count = 0;
  }

  void split() {
    float newWidth = w * 0.5;
    children[0] = new TreeNode(x, y, newWidth); // nw
    children[1] = new TreeNode(x + newWidth, y, newWidth); // ne
    children[2] = new TreeNode(x, y + newWidth, newWidth); // sw
    children[3] = new TreeNode(x + newWidth, y + newWidth, newWidth); // se
    this.leaf = false;
  }

  // Return index of child that contains given vector
  // For performance, e don't consider not fitting
  int which(Vector v) {
    float halfWidth = w * 0.5;
    if (v.y < y + halfWidth) {
      return v.x < x + halfWidth ? 0 : 1;
    }
    return v.x < x + halfWidth ? 2 : 3;
  }

  void insert(Particle newP) {
    if (this.leaf) {
      // Case: Leaf already contains another particle
      if (this.particle != null) {
        Particle a = this.particle;
        Particle b = newP;

        TreeNode cur = this;
        int qA = cur.which(a.pos);
        int qB = cur.which(b.pos);
        while (qA == qB) {
          // Update total center and mass
          cur.totalCenter.add(a.pos);
          cur.totalCenter.add(b.pos);
          cur.totalMass += mass * 2;

          cur.split();
          cur = cur.children[qA];
          qA = cur.which(a.pos);
          qB = cur.which(b.pos);
        }

        cur.totalMass += mass * 2;
        cur.totalCenter.add(a.pos);
        cur.totalCenter.add(b.pos);
        cur.count += 2;

        cur.split();
        cur.children[qA].particle = a;
        cur.children[qB].particle = b;

        // Update center of mass and total for lowest-level child
        cur.children[qA].totalCenter.add(a.pos);
        cur.children[qB].totalCenter.add(b.pos);
        cur.children[qA].totalMass += mass;
        cur.children[qA].totalMass += mass;
        cur.children[qA].count++;
        cur.children[qB].count++;

        this.particle = null;
        return;
      }

      this.particle = newP;
      this.totalCenter.add(newP.pos);
      this.totalMass += mass;
      this.count++;
      return;
    }

    // Not a leaf
    this.count++;
    this.totalCenter.add(newP.pos);
    this.children[this.which(newP.pos)].insert(newP);
  }

  void display() {
    if (!leaf) {
      for (TreeNode tn : children) { tn.display(); }
    }

    strokeWeight(2);
    rect(x, y, w, w);
  }
}