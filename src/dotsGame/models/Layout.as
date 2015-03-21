package dotsGame.models {
	import dotsGame.models.dataObjects.GridData;
	import dotsGame.models.dataObjects.PlayerData;
	
	public class Layout {
		private static const STAGE_WIDTH:uint = 1024;
		private static const STAGE_HEIGHT:uint = 720;
		private static const MARGIN:uint = 100;
		private var _gridData:GridData;
		private var _firstPlayerData:PlayerData;
		private var _secondPlayerData:PlayerData;
		private var _currentColor:uint;
		
		public function initPlayers(firstName:String, firstColor:uint, secondName:String, secondColor:uint):void {
			_firstPlayerData = createPlayer(firstName, firstColor);
			_secondPlayerData = createPlayer(secondName, secondColor);
			swapColor();
		}
		
		private function createPlayer(name:String, color:uint):PlayerData {
			return new PlayerData(name, color);
		}
		
		public function swapColor():void {
			_currentColor = (_currentColor == _firstPlayerData.color) ? _secondPlayerData.color : _firstPlayerData.color;
		}
		
		public function initGrid(rows:uint, columns:uint):void {
			_gridData = new GridData(MARGIN, rows, columns, boxSize(rows,columns));
		}
		
		private function boxSize(rows:uint, columns:uint):uint {
			var boxWidth:uint = (STAGE_WIDTH - MARGIN) / columns;
			var boxHeight:uint = (STAGE_HEIGHT - MARGIN*2) / rows;
			return boxWidth < boxHeight ? boxWidth : boxHeight;
		}
		
		public function get gridData():GridData {
			return _gridData;
		}
		
		public function get firstPlayerData():PlayerData {
			return _firstPlayerData;
		}
		
		public function get secondPlayerData():PlayerData {
			return _secondPlayerData;
		}
		
		public function get currentColor():uint {
			return _currentColor;
		}
	}
}
