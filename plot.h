#ifndef PLOT_H
#define PLOT_H

#include <vector>
#include <map>
#include <string>
#include "bounds.h"
#include "image.h"
#include "func.h"
#include "fill.h"

class Plot {
private:
  // TODO: add fields to represent plot bounds, functions, fills, etc.
  Bounds bounds;
  std::vector<Function> functions;
  std::vector<Fill> fills;

  // value semantics are prohibited
  Plot(const Plot &);
  Plot &operator=(const Plot &);

public:
  Plot();
  ~Plot();

  // TODO: add member functions to set and modify plot data
  void set_bounds(Bounds bounds);
  void add_function(Function func);
  void add_fill(Fill fill);
};

#endif // PLOT_H
