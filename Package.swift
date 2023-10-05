// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Rabbit",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Rabbit",
            targets: ["Rabbit"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Rabbit"),
        .testTarget(
            name: "RabbitTests",
            dependencies: ["Rabbit"],
            resources: [
                    // Copy Tests/ExampleTests/Resources directories as-is.
                    // Use to retain directory structure.
                    // Will be at top level in bundle.
                    .copy("Resources/sample.json"),
            ])
       
    ]
)
