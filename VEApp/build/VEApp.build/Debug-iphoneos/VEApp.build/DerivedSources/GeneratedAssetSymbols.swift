import Foundation
#if canImport(AppKit)
import AppKit
#endif
#if canImport(UIKit)
import UIKit
#endif
#if canImport(SwiftUI)
import SwiftUI
#endif
#if canImport(DeveloperToolsSupport)
import DeveloperToolsSupport
#endif

#if SWIFT_PACKAGE
private let resourceBundle = Foundation.Bundle.module
#else
private class ResourceBundleClass {}
private let resourceBundle = Foundation.Bundle(for: ResourceBundleClass.self)
#endif

// MARK: - Color Symbols -

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension DeveloperToolsSupport.ColorResource {

    /// The "BlackGrayColor" asset catalog color resource.
    static let blackGray = DeveloperToolsSupport.ColorResource(name: "BlackGrayColor", bundle: resourceBundle)

    /// The "greenColor" asset catalog color resource.
    static let green = DeveloperToolsSupport.ColorResource(name: "greenColor", bundle: resourceBundle)

    /// The "orangeColor" asset catalog color resource.
    static let orange = DeveloperToolsSupport.ColorResource(name: "orangeColor", bundle: resourceBundle)

    /// The "redColor" asset catalog color resource.
    static let red = DeveloperToolsSupport.ColorResource(name: "redColor", bundle: resourceBundle)

}

// MARK: - Image Symbols -

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension DeveloperToolsSupport.ImageResource {

    /// The "drawer-menu-icon" asset catalog image resource.
    static let drawerMenuIcon = DeveloperToolsSupport.ImageResource(name: "drawer-menu-icon", bundle: resourceBundle)

    /// The "halt" asset catalog image resource.
    static let halt = DeveloperToolsSupport.ImageResource(name: "halt", bundle: resourceBundle)

    /// The "idle" asset catalog image resource.
    static let idle = DeveloperToolsSupport.ImageResource(name: "idle", bundle: resourceBundle)

    /// The "notification-icon" asset catalog image resource.
    static let notificationIcon = DeveloperToolsSupport.ImageResource(name: "notification-icon", bundle: resourceBundle)

    /// The "running" asset catalog image resource.
    static let running = DeveloperToolsSupport.ImageResource(name: "running", bundle: resourceBundle)

    /// The "search-icon" asset catalog image resource.
    static let searchIcon = DeveloperToolsSupport.ImageResource(name: "search-icon", bundle: resourceBundle)

}

// MARK: - Color Symbol Extensions -

#if canImport(AppKit)
@available(macOS 14.0, *)
@available(macCatalyst, unavailable)
extension AppKit.NSColor {

    /// The "BlackGrayColor" asset catalog color.
    static var blackGray: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .blackGray)
#else
        .init()
#endif
    }

    #warning("The \"greenColor\" color asset name resolves to a conflicting NSColor symbol \"green\". Try renaming the asset.")

    #warning("The \"orangeColor\" color asset name resolves to a conflicting NSColor symbol \"orange\". Try renaming the asset.")

    #warning("The \"redColor\" color asset name resolves to a conflicting NSColor symbol \"red\". Try renaming the asset.")

}
#endif

#if canImport(UIKit)
@available(iOS 17.0, tvOS 17.0, *)
@available(watchOS, unavailable)
extension UIKit.UIColor {

    /// The "BlackGrayColor" asset catalog color.
    static var blackGray: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .blackGray)
#else
        .init()
#endif
    }

    #warning("The \"greenColor\" color asset name resolves to a conflicting UIColor symbol \"green\". Try renaming the asset.")

    #warning("The \"orangeColor\" color asset name resolves to a conflicting UIColor symbol \"orange\". Try renaming the asset.")

    #warning("The \"redColor\" color asset name resolves to a conflicting UIColor symbol \"red\". Try renaming the asset.")

}
#endif

#if canImport(SwiftUI)
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension SwiftUI.Color {

    /// The "BlackGrayColor" asset catalog color.
    static var blackGray: SwiftUI.Color { .init(.blackGray) }

    #warning("The \"greenColor\" color asset name resolves to a conflicting Color symbol \"green\". Try renaming the asset.")

    #warning("The \"orangeColor\" color asset name resolves to a conflicting Color symbol \"orange\". Try renaming the asset.")

    #warning("The \"redColor\" color asset name resolves to a conflicting Color symbol \"red\". Try renaming the asset.")

}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension SwiftUI.ShapeStyle where Self == SwiftUI.Color {

    /// The "BlackGrayColor" asset catalog color.
    static var blackGray: SwiftUI.Color { .init(.blackGray) }

}
#endif

// MARK: - Image Symbol Extensions -

#if canImport(AppKit)
@available(macOS 14.0, *)
@available(macCatalyst, unavailable)
extension AppKit.NSImage {

