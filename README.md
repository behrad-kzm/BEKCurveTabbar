
# BEKCurveTabbar
Full Customizable Tabbar with IBInspectables
<img src="https://github.com/behrad-kzm/BEKDesing/blob/master/Images/BEKHeader.png">

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
you can set your 'tabbar' to BEKCurveTabbar inside interface builder or initiate it programatically with easiest way as possible like this:

__Note:__ ```BEKCurveTabbarController``` initiates with ```.initiate()```


__Default Config Usage:__

```swift
        //Initiate your viewControllers
        let firstViewController = UIViewController()
        firstViewController.view.backgroundColor = .red
        firstViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        let secondViewController = UIViewController()
        firstViewController.view.backgroundColor = .white
        secondViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        let thirdViewController = UIViewController()
        thirdViewController.view.backgroundColor = .blue
        thirdViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 2)
        
        //get instance of BEKCurveTabbarController
        let tabBarViewController = BEKCurveTabbarController.instantiate()
        
        //set viewControllers to the tabbar
        tabBarViewController.setViewControllers([firstViewController, secondViewController, thirdViewController], animated: true)

```



__Customized Config Usage:__

Create a new struct that confirms ```BEKTabBarViewModelType``` :

```swift
struct MyCustomTabBarViewModel: BEKTabBarViewModelType {
    let heightRatio: CGFloat = CGFloat(TabbarHeightRatios.bestSize.rawValue)
    let containerColor: UIColor = .white
    let hideTitle: Bool = false
    let animationDuration: CGFloat = 0.3
    let animated: Bool = true
    let shadowColor: UIColor = UIColor(red: 0.353, green: 0.784, blue: 1, alpha: 1.0)
    let shadowRadius: CGFloat = 16
    let containerBorderWidth: CGFloat = 1.0
    let containerBorderColor: UIColor = .gray
    let selectedTextColor: UIColor = .yellow
    let selectedTextFont: UIFont = .systemFont(ofSize: 13)
    let normalTextColor: UIColor = .lightGray
    let normalTextFont: UIFont = .systemFont(ofSize: 11)
    let topCornerRadius: CGFloat = TabbarHeightRatios.bestSize.cornerRadius()
    let bottomCornerRadius: CGFloat = 0
    let containerInsets: UIEdgeInsets = TabbarHeightRatios.bestSize.containerInsets()
    let selectionCircleRadius: CGFloat = TabbarHeightRatios.bestSize.circleRadius()
    let selectionCircleBorderWidth: CGFloat = 0.0
    let selectionCircleBorderColor: UIColor = .clear
    let selectionCircleBackgroundColor: UIColor = UIColor(red: 0.353, green: 0.784, blue: 1, alpha: 1.0)
    let textOffset: CGFloat = 0
    init() {}
}

```

__Note:__ ```TabbarHeightRatios.bestSize``` provides you computed values for different iOS environments. (recommended)

Now you just need to pass your viewModel to ```.setupViewModel(viewModel: BEKTabBarViewModelType)``` function.

```swift
        //1- Initiate your viewControllers
        let firstViewController = UIViewController()
        firstViewController.view.backgroundColor = .red
        firstViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        let secondViewController = UIViewController()
        firstViewController.view.backgroundColor = .white
        secondViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        let thirdViewController = UIViewController()
        thirdViewController.view.backgroundColor = .blue
        thirdViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 2)
        
        //2- get instance of BEKCurveTabbarController
        let tabBarViewController = BEKCurveTabbarController.instantiate()
        
        //3- Config your own TabBar ViewModel
        let myViewModel = MyCustomTabBarViewModel()
        
        //4- setup TabBar Controller with you viewModel
        tabBarViewController.setupViewModel(viewModel: myViewModel)
        
        //5- set viewControllers to the tabbar
        tabBarViewController.setViewControllers([firstViewController, secondViewController, thirdViewController], animated: true)
        return tabBarViewController
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
