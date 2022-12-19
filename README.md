# SwiftUICinematicUniverse

### Home View
##### Main view shows couple of first Marvel characters. 
#### Important! Infinite pagination is available. When last hero is shown, next set of characters is being fetched!
<p align="leading">
<img src="https://github.com/ogrodowski-tomasz/SwiftUICinematicUniverse/blob/main/Screenshots/main1.png" width=150>
<img src="https://github.com/ogrodowski-tomasz/SwiftUICinematicUniverse/blob/main/Screenshots/main2.png" width=150>
</p>

Tapping on one of them navigates to:
### Details View
##### Those are details of selected character. This view contains:
- Background color based on blurred thumbnail
- Thumbnail image of character
- Characters name
- Short desctription. This block is tappable. If description is long, user can toggle show number of lines. There are cases where description is not provided
- Comics with this character (Comic thumbnail image and title). Here also infinite pagination is available.

<p align="leading">
<img src="https://github.com/ogrodowski-tomasz/SwiftUICinematicUniverse/blob/main/Screenshots/details1.png" width=150>
<img src="https://github.com/ogrodowski-tomasz/SwiftUICinematicUniverse/blob/main/Screenshots/details2.png" width=150>
<img src="https://github.com/ogrodowski-tomasz/SwiftUICinematicUniverse/blob/main/Screenshots/details3.png" width=150>
<img src="https://github.com/ogrodowski-tomasz/SwiftUICinematicUniverse/blob/main/Screenshots/details4.png" width=150>
<img src="https://github.com/ogrodowski-tomasz/SwiftUICinematicUniverse/blob/main/Screenshots/details5.png" width=150>
</p>

What's more: during downloading data loading view is shown, as below:
<p align="leading">
<img src="https://github.com/ogrodowski-tomasz/SwiftUICinematicUniverse/blob/main/Screenshots/loadingDetails1.png" width=150>
</p>

#### Haven't found character You'd wanted to? Try going to:
### Search View
##### Type characters name into search field. 
<p align="leading">
<img src="https://github.com/ogrodowski-tomasz/SwiftUICinematicUniverse/blob/main/Screenshots/searchStart.png" width=150>
<img src="https://github.com/ogrodowski-tomasz/SwiftUICinematicUniverse/blob/main/Screenshots/searchResults1.png" width=150>
<img src="https://github.com/ogrodowski-tomasz/SwiftUICinematicUniverse/blob/main/Screenshots/searchResults2.png" width=150>
<img src="https://github.com/ogrodowski-tomasz/SwiftUICinematicUniverse/blob/main/Screenshots/searchResults3.png" width=150>
<img src="https://github.com/ogrodowski-tomasz/SwiftUICinematicUniverse/blob/main/Screenshots/searchResults4.png" width=150>
</p>

### How to install this app?

- Create account on <a href="https://developer.marvel.com">Marvel Developer webstite</a>
- Clone this repo.
- When You get the api keys, find file called `Constans.swift` and put your keys there.
```swift
let PUBLIC_API_KEY = "<PUBLIC API KEY HERE>"
let PRIVATE_API_KEY = "<PRIVATE API KEY HERE>"
```
- Enjoy!


### What's coming next?
Possible updates should contain 
- pull to refresh
- infinite scrolling (there are A LOT of characters in Marvel's database :P )
- pagination on comic books (some characters has 500+ comic books)
- comic details
