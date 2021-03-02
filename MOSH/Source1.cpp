//int ways(int st, int fn, int k) {
//	vector<int> buff(fn + 1);
//	buff[st] = 1;
//	for (int i = st; i < fn; ++i) {
//		int to;
//		to = i + 1;
//		if (to <= fn) buff[to] += buff[i];
//		to = i * k;
//		if (to <= fn) buff[to] += buff[i];
//	}
//	return buff[fn];
//}
//vector<int> res;
//int counter = 0;
//bool parceTable(vector<vector<int>> table, vector<int>& path, int in, int x, int y, vector<int> try_path) {
//	if (in == path.size()) {
//		res = try_path;
//		return true;
//	}
//	++counter;
//	if (counter / 1000 != (counter - 1) / 1000) cout << counter << " ";
//	//cout << counter << endl;
//	//for (auto j : try_path) cout << j + 1 << " ";
//	//cout << endl;
//	if (x >= 0) {
//		for (int i = table.size() - 1; i >= 0; --i) {
//			if (table[x][i] == path[in]) {
//				auto copt = table;
//				copt[x][i] = -666;
//				auto cop = try_path;
//				cop.push_back(i);
//				if (parceTable(copt, path, in + 1, -1, i, cop)) {
//					return true;
//				}
//			}
//		}
//	}
//	else {
//		for (int i = table.size() - 1; i >= 0; --i) {
//			if (table[i][y] == path[in]) {
//				auto copt = table;
//				copt[i][y] = -666;
//				auto cop = try_path;
//				cop.push_back(i);
//				if (parceTable(copt, path, in + 1, i, -1, cop)) {
//					return true;
//				}
//			}
//		}
//	}
//	return false;
//}


		//int path_size, table_size;
		//f >> dec >> path_size;
		//vector<int> path(path_size);
		//for (int j = 0; j < path_size; ++j) {
		//	f >> hex >> path[j];
		//}
		//f >> dec >> table_size;
		//vector<vector<int>> table(table_size);
		//for (int x = 0; x < table_size; ++x) {
		//	for (int y = 0; y < table_size; ++y) {
		//		table[x].resize(table_size);
		//		f >> hex >> table[x][y];
		//	}
		//}
		//counter = 0;
		//res.clear();
		//cout << "----" << i << "-----";
		////if (i < 4) continue;
		////sortPrint(path);
		//parceTable(table, path, 0, 0, -1, {});
		//for (auto j : res) cout << j + 1 << " ";
		//cout << endl;
