package com.bbrowsound

import org.scalatest._
import org.scalatest.prop.TableDrivenPropertyChecks._

class BinaryChopSpec extends FlatSpec with Matchers {
  lazy val testCases =
    Table(
      ("expected", "search", "list"),
      (-1, 3, List.empty[Int]),
      (-1, 3, List(1)),
      (0, 1, List(1)),
      (0, 1, List(1, 3, 5)),
      (1, 3, List(1, 3, 5)),
      (2, 5, List(1, 3, 5)),
      (-1, 0, List(1, 3, 5)),
      (-1, 2, List(1, 3, 5)),
      (-1, 4, List(1, 3, 5)),
      (-1, 6, List(1, 3, 5)),
      (0, 1, List(1, 3, 5, 7)),
      (1, 3, List(1, 3, 5, 7)),
      (2, 5, List(1, 3, 5, 7)),
      (3, 7, List(1, 3, 5, 7)),
      (-1, 0, List(1, 3, 5, 7)),
      (-1, 2, List(1, 3, 5, 7)),
      (-1, 4, List(1, 3, 5, 7)),
      (-1, 6, List(1, 3, 5, 7)),
      (-1, 8, List(1, 3, 5, 7))
    )

  it should "handle all test cases using recursive approach" in {
    forAll(testCases) { (expected: Int, search: Int, list: List[Int]) =>
      RecursiveChop.chop(search, list) shouldBe expected
    }
  }

  it should "handle all test cases using iterative approach" in {
    forAll(testCases) { (expected: Int, search: Int, list: List[Int]) =>
      IterativeChop.chop(search, list) shouldBe expected
    }
  }
}

object RecursiveChop {
  def binarySearch(x: Int, arr: List[Int], left: Int, right: Int): Int = {
    arr match {
      case Nil => -1
      case List(_*) =>
        if (right >= left) {
          val middleIndex = left + (right - left)
          arr(middleIndex) match {
            case middleValue if middleValue == x =>
              middleIndex
            case middleValue if middleValue > x =>
              binarySearch(x, arr, left, middleIndex - 1)
            case _ =>
              binarySearch(x, arr, middleIndex + 1, right)
          }
        } else {
          -1
        }
    }
  }

  def chop(x: Int, arr: List[Int]): Int = {
    binarySearch(x, arr, 0, arr.length - 1)
  }
}

object IterativeChop {
  def chop(x: Int, arr: List[Int]): Int = {
    var left = 0
    var right = arr.length - 1
    while (left <= right) {
      val middle_index = left + (right - left)
      val middle_value = arr(middle_index)
      if (middle_value == x) {
        return middle_index
      } else if (middle_value < x) {
        left = middle_index + 1
      } else {
        right = middle_index - 1
      }
    }
    -1
  }
}
