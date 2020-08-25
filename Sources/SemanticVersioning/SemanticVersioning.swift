import Foundation

public struct SemanticVersion: Comparable {
    public var string: String
    
    public init(string: String) {
        self.string = string
    }
    
    public var components: SemanticVersionComponents {
        makeComponents()
    }
    
    public static func < (lhs: SemanticVersion, rhs: SemanticVersion) -> Bool {
        lhs.components < rhs.components
    }
    
    public func isFullyCompatible(with other: SemanticVersion) -> Bool {
        self >= other
    }
    
    private func makeComponents() -> SemanticVersionComponents {
        var major: Int = 0
        var minor: Int = 0
        var patch: Int = 0
        
        let stringComponents = string
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .components(separatedBy: ".")
        
        if stringComponents.indices.contains(2) {
            let patchComponent = stringComponents[2]
            if let number = makeInteger(patchComponent) {
                patch = number
            }
        }
        
        if stringComponents.indices.contains(1) {
            let minorComponent = stringComponents[1]
            if let number = makeInteger(minorComponent) {
                minor = number
            }
        }
        
        if stringComponents.indices.contains(0) {
            let majorComponent = stringComponents[0]
            if let number = makeInteger(majorComponent) {
                major = number
            }
        }
        
        return .init(major: major, minor: minor, patch: patch)
    }
    
    private func makeInteger(_ string: String) -> Int? {
        guard let number = NumberFormatter().number(from: string) else { return nil }
        return Int(truncating: number)
    }
}

public struct SemanticVersionComponents: Equatable, Comparable {
    var major: Int
    var minor: Int
    var patch: Int
    
    public static func < (lhs: SemanticVersionComponents, rhs: SemanticVersionComponents) -> Bool {
        if lhs.major != rhs.major {
            return lhs.major < rhs.major
        } else if lhs.minor != rhs.minor {
            return lhs.minor < rhs.minor
        } else {
            return lhs.patch < rhs.patch
        }
    }
}
