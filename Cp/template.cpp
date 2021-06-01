#define DBG 1
#define MANY_TESTS 0

#pragma region
// bruh template for cp by Wgmlgz ver 0.5
#include <bits/stdc++.h>
using namespace std;
// colors
#define RESET   "\033[0m"
#define BLACK   "\033[30m"    
#define RED     "\033[31m"  
#define GREEN   "\033[32m"    
#define YELLOW  "\033[33m" 
#define BLUE    "\033[34m"   
#define MAGENTA "\033[35m"   
#define CYAN    "\033[36m"   
#define WHITE   "\033[37m"    
// dbg switch
#if DBG
ifstream fin("deb_in.txt");
#define in fin
#else
#define in cin
#endif
#define out cout
// types
#define ll int64_t
#define vec vector
#define str string
typedef pair<ll, ll> pii;typedef vec<ll> vi;typedef vec<pii> vpii;typedef vec<vi> vvi;
#define hmap unordered_map
#define hset unordered_set
// macro overload
#define GET_MACRO6(_1,_2,_3,_4,_5,_6,NAME,...) NAME
#define GET_MACRO4(_1,_2,_3,_4,NAME,...) NAME
#define GET_MACRO3(_1,_2,_3,NAME,...) NAME
#define GET_MACRO2(_1,_2,NAME,...) NAME
// shorts
#define sz size()
#define bg begin()
#define ed end()
#define back back()
#define ph push_back
#define elif else if
#define F first
#define S second
#define ret return
// loops
#define fl(i,x) for(auto& i:x)
#define flc(i,x) for(auto i:x)
#define fo_1(n) for(ll PP_CAT(n,i)=0;PP_CAT(n,i)<n;PP_CAT(n,i)++)
#define fo_2(i,n) for(ll i=0;i<n;i++)
#define fo_3(i,k,n) for(ll i=k;k<n?i<n:i>n;k<n?++i:--i)
#define fo_4(i,a,b,c) for(ll i=k;a<b?i<b:i>b;i+=c)
#define fo(...) GET_MACRO4(__VA_ARGS__,fo_4,fo_3,fo_2,fo_1)(__VA_ARGS__)

// out
#define O out<<
#define nl O endl

template <typename T> void on(T t) { std::cout << t << std::endl; }
template<typename T, typename... Args>void on(T t, Args... args) { O t << " ";on(args...);nl; }

#define os(x) {O x<<" ";}
#define yes on("YES")
#define no on("NO")
#define yn(x) ((x)?"YES":"NO")
#define oyn(x) on(yn(x)) 

#define ALL(x) x.bg,x.ed
#define CLR(x) memset(x,0,sizeof(x))
#define FIND(x,y) find(ALL(x),y)
#define IN(x,y) (FIND(x,(y))!=x.ed)
#define SORT(x) sort(ALL(x))
#define REV(x) reverse(ALL(x))
#define SUM(x) accumulate(ALL(x), 0)

#define I in>>
#define iv(...)   GET_MACRO2(__VA_ARGS__,iv_2,iv_1)(__VA_ARGS__)
#define iv_1(v)   ll PP_CAT(v,n);I PP_CAT(v,n);vec<ll>v(PP_CAT(v,n));fl(i,v){I i;}
#define iv_2(v,n) vec<ll>v(n);fl(i,v){I i;}

#define ints_1(a) ll a; I a;
#define ints_2(a,b) ll a,b; I a>>b;
#define ints_3(a,b,c) ll a,b,c;I a>>b>>c;
#define ints_4(a,b,c,d) ll a,b,c,d; I a>>b>>c>>d;
#define ints_5(a,b,c,d,e) ll a,b,c,d,e; I a>>b>>c>>d>>e;
#define ints_6(a,b,c,d,e,f) ll a,b,c,d,e,f; I a>>b>>c>>d>>e>>f;
#define ints(...) GET_MACRO6(__VA_ARGS__,ints_6,ints_5,ints_4,ints_3,ints_2,ints_1)(__VA_ARGS__)

