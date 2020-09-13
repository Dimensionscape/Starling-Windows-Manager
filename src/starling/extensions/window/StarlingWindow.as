package starling.extensions.window  {
	import flash.display.NativeWindow;
	import flash.display.NativeWindowInitOptions;
	import flash.display.NativeWindowRenderMode;
	import flash.display.NativeWindowType;
	import starling.core.Starling;
	import flash.geom.Point;
	import starling.events.Event;
	import starling.display.DisplayObject;
	import flash.geom.Rectangle;

	public class StarlingWindow extends BaseStarlingWindow{
		internal var _starling:Starling;
		private var __nativeWindow:NativeWindow;

		public function get starling():Starling{
			return _starling;
		}
		public function StarlingWindow(starlingWindowConfiguration:StarlingWindowConfiguration) {
			if(starlingWindowConfiguration!=null) __fromConfiguration(starlingWindowConfiguration);
			//else __fromNativeWindow();
		}
		
		public static function fromNativeWindow(id:String, nativeWindow:NativeWindow):StarlingWindow{
			var starlingWindow:StarlingWindow = new StarlingWindow(null);
			starlingWindow.__nativeWindow = nativeWindow;			
			starlingWindow.id = id;
			return starlingWindow;
		}
		
		//private function __fromNativeWindow():void{
		//	
		//}
		
		private function __fromConfiguration(starlingWindowConfiguration:StarlingWindowConfiguration):void{
			__setNativeWindowInitOptions(starlingWindowConfiguration);
			__nativeWindow = new NativeWindow(starlingWindowConfiguration.nativeWindowInitOptions);
			__configureStarlingWindow(starlingWindowConfiguration);
			if(starlingWindowConfiguration.autoSizeStage)__nativeWindow.stage.addEventListener(Event.RESIZE, __onStageResize);
			__createStarling(starlingWindowConfiguration.starlingConfiguration);
		}
		
		private function __configureStarlingWindow(config:StarlingWindowConfiguration):void{
			__nativeWindow.alwaysInFront = config.alwaysInFront;
			__nativeWindow.width = config.width;
			__nativeWindow.height = config.height;			
			if(config.maxWidth>0||config.maxHeight>0) __nativeWindow.maxSize = new Point(config.maxWidth, config.maxHeight);
			if(config.minWidth>0||config.minHeight>0) __nativeWindow.minSize = new Point(config.minWidth, config.minHeight);
			__nativeWindow.title = config.title;
			__nativeWindow.x = config.x;
			__nativeWindow.y = config.y;
			__nativeWindow.visible = config.visible;
			__nativeWindow.stage.color = this.backgroundColor = config.backgroundColor;
			this.autoActivate = config.autoActivate;
		}
		
		private function __setNativeWindowInitOptions(config:StarlingWindowConfiguration):void{
			var options:NativeWindowInitOptions = config.nativeWindowInitOptions;
			options.maximizable = config.maximizable;
			options.minimizable = config.minimizable;
			options.renderMode = NativeWindowRenderMode.DIRECT;
			options.resizable = config.resizable;
			options.systemChrome = config.systemChrome;
			options.transparent = config.transparent;
			options.type = config.type;		
		}
		
		private function __createStarling(starlingConfiguration:StarlingConfiguration):void{			
			this._starling = new Starling(starlingConfiguration.rootClass, __nativeWindow.stage, starlingConfiguration.viewPort, starlingConfiguration.stage3D, starlingConfiguration.renderMode, starlingConfiguration.profile);
			this._starling.addEventListener(Event.ROOT_CREATED, __onStarlingRootCreated);
		}
		
		private function __onStarlingRootCreated(e:Event):void{		
			this._starling.stage.color = this.backgroundColor;
			if(this.autoActivate)__nativeWindow.activate();
			__onStageResize(null);
			
			
		}
		private function __onStageResize(e):void{
			
			if(_starling && __nativeWindow){
				_starling.stage.stageHeight = __nativeWindow.stage.stageHeight;
				_starling.viewPort = new Rectangle(0, 0, __nativeWindow.stage.stageWidth, __nativeWindow.stage.stageHeight);
			}
		}
	}
	
}
