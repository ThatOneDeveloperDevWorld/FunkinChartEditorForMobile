package debug;

import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.system.System;
import openfl.events.Event;

class FPSCounter extends TextField {
	var times:Array<Float>;

	public function new(x:Float = 10, y:Float = 10, color:Int = 0xFFFFFF) {
		super();
		this.x = x;
		this.y = y;
		this.selectable = false;
		this.mouseEnabled = false;
		this.defaultTextFormat = new TextFormat("_sans", 12, color);
		this.text = "FPS: ";
		
		times = [];
		addEventListener(Event.ENTER_FRAME, onEnter);
	}

	function onEnter(e:Event):Void {
		var now = haxe.Timer.stamp() * 1000;
		times.push(now);
		
		while (times[0] < now - 1000) {
			times.shift();
		}

		var currentFPS = times.length;
		var mem = Math.round(System.totalMemory / 1024 / 1024 * 100) / 100;

		text = "FPS: " + currentFPS + " | MEM: " + mem + " MB";
	}
}
