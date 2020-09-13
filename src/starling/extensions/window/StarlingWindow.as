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
		private var _nativeWindow:NativeWindow;

		public function get starling():Starling{
			return _starling;
		}
		
		public function get nativeWindow():NativeWindow{
			return _nativeWindow
		}
		public function StarlingWindow(starlingWindowConfiguration:StarlingWindowConfiguration) {
			if(starlingWindowConfiguration!=null) __fromConfiguration(starlingWindowConfiguration);
		}
		
		public static function fromNativeWindow(id:String, nativeWindow:NativeWindow):StarlingWindow{
			var starlingWindow:StarlingWindow = new StarlingWindow(null);
			starlingWindow._nativeWindow = nativeWindow;			
			starlingWindow.id = id;
			return starlingWindow;
		}
		
		override public function set alwaysInFront(bool:Boolean):void{
			super.alwaysInFront = _nativeWindow.alwaysInFront = bool;
			
		}
		
		private function __fromConfiguration(starlingWindowConfiguration:StarlingWindowConfiguration):void{
			__setNativeWindowInitOptions(starlingWindowConfiguration);
			_nativeWindow = new NativeWindow(starlingWindowConfiguration.nativeWindowInitOptions);
			__configureStarlingWindow(starlingWindowConfiguration);
			if(starlingWindowConfiguration.autoSizeStage)_nativeWindow.stage.addEventListener(Event.RESIZE, __onStageResize);
			__createStarling(starlingWindowConfiguration.starlingConfiguration);
		}
		
		private function __configureStarlingWindow(config:StarlingWindowConfiguration):void{
			this.id = config.starlingConfiguration.id;
			_nativeWindow.alwaysInFront = config.alwaysInFront;
			_nativeWindow.width = config.width;
			_nativeWindow.height = config.height;			
			if(config.maxWidth>0||config.maxHeight>0) _nativeWindow.maxSize = new Point(config.maxWidth, config.maxHeight);
			if(config.minWidth>0||config.minHeight>0) _nativeWindow.minSize = new Point(config.minWidth, config.minHeight);
			_nativeWindow.title = config.title;
			_nativeWindow.x = config.x;
			_nativeWindow.y = config.y;
			_nativeWindow.visible = config.visible;
			_nativeWindow.stage.color = this.backgroundColor = config.backgroundColor;
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
			this._starling = new Starling(starlingConfiguration.rootClass, _nativeWindow.stage, starlingConfiguration.viewPort, starlingConfiguration.stage3D, starlingConfiguration.renderMode, starlingConfiguration.profile);
			this._starling.addEventListener(Event.ROOT_CREATED, __onStarlingRootCreated);
		}
		
		private function __onStarlingRootCreated(e:Event):void{		
			this._starling.stage.color = this.backgroundColor;
			if(this.autoActivate)_nativeWindow.activate();
			__onStageResize(null);
			
			
		}
		private function __onStageResize(e):void{
			
			if(_starling && _nativeWindow){
				_starling.stage.stageHeight = _nativeWindow.stage.stageHeight;
				_starling.viewPort = new Rectangle(0, 0, _nativeWindow.stage.stageWidth, _nativeWindow.stage.stageHeight);
			}
		}
	}
	
}
