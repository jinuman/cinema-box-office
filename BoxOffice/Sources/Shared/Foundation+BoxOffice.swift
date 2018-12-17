//
//  Foundation+BoxOffice.swift
//  BoxOffice
//
//  Created by Jinwoo Kim on 2018. 12. 17..
//  Copyright © 2018년 jinuman. All rights reserved.
//

import Foundation

extension Int {
    func withCommas() -> String {
        let nf = NumberFormatter()
        nf.numberStyle = NumberFormatter.Style.decimal
        return nf.string(from: NSNumber(value: self)) ?? "0"
    }
}
