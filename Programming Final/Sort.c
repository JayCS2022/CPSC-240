//Jay Parmar
//Jay-04.CS@csu.fullerton.edu
//240-17 final program
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

//Function for Sorting the array
void Sort(long array[], int count) {
    long array_number;
    for (int i = 0; i < count; i++) {
      for (int j=0; j<count-i-1; j++){
        if (array[j] > array[j+1]){
          array_number=array[j];
          array[j]=array[j+1];
          array[j+1]=array_number;
        }
      } 
    }
}