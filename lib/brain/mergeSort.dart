// import 'package:sorting_algos/screen/mainScreen.dart';
// import 'package:flutter/material.dart';
// import 'package:sorting_algos/painter.dart';
//
// class MSWdt extends StatefulWidget {
//   @override
//   _MSWdtState createState() => _MSWdtState();
// }
//
// class _MSWdtState extends State<MSWdt> {
//   Future<List<int>> merge(List<int> arr, int l, int m, int r) async {
//     List<int> a = [];
//     a.clear();
//     int i, j, k;
//     int n1 = m - l + 1;
//     int n2 = r - m;
//
//     /* create temp arrays */
//     List<int> L = [];
//     List<int> R = [];
//
//     /* Copy data to temp arrays L[] and R[] */
//     for (i = 0; i < n1; i++) {
//       // L[i] = arr[l + i];
//
//       L.add(arr[l + i]);
//     }
//     for (j = 0; j < n2; j++) {
//       // R[j] = arr[m + 1 + j];
//
//       R.add(arr[m + 1 + j]);
//     }
//
//     /* Merge the temp arrays back into arr[l..r]*/
//     i = 0; // Initial index of first subarray
//     j = 0; // Initial index of second subarray
//     k = l; // Initial index of merged subarray
//     while (i < n1 && j < n2) {
//       if (L[i] <= R[j]) {
//         arr[k] = L[i];
//         i++;
//       } else {
//         arr[k] = R[j];
//         j++;
//       }
//       k++;
//     }
//
//     while (i < n1) {
//       arr[k] = L[i];
//       i++;
//       k++;
//     }
//
//     while (j < n2) {
//       arr[k] = R[j];
//       j++;
//       k++;
//     }
//     a.clear();
//     for (int i = 0; i < arr.length; i++) {
//       a.add(arr[i]);
//     }
//     temp.add(a);
//     await Future.delayed(const Duration(milliseconds: 500), () {
//       setState(() {
//         print('set state called');
//         left = l;
//         right = r;
//         tbp = a;
//       });
//     });
//     print('reached at end of merge');
//     return arr;
//   }
//
// /* l is for left index and r is right index of the
// sub-array of arr to be sorted */
//   Future<List<int>> mergeSort(List<int> arr, int l, int r) async {
//     List<int> a = [];
//     a.clear();
//     if (l < r) {
//       // Same as (l+r)/2, but avoids overflow for
//       // large l and h
//       int m = (l + (r - l) / 2).floor();
//
//       // Sort first and second halves
//       arr = await mergeSort(arr, l, m);
//       //print('hello guys0 $arr');
//       arr = await mergeSort(arr, m + 1, r);
//       //print('hello guys1 $arr');
//
//       arr = await merge(arr, l, m, r);
//       //print('hello guys2 $arr');
//     }
//     return arr;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: PaintingWdt(tbp, (17 / density) * 15, left, right),
//     );
//   }
// }
//
// // class MS {
// //   List<int> c = [];
// //
// //   List<int> get getArray {
// //     return c;
// //   }
// //
// //   Future<List<int>> merge(List<int> arr, int l, int m, int r) async {
// //     List<int> a = [];
// //     a.clear();
// //     int i, j, k;
// //     int n1 = m - l + 1;
// //     int n2 = r - m;
// //
// //     /* create temp arrays */
// //     List<int> L = [];
// //     List<int> R = [];
// //
// //     /* Copy data to temp arrays L[] and R[] */
// //     for (i = 0; i < n1; i++) {
// //       // L[i] = arr[l + i];
// //
// //       L.add(arr[l + i]);
// //     }
// //     for (j = 0; j < n2; j++) {
// //       // R[j] = arr[m + 1 + j];
// //
// //       R.add(arr[m + 1 + j]);
// //     }
// //
// //     /* Merge the temp arrays back into arr[l..r]*/
// //     i = 0; // Initial index of first subarray
// //     j = 0; // Initial index of second subarray
// //     k = l; // Initial index of merged subarray
// //     while (i < n1 && j < n2) {
// //       if (L[i] <= R[j]) {
// //         arr[k] = L[i];
// //         i++;
// //       } else {
// //         arr[k] = R[j];
// //         j++;
// //       }
// //       k++;
// //     }
// //
// //     while (i < n1) {
// //       arr[k] = L[i];
// //       i++;
// //       k++;
// //     }
// //
// //     while (j < n2) {
// //       arr[k] = R[j];
// //       j++;
// //       k++;
// //     }
// //     a.clear();
// //     for (int i = 0; i < arr.length; i++) {
// //       a.add(arr[i]);
// //     }
// //     await Future.delayed(const Duration(milliseconds: 500), () {
// //       setState(() {
// //         print('set state called');
// //         tbp = a;
// //       });
// //     });
// //     print('reached at end of merge');
// //     return arr;
// //   }
// //
// // /* l is for left index and r is right index of the
// // sub-array of arr to be sorted */
// //   Future<List<int>> mergeSort(List<int> arr, int l, int r) async {
// //     List<int> a = [];
// //     a.clear();
// //     if (l < r) {
// //       // Same as (l+r)/2, but avoids overflow for
// //       // large l and h
// //       int m = (l + (r - l) / 2).floor();
// //
// //       // Sort first and second halves
// //       arr = await mergeSort(arr, l, m);
// //       //print('hello guys0 $arr');
// //       arr = await mergeSort(arr, m + 1, r);
// //       //print('hello guys1 $arr');
// //
// //       arr = await merge(arr, l, m, r);
// //       //print('hello guys2 $arr');
// //     }
// //     return arr;
// //   }
// // }
