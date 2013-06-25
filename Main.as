package 
{
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.display.NativeMenu;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.sampler.NewObjectSample;
	import utils.Debug;
	
	/**
	 * ...
	 * @author Christopher Roach
	 */
	public class Main extends Sprite 
	{
		// Static variables
		
		//public static var controls:Controls;
		public static var _stage:Object;
		public static var slides:Object = { };
		public static var menu:Menu = new Menu();
		public static var assets:Assets = new Assets();
		public static var preloader:PreLoader = new PreLoader();
		public static var events:SysEvents = new SysEvents();
		public static var controls:Controls = new Controls();
		
		// Project name controls
		public static const project:String = 'dga';
		
		// Framerate controls
		private const _framerate:int = 30;
		
		// Main initialiser
		public function Main():void 
		{
			// Enable debug
			Debug.Enabled = false;
			
			// load stage
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			// Remove stage init
			removeEventListener(Event.ADDED_TO_STAGE, init);

			// Set static stage variable
			Main._stage = stage;
			Main._stage.frameRate = this._framerate;
			
			var events_object = {
				// Preloader
				"PRELOADER_STARTED": function():Function { // called when preloader is started
					return function fn(_e:Event):void
					{
						assets.load_config(); // begin loading the config file
					}
				},
				"CONFIG_LOADED": function():Function { // called when the configuration file is loaded and parsed
					return function fn(_e:Event):void
					{
						assets.load_slides(); // load all slides from the config file
						controls.init(); // initialise the controls
						menu.render_menu(); // Renders the slideshow menu with a list of all the modules
						menu.render_controls(); // renders the popup controls that overlay over slides
					}
				},
				"PRELOADER_FINISHED": function():Function { // Once the preloader is finished and removed, show the menu onscreen
					return function fn(_e:Event):void
					{
						Main._stage.addChild(menu.menu); // show the menu onscreen
						Assets.slides.menu.mc.play(); // Play the menu
						Debug.log(this);
					}
				},
				"MENU_LOADED": function():Function { // called when menu rendering is complete
					return function fn(_e:Event):void
					{
						preloader.system_loaded(_e); // shut down the preloader
					}
				}
			};
			
			// Hook all events
			events.hook_events(events_object);
			
			// Start the preloader
			preloader.init();
		}
	}
}