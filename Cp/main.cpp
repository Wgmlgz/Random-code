#define DBG  
#define MANY_TESTS 0

#pragma region
// bruh template for cp by Wgmlgz ver 0.3
#include <bits/stdc++.h>
using namespace std;
#define RESET   "\033[0m"
#define BLACK   "\033[30m"      /* Black */
#define RED     "\033[31m"      /* Red */
#define GREEN   "\033[32m"      /* Green */
#define YELLOW  "\033[33m"      /* Yellow */
#define BLUE    "\033[34m"      /* Blue */
#define MAGENTA "\033[35m"      /* Magenta */
#define CYAN    "\033[36m"      /* Cyan */
#define WHITE   "\033[37m"      /* White */
#define BOLDBLACK   "\033[1m\033[30m"      /* Bold Black */
#define BOLDRED     "\033[1m\033[31m"      /* Bold Red */
#define BOLDGREEN   "\033[1m\033[32m"      /* Bold Green */
#define BOLDYELLOW  "\033[1m\033[33m"      /* Bold Yellow */
#define BOLDBLUE    "\033[1m\033[34m"      /* Bold Blue */
#define BOLDMAGENTA "\033[1m\033[35m"      /* Bold Magenta */
#define BOLDCYAN    "\033[1m\033[36m"      /* Bold Cyan */
#define BOLDWHITE   "\033[1m\033[37m"      /* Bold White */

#ifdef DBG
#define DBGV 1
ifstream fin("deb_in.txt");
#define in fin
#else
#define DBGV 0
#define in cin
#endif
#define out cout
#define ll int64_t
#define fo(i,n) for(int i=0;i<n;i++)
#define Fo(i,k,n) for(int i=k;k<n?i<n:i>n;k<n?++i:--i)
#define nl out<<endl
#define outn(x) {out<<x;nl;}
#define outs(x) {out<<x<<" ";}
#define dbs(x) {if(DBGV){out<<GREEN<<"> "<<x<<RESET<<" ";}}
#define dbn(x) {if(DBGV){out<<GREEN<<"> "<<x<<RESET;nl;}}
#define debs(x) {if(DBGV){out<<x;nl;}}
#define deb(x) {if(DBGV){out<<#x<<"="<<x;nl;}}
#define debv(x) {if(DBGV){out<<#x<<" = [";fo(i,x.size()){out<<x[i]<<(x.size()!=i+1?",":"");}outn("]")}}
#define deb2(x,y) {if(DBGV){out<<#x<<" = "<<x<<", "<<#y<<" = "<< y;nl;}}
#define fl(i,x) for(auto& i:x)
#define flc(i,x) for(auto i:x)
#define outv(x) {fl(i,x)outs(i);nl;}
#define bg begin()
#define ed end()
#define ALL(x) x.bg,x.ed
#define clr(x) memset(x,0,sizeof(x))
#define FIND(x, y) (x.find(y)!=x.ed)
#define SORT(x) sort(ALL(x))
#define REV(x) reverse(ALL(x));
#define SZ size()
#define ph push_back
#define vec vector
#define str string
#define elif else if
#define F first
#define S second
#define ret return
#define inv(x, size) vec<int>x(size);fl(i,x){in>>i;}
#define yn(x) (x?"YES":"NO")
#define outyn(x) outn(yn(x)) 
typedef pair<int, int> pii;
typedef vec<int> vi;
typedef vec<pii> vpii;
typedef vec<vi> vvi;
const int MOD = 1'000'000'007;
#pragma endregion

ll n, m, k;

void solve(int TT) {
  in >> n;
  
}

#pragma region
#ifdef MANY_TESTS
int main() {
  ios_base::sync_with_stdio(0), in.tie(0), cout.tie(0);
  int t = 1;
  in >> t;
  while (t--) {
    dbs("")
    solve(t);
  }
  return 0;
}
#else
int main() {
  ios_base::sync_with_stdio(0), in.tie(0), cout.tie(0);
  solve(0);
}
#endif
#pragma endregion
