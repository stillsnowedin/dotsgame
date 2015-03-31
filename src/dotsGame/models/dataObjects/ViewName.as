package dotsGame.models.dataObjects {
	import dotsGame.views.Grid;
	import dotsGame.views.Specs;
	import dotsGame.views.Status;
	import dotsGame.views.Victory;
	
	public class ViewName {
		private var _viewClass:Class;
		public static const STATUS:ViewName = new ViewName(Status);
		public static const SPECS:ViewName = new ViewName(Specs);
		public static const GRID:ViewName = new ViewName(Grid);
		public static const VICTORY:ViewName = new ViewName(Victory);
		
		public function ViewName(viewClass:Class):void {
			_viewClass = viewClass;
		}
		
		public function get viewClass():Class {
			return _viewClass;
		}
	}
}
