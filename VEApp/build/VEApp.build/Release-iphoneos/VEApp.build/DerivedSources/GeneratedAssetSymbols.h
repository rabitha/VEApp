#import <Foundation/Foundation.h>

#if __has_attribute(swift_private)
#define AC_SWIFT_PRIVATE __attribute__((swift_private))
#else
#define AC_SWIFT_PRIVATE
#endif

/// The resource bundle ID.
static NSString * const ACBundleID AC_SWIFT_PRIVATE = @"com.VE.VEApp";

/// The "BlackGrayColor" asset catalog color resource.
static NSString * const ACColorNameBlackGrayColor AC_SWIFT_PRIVATE = @"BlackGrayColor";

/// The "greenColor" asset catalog color resource.
static NSString * const ACColorNameGreenColor AC_SWIFT_PRIVATE = @"greenColor";

/// The "orangeColor" asset catalog color resource.
static NSString * const ACColorNameOrangeColor AC_SWIFT_PRIVATE = @"orangeColor";

/// The "redColor" asset catalog color resource.
static NSString * const ACColorNameRedColor AC_SWIFT_PRIVATE = @"redColor";

/// The "drawer-menu-icon" asset catalog image resource.
static NSString * const ACImageNameDrawerMenuIcon AC_SWIFT_PRIVATE = @"drawer-menu-icon";

/// The "halt" asset catalog image resource.
static NSString * const ACImageNameHalt AC_SWIFT_PRIVATE = @"halt";

/// The "idle" asset catalog image resource.
static NSString * const ACImageNameIdle AC_SWIFT_PRIVATE = @"idle";

/// The "notification-icon" asset catalog image resource.
static NSString * const ACImageNameNotificationIcon AC_SWIFT_PRIVATE = @"notification-icon";

/// The "running" asset catalog image resource.
static NSString * const ACImageNameRunning AC_SWIFT_PRIVATE = @"running";

/// The "search-icon" asset catalog image resource.
static NSString * const ACImageNameSearchIcon AC_SWIFT_PRIVATE = @"search-icon";

#undef AC_SWIFT_PRIVATE
