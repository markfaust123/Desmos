#ifndef BOUNDS_H
#define BOUNDS_H

class Bounds {
private:
  // TODO: add fields
  double xmax;
  double xmin;
  double ymax;
  double ymin;

public:
  // TODO: add member functions
  Bounds(double xmax, double xmin, double ymax, double ymin) : xmax(xmax), xmin(xmin), ymax(ymax), ymin(ymin) { }

  double get_x_max() { return xmax; }
  double get_x_min() { return xmin; }
  double get_y_max() { return ymax; }
  double get_y_min() { return ymin; }

  double set_x_max(double xmax) { this->xmax = xmax; }
  double set_x_min(double xmin) { this->xmin = xmin; }
  double set_y_max(double ymax) { this->ymax = ymax; }
  double set_y_min(double ymin) { this->ymin = ymin; }

};

#endif // BOUNDS_H
