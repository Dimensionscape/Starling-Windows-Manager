package starling.extensions.managers {
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
				if (overwrite) removeStarling(starlingWindow.id);
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
				if (overwrite) removeStarling(starlingWindow.id);
				starlingWindow._starling = new Starling(rootClass, nativeWindow.stage, viewPort);
				__starlingCollection.push((__starlingMap[id] = starlingWindow)._starling);
				if (onRootCreated != null) starlingWindow.starling.addEventListener(starling.events.Event.ROOT_CREATED, onRootCreated)
				if (onContextCreated != null) starlingWindow.starling.addEventListener(starling.events.Event.CONTEXT3D_CREATE, onContextCreated);
				if (__starlingCollection.length == 0) starlingWindow.starling.nativeStage.addEventListener(flash.events.Event.EXIT_FRAME, __onExitFrame);
			
			} else throw ("Duplicate Starling id is not allowed. Pass true as the overwrite argument to bypass.");
			return starlingWindow.starling;
		}
		
		public static function createStarling(id: String, rootClass: Class, stage: Stage, viewport: Rectangle = null, onContextCreated: Function = null, onRootCreated: Function = null, 
		overwrite: Boolean = false): Starling {

			if (__starlingMap[id] == undefined || overwrite) {
				if (overwrite) removeStarling(id);
				__starlingMap[id] = new Starling(rootClass, stage, viewport);
				if (onRootCreated != null) __starlingMap[id].addEventListener(starling.events.Event.ROOT_CREATED, onRootCreated)
				if (onContextCreated != null) __starlingMap[id].addEventListener(starling.events.Event.CONTEXT3D_CREATE, onContextCreated);
				if (__starlingCollection.length == 0) stage.addEventListener(flash.events.Event.EXIT_FRAME, __onExitFrame);
				__starlingCollection.push(__starlingMap[id]);
				return __starlingMap[id];
			} else throw ("Duplicate Starling id is not allowed. Pass true as the overwrite argument to bypass.");

		}

		public static function removeStarling(id: String): void {
			__starlingCollection.removeAt(__starlingCollection.indexOf(__starlingMap[id]));
			__starlingMap[id] = null;
			delete __starlingMap[id];
		}

		public static function setViewport(id: String, rect: Rectangle): void {

		}

		public static function setStageDimensions(stageWidth: int, stageHeight: int): void {

		}

		public static function makeCurrent(id: String): void {
			if (__starlingMap[id] != undefined) __starlingMap[id].makeCurrent();
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