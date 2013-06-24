
## About
Small event handler for AS3. Gives you the ability to create, destroy, dispatch multiple or single events all at once.

## Utilises
- AS3

## Usage
Construct the Class as normal, if you're referencing the stage in a static form throughout your application, you can pass the stage value to the constructor.
```as3
	var _stage = stage;
    var super_event = new SuperEvents(_stage);
```

Create multiple events, or a single event by passing an object built up with an event reference (String), and its associated function
```as3
    // Create multiple events from one object, reference:String, function:Function
    var event_obj = {
    	"APP_LOADING": function():void
    	{
    		trace('The application is loading');
    	}, 
    	"APP_LOADED": function():void
    	{
    		trace('The application has loaded');
    	}
	}

	super_event.create_event(obj);
```