#define DBG 

#pragma region
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
#define Fo(i,k,n) for(int i=k;k<n?i<n:i>n;k<n?i+=1:i-=1)
#define ll long long
#define nl out<<endl;
#define deb(x) if(DBGV){out<<#x<<"="<<x;nl;}
#define deb2(x, y) if(DBGV){out<<#x<<"="<<x<<","<<#y<<"="<<y;nl;}
#define outn(x) out<<x;nl;
#define outs(x) out<<x<<" ";
#define fl(x) for(auto&i:x)
#define flc(x) for(autoi:x)
#define outv(x) fl(x)outs(i);nl;
#define all(x) x.begin(), x.end()
#define clr(x) memset(x, 0, sizeof(x))
#define SORT(x) sort(all(x))
#define vec vector
#define F first()
#define S second()
#define ret return
#define yn(x) if((x)){outn("YES");}else{outn("NO");}
typedef pair<int, int>	pii;
typedef vec<int>		vi;
typedef vec<pii>		vpii;
typedef vec<vi>		vvi;
const int MOD = 1'000'000'007;
#pragma endregion 

int n, m, k;

void solve() {
    deb(666)
}

#pragma region 
// int main() { solve(); }
int main() {
    ios_base::sync_with_stdio(0), in.tie(0), cout.tie(0);
    int t = 1;
    in >> t;
    while (t--) solve();
    return 0;
}
#pragma endregion