# SaveManagerGd
 Save precisous 5 minutes of coding with this braindead easy save system


# Easy save system
SaveManager is a pre-coded saving system that is just a singleton providing useful signals and methods to save and load your games, or any data in general

## Capable os multi-saves
Since the save manager is just a reference to a file, you can name the file whatever you want to create multiple saves

![Multi Saving example](https://github.com/Visnicio/SaveManagerGd/blob/main/assets/SaveManager.gif)


# Docs

The save manager provides the following variables that can be customizable to your hearts content
```gdscript
@export var save_path_prefix: String = "user://"
@export var game_save_name: String = "game_save"
@export var save_format: String = ".dat"

# If you want to edit them in a more human way, just go to the singleton scene at addons/save_manager_gd/save_manager/save_manager.tscn
# There you will find this variables as exported variables
```

To save a game just simply call `SaveManager.save_game()`, and for loading games use `SaveManager.load_game()`
```gdscript
SaveManager.save_game()
SaveManager.load_game()

# Both of them use the parameterized variables to perfom the serialization actions, you can see more of that in the MultiSaving Example
```

To make your life easier, the `SaveManager` emits 3 important signals whenever any action took place there
```gdscript
signal game_loaded
signal game_saved
signal save_warned # Emmited when code tried to save on an existing save game, you can use it to display a message for the player asking if they want to override it
```
## Save Overriding
By default, the SaveManager will never override any save, if you want to override a save you must set the argument `override_save = true`
```gdscript
var should_override_save: bool = true # or false
SaveManager.save_game(should_override_save)
```

# Installation
Download this repo, and extract the addons folder to your godot project folder
go to `Project -> Project Settings -> Plugins` and activate SaveManager
the plugin will automatically add the singleton to your project

happy coding! :)
