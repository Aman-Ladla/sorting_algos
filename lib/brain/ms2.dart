class MS2 {
// Utility function to find minimum of two integers
  int min(int x, int y) {
    return (x < y) ? x : y;
  }

  void mergeSort(List<int> arr, int n) {
    int curr_size;
    int left_start;

    for (curr_size = 1; curr_size <= n - 1; curr_size = 2 * curr_size) {
      for (left_start = 0; left_start < n - 1; left_start += 2 * curr_size) {
        // Find ending point of left subarray. mid+1 is starting
        // point of right
        int mid = min(left_start + curr_size - 1, n - 1);

        int right_end = min(left_start + 2 * curr_size - 1, n - 1);
        merge(arr, left_start, mid, right_end);
      }
    }
  }

/* Function to merge the two haves arr[l..m] and arr[m+1..r] of array arr[] */
  void merge(List<int> arr, int l, int m, int r) {
    int i, j, k;
    int n1 = m - l + 1;
    int n2 = r - m;

    List<int> L, R;

    /* Copy data to temp arrays L[] and R[] */
    for (i = 0; i < n1; i++) {
      L.add(arr[l + i]);
    }
    for (j = 0; j < n2; j++) {
      R.add(arr[m + 1 + j]);
    }

    /* Merge the temp arrays back into arr[l..r]*/
    i = 0;
    j = 0;
    k = l;
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

    /* Copy the remaining elements of L[], if there are any */
    while (i < n1) {
      arr[k] = L[i];
      i++;
      k++;
    }

    /* Copy the remaining elements of R[], if there are any */
    while (j < n2) {
      arr[k] = R[j];
      j++;
      k++;
    }
  }
}
