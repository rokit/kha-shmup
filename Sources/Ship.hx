package;

import kha.Image;
import kha.graphics2.Graphics;
import kha.math.Vector2;

class Ship {
	private var image:Image;
	private var controller:HeroController;

	private var pos:Vector2 = new Vector2(0, 0);

	public function new(x:Int, y:Int, image:Image) {
		pos.x = x;
		pos.y = y;
		this.image = image;
		this.controller = new HeroController();
	}

	public function tick() {
		var newDir = new Vector2(0, 0);
		if (controller.left) {
			newDir.x -= 1;
		}
		if (controller.right) {
			newDir.x += 1;
		}
		if (controller.up) {
			newDir.y -= 1;
		}
		if (controller.down) {
			newDir.y += 1;
		}
		var normNewDir = newDir.normalized();
		pos = pos.add(normNewDir);
		constrain();
	}

	public function constrain() {
		// limit the ship to the width of the screen
		if (pos.x < 0) {
			pos.x = 0;
		} else if (pos.x + image.width > 800) {
			pos.x = 800 - image.width;
		}

		// limit the ship to the height of the screen
		if (pos.y < 0) {
			pos.y = 0;
		} else if (pos.y + image.height > 600) {
			pos.y = 600 - image.height;
		}
	}

	public function render(g:Graphics) {
		g.drawImage(image, pos.x, pos.y);
	}
}
