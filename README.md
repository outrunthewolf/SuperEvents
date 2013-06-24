
## About
Small event handling class for AS3. Gives you the ability to create, destroy, dispatch multiple or single events all at once.

## Utilises
- AS3

## Usage
Construct the class as normal.
```as3
	var _stage = stage;
    var super_event = new SuperEvents();
```

Create multiple events, or a single event by passing an object built up with an:
- ref: "Event reference" (String)
- func: "Associated function" (Function)
- bind: "An object to bind the function to, a movieclip for example" **Optional**

```as3
    var event_obj = {
    	{
	    	ref: "APP_LOADING",
	    	func: function():void
	    	{
	    		trace('The application is loading');
	    	},
	    	bind: myMovieclip
    	},
    	{
	    	ref: "APP_LOADED",
	    	func: function():void
	    	{
	    		trace('The application has loaded');
	    	}
    	}
	}

	super_event.create_events(obj);
```
By default the class will attach events to the stage, but by using bind you can specify if the event is attached to anything



Dispatch multiple events, or a single event by passing an array of the event references
```as3
    var event_array = ["APP_LOADING", "APP_LOADED"];

	super_event.dispatch_events(event_array);
```

