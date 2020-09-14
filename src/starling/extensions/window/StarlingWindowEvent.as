package starling.extensions.window {
	import starling.events.Event;
	
	public class StarlingWindowEvent extends Event {
		
		public static const STARLING_INIT:String = "starlingInit";
		public static const ACTIVATE:String = "activate";
		public static const CLOSE:String = "close";
		public static const CLOSING:String = "closing";
		public static const DEACTIVATE:String = "deactivate";
		public static const DISPLAY_STATE_CHANGE:String = "displayStateChange";
		public static const DISPLAY_STATE_CHANGING:String = "displayStateChanging";
		public static const MOVE:String = "move";
		public static const MOVING:String = "moving";
		public static const RESIZE:String = "resize";
		public static const RESIZING:String = "resizing";
		public static const ADDED:String = "added";
		public static const REMOVED:String = "removed";
		public function StarlingWindowEvent(type:String, bubbles:Boolean=false, data:Object = null)
        {
        	super(type, bubbles, data);
        
		}

	}
	
}
