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
std::pair<std::vector<Line>, bool> tracePath(Line v, Point target,
                                             double target_radius,
                                             std::vector<Line> lines,
                                             size_t max_bounces) {
  std::pair<std::vector<Line>, bool> path;
  path.second = false;

  v.multiply(RAY_MULTIPLIER);
  for (size_t i = 0; i < max_bounces; ++i) {
    auto trace_res = crossObject(v, lines);
    if (trace_res.first.active) {
      double ang = v.angle(*trace_res.second);

      Line t = v;
      t.end = trace_res.first;
      path.first.push_back(t);

      if (cross(Line(target + Point(-target_radius, 0),
                     target + Point(target_radius, 0)),
                t)
              .active ||
          cross(Line(target + Point(0, -target_radius),
                     target + Point(0, target_radius)),
                t)
              .active) {
        path.second = true;
        break;
      }

      if (t.dist(target) < target_radius) path.second = true;
      double tt = t.rotate(trace_res.first, ang).angle(*trace_res.second);
      bool b = (tt <= 0.0001);
      if (isnan(tt)) b = true;
      double angt = ang;
      ang = 1.5708 - ang;
      ang *= 2;
      if (b) {
        ang = -ang;
      }
      auto rd = []() -> double { return static_cast<double>(rand()) / RAND_MAX; };
      Point move;
      move.x += (rd() - 0.5) * 2;
      move.y += (rd() - 0.5) * 2;
      trace_res.second->start = trace_res.second->start + move;
      trace_res.second->end = trace_res.second->end + move;

      v.start = trace_res.first;
      v.rotate(trace_res.first, 3.14159 + ang);

    } else {
      path.first.push_back(v);
      break;
    }
  }
  return path;
}

std::vector<Line> generateLines(Point p1 = Point(-10, -10),
                                Point p2 = Point(10, 10),
                                Point max_size = Point(5, 5),
                                size_t min_cout = 20, size_t max_cout = 40) {
  using namespace std::chrono;

  srand(system_clock::now().time_since_epoch().count());
  int count = rand() % (max_cout - min_cout) + min_cout;
  std::vector<Line> lines;
  for (int i = 0; i < count; ++i) {
    auto rd = []() -> double { return static_cast<double>(rand()) / RAND_MAX; };
    Point size;
    size.x = rd() * max_size.x;
    size.y = rd() * max_size.y;

    Point pos;
    pos.x = rd() * ((p2 - p1) - size).x + p1.x;
    pos.y = rd() * ((p2 - p1) - size).y + p1.y;
    Line tmp = Line(pos, pos + size);
    if (rand() % 2) {
      std::swap(tmp.end.x, tmp.start.x);
    }
    lines.push_back(tmp);
  }

  return lines;
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
  std::vector<Line> lines = generateLines();
  printLines(lines, "lines");

  auto v = Line(0, 0, 1, 1);
  auto hit_point = Point(0, 1);
  auto path = tracePath(v, hit_point, 0.5, lines, 100);
  std::cout << std::endl;
  printLines(path.first, "path");
  std::cout << std::endl;
  std::cout << "hit at point: " << hit_point.toString() << " = " << std::boolalpha << path.second << std::endl;
}