import Foundation

struct AppConstants
{
    private static let isFirstTimeAppLaunch = "isFirstTimeAppLaunch"
    static var isNotFirstTimeAppLaunchPersistent = UserDefaults.standard.bool(forKey: isFirstTimeAppLaunch){
        willSet{
            UserDefaults.standard.set(newValue, forKey: isFirstTimeAppLaunch)
            UserDefaults.standard.synchronize()
        }
    }
}
