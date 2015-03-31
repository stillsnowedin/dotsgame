package dotsGame.models {
	import dotsGame.views.Grid;
	import dotsGame.views.Specs;
	import dotsGame.views.Status;
	import dotsGame.views.Victory;

	import flash.display.Sprite;
	import flash.utils.Dictionary;
	
	public class ActiveViews {
		private const STATUS:String = "STATUS";
		private const SPECS:String = "SPECS";
		private const GRID:String = "GRID";
		private const VICTORY:String = "VICTORY";
		private var activeViews:Dictionary;
		
		public function ActiveViews():void {
			activeViews = new Dictionary();
		}
		
		public function getStatus():Sprite {
			return get(STATUS, Status);
		}
		
		public function getSpecs():Sprite {
			return get(SPECS, Specs);
		}
		
		public function getGrid():Sprite {
			return get(GRID, Grid);
		}
		
		public function getVictory():Sprite {
			return get(VICTORY, Victory);
		}
		
		private function get(name:String, type:Class):Sprite {
			if (activeViews[name] == null) {
				addNew(name,  type);
			}	
			return activeViews[name];
		}
		
		private function addNew(name:String, type:Class):void {
			activeViews[name] = new type();
		}
	}
}
