//
//  GetCharacters.swift
//  Article
//
//  Created by WYNOT-MAC on 26/03/19.
//  Copyright © 2019 WYNOT-MAC. All rights reserved.
//

import Foundation


extension DefaultBidirectionalIndices {
    subscript(at: Int) -> Elements.Index {
        return index(startIndex, offsetBy: at)
    }
}

// Moving the index(_:offsetBy:) to an extension yields slightly
// briefer implementations for these String extensions.
extension String {
    subscript(r: CountableClosedRange<Int>) -> SubSequence {
        return self[indices[r.lowerBound]...indices[r.upperBound]]
    }
    subscript(r: CountablePartialRangeFrom<Int>) -> SubSequence {
        return self[indices[r.lowerBound]...]
    }
    subscript(r: PartialRangeThrough<Int>) -> SubSequence {
        return self[...indices[r.upperBound]]
    }
    subscript(r: PartialRangeUpTo<Int>) -> SubSequence {
        return self[..<indices[r.upperBound]]
    }
}


extension String
{
    func getInitialText() -> String
    {
        return components(separatedBy: " ").compactMap({ splitText -> String? in
            if let first = splitText.first {
                return "\(first)"
            }
            return nil
        }).joined()
    }
}
