package starling.extensions.window {
	import flash.display.NativeWindow;

	public class BaseStarlingWindowConfiguration implements IStarlingWindow {

		private var _id: String;
		private var _x: int;
		private var _y: int;
		private var _width: int;
		private var _height: int;
		private var _title: String;
		private var _type: String;
		private var _backgroundColor: uint;
		private var _resizable: Boolean;
		private var _minimizable: Boolean;
		private var _maximizable: Boolean;
		private var _systemChrome: String;
		private var _transparent: Boolean;
		private var _alwaysInFront: Boolean;
		private var _owner: NativeWindow;
		private var _maxWidth: int;
		private var _maxHeight: int;
		private var _minWidth: int;
		private var _minHeight: int;
		private var _visible: Boolean;
		private var _autoSizeStage: Boolean;
		private var _autoActivate: Boolean;

		public function get id(): String {
			return _id;
		}
		public function set id(id: String) {
			_id = id;
		}
		public function get x(): int {
			return _x;
		}
		public function set x(value: int): void {
			_x = value;
		}
		public function get y(): int {
			return _y;
		}
		public function set y(value: int): void {
			_y = value;
		}
		public function get width(): int {
			return _width;
		}
		public function set width(value: int): void {
			_width = value;
		}
		public function get height(): int {
			return _height;
		}
		public function set height(value: int): void {
			_height = value;
		}
		public function get title(): String {
			return _title;
		}
		public function set title(title: String): void {
			_title = title;
		}
		public function get type(): String {
			return _type;
		}
		public function set type(nativeWindowType: String): void {
			_type = nativeWindowType;
		}
		public function get backgroundColor(): uint {
			return _backgroundColor;
		}
		public function set backgroundColor(color: uint): void {
			_backgroundColor = color;
		}
		public function get resizable(): Boolean {
			return _resizable;
		}
		public function set resizable(bool: Boolean): void {
			_resizable = bool;
		}
		public function get minimizable(): Boolean {
			return _minimizable;
		}
		public function set minimizable(bool: Boolean): void {
			_minimizable = bool;
		}
		public function get maximizable(): Boolean {
			return _maximizable;
		}
		public function set maximizable(bool: Boolean): void {
			_maximizable = bool;
		}
		public function get systemChrome(): String {
			return _systemChrome;
		}
		public function set systemChrome(chrome: String): void {
			_systemChrome = chrome;
		}
		public function get transparent(): Boolean {
			return _transparent;
		}
		public function set transparent(bool: Boolean): void {
			_transparent = bool;
		}
		public function get alwaysInFront(): Boolean {
			return _alwaysInFront;
		}
		public function set alwaysInFront(bool: Boolean): void {
			_alwaysInFront = bool
		}
		public function get maxWidth(): int {
			return _maxWidth;
		}
		public function set maxWidth(value: int): void {
			_maxWidth = value;
		}
		public function get maxHeight(): int {
			return _maxHeight;
		}
		public function set maxHeight(value: int): void {
			_maxHeight = value;
		}
		public function get minWidth(): int {
			return _minWidth;
		}
		public function set minWidth(value: int): void {
			_minWidth = value;
		}
		public function get minHeight(): int {
			return _minHeight;
		}
		public function set minHeight(value: int): void {
			_minHeight = value;
		}
		public function get visible(): Boolean {
			return _visible;
		}
		public function set visible(value: Boolean): void {
			_visible = value;
		}
		public function get autoSizeStage(): Boolean {
			return _autoSizeStage;
		}
		public function set autoSizeStage(bool: Boolean): void {
			_autoSizeStage = bool;
		}
		public function get autoActivate(): Boolean {
			return _autoActivate;
		}
		public function set autoActivate(bool: Boolean): void {
			_autoActivate = bool;
		}

		public function get owner(): NativeWindow {
			return _owner;
		}
		public function set owner(nativeWindow: NativeWindow): void {
			_owner = nativeWindow;
		}

	}

}