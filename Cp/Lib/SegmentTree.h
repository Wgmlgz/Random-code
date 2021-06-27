#pragma once
#include <bits/stdc++.h>

template<typename T>
class SegTree {
  T default_val;
  std::function<T(const T &, const T &)> seg_merge;

  std::vector<T> base;
  std::vector<T> tree;

  void build(int pos, int l, int r) {
    if (r - l == 1) { tree[pos] = base[l]; return; }
    int m  = l + (r - l) / 2;
    build(pos * 2, l, m);
    build(pos * 2 + 1, m, r);
    tree[pos] = seg_merge(tree[pos * 2], tree[pos * 2 + 1]);
  }

  std::pair<bool, T> getRange(int pos, int ql, int qr, int l, int r) {
    if (ql <= l and qr >= r) return {true, tree[pos]};
    if (qr <= l or ql >= r) return {false, default_val};

    int m = l + (r - l) / 2;
    auto r1 = getRange(pos * 2, ql, qr, l, m);
    auto r2 = getRange(pos * 2 + 1, ql, qr, m, r);

    if (r1.first and r2.first) return {true, seg_merge(r1.second, r2.second)};
    else if (r1.first) return {true, r1.second};
    else return {true, r2.second};
  }
  void update(int pos, int q, int l, int r, const T& val) {
    if (r - l == 1) { tree[pos] = val; return; }
    int m  = l + (r - l) / 2;
    if (m > q) update(pos * 2, q, l, m, val);
    else update(pos * 2 + 1, q, m, r, val);
    tree[pos] = seg_merge(tree[pos * 2], tree[pos * 2 + 1]);
  }

 public:
  SegTree(const std::vector<T>& v, const T& default_val, std::function<T(const T&, const T&)> seg_merge){
    this->seg_merge = seg_merge;
    this->default_val = default_val;
    base = v;
    tree.resize(4 * base.size(), default_val);
    build(1, 0, base.size());
  }
  T getRange(int l, int r) {
    return getRange(1, l, r, 0, base.size()).second;
  }
  void update(int pos, const T& val) {
    update(1, pos, 0, base.size(), val);
  }
};

const int INF = 1000 * 1000 * 1000;

struct SegSum : public SegTree<int> {
  SegSum(const std::vector<int>& v) : SegTree(v, 0, [](auto a, auto b) { return a + b; }) {}
};

struct SegMin : public SegTree<int> {
  SegMin(const std::vector<int>& v) : SegTree(v, 0, [](auto a, auto b) { return std::min(a, b); }) {}
};

struct SegMax : public SegTree<int> {
  SegMax(const std::vector<int>& v) : SegTree(v, 0, [](auto a, auto b) { return std::max(a, b); }) {}
};
