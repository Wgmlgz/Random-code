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
#include <queue>
using namespace std;


const string file_name = "e1.txt";
const string sp = " ";
using p = pair<int, int>;
using pp = pair<p, p>;

int t, n, m, r, chels;
int its = 0;
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

struct nd {
	vector<pair<nd*, int8_t>> con;
	int x, y;
};

vector<vector<nd>> ori;
vector<nd*> all;
vector<pair<nd*, int>> parce_table;
vector<pair<nd*, nd*>> ch;
vector<pair<nd*, int>> nw;
int minn = 9999999;
void newFi(size_t x, size_t y) {
	// clear
	all.clear();
	ori.clear();
	ori.resize(x, vector<nd>(y));
	for (size_t i = 0; i < x; ++i) {
		for (size_t j = 0; j < y; ++j) {
			//cout << "$ " << i << sp << j << endl;
			all.push_back(&ori[i][j]);
			// connect
			if (i != 0)     ori[i][j].con.push_back({ &ori[i - 1][j], 10 });
			if (i != x - 1) ori[i][j].con.push_back({ &ori[i + 1][j], 10 });
			if (j != 0)     ori[i][j].con.push_back({ &ori[i][j - 1], 10 });
			if (j != y - 1) ori[i][j].con.push_back({ &ori[i][j + 1], 10 });
			ori[i][j].x = i + 1;
			ori[i][j].y = j + 1;
			for (int t = 0; t < ori[i][j].con.size(); ++t) {
				parce_table.push_back({ &ori[i][j], t });
			}
		}
	}
	ch.clear();
	for (auto& i : paths) {
		// ###############################
		ch.push_back({ &ori[i.first.second - 1][i.first.first - 1], &ori[i.second.second - 1][i.second.first - 1] });
	}
	//parce_table.push_back({ &ori[0][0], 1 });
	//parce_table.push_back({ &ori[0][2], 0 });
	//parce_table.push_back({ &ori[1][2], 1 });
	//parce_table.push_back({ &ori[2][2], 1 });

}

void setFast() {
	// reset

	for (auto& i : all)
		for (auto& j : i->con) j.second = 10;

	for (auto& i : nw)
		i.first->con[i.second].second = 1;

	//for (auto i : nw) {
	//	cout << "g " << i.first->x << sp << i.first->y << sp << i.second << endl;
	//}
	//cout << endl;
}

int bfs(nd* st, nd* ed, int max) {
	vector<nd*> used;
	queue<pair<nd*, int>> q;
	q.push({ st, 0 });
	int fastest = max;
	while (q.empty() == false) {
		auto t = q.front();
		q.pop();
		//if (find(used.begin(), used.end(), t.first) != used.end()) continue;
		if (t.second > fastest) continue;
		if (t.first == ed) {
			if (t.second < max) fastest = t.second;
			continue;
		}
		for (auto& i : t.first->con) {
			q.push({ i.first, i.second + t.second });
			used.push_back(i.first);
		}
	}
	//cout << "d " << fastest << endl;
	return fastest;
}
int tryDa(vector<int> old) {
	++its;
	if (its / 1000 != (its - 1) / 1000) cout << "its " << its;
	nw.clear();
	for (auto& i : old) nw.push_back(parce_table[i]);
	setFast();
	int sum = 0;
	for (auto& i : ch) {
		sum += bfs(i.first, i.second, 10 * worst(i.first->x, i.first->y, i.second->x, i.second->y));
	}
	return sum;
}

void parce(vector<int> old, int tpos, int upos) {
	//cout << ": " << tpos << sp << upos << endl;
	if (upos == r) {
		int res = tryDa(old);
		if (res < minn) {
			cout << "New min!: ";
			cout << res << endl;
			for (auto i : nw) {
				printf("& %d %d %d %d\n", i.first->x, i.first->y, i.first->con[i.second].first->x, i.first->con[i.second].first->y);
			}
			minn = res;
		}
		
	}
	else {
		for (int i = tpos; i < parce_table.size(); ++i) {
			auto cop = old;
			cop.push_back(i);
			parce(cop, i + 1, upos + 1);
		}
	}
}
//    <-----
//    <--
//  <----
void solve() {
	newFi(m, n);
	parce(vector<int>(), 0, 0);
}
int main() {
	ifstream f(file_name);
	f >> t;

	for (int i = 0; i < t; ++i) {
		its = 0;
		cout << "test: " << i << endl;
		f >> n >> m >> r >> chels;
		cout << n << " " << m << " " << r << endl;
		paths.clear();
		paths.resize(chels);
		for (int j = 0; j < chels; j++) {
			int y, x, yf, xf;
			f >> paths[j].first.first;
			f >> paths[j].first.second;
			f >> paths[j].second.first;
			f >> paths[j].second.second;
		}
		if (i < 2) continue;
		solve();
	}
	std::cout << "fin";
	while (1);

}