#include <iostream>
#include <vector>


/*
  CLRS: Dynamic Programming - Rob cutting
 */

using namespace std;

int recursive_cr(const vector<int> &p, size_t n) {
  int opt = p[0];
  for (size_t i = 1; i <= n; ++i) {
    int value = p[i] + recursive_cr(p, n-i);
    if (value > opt) {
      opt = value;
    }
  }
  return opt;
}


int memoized_cr_aux(const vector<int> &p, vector<int> &r, size_t k) {

  if (r[k] >= 0) {
    return r[k];
  }

  int opt = 0;
  for (size_t i = 1; i <= k; ++i) {
    int value = p[i] + memoized_cr_aux(p, r, k - i);
    if (value > opt) {
      opt = value;
    }
  }
  r[k] = opt;
  return opt;
}

int memoized_cr(const vector<int> &p, vector<int> &r, size_t n) {
  for (size_t i = 0; i < r.size(); ++i) {
    r[i] = -1;
  }
  return memoized_cr_aux(p, r, n);
}

void bottom_up_cr(const vector<int> &p, vector<int> &r) {
  r[0] = 0;
  for (size_t j = 1; j < r.size(); ++j) {
    int opt = p[j];
    for (size_t i = 1; i < j; ++i) {
      if (p[i] + r[j - i] > opt) {
        opt = p[i] + r[j - i];
      }
    }
    r[j] = opt;
  }
}


void extended_bottom_up_cr(const vector<int> &p, vector<int> &r, vector<int> &s) {
  for (size_t i = 0; i < s.size(); ++i) {
    s[i] = i;
  }
  r[0] = 0;
  for (size_t j = 1; j < r.size(); ++j) {
    int opt = p[j];
    for (size_t i = 1; i < j; ++i) {
      if (p[i] + r[j - i] > opt) {
        opt = p[i] + r[j - i];
        s[j] = i;
      }
      r[j] = opt;
    }
  }
}




int main() {

  // price
  // g++ -std=c++11 cut_rob.cpp
  vector<int> p = {0, 1, 5, 8, 9, 10, 17, 17, 20, 24, 30};

  //Revenue
  vector<int> r(p.size());

  //solution
  vector<int> s(p.size());

  //1
  cout << "recursive_cr running..." << endl;
  cout << recursive_cr(p, p.size() - 1) << endl;

  //2
  cout << "memoized_cr running..." << endl;
  cout << memoized_cr(p, r, p.size() - 1) << endl;
  for (size_t i = 0; i < r.size(); ++i) {
    cout << r[i] << ' ';
  }
  cout << endl;

  //3
  cout << "extended_bottom_up_cr running... ";
  extended_bottom_up_cr(p, r, s);
  for (size_t i = 0; i < s.size(); ++i) {
    size_t j = i;
    while(j > 0) {
      cout << s[j] << ' ';
      j -= static_cast<size_t>(s[j]);
    }
    cout << endl;
  }

  return 0;
}
