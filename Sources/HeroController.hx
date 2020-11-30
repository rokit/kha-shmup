package;

import kha.input.KeyCode;
import kha.input.Keyboard;
import kha.input.Surface;

class HeroController {
	public var left:Bool;
	public var right:Bool;
	public var up:Bool;
	public var down:Bool;
	public var x:Int;
	public var y:Int;
	public var firing:Bool;

	public function new() {
		Keyboard.get().notify(keyDown, keyUp);
	}

	public function keyDown(key:KeyCode) {
		switch (key) {
			case KeyCode.Left:
				left = true;
			case KeyCode.Right:
				right = true;
			case KeyCode.Up:
				up = true;
			case KeyCode.Down:
				down = true;
			case KeyCode.Z:
				firing = true;
			default:
				// no-op
		}
	}

	public function keyUp(key:KeyCode) {
		switch (key) {
			case KeyCode.Left:
				left = false;
			case KeyCode.Right:
				right = false;
			case KeyCode.Up:
				up = false;
			case KeyCode.Down:
				down = false;
			case KeyCode.Z:
				firing = false;
			default:
				// no-op
		}
	}

	public function reset() {
		left = false;
		right = false;
		up = false;
		down = false;
		firing = false;
	}
}
