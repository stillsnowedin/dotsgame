package dotsGame.models {
	import dotsGame.models.dataObjects.GridLayoutData;
	import dotsGame.models.dataObjects.PlayerData;
	
	public class GridLayout {
		private static const STAGE_WIDTH:uint = 1024;
		private static const STAGE_HEIGHT:uint = 768;
		private static const MARGIN:uint = 100;
		private static const Y_OFFSET:uint = 100;
		private var _gridData:GridLayoutData;
		private var _firstPlayerData:PlayerData;
		private var _secondPlayerData:PlayerData;
		private var _firstScore:uint;
		private var _secondScore:uint;
		
		public function GridLayout():void {
		}
		
		public function initFirstPlayer(name:String, color:uint):void {
			_firstPlayerData = new PlayerData(name, color);
		}
		
		public function initSecondPlayer(name:String, color:uint):void {
			_secondPlayerData = new PlayerData(name, color);
		}
		
		public function initGrid(rows:uint, columns:uint):void {
			_gridData = new GridLayoutData(Y_OFFSET, rows, columns, boxSize(rows,columns));
		}
		
		private function boxSize(rows:uint, columns:uint):uint {
			var boxWidth:uint = (STAGE_WIDTH - MARGIN) / columns;
			var boxHeight:uint = (STAGE_HEIGHT - Y_OFFSET - MARGIN) / rows;
			return boxWidth < boxHeight ? boxWidth : boxHeight;
		}
		
		public function get firstPlayerData():PlayerData {
			return _firstPlayerData;
		}
		
		public function get secondPlayerData():PlayerData {
			return _secondPlayerData;
		}
		
		public function get gridData():GridLayoutData {
			return _gridData;
		}
		
		public function increaseFirstScore():void {
			_firstScore++;
		}
		
		public function increaseSecondScore():void {
			_secondScore++;
		}
		
		public function get firstScore():uint {
			return _firstScore;
		}
		
		public function get secondScore():uint {
			return _secondScore;
		}
	}
}
