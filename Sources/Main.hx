package;

import kha.Assets;
import kha.Framebuffer;
import kha.Scheduler;
import kha.System;

class Main {
	static function update():Void {}

	static function render(framebuffer:Framebuffer):Void {}

	public static function main() {
		System.start({title: "KhaShmup", width: 800, height: 600}, function(_) {
			// Just loading everything is ok for small projects
			Assets.loadEverything(function() {
				var game = new KhaShmup();
				// Avoid passing update/render directly,
				// so replacing them via code injection works
				Scheduler.addTimeTask(function() {
					game.tick();
				}, 0, 1 / 60);
				System.notifyOnFrames(function(framebuffers) game.render(framebuffers[0]));
			});
		});
	}
}
