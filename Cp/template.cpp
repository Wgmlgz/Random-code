#define DBG 1
#define MANY_TESTS 0

#pragma region
// bruh template for cp by Wgmlgz ver 0.6
#include <bits/stdc++.h>
using namespace std;
#ifdef ONLINE_JUDGE
#define DBG 0
#endif
#define RESET   "\033[0m"
#define BLACK   "\033[30m"    
#define RED     "\033[31m"  
#define GREEN   "\033[32m"    
#define YELLOW  "\033[33m" 
#define BLUE    "\033[34m"   
#define MAGENTA "\033[35m"   
#define CYAN    "\033[36m"   
#define WHITE   "\033[37m"    
#if DBG
ifstream fin("deb_in.txt");
#define in fin
#else
#define in cin
#endif
const int MOD = 1'000'000'007;const int INF = 2'000'000'000;
#define out cout
#define ll int64_t
#define int int64_t
#define vec vector
#define str string
typedef pair<ll, ll> pii;
typedef vec<ll> vi;
typedef vec<pii> vpii;
typedef vec<vi> vvi;
typedef set<ll> si;
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
#define fl_1(x) for(auto&i:x)
#define fl_2(i,x) for(auto&i:x)
#define fl(...) GET_MACRO2(__VA_ARGS__,fl_2,fl_1)(__VA_ARGS__)

#define flc_1(x) for(auto i:x)
#define flc_2(i,x) for(auto i:x)
#define flc(...) GET_MACRO2(__VA_ARGS__,flc_2,flc_1)(__VA_ARGS__)

