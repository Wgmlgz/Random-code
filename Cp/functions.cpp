#include "BetterCpp.h"

vector<int> fc(int n) {
  vector<int> res;
  for (int d = 2; d * d <= n; d++)
    while (n % d == 0) {
      res.push_back(d);
      n /= d;
    }
  if (n > 1)
    res.push_back(n);
  return res;
}
int fact(int n) {
  if (n >= MOD)ret 0;
  int result = 1;
  for (int i = 1; i <= n; i++)
    result = (result * i) % MOD;
  ret result;
}
template<typename T1, typename T2>vector<pair<typename T1::value_type, typename T2::value_type>> zip(T1& a, T2& b) {
  vector<pair<typename T1::value_type, typename T2::value_type>> c(a.size());
  transform(a.begin(), a.end(), b.begin(), c.begin(),
    [](const auto& aa, const auto& bb) {
      return make_pair(aa, bb);
    });
  return c;
};