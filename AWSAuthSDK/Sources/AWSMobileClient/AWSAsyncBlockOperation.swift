import Foundation

enum AsyncBlockState: String {
    case ready = "isReady"
    case executing = "isExecuting"
    case finished  = "isFinished"
    case cancelled = "isCancelled"
}

typealias AsyncBlockDoneClosure = () -> Void
typealias AsyncBlockClosure = (@escaping AsyncBlockDoneClosure) -> Void

class AsyncBlockOperation: Operation {
    let asyncBlock: AsyncBlockClosure

    var state: AsyncBlockState = .ready

    // handle KVO events before changing state
    func transition(to newState: AsyncBlockState) {
        guard state != newState else { return }

        willChangeValue(forKey: newState.rawValue)
        willChangeValue(forKey: state.rawValue)

        state = newState

        didChangeValue(forKey: newState.rawValue)
        didChangeValue(forKey: state.rawValue)
    }

    override var isReady: Bool {
        state == .ready
    }

    override var isExecuting: Bool {
        state == .executing
    }

    override var isFinished: Bool {
        state == .finished
    }

    override var isCancelled: Bool {
        state == .cancelled
    }

    init(asyncBlock: @escaping AsyncBlockClosure) {
        self.asyncBlock = asyncBlock
        super.init()
    }

    override var isAsynchronous: Bool { true }

    override func start() {
        guard !isCancelled && isReady else {
            return
        }
        main()
    }

    override func main() {
        guard !isCancelled else { return }

        transition(to: .executing)

        let done: AsyncBlockDoneClosure = { [weak self] in
            guard let self = self else { fatalError() }
            self.transition(to: .finished)
        }

        asyncBlock(done)
    }

    override func cancel() {
        transition(to: .cancelled)
    }
}
