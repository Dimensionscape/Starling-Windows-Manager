# Starling-Windows-Manager
Starling Windows Manager is an extension for Starling that simplifies the utilization of multiple windows without the headache of maintaining current starling instance.

Both primary StarlingWindow creation methods create their own starling instance. Configure the starling instance with StarlingConfiguration and configure the window using the StaringWindowConfiguration class.

Usage:
```actionscript
  //Create new StarlingWindow
	StarlingWindowsManager.createStaringWindow(new StarlingWindowConfiguration(new StarlingConfiguration("Main")).start();

  //Create new StarlingWindow from current stages NativeWindow
	StarlingWindowsManager.createStarlingFromWindow("Main", Director, stage.nativeWindow).start();

```
