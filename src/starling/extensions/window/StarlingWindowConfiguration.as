package starling.extensions.window {
	import flash.display.NativeWindowType;
	import flash.display.NativeWindowSystemChrome;
	import flash.display.NativeWindowInitOptions;
	import flash.display.NativeWindow;

	public class StarlingWindowConfiguration extends BaseStarlingWindowConfiguration{
		
		public var starlingConfiguration:StarlingConfiguration;

		internal var nativeWindowInitOptions: NativeWindowInitOptions;


		public function StarlingWindowConfiguration(starlingConfiguration:StarlingConfiguration, x: int = 0, y: int = 0, width: int = 550, height: int = 400, title: String = "",
		type: String = NativeWindowType.NORMAL,	systemChrome: String = NativeWindowSystemChrome.STANDARD, backgroundColor:uint = 0x0, resizable: Boolean = true, owner:NativeWindow = null, 
		minimizable: Boolean = true, maximizable: Boolean = true, maxWidth: int = -1, maxHeight: int = -1, minWidth: int = -1, minHeight: int = -1,	alwaysInFront: Boolean = true, 
		autoSizeStage: Boolean = true, autoActivate: Boolean = true) {			
			this.x = x, this.y = y, this.width = width, this.height = height, this.title = title, this.type = type, this.systemChrome = systemChrome, this.resizable = resizable,
			this.minimizable = minimizable, this.maximizable = maximizable, this.maxWidth = maxWidth, this.maxHeight = maxHeight, this.minHeight = minHeight, this.autoActivate = autoActivate, 
			this.starlingConfiguration = starlingConfiguration, this.id = this.starlingConfiguration.id, this.autoSizeStage = autoSizeStage, this.backgroundColor = backgroundColor, this.owner = owner;
			nativeWindowInitOptions = new NativeWindowInitOptions();
		}



	}

}