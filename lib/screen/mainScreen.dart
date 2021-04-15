import 'dart:math';
import 'package:flutter/material.dart';
import 'package:sorting_algos/painter.dart';

bool flag = false;
List<int> tbp = [];
int left = -2;
int right = -1;
int density = 10;

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<DropdownMenuItem<String>> dropDownList = [];
  String selectedAlgo = 'Merge Sort';
  List<int> arr = [];
  bool butEnabled = true;
  bool sortButEnabled = true;
  var chosenAlgo;
  List<int> a = [];
  bool endflag = false;

  //Algorithms

  // Bubble Sort Algo

  Future<void> bubbleSort(List<int> arr) async {
    int n = arr.length;
    int temp = 0;
    for (int i = 0; i < n; i++) {
      for (int j = 1; j < (n - i); j++) {
        if (arr[j - 1] > arr[j]) {
          //swap elements
          temp = arr[j - 1];
          arr[j - 1] = arr[j];
          arr[j] = temp;
        }
        await Future.delayed(const Duration(milliseconds: 500), () {
          setState(() {
            print('set state called');
            left = j - 1;
            right = j;
            // a.clear();
            // for (int i = 0; i < arr.length; i++) {
            //   a.add(arr[i]);
            // }
            // tbp = a;
            tbp = List.from(arr);
          });
        });
      }
    }

    await Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        print('set state called');
        left = 0;
        right = arr.length;
        tbp = List.from(arr);
      });
    });
  }

  // Merge Sort Algo

  Future<List<int>> merge(List<int> arr, int l, int m, int r) async {
    a.clear();
    int i, j, k;
    int n1 = m - l + 1;
    int n2 = r - m;

    /* create temp arrays */
    List<int> L = [];
    List<int> R = [];

    /* Copy data to temp arrays L[] and R[] */
    for (i = 0; i < n1; i++) {
      // L[i] = arr[l + i];

      L.add(arr[l + i]);
    }
    for (j = 0; j < n2; j++) {
      // R[j] = arr[m + 1 + j];

      R.add(arr[m + 1 + j]);
    }

    /* Merge the temp arrays back into arr[l..r]*/
    i = 0; // Initial index of first subarray
    j = 0; // Initial index of second subarray
    k = l; // Initial index of merged subarray
    while (i < n1 && j < n2) {
      if (L[i] <= R[j]) {
        arr[k] = L[i];
        i++;
      } else {
        arr[k] = R[j];
        j++;
      }
      k++;
    }

    while (i < n1) {
      arr[k] = L[i];
      i++;
      k++;
    }

    while (j < n2) {
      arr[k] = R[j];
      j++;
      k++;
    }
    await Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        print('set state called');
        left = l;
        right = r;
        tbp = List.from(arr);
      });
    });
    print('reached at end of merge');
    return arr;
  }

