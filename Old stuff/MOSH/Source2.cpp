//#include <iostream>
//#include <fstream>
//#include <vector>
//#include <string>
//#include <thread>
//#include <queue>
//using namespace std;
//const string file_name = "d1.txt";
//fstream f;
//int y_size, x_size;
//int bad_counter = 0;
//int calls = 0;
//int good_counter = 0;
//vector<vector<int>> rule_x, rule_y;
//vector<vector<vector<char>>> hor, ver;
//vector<thread> threads;
//int active_threads = 0;
//int max_threads_size = 4;
//bool solved = false;
//
//const unsigned int n = std::thread::hardware_concurrency();
//void coutVector(vector<char>& v) {
//	for (auto i : v) {
//		//cout << (i == '#' ? '#' : '.') << ' ';
//		cout << (i == '#' ? '1' : '0') << ' ';
//	}
//	cout << endl;
//}
//void coutVector2(vector<vector<char>>& v) {
//	for (auto i : v) coutVector(i);
//	cout << endl;
//}
//void inputRule(vector<vector<int>>& v, int rule_size) {
//	v.clear();
//	v.resize(rule_size);
//	for (int i = 0; i < rule_size; ++i) {
//		int size;
//		f >> size;
//		v[i].resize(size);
//		for (int j = 0; j < size; ++j) {
//			f >> v[i][j];
//		}
//	}
//}
//
////     rule x
//// r
//// u
//// l
//// e
//// 
//// y
////
////
////
//int check(int x, int y, vector<vector<char>>& img) {
//	vector<int> chanks;
//	int cur_chank_size = 0;
//	for (int i = 0; i <= y; ++i) {
//		if (img[i][x] == '#') ++cur_chank_size;
//		if (img[i][x] == ' ' && cur_chank_size != 0) {
//			chanks.push_back(cur_chank_size);
//			cur_chank_size = 0;
//		}
//	}
//	if (chanks.size() + (cur_chank_size > 0 ? 1 : 0) > rule_x[x].size()) return 1;
//	for (int i = 0; i < chanks.size(); ++i) if (rule_x[x][i] != chanks[i]) return 2;
//
//	if (cur_chank_size == 0) {
//		int sum = 0;
//		for (int i = chanks.size(); i < rule_x[x].size(); ++i) {
//			sum += rule_x[x][i];
//			if (i + 1 != rule_x[x].size()) ++sum;
//		}
//		if (sum + y >= y_size) return 3;
//	}
//	else {
//		if (cur_chank_size > rule_x[x][chanks.size()]) return 4;
//		int sum = 0;
//		for (int i = chanks.size(); i < rule_x[x].size(); ++i) {
//			sum += rule_x[x][i];
//			if (i + 1 != rule_x[x].size()) ++sum;
//		}
//		if (sum + y - cur_chank_size >= y_size) return 5;
//	}
//
//	return 0;
//}
//bool gen(int y, int rule_pos, int gen_pos, vector<vector<char>> img) {
//	if (solved) return false;
//	++calls;
//	//if (calls % 1000000 == 0) cout << "calls(" << y << "): "<< calls << " ";
//	//if ()
//	if (y == y_size) {
//		solved = true;
//		//cout  << calls << endl;
//		coutVector2(img);
//		//cout << "da";
//
//		return true;;
//	}
//	if (rule_pos == rule_y[y].size()) {
//		for (int x = 0; x < x_size; ++x) {
//			if (check(x, y, img) != 0) {
//				//cout << check(x, y, img) << "x:" << x << "y:" << y << " bad(:\n";
//				//coutVector2(img);
//				++bad_counter;
//
//				//return false;
//			}
//		}
//		//if (good_counter % 1000 == 0) cout << endl << "goods:" << good_counter << endl;
//		++good_counter;
//		//cout << "cool:\n";
//		//coutVector2(img);
//		if (gen(y + 1, 0, 0, img)) return true;
//	}
//	else {
//		for (int i = gen_pos; i < x_size - rule_y[y][rule_pos] + 1; ++i) {
//			vector<vector<char>> copy = img;
//			for (int j = i; j < i + rule_y[y][rule_pos]; ++j) {
//				copy[y][j] = '#';
//			}
//			bool b = true;
//			for (int j = i; j < i + rule_y[y][rule_pos]; ++j) {
//				if (check(j, y, copy) != 0) {
//					//cout << check(j, y, copy) << "x:" << j << "y:" << y << " bad(:\n";
//					//coutVector2(copy);
//					//b = false;
//					//break;
//				}
//			}
//			if (b == false) continue; else {
//				if (active_threads < max_threads_size && false) {
//					++active_threads;
//					threads.push_back(thread(gen, y, rule_pos + 1, i + rule_y[y][rule_pos] + 1, copy));
//					//return false;
//				}
//				else if (active_threads == max_threads_size - 1 && false) {
//					++active_threads;
//					for (auto& i : threads) i.join();
//					//return false;
//				}
//				else
//					if (gen(y, rule_pos + 1, i + rule_y[y][rule_pos] + 1, copy)) return true;
//			}
//		}
//	}
//	return false;
//}
//void solve(int i) {
//	//cout << i << endl;
//	f >> y_size >> x_size;
//	//cout << y_size << " " << x_size << endl;
//	vector<char> line_example(x_size, ' ');
//	vector<vector<char>> img(y_size, line_example);
//
//	inputRule(rule_y, y_size);
//	inputRule(rule_x, x_size);
//	//if (i < 1) return;
//	gen(0, 0, 0, img);
//}
//
//int main() {
//	//cout << std::thread::hardware_concurrency() << endl;
//	f.open(file_name);
//	int times;
//	f >> times;
//	//times = 1;
//	for (int i = 0; i < times; ++i) {
//		//cout << "waiting..." << endl;
//		//cin >> max_threads_size;
//		//cout << i;
//		solved = false;
//		active_threads = 0;
//		calls = 0;
//		bad_counter = 0;
//		good_counter = 0;
//		solve(i);
//	}
//	cout << "fin!";
//	while (1);
//	//cin >> n;
//}