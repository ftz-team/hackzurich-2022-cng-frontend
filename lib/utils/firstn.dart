import 'dart:math';

String firstn(String s, int n) {
  return s.substring(0, min(n, s.length));
}