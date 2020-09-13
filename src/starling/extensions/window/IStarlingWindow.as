package starling.extensions.window {

	public interface IStarlingWindow {
		function get id(): String;
		function set id(id:String);
		function get x(): int;
		function set x(value:int):void;
		function get y(): int;
		function set y(value:int):void;
		function get width(): int;
		function set width(value:int):void;
		function get height(): int;
		function set height(value:int):void;
		function get title(): String;
		function set title(title:String):void
		function get type(): String;
		function set type(nativeWindowType:String):void;
		function get backgroundColor(): uint;
		function set backgroundColor(color:uint):void;
		function get resizable(): Boolean;
		function set resizable(bool:Boolean):void;
		function get minimizable(): Boolean;
		function set minimizable(bool:Boolean):void;
		function get maximizable(): Boolean;
		function set maximizable(bool:Boolean):void;
		function get systemChrome(): String;
		function set systemChrome(chrome:String):void;
		function get transparent(): Boolean;
		function set transparent(bool:Boolean):void;
		function get alwaysInFront(): Boolean;
		function set alwaysInFront(bool:Boolean):void;
		function get maxWidth(): int;
		function set maxWidth(value:int):void;
		function get maxHeight(): int;
		function set maxHeight(value:int):void;
		function get minWidth(): int;
		function set minWidth(value:int):void;
		function get minHeight(): int;
		function set minHeight(value:int): void;
		function get visible(): Boolean;
		function set visible(value:Boolean):void;
		function get autoSizeStage(): Boolean;
		function set autoSizeStage(bool:Boolean):void;
		function get autoActivate(): Boolean;
		function set autoActivate(bool:Boolean):void;
	}

}