ll gcd(ll a, ll b) { ret b ? gcd(b, a % b) : a; }ll lcm(ll a, ll b) { ret(a * b / gcd(a, b)); }
size_t off = 0;bool debo = false;template<typename Char, typename Traits, typename Allocator> basic_string<Char, Traits, Allocator> operator *(const basic_string<Char, Traits, Allocator> s, size_t n) { basic_string<Char, Traits, Allocator> tmp = "";  for (size_t i = 0; i < n; ++i) { tmp += s; }  return tmp; }template<typename Char, typename Traits, typename Allocator> basic_string<Char, Traits, Allocator> operator *(size_t n, const basic_string<Char, Traits, Allocator>& s) { return s * n; }template<typename T> std::ostream& outContainer(std::ostream& ot, T& v, bool isf) { if (debo)(ot << "[");if (!isf) { off += 2; nl; };int t = v.size();fl(i, v) { if (!isf && debo) ot << str(off, ' ');ot << i;if (--t) { ot << " ";if (!isf) nl; } }if (!isf) { off -= 2; };if (!isf) nl;if (!isf && debo) ot << str(off, ' ');if (debo) { ot << "]"; }return ot; }template <typename T> std::ostream& operator<< (std::ostream& ot, const std::vector<T>& v) { return outContainer(ot, v, is_fundamental<T>::value); }template <typename T> std::ostream& operator<< (std::ostream& ot, const std::list<T>& v) { return outContainer(ot, v, is_fundamental<T>::value); }template <typename T> std::ostream& operator<< (std::ostream& ot, const std::deque<T>& v) { return outContainer(ot, v, is_fundamental<T>::value); }template <typename T> std::ostream& operator<< (std::ostream& ot, const std::queue<T>& q) { std::vector<int> v; std::queue<T> qc = q; while (!qc.empty()) { v.push_back(qc.front()); qc.pop(); }return operator<<(ot, v); }template <typename T> std::ostream& operator<< (std::ostream& ot, const std::stack<T>& st) { std::vector<int> v; std::stack<T> stc = st; while (!stc.empty()) { v.push_back(stc.top()); stc.pop(); } REV(v); return operator<<(ot, v); }template <typename T> std::ostream& operator<< (std::ostream& ot, const std::set<T>& v) { return outContainer(ot, v, is_fundamental<T>::value); }template <typename T> std::ostream& operator<< (std::ostream& ot, const std::multiset<T>& v) { return outContainer(ot, v, is_fundamental<T>::value); }template <typename T> std::ostream& operator<< (std::ostream& ot, const std::unordered_set<T>& v) { return outContainer(ot, v, is_fundamental<T>::value); }template <typename T> std::ostream& operator<< (std::ostream& ot, const std::unordered_multiset<T>& v) { return outContainer(ot, v, is_fundamental<T>::value); }template <typename T, typename T2> std::ostream& operator<< (std::ostream& ot, const std::map<T, T2>& v) { return outContainer(ot, v, false); }template <typename T, typename T2> std::ostream& operator<< (std::ostream& ot, const std::multimap<T, T2>& v) { return outContainer(ot, v, false); }template <typename T, typename T2> std::ostream& operator<< (std::ostream& ot, const std::unordered_map<T, T2>& v) { return outContainer(ot, v, false); }template <typename T, typename T2> std::ostream& operator<< (std::ostream& ot, const std::unordered_multimap<T, T2>& v) { return outContainer(ot, v, false); }template <typename T1, typename T2> std::ostream& operator<< (std::ostream& ot, const std::pair<T1, T2>& p) { ot << (debo ? "(" : "") << p.first << " " << p.second << (debo ? ")" : "");return ot; }

struct DebugDude { bool b = false; }; DebugDude DDT;struct OutDude {}; OutDude ODT;template<typename T>DebugDude& operator<< (DebugDude& d, T x) { if (!DBG) ret d;O  GREEN << x << RESET << "\n";d.b = true;ret d; }template<typename T>OutDude& operator<< (OutDude& d, T x) { O x << "\n";ret d; }
#define db DDT.b=0;DDT<< 
#define o ODT<< 
#define deb_1(a) {if(DBG){O GREEN<<#a<<"="<<a<<RESET;nl;}}
#define deb_2(a,b) {if(DBG){O GREEN<<#a<<"="<<a<<"  "<<#b<<"="<<b<<RESET;nl;}}
#define deb_3(a,b,c) {if(DBG){O GREEN<<#a<<"="<<a<<"  "<<#b<<"="<<b<<"  "<<#c<<"="<<c<<RESET;nl;}}
#define deb_4(a,b,c,d) {if(DBG){O GREEN<<#a<<"="<<a<<"  "<<#b<<"="<<b<<"  "<<#c<<"="<<c<<"  "<<#d<<"="<<d<<RESET;nl;}}
#define deb_5(a,b,c,d,e) {if(DBG){O GREEN<<#a<<"="<<a<<"  "<<#b<<"="<<b<<"  "<<#c<<"="<<c<<"  "<<#d<<"="<<d<<"  "<<#e<<"="<<e<<RESET;nl;}}
#define deb_6(a,b,c,d,e,f) {if(DBG){O GREEN<<#a<<"="<<a<<"  "<<#b<<"="<<b<<"  "<<#c<<"="<<c<<"  "<<#d<<"="<<d<<"  "<<#e<<"="<<e<<"  "<<#f<<"="<<f<<RESET;nl;}}
#define deb(...) GET_MACRO6(__VA_ARGS__,deb_6,deb_5,deb_4,deb_3,deb_2,deb_1)(__VA_ARGS__)
// constants 
const int MOD = 1'000'000'007;
const int INF = 2'000'000'000;
#pragma endregion

void preSolve() {}

void solve(int TT) {

}

#pragma region
#if MANY_TESTS
int main() {
  ios_base::sync_with_stdio(0), in.tie(0), cout.tie(0);
  preSolve();
  int t = 1;
  in >> t;
  vec<str> faces = { "0_o", ">_<", ":)", ":(", "^-^" };
  fo(i, t) {
    //if (DBG) { out << "\033[33m" << "Case: " << i << "  " << faces[i % faces.size()] << "\n" << RESET; }
    if (DBG) { out << YELLOW << " __ " << (i + 1) << " __\n" << RESET; }
    solve(t);
  }
  return 0;
}
#else
int main() {
  preSolve();
  ios_base::sync_with_stdio(0), in.tie(0), cout.tie(0);
  solve(0);
}
#endif
#pragma endregion
