# Starling-Windows-Manager
Starling Windows Manager is an extension for Starling that simplifies the utilization of multiple windows without the headache of maintaining current starling instance.

Both primary StarlingWindow creation methods create their own starling instance. Configure the starling instance with StarlingConfiguration and configure the window using the StaringWindowConfiguration class.

# Important Notice: 
While possible to create auxiliary windows without the primary window utilizing starling, all usage of starling must be orchestrated with the StarlingWindowManager in order for it to operate correctly. Ensure that you create your primary window's starling instance with the the StarlingWindowManager class.

# Usage:
```actionscript
  //Create new StarlingWindow
	StarlingWindowsManager.createStaringWindow(new StarlingWindowConfiguration(new StarlingConfiguration("Main")).start();

  //Create new StarlingWindow from current stages NativeWindow
	StarlingWindowsManager.createStarlingFromWindow("Main", Sprite, stage.nativeWindow).start();

```
# Warning:
It is not recommended to use this version for production use. A stable version will be available shortly.
