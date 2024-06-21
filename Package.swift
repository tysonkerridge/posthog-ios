// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "PostHog",
    platforms: [
        .macOS(.v10_15), .iOS(.v12), .tvOS(.v13), .watchOS(.v6),
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "PostHog",
            targets: ["PostHog"]
        ),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/tysonkerridge/Quick.git", revision: "de176385321ad303415c2a3e0f7cdbadff84065a"),
        .package(url: "https://github.com/tysonkerridge/Nimble.git", revision: "e059623a425587eac671e618b2506a3d58d1a2f7"),
        .package(url: "https://github.com/AliSoftware/OHHTTPStubs.git", from: "9.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "PostHog",
            path: "PostHog",
            resources: [
                .copy("Resources/PrivacyInfo.xcprivacy"),
            ]
        ),
        .testTarget(
            name: "PostHogTests",
            dependencies: [
                "PostHog",
                "Quick",
                "Nimble",
                "OHHTTPStubs",
                .product(name: "OHHTTPStubsSwift", package: "OHHTTPStubs"),
            ],
            path: "PostHogTests"
        ),
    ]
)
