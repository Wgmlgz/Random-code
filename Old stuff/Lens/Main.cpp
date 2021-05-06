#include <chrono>

#include <ctime>
#include <fstream>
#include <iostream>
#include <string>
#include <vector>

#define MAX_DISTANCE 9999999999
#define RAY_MULTIPLIER 10000

struct Point {
  double x;
  double y;
  bool active;
  Point() {
    x = 0;
    y = 0;
    active = true;
  }
  Point(double nx, double ny, bool nactive = true) {
    x = nx;
    y = ny;
    active = nactive;
  }
  friend const Point operator-(const Point& a, const Point& b) {
    return Point(a.x - b.x, a.y - b.y);
  }
  friend const Point operator+(const Point& a, const Point& b) {
    return Point(a.x + b.x, a.y + b.y);
  }
  std::string toString() {
    return std::to_string(x) + ", " + std::to_string(y);
  }
  void rotate(Point o, double angle) {
    double tx = cos(angle) * (x - o.x) - sin(angle) * (y - o.y) + o.x;
    double ty = sin(angle) * (x - o.x) + cos(angle) * (y - o.y) + o.y;

    x = tx;
    y = ty;
  }
};
struct Line {
  Point start;
  Point end;
  Line() {
    start = Point();
    end = Point();
  }
  Line(Point nstart, Point nend) {
    start = nstart;
    end = nend;
  }
  Line(double x1, double y1, double x2, double y2) {
    start = Point(x1, y1);
    end = Point(x2, y2);
  }
  double length() {
    auto tmp = start - end;
    return sqrt(tmp.x * tmp.x + tmp.y * tmp.y);
  }
  void multiply(double n) {
    auto tmp = end - start;
    tmp.x *= n;
    tmp.y *= n;
    end = start + tmp;
  }
  double angle(Line line) {
    Point p1 = end - start;
    Point p2 = line.end - line.start;
    double cos = std::abs(p1.x * p2.x + p1.y * p2.y) /
                 (std::sqrt(p1.x * p1.x + p1.y * p1.y) *
                  std::sqrt(p2.x * p2.x + p2.y * p2.y));
    return acos(cos);
  }
  Line rotate(Point origin, double angle) {
    start.rotate(origin, angle);
    end.rotate(origin, angle);
    return *this;
  }
  double dist(Point target) {
    double t = ((target.x - start.x) * (end.x - start.x) +
                (target.y - start.y) * (end.y - start.y)) /
               ((end.x - start.x) * (end.x - start.x) +
                (end.y - start.y) * (end.y - start.y));
    if (t > 1) t = 1;
    if (t < 0) t = 0;
    double a = start.x - target.x + (end.x - start.x) * t;
    double b = start.y - target.y + (end.y - start.y) * t;
    if (sqrt(a * a + b * b) == 1) {
      std::cout << "*" << start.x << " " << start.y << " " << end.x << " "
                << end.y << std::endl;
    }
    return sqrt(a * a + b * b);
  }
};

