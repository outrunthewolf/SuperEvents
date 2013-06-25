package 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author outrunthewolf
	 */
	public class SuperEvents 
	{
		private var _stage:Stage = stage;
		private var _events:Object;

		// Construct the class, pass the stage value if
		public function SuperEvents():void
		{
			
		}

		public function set_stage(stg:DisplayObject):void
		{
			this._stage = stg;
		}
		
		// Create multiple events from an object
		public function create_events(obj:Object):void
		{
			var bound = this._stage
			for (var i:* in obj)
			{
				if(obj[i].bind) bound = obj[i].bind;

				bound.addEventListener(i, function obj[i].func, false, 0, false);
				this._events[i] = obj[i];
			}
		}
		
		// Fire a single event / multiple events
		public function fire_events(arr:Array):void
		{
			dispatchEvent(new Event(str));
		}
		
		// clear a single event / multiple events
		public function clear_events(str:String):void
		{
			var bound = this._stage
			for (var i:* in obj)
			{
				if(obj[i].bind) bound = obj[i].bind;

				this._stage.removeEventListener(i, {obj[i]});
			}
		}

		// flush all events on the stage
		public function flush_events():void
		{

		}
	}
	
}