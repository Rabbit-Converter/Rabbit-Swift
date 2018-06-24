# Rabbit-Swift

## Cocoapods 

Only iOS 8.0 or later

Add `pod 'Rabbit-Swift'` in Podfile

```
platform :ios, '8.0'
use_frameworks!

pod 'Rabbit-Swift'
```

and then `pod install`

You can use like

```swift
import Rabbit_Swift
```

```swift
Rabbit.zg2uni("Zawgyi To Unicode")
Rabbit.uni2zg("Unicode To Zawgyi")
```

### Carthage (iOS 8 or later)

For Carthage , please read [how to](https://github.com/Carthage/Carthage) use it , first.

In the `Cartfile` ,

```
github "Rabbit-Converter/Rabbit-Swft" >= 0.1.4
```
And then update the Carthage

```
carthage update
```

You can find the framework , under the `Carthage/Build/iOS/RabbitConverter.framework` . 

- Drag and Drop to yoru framwork. 
- Unselected the `Copy Item If Needed`

In the `Run Script` > `Input Files` , add

```
$(SRCROOT)/Carthage/Build/iOS/RabbitConverter.framework
```

In the code , you can call

```swift
import RabbitConverter
```
You can use like

```swift
Rabbit.zguni("Zawgyi Text")
Rabbit.uni2zg("Unicode Text")
```

## License
MIT