#define fo_1(n) for(ll PP_CAT(n,i)=0;PP_CAT(n,i)<n;PP_CAT(n,i)++)
#define fo_2(i,n) for(ll i=0;i<n;i++)
#define fo_3(i,k,n) for(ll i=k;k<n?i<n:i>n;k<n?++i:--i)
#define fo_4(i,a,b,c) for(ll i=a;a<b?i<b:i>b;i+=c)
#define fo(...) GET_MACRO4(__VA_ARGS__,fo_4,fo_3,fo_2,fo_1)(__VA_ARGS__)
#define O out<<
#define nl O endl
#define os(x) {O x<<" ";}
#define yes on("YES")
#define no on("NO")
#define yn(x) ((x)?"YES":"NO")
#define oyn(x) on(yn(x)) 
template <typename T> void on(T t) { cout << t << endl; }
template<typename T, typename... Args>void on(T t, Args... args) { O t << " ";on(args...);nl; }
#define ALL(x) (x).bg,(x).ed
#define CLR(x) memset(x,0,sizeof(x))
#define FIND(x,y) find(ALL(x),y)
#define IN(x,y) (FIND(x,(y))!=x.ed)
#define SORT(x) sort(ALL(x))
#define REV(x) reverse(ALL(x))
#define SUM(x) accumulate(ALL(x), 0)
#define I in>>
#define iv(...) GET_MACRO2(__VA_ARGS__,iv_2,iv_1)(__VA_ARGS__)
#define iv_1(v) ll v##n;I v##n;vec<ll>v(v##n);fl(i,v){I i;}
#define iv_2(v,n) vec<ll>v(n);fl(i,v){I i;}
#define ints_1(a) ll a; I a;
#define ints_2(a,b) ll a,b; I a>>b;
#define ints_3(a,b,c) ll a,b,c;I a>>b>>c;
#define ints_4(a,b,c,d) ll a,b,c,d; I a>>b>>c>>d;
#define ints_5(a,b,c,d,e) ll a,b,c,d,e; I a>>b>>c>>d>>e;
#define ints_6(a,b,c,d,e,f) ll a,b,c,d,e,f; I a>>b>>c>>d>>e>>f;
#define ints(...) GET_MACRO6(__VA_ARGS__,ints_6,ints_5,ints_4,ints_3,ints_2,ints_1)(__VA_ARGS__)
int fact(int n) { if (n >= MOD)ret 0;int result = 1;for (int i = 1; i <= n; i++)result = (result * i) % MOD;ret result; }ll gcd(ll a, ll b) { ret b ? gcd(b, a % b) : a; }ll lcm(ll a, ll b) { ret(a * b / gcd(a, b)); }
#define bits_1(a) bitset<32>(a).to_string()
#define bits_2(a,b) bitset<b>(a).to_string()
#define bits(...) GET_MACRO2(__VA_ARGS__,bits_2,bits_1)(__VA_ARGS__)
size_t off = 0;bool debo = false;
template<typename Char, typename Traits, typename Allocator> basic_string<Char, Traits, Allocator> operator *(const basic_string<Char, Traits, Allocator> s, size_t n) { basic_string<Char, Traits, Allocator> tmp = "";  for (size_t i = 0; i < n; ++i) { tmp += s; }  ret tmp; }
template<typename Char, typename Traits, typename Allocator> basic_string<Char, Traits, Allocator> operator *(size_t n, const basic_string<Char, Traits, Allocator>& s) { ret s * n; }
template<typename T>  ostream& outContainer(ostream& ot, T& v, bool isf) { if (debo)(ot << "[");if (!isf) { off += 2; nl; };int t = v.size();fl(i, v) { if (!isf && debo) ot << str(off, ' ');ot << i;if (--t) { ot << " ";if (!isf) nl; } }if (!isf) { off -= 2; };if (!isf) nl;if (!isf && debo) ot << str(off, ' ');if (debo) { ot << "]"; }ret ot; }
#define STLCOUT(nm) template<typename T>  ostream& operator<< (ostream& ot, const nm<T>& v) { ret outContainer(ot, v, is_fundamental<T>::value); }
#define STLCOUTP(nm) template <typename T,typename T2> ostream& operator<< (ostream& ot, const nm<T, T2>& v) { ret outContainer(ot, v, false); }
STLCOUTP(map);STLCOUTP(multimap);STLCOUTP(unordered_map);STLCOUTP(unordered_multimap);STLCOUT(list);STLCOUT(set);STLCOUT(deque);STLCOUT(multiset);STLCOUT(unordered_set);STLCOUT(unordered_multiset);STLCOUT(vector);
template<typename T>  ostream& operator<< (ostream& ot, const queue<T>& q) { vector<int> v; queue<T> qc = q; while (!qc.empty()) { v.push_back(qc.front()); qc.pop(); }ret operator<<(ot, v); }
template<typename T>  ostream& operator<< (ostream& ot, const stack<T>& st) { vector<int> v; stack<T> stc = st; while (!stc.empty()) { v.push_back(stc.top()); stc.pop(); } REV(v); ret operator<<(ot, v); }
template <typename T1,typename T2> ostream& operator<< (ostream& ot, const pair<T1, T2>& p) { ot << (debo ? "(" : "") << p.first << " " << p.second << (debo ? ")" : "");ret ot; }
struct DebugDude { bool b = false; }; DebugDude DDT;struct OutDude {}; OutDude ODT;template<typename T>DebugDude& operator<< (DebugDude& d, T x) { if (!DBG) ret d;O  GREEN << x << RESET << "\n";debo=0;d.b = true;ret d; }
template<typename T>OutDude& operator<< (OutDude& d, T x) { O x << "\n";ret d; }
#define db debo=1;DDT.b=0;DDT<< 
#define o ODT<< 
#define deb_1(a) {if(DBG){debo=1;O GREEN<<#a<<"="<<(a)<<RESET;nl;}}
#define deb_2(a,b) {if(DBG){debo=1;O GREEN<<#a<<"="<<(a)<<"  "<<#b<<"="<<(b)<<RESET;nl;}}
#define deb_3(a,b,c) {if(DBG){debo=1;O GREEN<<#a<<"="<<(a)<<"  "<<#b<<"="<<(b)<<"  "<<#c<<"="<<(c)<<RESET;nl;}}
#define deb_4(a,b,c,d) {if(DBG){debo=1;O GREEN<<#a<<"="<<a<<"  "<<#b<<"="<<b<<"  "<<#c<<"="<<c<<"  "<<#d<<"="<<d<<RESET;nl;}}
#define deb_5(a,b,c,d,e) {if(DBG){debo=1;O GREEN<<#a<<"="<<a<<"  "<<#b<<"="<<b<<"  "<<#c<<"="<<c<<"  "<<#d<<"="<<d<<"  "<<#e<<"="<<e<<RESET;nl;}}
#define deb_6(a,b,c,d,e,f) {if(DBG){debo=1;O GREEN<<#a<<"="<<a<<"  "<<#b<<"="<<b<<"  "<<#c<<"="<<c<<"  "<<#d<<"="<<d<<"  "<<#e<<"="<<e<<"  "<<#f<<"="<<f<<RESET;nl;}}
#define deb(...) GET_MACRO6(__VA_ARGS__,deb_6,deb_5,deb_4,deb_3,deb_2,deb_1)(__VA_ARGS__)
#define ct continue
#define elif else if
#define ins .insert
#define DUDE(name) template<typename T> 
template<typename T>  T&operator>(vector<T>v,size_t i){ret v[i];}
template<typename T>  T&operator>(basic_string<T>v,size_t i){ret v[i];}
template<typename T> void operator^(set<T>v,T i){v.insert(i);}
template<typename T1,typename T2>T2&operator|(map<T1,T2>v,T1 i){ret v[i];}
template<typename T1,typename T2>T2&operator|(hmap<T1,T2>v,T1 i){ret v[i];}
#define ev &1==0
#define od &1
#define di -'0'
#define let -'a'
#define LET -'A'
#define fn(name, rt, p1) template<typename T> rt name(T p1) { 
#define pr(name, p1) template<typename T> void name(T p1) { 

void preSolve();void solve(int);
void postSolve() {
#ifdef DBG
cerr <<CYAN<< "finished in " << clock() * 1.0 / CLOCKS_PER_SEC << " sec" << endl;
#endif
}
#if MANY_TESTS

signed main() { ios_base::sync_with_stdio(0), in.tie(0), out.tie(0);db "test";preSolve();int t = 1;in >> t;fo(i, t) { if (DBG) { out << YELLOW << " __ " << (i + 1) << " __\n" << RESET; }solve(t); } postSolve();}
#else
signed main() { ios_base::sync_with_stdio(0), in.tie(0), out.tie(0);preSolve();solve(0); postSolve();}
#endif
#pragma endregion
void preSolve() {}


void solve(int TT) {
  
}
