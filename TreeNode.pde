// Quadtree!

class TreeNode {
  float x, y, w;
  TreeNode[] children; // Children
  boolean leaf;
  Particle particle;

  public TreeNode(float x, float y, float w) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.leaf = true;
    this.particle = null;
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
    } else {
      return v.y < x + halfWidth ? 2 : 3;
    }
  }

  void insert(Particle newP) {
    if (this.leaf) {

      // Case: Leaf already contains particle
      if (this.particle != null) {
        Particle a = this.particle;
        Particle b = newP;

        TreeNode cur = this;
        int qA = cur.which(a.pos);
        int qB = cur.which(b.pos);
        while (qA == qB) {
          cur.split();
          cur = cur.children[qA];
          qA = cur.which(a.pos);
          qB = cur.which(b.pos);
        }

        cur.split();
        cur.children[qA].particle = a;
        cur.children[qB].particle = b;

        this.particle = null;
        return;
      }

      this.particle = newP;
      return;
    }

    // Not a leaf
    this.children[this.which(newP.pos)].insert(newP);
  }
}