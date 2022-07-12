import Foundation

/// Helper method that formats print output to console
///
/// - Parameters:
///   - description: Example description
///   - action: Example code
public func example(of description: String, action: () -> Void) {
    print("\n--- Example of:", description, "---")
    action()
}
