package dotsGame.models {
	import dotsGame.views.Grid;
	import dotsGame.views.Menu;
	import dotsGame.views.Status;

	import flash.display.Sprite;
	import flash.utils.Dictionary;
	
	public class ActiveViews {
		private const MENU:String = "MENU";
		private const STATUS:String = "STATUS";
		private const GRID:String = "GRID";
		private var activeViews:Dictionary;
		
		public function ActiveViews():void {
			activeViews = new Dictionary();
		}
		
		public function getMenu():Sprite {
			return get(MENU, Menu);
		}
		
		public function getStatus():Sprite {
			return get(STATUS, Status);
		}
		
		public function getGrid():Sprite {
			return get(GRID, Grid);
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
