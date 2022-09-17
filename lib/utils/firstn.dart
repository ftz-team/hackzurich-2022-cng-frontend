import 'dart:math';

String firstn(String s, int n) {
  if (s.length < n + 3) {
    return s;
  }
  return s.substring(0, min(n, s.length))+"...";
}