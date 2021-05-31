#define DBG 1
#define MANY_TESTS 1

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
typedef pair<ll, ll> pii;
typedef vec<ll> vi;
typedef vec<pii> vpii;
typedef vec<vi> vvi;
#define hmap unordered_map
#define hset unordered_set
// macro overload
#define PP_CAT( A, B ) A ## B
#define UNIQUE_NAME(base) PP_CAT(base, __COUNTER__)
#define PP_EXPAND(...) __VA_ARGS__
#define PP_VA_ARG_SIZE(...) PP_EXPAND(PP_APPLY_ARG_N((PP_ZERO_ARGS_DETECT(__VA_ARGS__), PP_RSEQ_N)))
#define PP_ZERO_ARGS_DETECT(...) PP_EXPAND(PP_ZERO_ARGS_DETECT_PREFIX_ ## __VA_ARGS__ ## _ZERO_ARGS_DETECT_SUFFIX)
#define PP_ZERO_ARGS_DETECT_PREFIX__ZERO_ARGS_DETECT_SUFFIX ,,,,,,,,,,,0
#define PP_APPLY_ARG_N(ARGS) PP_EXPAND(PP_ARG_N ARGS)
#define PP_ARG_N(_0, _1, _2, _3, _4, _5, _6, _7, _8, _9, _10, N,...) N
#define PP_RSEQ_N 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0
#define PP_OVERLOAD_SELECT(NAME, NUM) PP_CAT( NAME ## _, NUM)
#define PP_MACRO_OVERLOAD(NAME, ...) PP_OVERLOAD_SELECT(NAME, PP_VA_ARG_SIZE(__VA_ARGS__))(__VA_ARGS__)
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
#define fo(...) PP_MACRO_OVERLOAD(fo, __VA_ARGS__)
#define fo_0() for(ll i=0;i<n;i++)
#define fo_1(n) for(ll PP_CAT(n,i)=0;PP_CAT(n,i)<n;PP_CAT(n,i)++)
#define fo_2(i,n) for(ll i=0;i<n;i++)
#define fo_3(i,k,n) for(ll i=k;k<n?i<n:i>n;k<n?++i:--i)
#define fo_4(i,a,b,c) for(ll i=k;a<b?i<b:i>b;i+=c)
// out
#define O out<<
#define nl O endl
#define on(x) {O x;nl;}
#define os(x) {O x<<" ";}
#define yes on("YES")
#define no on("NO")
#define yn(x) ((x)?"YES":"NO")
#define oyn(x) on(yn(x)) 
// debug
// #define dbs(x) {if(DBG){out<<MAGENTA<<"> "<<RESET<<x<<" ";}}
// #define dbn(x) {if(DBG){out<<MAGENTA<<"> "<<RESET<<x;nl;}}
// #define debs(x) {if(DBG){out<<x;nl;}}
// #define deb(x) {if(DBG){out<<#x<<"="<<x;nl;}}
// #define debv(x) {if(DBG){out<<#x<<" = ";fl(qwe,x)outs(qwe);nl;}}
// #define deb2(x,y) {if(DBG){out<<#x<<" = "<<x<<", "<<#y<<" = "<< y;nl;}}

//#define deb(x) {if(DBG){out<<#x<<"=";debF(x);nl;}}

#define deb(...) PP_MACRO_OVERLOAD(deb, __VA_ARGS__)
#define deb_0() {if(DBG){O"----";nl;}}
#define deb_1(a) {if(DBG){O#a<<"="<<a;nl;}}
#define deb_2(a,b) {if(DBG){O#a<<"="<<a<<" "<<#b<<"="<<b;nl;}}
#define deb_3(a,b,c) {if(DBG){O#a<<"="<<a<<" "<<#b<<"="<<b<<" "<<#c<<"="<<c;nl;}}
#define deb_4(a,b,c,d) {if(DBG){O#a<<"="<<a<<" "<<#b<<"="<<b<<" "<<#c<<"="<<c<<" "<<#d<<"="<<d;nl;}}
#define deb_5(a,b,c,d,e) {if(DBG){O#a<<"="<<a<<" "<<#b<<"="<<b<<" "<<#c<<"="<<c<<" "<<#d<<"="<<d<<" "<<#e<<"="<<e;nl;}}
#define deb_6(a,b,c,d,e,f) {if(DBG){O#a<<"="<<a<<" "<<#b<<"="<<b<<" "<<#c<<"="<<c<<" "<<#d<<"="<<d<<" "<<#e<<"="<<e<<" "<<#f<<"="<<f;nl;}}
// define functions
#define ALL(x) x.bg,x.ed
#define CLR(x) memset(x,0,sizeof(x))
#define FIND(x,y) find(ALL(x),y)
#define IN(x,y) (FIND(x,(y))!=x.ed)
#define SORT(x) sort(ALL(x))
#define REV(x) reverse(ALL(x))
#define SUM(x) accumulate(ALL(x), 0)
//input
#define I in>>
#define iv(...)       PP_MACRO_OVERLOAD(iv, __VA_ARGS__)
#define iv_0()        ll n;I n;vec<ll>v(n);fl(i,v){I i;}
#define iv_1(v)       ll PP_CAT(v,n);I PP_CAT(v,n);vec<ll>v(PP_CAT(v,n));fl(i,v){I i;}
#define iv_2(v,n) vec<ll>x(n);fl(i,v){I i;}

