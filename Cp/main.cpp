#define DBG 1
#define MANY_TESTS 1

#pragma region
// bruh template for cp by Wgmlgz ver 0.4
#include <bits/stdc++.h>
using namespace std;
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
#define out cout
// types
#define ll int64_t
#define vec vector
#define str string
typedef pair<ll, ll> pii;
typedef vec<ll> vi;
typedef vec<pii> vpii;
typedef vec<vi> vvi;
// shorts
#define sz size()
#define bg begin()
#define ed end()
#define ph push_back
#define elif else if
#define F first
#define S second
#define ret return
// loops
#define fo(i,n) for(ll i=0;i<n;i++)
#define Fo(i,k,n) for(ll i=k;k<n?i<n:i>n;k<n?++i:--i)
#define fl(i,x) for(auto& i:x)
#define flc(i,x) for(auto i:x)
// out
#define nl out<<endl
#define outn(x) {out<<x;nl;}
#define outs(x) {out<<x<<" ";}
#define outv(x) {fl(i,x)outs(i);nl;}
#define oy outn("YES")
#define on outn("NO")
#define yn(x) ((x)?"YES":"NO")
#define outyn(x) outn(yn(x)) 
// debug
#define dbs(x) {if(DBG){out<<MAGENTA<<"> "<<RESET<<x<<" ";}}
#define dbn(x) {if(DBG){out<<MAGENTA<<"> "<<RESET<<x;nl;}}
#define debs(x) {if(DBG){out<<x;nl;}}
#define deb(x) {if(DBG){out<<#x<<"="<<x;nl;}}
#define debv(x) {if(DBG){out<<#x<<" = ";fl(qwe,x)outs(qwe);nl;}}
#define deb2(x,y) {if(DBG){out<<#x<<" = "<<x<<", "<<#y<<" = "<< y;nl;}}
// define functions
#define ALL(x) x.bg,x.ed
#define CLR(x) memset(x,0,sizeof(x))
#define FIND(x,y) find(ALL(x),y)
#define IN(x,y) (FIND(x,(y))!=x.ed)
#define SORT(x) sort(ALL(x))
#define REV(x) reverse(ALL(x))
#define SUM(x) accumulate(ALL(x), 0)
//input
#define inv(x, size) vec<ll>x(size);fl(i,x){in>>i;}
#define inN(n) ll n;in>>n;
#define inN_ inN(n);
#define inNV(n, v) inN(n);inv(v,n);
#define inNV_ ll n;in >> n;inv(v,n);

// funcions
ll gcd(ll a, ll b) { ret b ? gcd(b, a % b) : a; }
ll lcm(ll a, ll b) { ret(a * b / gcd(a, b)); }
template<typename Char, typename Traits, typename Allocator> basic_string<Char, Traits, Allocator> operator *(const basic_string<Char, Traits, Allocator> s, size_t n) { basic_string<Char, Traits, Allocator> tmp = "";  for (size_t i = 0; i < n; ++i) { tmp += s; }  return tmp; }
template<typename Char, typename Traits, typename Allocator> basic_string<Char, Traits, Allocator> operator *(size_t n, const basic_string<Char, Traits, Allocator>& s) { return s * n; }

// constants 
const int MOD = 1'000'000'007;
const int INF = 2'000'000'000;
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
  while (t--) {
    if (DBG) { out << GREEN << ">_<\n" << RESET; }
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
