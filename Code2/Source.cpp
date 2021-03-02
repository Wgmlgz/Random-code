#include <iostream>
#include <set>
#include <algorithm>
#include <vector>
using namespace std;
int main() {
    // 3 3 2 3 5 1 2 3
    // 3 4 1 2 2 1 2 4 5
    int n, m;
    cin >> n >> m;
    vector<int> arr (n);
    for (int i = 0; i < n; ++i) cin >> arr[i];
    for (int i = 0; i < m; ++i) {
        int t;
        cin >> t;
        cout << (binary_search(arr.begin(), arr.end(), t) ? "YES" : "NO") << endl;
    }
}