#include <iostream>

/*
Задание 1.
Объект находится в начальной точке. Через промежуток времени t1 объект
получает ускорение a, изменяющееся по закону: a=A+B*t. Определить путь
пройденный объектом за время t2, величину скорости и ускорения в времени
момент t3 (t1<t3<t2). Движение вдоль 1 координатной оси.

Задание 2.
Объект находится в начальной точке. Через промежуток времени t1 объект
получает ускорение aх, изменяющееся по закону: a=A+B*t; и ay,
изменяющееся по закону: a=C+D*t. Определить путь пройденный объектом
за время t2, величину скорости и ускорения в момент времени t3 (t1<t3<t2).
Движение вдоль 2-х координатных осей.
*/

double GetIntegral(double x, double a, double b) {
  return (x * x * b) / 2 + a * x;
}
void Task1() {
  double t1, t2, t3;
  double A, B;
  std::cin >> t1 >> t2 >> t3 >> A >> B;

  double s_t2, v_t3, a_t3;

  s_t2 = GetIntegral(t2, A, B) - GetIntegral(t1, A, B);
  v_t3 = GetIntegral(t3, A, B);
  a_t3 = A + B * t3;

  std::cout << s_t2 << " " << v_t3 << " " << a_t3;
}
void Task2() {
  /*double t1, t2, t3;
  double A, B, C, D;
  std::cin >> t1 >> t2 >> t3 >> A >> B >> C >> D;

  double s_t2_, v_t3, a_t3;

  s_t2 = GetIntegral(t2, A, B) - GetIntegral(t1, A, B);
  v_t3 = GetIntegral(t3, A, B);

  s_t2 = GetIntegral(t2, A, B) - GetIntegral(t1, A, B);
  v_t3 = GetIntegral(t3, A, B);

  a_t3 = A + B * t3;

  std::cout << s_t2 << " " << v_t3 << " " << a_t3;*/
}
int main() {
  Task1();
  Task2();
}