/* l is for left index and r is right index of the
sub-array of arr to be sorted */
  Future<List<int>> mergeSort(List<int> arr, int l, int r) async {
    List<int> a = [];
    a.clear();
    if (l < r) {
      // Same as (l+r)/2, but avoids overflow for
      // large l and h
      int m = (l + (r - l) / 2).floor();

      // Sort first and second halves
      arr = await mergeSort(arr, l, m);
      //print('hello guys0 $arr');
      arr = await mergeSort(arr, m + 1, r);
      //print('hello guys1 $arr');

      arr = await merge(arr, l, m, r);
      //print('hello guys2 $arr');
    }
    return arr;
  }

  //Quick Sort Algo

  Future<List<int>> sort(List<int> arr, int low, int high) async {
    if (low < high) {
      int pivot = arr[high];
      int i = (low - 1);
      for (int j = low; j < high; j++) {
        if (arr[j] <= pivot) {
          i++;
          int temp = arr[i];
          arr[i] = arr[j];
          arr[j] = temp;
          await Future.delayed(const Duration(milliseconds: 500), () {
            setState(() {
              print('set state called');
              left = i;
              right = j;
              tbp = List.from(arr);
            });
          });
        }
      }

      int temp = arr[i + 1];
      arr[i + 1] = arr[high];
      arr[high] = temp;

      await Future.delayed(const Duration(milliseconds: 500), () {
        setState(() {
          print('set state called');
          left = i + 1;
          right = high;
          tbp = List.from(arr);
        });
      });

      arr = await sort(arr, low, i);
      await Future.delayed(const Duration(milliseconds: 500), () {
        setState(() {
          print('set state called');
          left = low;
          right = i;
          tbp = List.from(arr);
        });
      });
      arr = await sort(arr, i + 2, high);
      await Future.delayed(const Duration(milliseconds: 500), () {
        setState(() {
          print('set state called');
          left = i + 2;
          right = high;
          tbp = List.from(arr);
        });
      });
    }
    return arr;
  }

  // Heap Sort

  Future<void> heapSort(List<int> arr) async {
    int n = arr.length;

    // Build heap (rearrange array)
    for (int i = (n / 2 - 1).floor(); i >= 0; i--) {
      arr = await heapify(arr, n, i);
    }

    // One by one extract an element from heap
    for (int i = n - 1; i >= 0; i--) {
      // Move current root to end
      int temp = arr[0];
      arr[0] = arr[i];
      arr[i] = temp;
      await Future.delayed(const Duration(milliseconds: 500), () {
        setState(() {
          print('set state called');
          left = 0;
          right = 1;
          tbp = List.from(arr);
        });
      });

      // call max heapify on the reduced heap
      arr = await heapify(arr, i, 0);
    }
  }

  // To heapify a subtree rooted with node i which is
  // an index in arr[]. n is size of heap
  Future<List<int>> heapify(List<int> arr, int n, int i) async {
    int largest = i; // Initialize largest as root
    int l = 2 * i + 1; // left = 2*i + 1
    int r = 2 * i + 2; // right = 2*i + 2

    // If left child is larger than root
    if (l < n && arr[l] > arr[largest]) {
      largest = l;
    }

    // If right child is larger than largest so far
    if (r < n && arr[r] > arr[largest]) {
      largest = r;
    }

    // If largest is not root
    if (largest != i) {
      int swap = arr[i];
      arr[i] = arr[largest];
      arr[largest] = swap;
      await Future.delayed(const Duration(milliseconds: 500), () {
        setState(() {
          print('set state called');
          left = i;
          right = largest;
          tbp = List.from(arr);
        });
      });

      // Recursively heapify the affected sub-tree
      arr = await heapify(arr, n, largest);
    }
    return arr;
  }

  //----------------------

  @override
  void initState() {
    super.initState();
    makeList();
    generateArray();
  }

  void update(List<int> a) async {
    print('set state called 0');
    await Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        print('set state called');
        tbp = a;
      });
    });
  }

  void generateArray() {
    var random = Random();
    setState(() {
      endflag = false;
      sortButEnabled = true;
      left = -2;
      right = -1;
      arr.clear();
      tbp.clear();
      for (int i = 0; i < density; i++) {
        int x = random.nextInt(290) + 20;
        arr.add(x);
        tbp.add(x);
      }
    });
  }

  void makeList() {
    dropDownList.add(DropdownMenuItem<String>(
      child: Text('Merge Sort'),
      value: 'Merge Sort',
    ));
    dropDownList.add(DropdownMenuItem<String>(
      child: Text('Bubble Sort'),
      value: 'Bubble Sort',
    ));
    dropDownList.add(DropdownMenuItem<String>(
      child: Text('Quick Sort'),
      value: 'Quick Sort',
    ));
    dropDownList.add(DropdownMenuItem<String>(
      child: Text('Heap Sort'),
      value: 'Heap Sort',
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Select Algorithm'),
                  DropdownButton(
                    items: dropDownList,
                    value: selectedAlgo,
                    onChanged: (value) {
                      setState(() {
                        selectedAlgo = value;
                        if (!sortButEnabled) {
                          generateArray();
                        }
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text('Density'),
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    trackHeight: 2.0,
                    activeTrackColor: Colors.white,
                    thumbColor: Colors.red,
                    overlayColor: Color(0x29EB1555),
                    inactiveTrackColor: Color(0x4A8d8e98),
                  ),
                  child: Slider(
                    value: density.toDouble(),
                    min: 4.0,
                    max: 17.0,
                    onChanged: butEnabled
                        ? (double newValue) {
                            setState(() {
                              density = newValue.round();
                              generateArray();
                            });
                          }
                        : null,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Material(
                  color: butEnabled ? Colors.white70 : Colors.white10,
                  borderRadius: BorderRadius.circular(20.0),
                  child: MaterialButton(
                    onPressed: butEnabled
                        ? () {
                            generateArray();
                          }
                        : null,
                    child: Text(
                      'Create New Array',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Expanded(
              flex: 5,
              child: Container(
                width: double.maxFinite,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        width: double.maxFinite,
                        color: Color(0xffeeeeee),
                        child: PaintingWdt(tbp, (17 / density) * 15, left,
                            right, selectedAlgo, endflag),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0, top: 20.0),
                      child: Material(
                        color: sortButEnabled ? Colors.green : Colors.white10,
                        borderRadius: BorderRadius.circular(20.0),
                        child: MaterialButton(
                          onPressed: sortButEnabled
                              ? () async {
                                  sortButEnabled = false;
                                  butEnabled = false;
                                  temp.clear();
                                  time = 0;
                                  print('sending $arr');
                                  switch (selectedAlgo) {
                                    case 'Merge Sort':
                                      arr = await mergeSort(
                                          arr, 0, arr.length - 1);
                                      break;
                                    case 'Bubble Sort':
                                      await bubbleSort(arr);
                                      break;
                                    case 'Quick Sort':
                                      await sort(arr, 0, arr.length - 1);
                                      await Future.delayed(
                                          const Duration(milliseconds: 500),
                                          () {
                                        setState(() {
                                          print('set state called');
                                          left = 0;
                                          right = arr.length - 1;
                                          endflag = true;
                                          tbp = List.from(arr);
                                        });
                                      });
                                      break;
                                    case 'Heap Sort':
                                      await heapSort(arr);
                                      await Future.delayed(
                                          const Duration(milliseconds: 500),
                                          () {
                                        setState(() {
                                          print('set state called');
                                          left = 0;
                                          right = arr.length - 1;
                                          endflag = true;
                                          tbp = List.from(arr);
                                        });
                                      });
                                      break;
                                  }
                                  print('in main $arr');
                                  butEnabled = true;
                                }
                              : null,
                          child: Text(
                            'Sort!',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
