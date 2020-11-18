import Foundation
import UIKit
import AVFoundation

class SorsationViewController: UIViewController {
    var arrayForExperiment = [7, 1, 5, 3, 2, 9, 6, 8]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        
        insertionality(unsorted: &arrayForExperiment)
        selectionSort(intArray: arrayForExperiment)
    }
}


func insertionality(unsorted: inout[Int]) -> [Int] {
    
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


