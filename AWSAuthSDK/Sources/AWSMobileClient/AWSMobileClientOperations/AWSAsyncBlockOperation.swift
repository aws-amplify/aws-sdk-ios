import Foundation

enum AWSAsyncBlockState: String {
    case ready = "isReady"
    case executing = "isExecuting"
    case finished  = "isFinished"
    case cancelled = "isCancelled"
}

public typealias AWSAsyncBlockDoneClosure = () -> Void
public typealias AWSAsyncBlockClosure = (@escaping AWSAsyncBlockDoneClosure) -> Void

public class AWSAsyncBlockOperation: Operation {
    private let asyncBlock: AWSAsyncBlockClosure
    private var state: AWSAsyncBlockState = .ready

    public override var isReady: Bool {
        state == .ready
    }

    public override var isExecuting: Bool {
        state == .executing
    }

    public override var isFinished: Bool {
        state == .finished
    }

    public override var isCancelled: Bool {
        state == .cancelled
    }

    public init(asyncBlock: @escaping AWSAsyncBlockClosure) {
        self.asyncBlock = asyncBlock
        super.init()
    }

    public override var isAsynchronous: Bool { true }

    public override func start() {
        guard !isCancelled else { return }

        transition(to: .executing)

        let done: AWSAsyncBlockDoneClosure = { [weak self] in
            guard let self = self else { fatalError() }
            self.transition(to: .finished)
        }

        asyncBlock(done)
    }

    public override func cancel() {
        transition(to: .cancelled)
    }

    // handle KVO events before changing state
    private func transition(to newState: AWSAsyncBlockState) {
        guard state != newState else { return }

        willChangeValue(forKey: newState.rawValue)
        willChangeValue(forKey: state.rawValue)

        state = newState

        didChangeValue(forKey: state.rawValue)
        didChangeValue(forKey: newState.rawValue)
    }
}
