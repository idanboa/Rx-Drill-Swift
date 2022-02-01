//
//  Throttler.swift
//  RxDrill
//
//  Created by Idan Boadana on 01/02/2022.
//

import Foundation

class Throttler: NSObject {
    private var task: DispatchWorkItem?

    func throttle(block: @escaping () -> Void) {
        task?.cancel()

        let task = DispatchWorkItem { block() }

        self.task = task

        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.3, execute: task)
    }
}