Point cross(Line first, Line second, bool ignore_origin = false) {
  double n;
  Point ret;

  if (first.end.y - first.start.y != 0) {  // a(y)
    double q = (first.end.x - first.start.x) / (first.start.y - first.end.y);
    double sn =
        (second.start.x - second.end.x) + (second.start.y - second.end.y) * q;
    if (!sn) {
      ret.active = false;
      return ret;
    }  // c(x) + c(y)*q
    double fn = (second.start.x - first.start.x) +
                (second.start.y - first.start.y) * q;  // b(x) + b(y)*q
    n = fn / sn;
  } else {
    if (!(second.start.y - second.end.y)) {
      ret.active = false;
      return ret;
    }  // b(y)
    n = (second.start.y - first.start.y) /
        (second.start.y - second.end.y);  // c(y)/b(y)
  }

  ret.x =
      second.start.x + (second.end.x - second.start.x) * n;  // x3 + (-b(x))*n
  ret.y =
      second.start.y + (second.end.y - second.start.y) * n;  // y3 +(-b(y))*n

  auto between = [](double a, double b, double c) -> bool {
    const double EPS = 1E-9;
    return std::min(a, b) <= c + EPS && c <= std::max(a, b) + EPS;
  };
  ret.active = between(first.start.x, first.end.x, ret.x) &&
               between(first.start.y, first.end.y, ret.y) &&
               between(second.start.x, second.end.x, ret.x) &&
               between(second.start.y, second.end.y, ret.y);

  if (ignore_origin) {
    const double EPS = 1E-9;
    if (fabs(ret.x - first.start.x) <= EPS &&
        fabs(ret.y - first.start.y) <= EPS)
      ret.active = false;
  }
  return ret;
}
std::pair<Point, Line*> crossObject(Line v, std::vector<Line>& lines) {
  double distande = MAX_DISTANCE;
  Point cross_p = Point(0, 0, false);
  Line* cross_line = nullptr;

  for (auto& i : lines) {
    auto cross_p_tmp = cross(v, i, true);
    if (cross_p_tmp.active) {
      double tmp_dist = Line(v.start, cross_p_tmp).length();
      if (tmp_dist < distande) {
        cross_p = cross_p_tmp;
        distande = tmp_dist;
        cross_line = &i;
      }
    }
  }

  return std::make_pair(cross_p, cross_line);
}
std::vector<Line> tracePath(double angle,
                            std::vector<std::pair<double, double>> objs) {
  objs.push_back(std::make_pair(1, 100));

  std::vector<Line> path;
  //path.push_back(Line(0, 100, 0, -100));

  Line to(0, 0, 1000, 0);
  Point last;
  double last_n = 1;
  to.rotate(last, angle);
  to.multiply(-1);
  //path.push_back(to);
  for (auto i : objs) {
    angle = asin((last_n / i.first) * sin(angle));
    to = Line(0, 0, 1000, 0);
    to.start = to.start + last;
    to.end = to.end + last;
    to.rotate(last, angle);
    auto b = Line(last + Point(i.second, 100), last + Point(i.second, -100));
    auto t = cross(to, b);
    path.push_back(Line(last, t));
    //path.push_back(b);
    last = t;
    last_n = i.first;
  }

  return path;
}
std::vector<Line> tracePathLens(Line ray, double f) {
  ray.multiply(RAY_MULTIPLIER);
  std::vector<Line> path;
  auto lens = Line(0, 100, 0, -100);
  //path.push_back(lens);
  auto c = cross(lens, ray);
  path.push_back(Line(ray.start, c));
  ray.start.y -= c.y;
  ray.end.y -= c.y;
  lens.start.x += f;
  lens.end.x += f;
  auto p = cross(ray, lens);
  auto out = Line(c, p);
  out.multiply(RAY_MULTIPLIER);
  path.push_back(out);
  return path;
}
std::string printLines(std::vector<Line>& lines, std::string name) {
  std::string str;
  for (auto i : lines)
    str += i.start.toString() + ", " + i.end.toString() + "\n";
  std::cout << name << " (x1, y1, x2, y2):\n";
  std::cout << str;
  std::ofstream myfile;
  myfile.open(name + ".csv");
  myfile << str;
  myfile.close();
  return str;
}
int main() {
  std::cout << "task 1" << std::endl;
  double a, s, n;
  std::cout << "Enter angle, s, n: ";
  std::cin >> a >> s >> n;
  std::vector<std::pair<double, double>> objs = {
  std::make_pair(n, s)};
  auto da = tracePath(a, objs);
  printLines(da, "path in task 1");
  std::cout << "task 2" << std::endl;
  int nn;
  std::cout << "Enter angle: ";
  std::cin >> a;
  std::cout << "Enter number of objects: ";
  std::cin >> nn;
  objs.clear();
  for (int i = 0; i < nn; ++i) {
    std::cout << "Enter s, n: ";
    std::cin >> s >> n;
    objs.push_back(std::make_pair(n, s));
  }
  da = tracePath(a, objs);
  printLines(da, "path in task 2");
  std::cout << "task 3" << std::endl;
  std::cout << "Enter x1, y1, x2, y2, f: ";
  double x_1, y_1, x_2, y_2, f;
  std::cin >> x_1 >> y_1 >> x_2 >> y_2 >> f;
  da = tracePathLens(Line(x_1, y_1, x_2, y_2), f);
  printLines(da, "path in task 3");
}