    /// The "drawer-menu-icon" asset catalog image.
    static var drawerMenuIcon: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .drawerMenuIcon)
#else
        .init()
#endif
    }

    /// The "halt" asset catalog image.
    static var halt: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .halt)
#else
        .init()
#endif
    }

    /// The "idle" asset catalog image.
    static var idle: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .idle)
#else
        .init()
#endif
    }

    /// The "notification-icon" asset catalog image.
    static var notificationIcon: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .notificationIcon)
#else
        .init()
#endif
    }

    /// The "running" asset catalog image.
    static var running: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .running)
#else
        .init()
#endif
    }

    /// The "search-icon" asset catalog image.
    static var searchIcon: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .searchIcon)
#else
        .init()
#endif
    }

}
#endif

#if canImport(UIKit)
@available(iOS 17.0, tvOS 17.0, *)
@available(watchOS, unavailable)
extension UIKit.UIImage {

    /// The "drawer-menu-icon" asset catalog image.
    static var drawerMenuIcon: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .drawerMenuIcon)
#else
        .init()
#endif
    }

    /// The "halt" asset catalog image.
    static var halt: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .halt)
#else
        .init()
#endif
    }

    /// The "idle" asset catalog image.
    static var idle: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .idle)
#else
        .init()
#endif
    }

    /// The "notification-icon" asset catalog image.
    static var notificationIcon: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .notificationIcon)
#else
        .init()
#endif
    }

    /// The "running" asset catalog image.
    static var running: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .running)
#else
        .init()
#endif
    }

    /// The "search-icon" asset catalog image.
    static var searchIcon: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .searchIcon)
#else
        .init()
#endif
    }

}
#endif

// MARK: - Thinnable Asset Support -

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
@available(watchOS, unavailable)
extension DeveloperToolsSupport.ColorResource {

    private init?(thinnableName: Swift.String, bundle: Foundation.Bundle) {
#if canImport(AppKit) && os(macOS)
        if AppKit.NSColor(named: NSColor.Name(thinnableName), bundle: bundle) != nil {
            self.init(name: thinnableName, bundle: bundle)
        } else {
            return nil
        }
#elseif canImport(UIKit) && !os(watchOS)
        if UIKit.UIColor(named: thinnableName, in: bundle, compatibleWith: nil) != nil {
            self.init(name: thinnableName, bundle: bundle)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}

#if canImport(AppKit)
@available(macOS 14.0, *)
@available(macCatalyst, unavailable)
extension AppKit.NSColor {

    private convenience init?(thinnableResource: DeveloperToolsSupport.ColorResource?) {
#if !targetEnvironment(macCatalyst)
        if let resource = thinnableResource {
            self.init(resource: resource)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}
#endif

#if canImport(UIKit)
@available(iOS 17.0, tvOS 17.0, *)
@available(watchOS, unavailable)
extension UIKit.UIColor {

    private convenience init?(thinnableResource: DeveloperToolsSupport.ColorResource?) {
#if !os(watchOS)
        if let resource = thinnableResource {
            self.init(resource: resource)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}
#endif

#if canImport(SwiftUI)
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension SwiftUI.Color {

    private init?(thinnableResource: DeveloperToolsSupport.ColorResource?) {
        if let resource = thinnableResource {
            self.init(resource)
        } else {
            return nil
        }
    }

}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension SwiftUI.ShapeStyle where Self == SwiftUI.Color {

    private init?(thinnableResource: DeveloperToolsSupport.ColorResource?) {
        if let resource = thinnableResource {
            self.init(resource)
        } else {
            return nil
        }
    }

}
#endif

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
@available(watchOS, unavailable)
extension DeveloperToolsSupport.ImageResource {

    private init?(thinnableName: Swift.String, bundle: Foundation.Bundle) {
#if canImport(AppKit) && os(macOS)
        if bundle.image(forResource: NSImage.Name(thinnableName)) != nil {
            self.init(name: thinnableName, bundle: bundle)
        } else {
            return nil
        }
#elseif canImport(UIKit) && !os(watchOS)
        if UIKit.UIImage(named: thinnableName, in: bundle, compatibleWith: nil) != nil {
            self.init(name: thinnableName, bundle: bundle)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}

#if canImport(AppKit)
@available(macOS 14.0, *)
@available(macCatalyst, unavailable)
extension AppKit.NSImage {

    private convenience init?(thinnableResource: DeveloperToolsSupport.ImageResource?) {
#if !targetEnvironment(macCatalyst)
        if let resource = thinnableResource {
            self.init(resource: resource)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}
#endif

#if canImport(UIKit)
@available(iOS 17.0, tvOS 17.0, *)
@available(watchOS, unavailable)
extension UIKit.UIImage {

    private convenience init?(thinnableResource: DeveloperToolsSupport.ImageResource?) {
#if !os(watchOS)
        if let resource = thinnableResource {
            self.init(resource: resource)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}
#endif

