import PBXProj

@testable import pbxproject_targets

// MARK: - Generator.CalculateSingleTargetAttributes.mock

extension Generator.CreateTargetAttributesElement {
    final class MockTracker {
        struct Called: Equatable {
            let createdOnToolsVersion: String
            let testHostIdentifier: String?
        }

        fileprivate(set) var called: [Called] = []

        fileprivate var results: [String]

        init(results: [String]) {
            self.results = results.reversed()
        }

        func nextResult() -> String {
            guard let result = results.popLast() else {
                preconditionFailure("Called too many times")
            }
            return result
        }
    }

    static func mock(contents: [String]) -> (mock: Self, tracker: MockTracker) {
        let mockTracker = MockTracker(results: contents)

        let mocked = Self(
            callable: { createdOnToolsVersion, testHostIdentifier in
                mockTracker.called.append(.init(
                    createdOnToolsVersion: createdOnToolsVersion,
                    testHostIdentifier: testHostIdentifier
                ))
                return mockTracker.nextResult()
            }
        )

        return (mocked, mockTracker)
    }
}
