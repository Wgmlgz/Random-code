#include <iostream>
#include <vector>
#include <string>
#include <fstream>
#include <algorithm>
#include <tuple>
#include <set>
#include <map>
#include <iomanip>
#include <thread>
using namespace std;


const string file_name = "e0.txt";

const string sp = " ";
using p = pair<int, int>;
using pp = pair<p, p>;

int t, n, m, r, chels;
vector<pp> paths;

inline int absi(int n) {
	return n > 0 ? n : -n;
}
inline int singi(int n) {
	return n > 0 ? 1 : -1;
}
inline int morei(int n) {
	return n > 0 ? 1 : 0;
}
inline int worst(int x, int y, int x1, int y1) {
	return absi(x - x1) + absi(y - y1);
}
string pstr(pp i) {
	string res = "(";
	res += to_string(i.first.first) + sp;
	res += to_string(i.first.second) + ", ";
	res += to_string(i.second.first) + sp;
	res += to_string(i.second.second);
	return res + ")";
}
//    <-----
//    <--
//  <----
vector<pair<pp, int>> findGood(int nn, int asx, int asy, int afx, int afy, int bsx, int bsy, int bfx, int bfy) {
	vector<pair<pp, int>> ret;
	if (asx >= bfx) {
		int msx = min(asx, bsx);
		int mfx = max(afx, bfx);
		for (int g = 1; g <= nn; ++g) {
			int way = 10 * worst(asx, asy, msx, g) + worst(msx, g, mfx, g) + 10 * worst(mfx, g, afx, afy);
			way += 10 * worst(bsx, bsy, msx, g) + worst(msx, g, mfx, g) + 10 * worst(mfx, g, bfx, bfy);
			int bad_way = (worst(asx, asy, afx, afy) + worst(bsx, bsy, bfx, bfy)) * 10;
			if (way < bad_way) {
				ret.push_back({ { {g, msx}, {g, mfx} }, bad_way - way });
				//cout << pstr() << " ";
			}
		}
	}
	return ret;
}
//    <-----
//    <--
//  <----
vector<pair<pp, int>> findGoodOne(int lines, int line_size, int asx, int asy, int afx, int afy) {

	int bad_way = worst(asx, asy, afx, afy) * 10;
	vector<pair<pp, int>> ret;
	for (int l = 1; l <= lines; ++l) {
		for (int i = 1; i <= line_size; ++i) {
			for (int j = i + 1; j <= line_size; ++j) {
				if (worst(j, l, i, l) > r) continue;
				int way = 10 * worst(asx, asy, j, l) + worst(j, l, i, l) + 10 * worst(i, l, afx, afy);
				if (way < bad_way) {
					ret.push_back({ { {l, j}, { l, i} }, bad_way - way });
				}
			}
		}
	}
	return ret;
}
vector<pair<pp, int>> parce(pp a, int k) {
	vector<pair<pp, int>> tmp;
	if (k == 0) {
		//tmp = findGood(n, 1+m- a.first.second, a.first.first, 1+m- a.second.second, a.second.first, 1+m- b.first.second, b.first.first, 1+m- b.second.second, b.second.first);
		tmp = findGoodOne(n, m, 1 + m - a.first.second, a.first.first, 1 + m - a.second.second, a.second.first);
		for (auto& j : tmp) {
			auto& i = j.first;
			i.first.second = 1 + m - i.first.second;
			i.second.second = 1 + m - i.second.second;
		}
	}
	if (k == 1) {
		//tmp = findGood(n, a.first.second, a.first.first, a.second.second, a.second.first, b.first.second, b.first.first, b.second.second, b.second.first);
		tmp = findGoodOne(n, m, a.first.second, a.first.first, a.second.second, a.second.first);
	}
	if (k == 2) {
		swap(a.first.first, a.first.second);
		swap(a.second.first, a.second.second);
		//swap(b.first.first, b.first.second);
		//swap(b.second.first, b.second.second);
		//tmp = findGood(m, 1+n- a.first.second, a.first.first, 1+n- a.second.second, a.second.first, 1+n- b.first.second, b.first.first, 1+n- b.second.second, b.second.first);
		tmp = findGoodOne(m, n, 1 + n - a.first.second, a.first.first, 1 + n - a.second.second, a.second.first);
		for (auto& j : tmp) {
			auto& i = j.first;
			i.first.second = 1 + n - i.first.second;
			i.second.second = 1 + n - i.second.second;
		}
		for (auto& j : tmp) {
			auto& i = j.first;
			swap(i.first.first, i.first.second);
			swap(i.second.first, i.second.second);
		}
	}
	if (k == 3) {
		swap(a.first.first, a.first.second);
		swap(a.second.first, a.second.second);
		//swap(b.first.first,  b.first.second);
		//swap(b.second.first, b.second.second);
		//tmp = findGood(m, a.first.second, a.first.first, a.second.second, a.second.first, b.first.second, b.first.first, b.second.second, b.second.first);
		tmp = findGoodOne(m, n, a.first.second, a.first.first, a.second.second, a.second.first);
		for (auto& j : tmp) {
			auto& i = j.first;
			swap(i.first.first, i.first.second);
			swap(i.second.first, i.second.second);
		}

	}
	return tmp;
}
void parceMap(vector<pair<pp, int>>& FUCK_FUCK, int st, vector<vector<vector<int>>> weights) {

}
void solve() {
	vector<int> no;
	for (auto i : paths) no.push_back(worst(i.first.first, i.first.second, i.second.first, i.second.second));
	//for (auto i : no) cout << i << endl;
	//cout << endl;
	vector<p> path_sizes;
	for (auto i : paths) path_sizes.push_back({ i.second.second - i.first.second, i.second.first - i.first.first });
	//for (auto i : path_sizes) cout << i.first << " " << i.second << endl;

	// 0      1    2    3
	// right left down up
	vector<vector<pp>> da(4);
	for (int i = 0; i < chels; ++i) {
		if (path_sizes[i].first > 0) da[0].push_back(paths[i]);
		else if (path_sizes[i].first < 0) da[1].push_back(paths[i]);

		if (path_sizes[i].second > 0) da[2].push_back(paths[i]);
		else if (path_sizes[i].second < 0) da[3].push_back(paths[i]);
	}
	//vector<vector<vector<int>>> weights(n, vector<vector<int>>(m, vector<int>{0, 0, 0, 0}));
	map<pp, vector<pair<pp, int>>> gg;
	/*auto addWeights = [&](vector<pair<pp, int>>& tmp, int tt) {
		for (auto i : tmp) {
			int sx = i.first.first.second;
			int sy = i.first.first.first;
			int fx = i.first.second.second;
			int fy = i.first.second.first;
			//   0    1    2    3
			// right left down up

			// right
			for (int j = sx; j < fx; ++j) {
				for (int k = sy;; k += singi(fy - sy)) {
					weights[k - 1][j - 1][0] += tt;
					if (k == fy) break;
				}
			}
			// left
			for (int j = sx; j > fx; --j) {
				for (int k = sy;; k += singi(fy - sy)) {
					weights[k - 1][j - 1][1] += tt;
					if (k == fy) break;
				}
			}
			// down
			for (int j = sy; j < fy; ++j) {
				for (int k = sx;; k += singi(fx - sx)) {
					weights[j - 1][k - 1][2] += tt;
					if (k == fx) break;
				}
			}
			// up
			for (int j = sy; j > fy; --j) {
				for (int k = sx;; k += singi(fx - sx)) {
					weights[j - 1][k - 1][3] += tt;
					if (k == fx) break;
				}
			}

			//cout << pstr(i.first) << ":" << i.second << " ";
		}
	};
	auto addWeights2 = [&](vector<pp>& tmp, int tt) {
		for (auto i : tmp) {
			int sx = i.first.second;
			int sy = i.first.first;
			int fx = i.second.second;
			int fy = i.second.first;
			//   0    1    2    3
			// right left down up

			// right
			for (int j = sx; j < fx; ++j) {
				for (int k = sy;; k += singi(fy - sy)) {
					weights[k - 1][j - 1][0] += tt;
					if (k == fy) break;
				}
			}
			// left
			for (int j = sx; j > fx; --j) {

				for (int k = sy;; k += singi(fy - sy)) {
					weights[k - 1][j - 1][1] += tt;
					if (k == fy) break;
				}
			}
			// down
			for (int j = sy; j < fy; ++j) {
				for (int k = sx;; k += singi(fx - sx)) {
					weights[j - 1][k - 1][2] += tt;
					if (k == fx) break;
				}
			}
			// up
			for (int j = sy; j > fy; --j) {
				for (int k = sx;; k += singi(fx - sx)) {
					weights[j - 1][k - 1][3] += tt;
					if (k == fx) break;
				}
			}

			//cout << pstr(i.first) << ":" << i.second << " ";
		}
	};*/
	//addWeights2(paths, 1);
	map<pp, int> FUCK;
	for (int k = 0; k < 4; ++k) {
		cout << k << " (" << da[k].size() << "): ";
		//for (auto j : da[k]) cout << pstr(j) << " ";
		cout << endl;

		int gg = 0;
		auto sz = da[k].size();
		for (int i = 0; i < sz; ++i) {
			//for (int j = i + 1; j < sz; ++j) {
			auto a = da[k][i];
			//auto b = da[k][j];
			auto tmp = parce(a, k);

			//for (int i = 0; i < 5 && i < tmp.size(); ++i) cout << pstr(tmp[i].first) << ":" << tmp[i].second << " ";
			for (auto i : tmp) {
				if (FUCK.find(i.first) != FUCK.end()) {
					FUCK.find(i.first)->second += i.second;
				}
				else {
					FUCK[i.first] = i.second;
				}
			}
			//FUCK_FUCK_FUCK.push_back(tmp);
			//addWeights(tmp, 2);
			//cout << endl;
			++gg;
			//}
		}

		//cout << gg;
		//cout << endl << endl;
	}
	vector<pair<pp, int>> FUCK_FUCK;
	for (auto i : FUCK) {
		FUCK_FUCK.push_back(i);
		//cout << pstr(i.first) << ":" << i.second;
	}
	sort(FUCK_FUCK.begin(), FUCK_FUCK.end(), [](auto& left, auto& right) {
		return left.second > right.second;
		});
	cout << "good map size: " << FUCK_FUCK.size();
	//cout << endl;

	cout << " -- "; for (int i = 0; i < 100 && i < FUCK_FUCK.size(); ++i) cout << pstr(FUCK_FUCK[i].first) << ":" << FUCK_FUCK[i].second << " ";

	vector<vector<vector<int>>> weights(n, vector<vector<int>>(m, vector<int>{0, 0, 0, 0}));
	//parceMap(FUCK_FUCK, 0, weights);
	cout << endl;
	return;
	//cout << "output:\n";
	for (int rr = 0; rr < r; ++rr) {
		//continue;
		int nn = 0, mm = 0, kk = 0;
		int max = -1;
		for (int i = 0; i < n; ++i) {
			for (int j = 0; j < m; ++j) {
				for (int k = 0; k < 4; ++k) {
					if (weights[i][j][k] > max) {
						max = weights[i][j][k];
						nn = i;
						mm = j;
						kk = k;
					}
				}
			}
		}
		if (max != -1) {
			weights[nn][mm][kk] = 0;
			cout << nn + 1 << " " << mm + 1 << " ";
			//   0    1    2    3
			// right left down up
			if (kk == 0) cout << nn + 1 << " " << mm + 2;
			if (kk == 1) cout << nn + 1 << " " << mm + 0;
			if (kk == 2) cout << nn + 2 << " " << mm + 1;
			if (kk == 3) cout << nn + 0 << " " << mm + 1;
			cout << endl;
		}
		//cout << 
	}
	cout << endl;

	for (auto i : weights) {
		for (auto j : i) cout << setw(6) << j[0] << " ";
		cout << endl;
	}
	cout << endl;
	for (auto i : weights) {
		for (auto j : i) cout << setw(6) << j[1] << " ";
		cout << endl;
	}
	cout << endl;
	for (auto i : weights) {
		for (auto j : i) cout << setw(6) << j[2] << " ";
		cout << endl;
	}
	cout << endl;
	for (auto i : weights) {
		for (auto j : i) cout << setw(6) << j[3] << " ";
		cout << endl;
	}
	cout << endl;

}

int main() {
	ifstream f(file_name);
	f >> t;

	for (int i = 0; i < t; ++i) {
		cout << "test: " << i << endl;
		f >> n >> m >> r >> chels;
		cout << r << endl;
		paths.clear();
		paths.resize(chels);
		for (int j = 0; j < chels; j++) {
			int y, x, yf, xf;
			f >> paths[j].first.first;
			f >> paths[j].first.second;
			f >> paths[j].second.first;
			f >> paths[j].second.second;
		}
		solve();
	}
	std::cout << "fin";
	while (1);

}