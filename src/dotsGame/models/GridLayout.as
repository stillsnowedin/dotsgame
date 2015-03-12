package dotsGame.models {
	import dotsGame.models.dataObjects.GridData;
	
	public class GridLayout {
		private static const Y_OFFSET:uint = 100;
		private static const BOX_ROWS:uint = 4;
		private static const BOX_COLUMNS:uint = 8;
		private static const BOX_SIZE:uint = 70;
		//private static const EDGE_WIDTH:uint = 7;
		//private static const EDGE_LENGTH:uint = 50;
		//private static const DOT_RADIUS:uint = 6;
		private var _gridData:GridData;
		
		public function GridLayout():void {
			setGridData();
		}
		
		private function setGridData():void {
			_gridData = new GridData(Y_OFFSET, BOX_ROWS, BOX_COLUMNS, BOX_SIZE);
		}
		
		public function get gridData():GridData {
			return _gridData;
		}
	}
}
