package dotsGame.models {
	import dotsGame.models.dataObjects.GridLayoutData;
	
	public class GridLayout {
		private static const STAGE_WIDTH:uint = 1024;
		private static const STAGE_HEIGHT:uint = 768;
		private static const MARGIN:uint = 100;
		private static const Y_OFFSET:uint = 100;
		private static const BOX_ROWS:uint = 8;
		private static const BOX_COLUMNS:uint = 4;
		private var _gridData:GridLayoutData;
		
		public function GridLayout():void {
			setGridData();
		}
		
		private function setGridData():void {
			_gridData = new GridLayoutData(Y_OFFSET, BOX_ROWS, BOX_COLUMNS, boxSize());
		}
		
		private function boxSize():uint {
			var boxWidth:uint = (STAGE_WIDTH - MARGIN) / BOX_COLUMNS;
			var boxHeight:uint = (STAGE_HEIGHT - Y_OFFSET - MARGIN) / BOX_ROWS;
			return boxWidth < boxHeight ? boxWidth : boxHeight;
		}
		
		public function get gridData():GridLayoutData {
			return _gridData;
		}
	}
}
