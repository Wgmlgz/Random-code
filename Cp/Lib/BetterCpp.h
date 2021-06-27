#pragma once

#define MANY_TESTS 1

#pragma region
const auto IPT = R"( * input goes brrrr * )";
#define DBG 1
#define COLORS 1
// bruh template for cp by Wgmlgz ver 0.10  ->  https://github.com/Wgmlgz/Random-code/blob/main/Cp/template.cpp
#include <bits/stdc++.h>
using namespace std;
const int MOD = 1e+9 + 7;const int INF = 1000 * 1000 * 1000;
#ifdef ONLINE_JUDGE
#undef DBG
#define DBG 0
#endif
#if COLORS
string RESET = "\033[0m";string BLACK = "\033[30m";string RED = "\033[31m";string GREEN = "\033[32m";string YELLOW = "\033[33m";string BLUE = "\033[34m";string MAGENTA = "\033[35m";string CYAN = "\033[36m";string WHITE = "\033[37m";
#else
string RESET;string BLACK;string RED;string GREEN;string YELLOW;string BLUE;string MAGENTA;string CYAN;string WHITE;
#endif
#if DBG
stringstream fin(IPT);
// ifstream fin("deb_in.txt");
#define in fin
#define out cout
#else
#define in cin
#define out cout
#endif
typedef int64_t ll;
#define int int64_t
#define vec vector
typedef string str;typedef pair<ll, ll> pii;typedef vec<ll> vi;typedef vec<pii> vpii;typedef vec<vi> vvi;typedef set<ll> si;
#define hmap unordered_map
#define hset unordered_set
#define GET_MACRO6(_1,_2,_3,_4,_5,_6,NAME,...) NAME
#define GET_MACRO4(_1,_2,_3,_4,NAME,...) NAME
#define GET_MACRO3(_1,_2,_3,NAME,...) NAME
#define GET_MACRO2(_1,_2,NAME,...) NAME
#define sz size()
#define bg begin()
#define ed end()
#define ph push_back
#define F first
#define S second
#define ret return
#define fl(i,x) for(auto&i:x)
#define flc(i,x) for(auto i:x)
#define flp(a,b,x) for(auto&[a,b]:x)
#define flpc(a,b,x) for(auto[a,b]:x)
#define fo_2(i,n) for(int i=0;i<n;i++)
#define fo_3(i,k,n) for(int i=k;k<n?i<n:i>n;k<n?++i:--i)
#define fo_4(i,a,b,c) for(int i=a;a<b?i<b:i>b;i+=c)
#define fo(...) GET_MACRO4(__VA_ARGS__,fo_4,fo_3,fo_2,fo_1)(__VA_ARGS__)
#define O out<<
#define nl O endl
#define os(x) {O (x)<<" ";}
#define yes on("YES")
#define no on("NO")
#define yesr yes; return
#define nor no; return
#define yn(x) on(((x)?"YES":"NO")) 
template <typename T> void on(T t) { out << t << endl; }template<typename T, typename... Args>void on(T t, Args... args) { O t << " ";on(args...); }
#define all(x) (x).bg,(x).ed
#define FIND(x,y) find(ALL(x),(y))
#define IN(x,y) (FIND((x),(y))!=x.end())
template<typename T>void sort(T& c) { sort(c.begin(), c.end()); }
template<typename T>void rev(T& c) { reverse(c.begin(), c.end()); }
template<typename T>void sum(T& c) { accumulate(c.begin(), c.end(), 0); }
#define I in>>
#define it(type, name) type name;I name;
#define iv(v,n) vec<ll>v(n);fl(i,v){I i;}
#define im(v,n,m) vec<vec<int>>v(n, vec<int>(m));fl(i,v){fl(j,i)I j;}
#define ints_1(a) ll a; I a;
#define ints_2(a,b) ll a,b; I a>>b;
#define ints_3(a,b,c) ll a,b,c;I a>>b>>c;
#define ints_4(a,b,c,d) ll a,b,c,d; I a>>b>>c>>d;
#define ints_5(a,b,c,d,e) ll a,b,c,d,e; I a>>b>>c>>d>>e;
#define ints_6(a,b,c,d,e,f) ll a,b,c,d,e,f; I a>>b>>c>>d>>e>>f;
#define ints(...) GET_MACRO6(__VA_ARGS__,ints_6,ints_5,ints_4,ints_3,ints_2,ints_1)(__VA_ARGS__)
ll gcd(ll a, ll b) { ret __gcd(a, b); }ll lcm(ll a, ll b) { ret(a * b / __gcd(a, b)); }
string bits(int c, const size_t s = 10) { return bitset<32>(c).to_string().substr(32 - s, s); }
template<typename Char, typename Traits, typename Allocator> basic_string<Char, Traits, Allocator> operator *(const basic_string<Char, Traits, Allocator> s, size_t n) { basic_string<Char, Traits, Allocator> tmp = "";  for (size_t i = 0; i < n; ++i) { tmp += s; }  ret tmp; }template<typename Char, typename Traits, typename Allocator> basic_string<Char, Traits, Allocator> operator *(size_t n, const basic_string<Char, Traits, Allocator>& s) { ret s* n; }
size_t off = 0;bool debo = 1; bool indexing = 1;template <typename T1, typename T2> ostream& operator<< (ostream& ot, const pair<T1, T2>& p) { ot << (debo ? "{" : "") << p.first << " " << p.second << (debo ? "}" : "");return ot; }
template <typename T, typename T2>ostream& outContainer(ostream& ot, const T& v, bool isf, bool is_index = false, function<void(const T2&)>printer = [](const T2& da) {cout << da;}) { if (debo)(ot << "[");if (!isf) { off += 2;ot << endl; }int t = v.size(), id = 0;for (const auto& i : v) { if (isf) { if (id)ot << " ";printer(i); } else { if (debo)ot << string(off, ' ');if (is_index && indexing & debo)ot << id << ":";printer(i);ot << endl; }++id; }if (!isf)off -= 2;if (!isf && debo)ot << string(off, ' ');if (debo)ot << "]";return ot; }
#define STLCOUT(nm, index) template<typename T>  ostream & operator<< (ostream & ot, const nm<T> & v) {return outContainer<nm<T>, T>(ot, v, (is_fundamental<T>::value or v.size() <= 1), index);}
#define STLCOUTP(nm) template <typename T1, typename T2>ostream& operator<< (ostream& ot, const nm<T1, T2>& v) {return outContainer<nm<T1, T2>, pair<T1, T2>>(ot, v, v.size() <= 1, 0, [](const pair < T1, T2>& da) { cout << da.first << (debo?":":" ") << da.second;});}
STLCOUTP(map);STLCOUTP(multimap);STLCOUTP(unordered_map);STLCOUTP(unordered_multimap);STLCOUT(list, 0);STLCOUT(set, 0);STLCOUT(deque, 1);STLCOUT(multiset, 0);STLCOUT(unordered_set, 0);STLCOUT(unordered_multiset, 0);STLCOUT(vector, 1);
template<typename T> ostream& operator<< (ostream& ot, const queue<T>& q) { vector<T> v; queue<T> qc = q; while (!qc.empty()) { v.push_back(qc.front()); qc.pop(); }return operator<<(ot, v); }
template<typename T> ostream& operator<< (ostream& ot, const stack<T>& st) { vector<T> v; stack<T> stc = st; while (!stc.empty()) { v.push_back(stc.top()); stc.pop(); } reverse(v.begin(), v.end()); return operator<<(ot, v); }
struct DebugDude { bool b = false; }; DebugDude DDT;struct OutDude {}; OutDude ODT;
template<typename T>DebugDude& operator<< (DebugDude& d, T& x) { if (!DBG) ret d;out << GREEN << x << RESET << "\n";debo = 0;d.b = true;ret d; }template<typename T>OutDude& operator<< (OutDude& d, T& x) { O x << "\n";ret d; }
#define o debo=0,ODT<< 
#define db debo=1,DDT.b=0,DDT<< 
#if DBG
#include "debug.h"
#else 
#define deb(...) 666;
#endif
#define ct continue
#define eve %2==0
#define odd %2
#define dig -'0'
#define let -'a'
#define LET -'A'
mt19937 mt(666);
void preSolve();void solve(int);void postSolve() { if (DBG) O CYAN << "finished in " << clock() * 1.0 / CLOCKS_PER_SEC << " sec" << endl; }
signed main() { ios_base::sync_with_stdio(0), in.tie(0), out.tie(0);preSolve();if (MANY_TESTS) { ints(t);fo(i, t) { if (DBG) { out << YELLOW << " -- " << (i + 1) << " --\n" << RESET; }solve(t); } } else solve(0);postSolve(); }
#pragma endregion