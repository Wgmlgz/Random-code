#include <cmath>
#include <cstdio>
#include <vector>
#include <iostream>
#include <string>
#include <algorithm>
#include <map>
#include <stack>
using namespace std;

using ll = long long;
ll n;
const ll MOD = 1000000007;

struct da {
    ll hh = 19;
    ll hs = 7;
    ll sh = 6;
    ll ss = 20;
};
da calc(da a, da b) {
    da t;
    t.hh = ((a.hh * b.hh) % MOD + (a.hs * b.sh) % MOD) % MOD;
    t.hs = ((a.hh * b.hs) % MOD + (a.hs * b.ss) % MOD) % MOD;
    t.sh = ((a.sh * b.hh) % MOD + (a.ss * b.sh) % MOD) % MOD;
    t.ss = ((a.ss * b.ss) % MOD + (a.sh * b.hs) % MOD) % MOD;
    return t;
}
int main() {
    cin >> n;
    vector<da> v(64);
    for (ll i = 1; i < 64; ++i) {
        da a = v[i - 1];
        da b = v[i - 1];
        v[i] = calc(a, b);
    }


        int ans = -1;
        da t;
        for (ll i = 0; i < 64; ++i) {
            //cout << v[i].hh << endl;
            if (((ll)1 << i) & n) {
                if (ans != -1) {
                    t = calc(t, v[i]);
                }
                else {
                    t = v[i];
                    ans = 0;
                }
            }
        }
        cout << t.hh << endl;


    return 0;
}



