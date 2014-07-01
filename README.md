SwiftTeamSelect
===============

[Swift](https://developer.apple.com/swift/) implementation of [SpriteKit](https://developer.apple.com/library/ios/documentation/GraphicsAnimation/Conceptual/SpriteKit_PG/Introduction/Introduction.html) SKScene with scrollable team selection.

![Animation of scrollable selection](https://raw.githubusercontent.com/burczyk/SwiftTeamSelect/master/assets/SwiftTeamSelect.gif)

My previous project [Flappy Football: Brasil Edition](https://itunes.apple.com/us/app/flappy-football-brasil-edition/id886571229?mt=8) made for UK customer had a screen with team selection.

It was a SpriteKit scene so I programmed it as draggable Sprites in Objective-C.

Now, when Swift gains more and more hype and it's time to practice some real code I decided to rewrite that solution in Swift and make it public :)

### Main concept

The whole scene works like a horizontal UIScrollView (but it's written purely in SpriteKit!) with one difference - while item moves to the center it becomes bigger.
There are 2 guides `leftGuide` and `rightGuide` which are minimum and maximum `x` value for moving Sprite. There is also third implicit guide which is half of the screen's width - center player is placed on that position while it's neighbours are arranged on both sides.

#### Scale computation

Proper scale is calculated by method 

```
func calculateScaleForX(x:CGFloat) -> CGFloat
``` 

It returns scale from `(0.5..1)` range based on simple assumptions:

* if Sprite's position becomes smaller or equal to `leftGuide` return 0.5,
* if Sprite's position becomes greater or equal to `rightGuide` return 0.5,
* otherwise calculate value from `(0.5..1)` range based on distance from the center of the screen.

Our scale function can be seen like this in mathematical sense, where collapse points are three guides described above:

```
      ^
____/   \____


```

#### Players' depth
To achieve behavior when center player covers it's neighbours when scrolling I used `zIndex` property of `SKSpriteNode` class. 

Method

```
func calculateZIndexesForPlayers()
```

calculates them increasingly from 0 to centerPlayer and then backwards.
In the beginning we start e.g. with zIndexes: `[0,1,2,3,2,1,0]`. If we move center player to the left they become `[0,1,2,1,0,-1,-2]` and centerPlayer is still on top and it can cover it's neighbours when dragged.

#### Scrolling
All real scrolling takes place in two methods:

```
override func touchesMoved(touches: NSSet!, withEvent event: UIEvent!)
override func touchesEnded(touches: NSSet!, withEvent event: UIEvent!)
```

First one is responsible for dragging Sprite when we move our finger on the screen.
It calculates translation for each movement and calls helper method.


`touchesEnded` is responsible for pulling each player to appropriate guide based on it's position when touch stops - when this method finishes all players are placed on `leftGuide`, screen center or `rightGuide`.

Both `touches*` methods use `SKActions` to make animations smooth.

#### Usage and adoption

For implementation details check [GameScene.swift](https://github.com/burczyk/SwiftTeamSelect/blob/master/SwiftTeamSelect/GameScene.swift) - it is complete `SKScene` subclass that you can use in your project.
If you change method `func createPlayers()` to your implementation of Sprites with textures instead of colored rectangles it can become even more interesting ;)

#### FlatUI colors
When drawing Sprites I used [FlatUI](http://flatuicolors.com/) colors.
[UIColor+Shorthands.swift](https://github.com/burczyk/SwiftTeamSelect/blob/master/SwiftTeamSelect/UIColor%2BShorthands.swift) file is an extension to `UIColor` class that adds all colors from that site as convenience methods:

```
UIColor.turquoise()
UIColor.emerald()
UIColor.peterRiver()
UIColor.amethyst()
UIColor.wetAsphalt()
UIColor.greenSea()
UIColor.nephritis()
UIColor.belizeHole()
UIColor.wisteria()
UIColor.midnightBlue()
UIColor.sunFlower()
UIColor.carrot()
UIColor.alizarin()
UIColor.clouds()
UIColor.concrete()
UIColor.orange()
UIColor.pumpkin()
UIColor.pomegranate()
UIColor.silver()
UIColor.asbestos()
```

It also adds [convenience initializer](https://developer.apple.com/library/prerelease/ios/documentation/swift/conceptual/swift_programming_language/Initialization.html) to `UIColor` so it can be initialized with `(0...255)` ints instead of `(0...1.0)` floats, e.g. `UIColor(26, 188, 156)` gives us Turquoise color.

#### License
**SwiftTeamSelect** is available under the MIT license. See the LICENSE file for more info.
