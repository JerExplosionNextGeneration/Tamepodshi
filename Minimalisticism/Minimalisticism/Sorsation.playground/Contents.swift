import Foundation
import UIKit
import AVFoundation

class SorsationViewController: UIViewController {
    var arrayForExperiment = [7, 1, 5, 3, 2, 9, 6, 8]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        
   // genericInsertionality(unsorted: <#T##[Comparable]#>, by: <#T##(Comparable, Comparable) -> Bool#>) //
        insertionality(unsorted: &arrayForExperiment)
        selectionSort(intArray: arrayForExperiment)
    }
}

private func genericInsertionality<T: Comparable>(unsorted: [T], by comparison: (T, T) -> Bool) -> [T] {
    var unsorted = unsorted
    
    for q in 0..<unsorted.count {

    }
    return Array<T>.init()
}

//func insertionSort<T: Comparable>(_ input: [T], by comparison: (T, T) -> Bool) -> [T]
//{
//    var items = input
//
//    for index in 1..<items.count
//    {
//        let value = items[index]
//        var position = index
//
//        while position > 0 && comparison(items[position - 1], value) {
//            items[position] = items[position - 1]
//            position -= 1
//        }
//        items[position] = value
//    }
//    return items
//}
//
//var sorted = insertionSort([70, 36, 40, 95, 22, 55, 26], by: >)
//print(sorted)
//
//var names = insertionSort(["Marvin", "Arthur", "Zaphod", "Trillian", "Eddie"], by: { $0 < $1 })
//print(names)


private func insertionality(unsorted: inout[Int]) -> [Int] {
    guard unsorted.count > 1 else { return unsorted }
    
    for index1 in 1..<unsorted.count {
        for index2 in (1...index1).reversed() {
            if unsorted[index2] < unsorted[index2 - 1] {
                unsorted.swapAt(index2 - 1, index2)
            } else {
                break
            }
        }
    }
    let sorted = unsorted
    print(sorted)
  
    return sorted
}


fileprivate func selectionSort(intArray: [Int]) -> [Int] {
    
    var intArrayInOperation = intArray
    for indexCurrent in 0..<(intArrayInOperation.count - 1) {
        var indexMin = indexCurrent
        
        for x in (indexCurrent + 1)..<intArray.count {
            if intArrayInOperation[x] < intArrayInOperation[indexMin] {
                indexMin = x
            }
        }
        if indexMin != indexCurrent {
            let holder = intArrayInOperation[indexCurrent]
            intArrayInOperation.swapAt(indexCurrent, indexMin)
        }
    }
    print(intArrayInOperation)
    return intArrayInOperation
}