#define ints(...) PP_MACRO_OVERLOAD(ints, __VA_ARGS__)
#define ints_0() ll n; I n;
#define ints_1(a) ll a; I a;
#define ints_2(a,b) ll a,b; I a>>b;
#define ints_3(a,b,c) ll a,b,c;I a>>b>>c;
#define ints_4(a,b,c,d) ll a,b,c,d; I a>>b>>c>>d;
#define ints_5(a,b,c,d,e) ll a,b,c,d,e; I a>>b>>c>>d>>e;
#define ints_6(a,b,c,d,e,f) ll a,b,c,d,e,f; I a>>b>>c>>d>>e>>f;

#define inN(n) ll n;in>>n;
#define inN_ inN(n);
#define inNV(n, v) inN(n);inv(v,n);
#define inNV_ ll n;in >> n;inv(v,n);

// funcions
ll gcd(ll a, ll b) { ret b ? gcd(b, a % b) : a; }
ll lcm(ll a, ll b) { ret(a * b / gcd(a, b)); }
// fixing shit for c++ devs (string multiplications and containers output)
template<typename Char, typename Traits, typename Allocator> basic_string<Char, Traits, Allocator> operator *(const basic_string<Char, Traits, Allocator> s, size_t n) { basic_string<Char, Traits, Allocator> tmp = "";  for (size_t i = 0; i < n; ++i) { tmp += s; }  return tmp; }
template<typename Char, typename Traits, typename Allocator> basic_string<Char, Traits, Allocator> operator *(size_t n, const basic_string<Char, Traits, Allocator>& s) { return s * n; }
size_t off = 0;
bool debo = false;
template<typename T> std::ostream& outContainer(std::ostream& ot, T& v, bool isf) { if (debo)(ot << "[");if (!isf) { off += 2; nl; };int t = v.size();fl(i, v) { if (!isf && debo) ot << str(off, ' ');ot << i;if (--t) { ot << " ";if (!isf) nl; } }if (!isf) { off -= 2; };if (!isf) nl;if (!isf && debo) ot << str(off, ' ');if (debo) { ot << "]"; }return ot; }
template <typename T> std::ostream& operator<< (std::ostream& ot, const std::vector<T>& v) { return outContainer(ot, v, is_fundamental<T>::value); }
template <typename T> std::ostream& operator<< (std::ostream& ot, const std::list<T>& v) { return outContainer(ot, v, is_fundamental<T>::value); }
template <typename T> std::ostream& operator<< (std::ostream& ot, const std::deque<T>& v) { return outContainer(ot, v, is_fundamental<T>::value); }
template <typename T> std::ostream& operator<< (std::ostream& ot, const std::queue<T>& q) { std::vector<int> v; std::queue<T> qc = q; while (!qc.empty()) { v.push_back(qc.front()); qc.pop(); }return operator<<(ot, v); }
template <typename T> std::ostream& operator<< (std::ostream& ot, const std::stack<T>& st) { std::vector<int> v; std::stack<T> stc = st; while (!stc.empty()) { v.push_back(stc.top()); stc.pop(); } REV(v); return operator<<(ot, v); }
template <typename T> std::ostream& operator<< (std::ostream& ot, const std::set<T>& v) { return outContainer(ot, v, is_fundamental<T>::value); }
template <typename T> std::ostream& operator<< (std::ostream& ot, const std::multiset<T>& v) { return outContainer(ot, v, is_fundamental<T>::value); }
template <typename T> std::ostream& operator<< (std::ostream& ot, const std::unordered_set<T>& v) { return outContainer(ot, v, is_fundamental<T>::value); }
template <typename T> std::ostream& operator<< (std::ostream& ot, const std::unordered_multiset<T>& v) { return outContainer(ot, v, is_fundamental<T>::value); }
template <typename T, typename T2> std::ostream& operator<< (std::ostream& ot, const std::map<T, T2>& v) { return outContainer(ot, v, false); }
template <typename T, typename T2> std::ostream& operator<< (std::ostream& ot, const std::multimap<T, T2>& v) { return outContainer(ot, v, false); }
template <typename T, typename T2> std::ostream& operator<< (std::ostream& ot, const std::unordered_map<T, T2>& v) { return outContainer(ot, v, false); }
template <typename T, typename T2> std::ostream& operator<< (std::ostream& ot, const std::unordered_multimap<T, T2>& v) { return outContainer(ot, v, false); }
template <typename T1, typename T2> std::ostream& operator<< (std::ostream& ot, const std::pair<T1, T2>& p) { ot << (debo ? "(" : "") << p.first << " " << p.second << (debo ? ")" : "");return ot; }


// constants 
const int MOD = 1'000'000'007;
const int INF = 2'000'000'000;

// epic debug function 
struct DebugDude { bool b = false; }; DebugDude DDT;
struct OutDude { bool b = false; }; OutDude ODT;
template<typename T>DebugDude& operator<< (DebugDude& d, T x) {
  if (!DBG) ret d;
  O  "" << "\033[1m\033[32m" << x << RESET << "\n";
  d.b = true;
  ret d;
}
template<typename T>OutDude& operator<< (OutDude& d, T x) {
  O x << "\n";
  d.b = true;
  ret d;
}

template<typename T>
void debF(T x) {
  debo = true;
  out << x << endl;
  debo = false;
}

#define db DDT.b=0;DDT<< 
#define o ODT.b=0;ODT<< 
#pragma endregion


void preSolve() {

}

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
    if (DBG) { out << "\033[33m" << (i + 1) << "\n" << RESET; }
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
