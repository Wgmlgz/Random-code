#include<iostream>
#include<vector>
#include<algorithm>
using namespace std;

vector<bool> used;
vector <vector<int>> graph;
vector<int> comp;

void dfs(int vertex, int components)
{
	used[vertex] = true;
	comp[vertex] = components;
	for (auto u : graph[vertex])
	{
		if (!used[u])
			dfs(u, components);
	}
}

int main()
{
	int n, m;
	cin >> m;
	cin >> n;
	graph.resize(m + 1);
	used.resize(m + 1);
	comp.resize(m + 1);
	int components = 1;
	
	
	for (int i = 0; i < n; i++)
	{
		int a, b;
		cin >> a >> b;
		graph[a].push_back(b);
		graph[b].push_back(a);
	}

	for (int i = 1; i <= m; i++) {
		if (!used[i]) {
			dfs(i, components);
			components++;
		}
	}
	cout << components - 1 << endl;
	for (int i = 1; i <= m; i++) {
		cout << comp[i] << endl;
	}
	return 0;
}