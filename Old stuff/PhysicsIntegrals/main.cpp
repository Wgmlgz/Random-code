﻿#include <math.h>
#include <iostream>

double GetIntegral(double x, double a, double b) { // вычисление интеграла для y = a + x * b
  return (x * x * b) / 2 + a * x; // интеграл y = a + x * b равен (bx^2)/2 + ax
}
double GetV(double x, double a, double b) { // вычисление скорости
	return GetIntegral(x, a, b); // вычисление скорости через игнтеграл, описанный выше
}
double GetA(double x, double a, double b) { // вычисление ускорения
	return a + b * x; // a = A + B*t  из условия
}
double GetS(double x1, double x2, double a, double b) { // вычисление пути
  return GetIntegral(x1, a, b) - GetIntegral(x2, a, b); // вычисление пути через определенный интегал (x1, x2)
}

int main1() {
  double t1, t2, t3;
  double A, B, C, D;

  std::cout << "- Task 1 -\n";
  std::cout << "enter t1, t2, t3, A, B:\n";
  std::cin >> t1 >> t2 >> t3 >> A >> B;

  double s_t2, v_t3, a_t3;

  s_t2 = GetS(t2, t1, A, B);
  v_t3 = GetV(t3, A, B);
  a_t3 = GetA(t3, A, B);

  std::cout << "s(t2) = ";
  std::cout << s_t2 << "\n";
  std::cout << "v(t3) = ";
  std::cout << v_t3 << "\n";
  std::cout << "a(t3) = ";
  std::cout << a_t3 << "\n";

  std::cout << "\n- Task 2 -\n";
  std::cout << "enter t1, t2, t3, A, B, C, D:\n";

  std::cin >> t1 >> t2 >> t3 >> A >> B >> C >> D;

  double s_t2_x, v_t3_x, a_t3_x;
  double s_t2_y, v_t3_y, a_t3_y;

  s_t2_x = GetS(t2, t1, A, B);
  v_t3_x = GetV(t3, A, B);
  a_t3_x = GetA(t3, A, B);

  s_t2_y = GetS(t2, t1, C, D);
  v_t3_y = GetV(t3, C, D);
  a_t3_y = GetA(t3, C, D);

  s_t2 = sqrt(s_t2_x * s_t2_x + s_t2_y * s_t2_y);
  v_t3 = sqrt(v_t3_x * v_t3_x + v_t3_y * v_t3_y);
  a_t3 = sqrt(a_t3_x * a_t3_x + a_t3_y * a_t3_y);

  std::cout << "s(t2) = ";
  std::cout << s_t2 << "\n";
  std::cout << "v(t3) = ";
  std::cout << v_t3 << "\n";
  std::cout << "a(t3) = ";
  std::cout << a_t3 << "\n";

  return 0;
}