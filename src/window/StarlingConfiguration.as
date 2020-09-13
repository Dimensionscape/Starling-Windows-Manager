package starling.extensions.managers {
	import starling.core.Starling;
	import starling.display.Sprite;
	import flash.geom.Rectangle;
	import flash.display.Stage3D;
	
	public class StarlingConfiguration {
		public var id:String;
		public var rootClass:Class;
		public var viewPort:Rectangle;
		public var stage3D:Stage3D;
		public var renderMode:String;
		public var profile:Object;
		public function StarlingConfiguration(id:String, rootClass:Class = null, viewPort: Rectangle = null, stage3D: Stage3D = null, renderMode:String = "auto",	profile:Object = "auto") {
			this.rootClass = rootClass, this.viewPort = viewPort, this.stage3D = stage3D, this.renderMode = renderMode, this.profile = profile, this.id = id;
			if(rootClass == null) this.rootClass = Sprite;
		}

	}
	
}
