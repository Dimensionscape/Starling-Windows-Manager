package starling.extensions.window {
	import starling.events.Event;
	import flash.geom.Rectangle;
	import flash.display.Sprite;
	import starling.core.Starling;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.display.NativeWindow;

	public class StarlingWindowsManager {

		private static var __starlingMap: Object = new Object();
		private static var __starlingCollection: Array = [];
		
		public static function createStaringWindow(starlingWindowConfiguration:StarlingWindowConfiguration, overwrite:Boolean = false):Starling{		
			var starlingWindow:StarlingWindow = new StarlingWindow(starlingWindowConfiguration);
			if(__starlingMap[starlingWindow.id] == undefined || overwrite){		
				if (overwrite) removeStarlingWindow(starlingWindow.id);
				__starlingMap[starlingWindow.id] = starlingWindow;	
				__starlingCollection.push(starlingWindow.starling);
				//if (starlingWindowConfiguration.starlingConfiguration.onRootCreated != null) starlingWindow.starling.addEventListener(starling.events.Event.ROOT_CREATED, onRootCreated)
				//if (onContextCreated != null) starlingWindow.starling.addEventListener(starling.events.Event.CONTEXT3D_CREATE, onContextCreated);
				if (__starlingCollection.length == 0) starlingWindow.starling.nativeStage.addEventListener(flash.events.Event.EXIT_FRAME, __onExitFrame);
			} else throw("Duplicate Starling id is not allowed. Pass true as the overwrite argument in order to bypass this error.");
			return starlingWindow.starling;
		}
		
		public static function createStarlingFromWindow(id:String, rootClass:Class, nativeWindow:NativeWindow, viewPort:Rectangle = null, onContextCreated:Function = null, 
		onRootCreated:Function = null, overwrite:Boolean = false):Starling{
			var starlingWindow:StarlingWindow = StarlingWindow.fromNativeWindow(id, nativeWindow); 
			if(__starlingMap[id] == undefined || overwrite){		
				if (overwrite) removeStarlingWindow(starlingWindow.id);
				starlingWindow._starling = new Starling(rootClass, nativeWindow.stage, viewPort);
				__starlingCollection.push((__starlingMap[id] = starlingWindow)._starling);
				if (onRootCreated != null) starlingWindow.starling.addEventListener(starling.events.Event.ROOT_CREATED, onRootCreated)
				if (onContextCreated != null) starlingWindow.starling.addEventListener(starling.events.Event.CONTEXT3D_CREATE, onContextCreated);
				if (__starlingCollection.length == 0) starlingWindow.starling.nativeStage.addEventListener(flash.events.Event.EXIT_FRAME, __onExitFrame);
			
			} else throw ("Duplicate Starling id is not allowed. Pass true as the overwrite argument to bypass.");
			return starlingWindow.starling;
		}		

		public static function removeStarlingWindow(id: String): void {
			if(StarlingWindow(__starlingMap[id])._starling.nativeStage.hasEventListener(flash.events.Event.EXIT_FRAME)) __starlingMap[id]._starling.nativeStage.removeEventListener(flash.events.Event.EXIT_FRAME, __onExitFrame);
			__starlingCollection.removeAt(__starlingCollection.indexOf(__starlingMap[id]._starling));
			__starlingMap[id] = null;
			delete __starlingMap[id];
			if (__starlingCollection.length == 0) __starlingCollection[0].addEventListener(flash.events.Event.EXIT_FRAME, __onExitFrame);

		}
		
		public static function getStarlingWindow(id:String):StarlingWindow{
			return __starlingMap[id];
		}
		
		public static function getStarlingWindowByStarling(starling:Starling):StarlingWindow{
			for each(var starlingWindow:StarlingWindow in __starlingMap){
				if(starlingWindow.starling === starling) return starlingWindow;
			}
			return null;
		}

		public static function setViewPort(id: String, rect: Rectangle): void {
			__starlingMap[id].staring.viewPort = rect;
		}

		public static function setStageDimensions(id:String, stageWidth: int, stageHeight: int): void {
			__starlingMap[id].starling.stage.stageWidth = stageWidth;
			__starlingMap[id].starling.stage.stageHeight = stageHeight;
		}

		public static function makeCurrent(id: String): void {
			if (__starlingMap[id] != undefined) __starlingMap[id].starling.makeCurrent();
		}

		private static function __onRootCreated(onRootCreated: Function, onRootCreatedFunction: Function = null): Function {
			return onRootCreatedFunction = function (e: starling.events.Event): void {
				e.currentTarget.removeEventListener(starling.events.Event.ROOT_CREATED, onRootCreatedFunction);
				e.currentTarget.removeEventListener(starling.events.Event.ROOT_CREATED, onRootCreated);
			}
		}

		private static function __onContextCreated(onRootCreated: Function, onContextCreatedFunction: Function = null): Function {
			return onContextCreatedFunction = function (e: starling.events.Event): void {
				e.currentTarget.removeEventListener(starling.events.Event.CONTEXT3D_CREATE, onContextCreatedFunction);
				e.currentTarget.removeEventListener(starling.events.Event.CONTEXT3D_CREATE, onRootCreated);
			}
		}

		private static function __onExitFrame(e: flash.events.Event) {
			var length:int = __starlingCollection.length;
			for(var i:int = 0; i< length; i++){
				__starlingCollection[i].makeCurrent();
			}
		}

	}

}