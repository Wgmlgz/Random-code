#define DBG 

#pragma region
// bruh template for cp by Wgmlgz ver 0.2
#include<bits/stdc++.h>
using namespace std;
#ifdef DBG
#define DBGV 1
ifstream fin("din.txt");
#define in fin
#else
#define DBGV 0
#define in cin
#endif
#define out cout
#define gc getchar_unlocked
#define fo(i,n) for(int i=0;i<n;i++)
#define Fo(i,k,n) for(int i=k;k<n?i<n:i>n;k<n?++i:--i)
#define ll long long
#define nl out<<endl;
#define outn(x) out<<x;nl;
#define outs(x) out<<x<<" ";
#define debs(x) if(DBGV){out<<x;nl;}
#define deb(x) if(DBGV){out<<#x<<"="<<x;nl;}
#define debv(x) if(DBGV){out<<#x<<" = [";fo(i,x.size()){out<<x[i];if(x.size()!=i+1){out<<",";}}outn("]")}
#define deb2(x,y) if(DBGV){out<<#x<<" = "<<x<<", "<<#y<<" = "<<y;nl;}
#define fl(x) for(auto&i:x)
#define flc(x) for(auto i:x)
#define outv(x) fl(x)outs(i);nl;
#define bg begin()
#define ed end()
#define ALL(x) x.bg, x.ed
#define clr(x) memset(x, 0, sizeof(x))
#define FIND(x,y) (x.find(y)!=x.ed)
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
#define inv(x, size) vec<int> x(size);fl(x){in>>i;}
#define yn(x) if((x)){outn("YES");}else{outn("NO");}
typedef pair<int, int> pii;
typedef vec<int> vi;
typedef vec<pii> vpii;
typedef vec<vi> vvi;
const int MOD = 1'000'000'007;
#pragma endregion 

int n, m, k;

void solve(int TT) {

}

#pragma region 
// int main() { solve(); }
int main() {
    ios_base::sync_with_stdio(0), in.tie(0), cout.tie(0);
    int t = 1;
    in >> t;
    while (t--) {
        debs("------------");
        solve(t);
    }
    return 0;
}
#pragma endregion
