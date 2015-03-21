package dotsGame.models.dataObjects {

	public class GridData {
		private var _yOffset:uint;
		private var _rows:uint;
		private var _columns:uint;
		private var _boxSize:uint;
		private var _edgeWidth:uint;
		private var _edgeLength:uint;
		private var _dotRadius:uint;
		
		public function GridData(yOffset:uint, rows:uint, columns:uint, boxSize:uint):void {
			_yOffset = yOffset;
			_rows = rows;
			_columns = columns;
			_boxSize = boxSize;
			
			calculateDot();
			calculateEdges(_dotRadius);
		}
		
		private function calculateDot():void {
			_dotRadius = Math.round(_boxSize / 10) - 1;
		}
		
		private function calculateEdges(dotRadius:uint):void {
			_edgeWidth = _boxSize / 10;
			_edgeLength = _boxSize - 3 * dotRadius;
		}
		
		public function get yOffset():uint {
			return _yOffset;
		}
		
		public function get rows():uint {
			return _rows;
		}
		
		public function get columns():uint {
			return _columns;
		}
		
		public function get boxSize():uint {
			return _boxSize;
		}
		
		public function get edgeWidth():uint {
			return _edgeWidth;
		}
		
		public function get edgeLength():uint {
			return _edgeLength;
		}
		
		public function get dotRadius():uint {
			return _dotRadius;
		}
	}
}
