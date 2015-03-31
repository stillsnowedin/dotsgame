package dotsGame.models {
	import dotsGame.models.dataObjects.ViewName;

	import flash.display.Sprite;
	import flash.utils.Dictionary;
	
	public class ActiveViews {
		private var activeViews:Dictionary;
		
		public function ActiveViews():void {
			activeViews = new Dictionary();
		}
		
		public function get(name:ViewName):Sprite {
			if (activeViews[name] == null) {
				add(name, name.viewClass);
			}	
			return activeViews[name];
		}
		
		private function add(name:ViewName, type:Class):void {
			activeViews[name] = new type();
		}
	}
}
