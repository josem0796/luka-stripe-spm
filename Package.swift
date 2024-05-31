// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LukaStripeSDK",
    platforms: [
            .iOS(.v13)
        ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "LukaStripeSDK",
            targets: ["LukaStripeSDK"]),
    ],
    dependencies: [
      .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.9.1")),
      .package(url: "https://github.com/stripe/stripe-ios-spm", .upToNextMajor(from: "23.27.2"))
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "LukaStripeSDK",
            dependencies: [
              .product(name: "Alamofire", package: "Alamofire"),
              .product(name: "Stripe", package: "stripe-ios-spm"),
              .product(name: "StripeApplePay", package: "stripe-ios-spm"),
              .product(name: "StripeCardScan", package: "stripe-ios-spm"),
              .product(name: "StripeIdentity", package: "stripe-ios-spm"),
              .product(name: "StripeFinancialConnections", package: "stripe-ios-spm"),
              .product(name: "StripePaymentSheet", package: "stripe-ios-spm"),
              .product(name: "StripePayments", package: "stripe-ios-spm"),
              .product(name: "StripePaymentsUI", package: "stripe-ios-spm")
            ],
            resources: [
              .copy("Assets/payco2024.crt")
            ]
        ),
        .testTarget(
            name: "LukaStripeSDKTests",
            dependencies: ["LukaStripeSDK"]),
    ]
)
