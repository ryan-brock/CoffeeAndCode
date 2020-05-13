package main

import "fmt"
import "errors"

func chop() { 
  println("hjiiiiiya");
  return chop_recursive(0);
}

func chop_recursive(depth int) {
  fmt.Printf("chop_recursive: %d\n", depth);

  if ( depth > 100 ) { 
    return errors.New("Depth is greater than max");
  } else { 
    return chop_recursive(depth+1);
  }
} 
