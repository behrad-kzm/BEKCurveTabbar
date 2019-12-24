
# BEKCurveTabbar
Full Customizable Tabbar with IBInspectables
<img src="https://github.com/behrad-kzm/BEKCurveTabbar/blob/master/Header.png">

[![CI Status](http://img.shields.io/travis/popwarsweet/JellySlider.svg?style=flat)](https://travis-ci.org/popwarsweet/JellySlider)
[![License](https://img.shields.io/cocoapods/l/JellySlider.svg?style=flat)](http://cocoapods.org/pods/JellySlider)
[![Platform](https://img.shields.io/cocoapods/p/JellySlider.svg?style=flat)](http://cocoapods.org/pods/JellySlider)

A fun replacement for UITabbar. The Component uses bezier paths.
## Demo
<img src="https://github.com/behrad-kzm/BEKCurveTabbar/blob/master/Preview.png" height="600"><img src="https://github.com/behrad-kzm/BEKCurveTabbar/blob/master/Preview2.png" height="600"><img src="https://github.com/behrad-kzm/BEKCurveTabbar/blob/master/Preview3.gif" height="600">

## Example

__usage:__

You can change appearance using xcode interface builder or use default config (recommended).
```BEKCurveTabbarController``` can setup with your custom ViewModel that confirms the ```BEKTabBarViewModelType``` protocol.
you can set your 'tabbar' to BEKCurveTabbar indide interface builder or initiate it programatically with easiest way as possible like this:
__Note:__ ```BEKCurveTabbarController``` initiates with ```.initiate()```

```swift

import BEKCurveTabbar
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        
        let firstViewController = UIViewController()
        firstViewController.view.backgroundColor = .red
        firstViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        let secondViewController = UIViewController()
        firstViewController.view.backgroundColor = .white
        secondViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        let thirdViewController = UIViewController()
        thirdViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        let tabBarViewController = BEKCurveTabbarController.instantiate()
        tabBarViewController.setViewControllers([firstViewController, secondViewController, thirdViewController], animated: true)
        
         guard let windowScene = (scene as? UIWindowScene) else { return }
         self.window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        //Make sure to do this else you won't get
        //the windowScene object using UIApplication.shared.connectedScenes
         self.window?.windowScene = windowScene
        window?.rootViewController = tabBarViewController
        window?.makeKeyAndVisible()
    }
}  

```

## Installation
```swift

  pod 'BEKCurveTabbar', :git => 'https://github.com/behrad-kzm/BEKCurveTabbar.git'

```


## Author
Behrad Kazemi, Behradkzm@gmail.com, bekapps.com
<a href="https://bekapps.com"> Visit Web Site </a>
## License

BEKCurveTabbar is available under the MIT license. See the LICENSE file for more info.
