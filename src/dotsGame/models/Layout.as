package dotsGame.models {
	import dotsGame.models.dataObjects.GridData;
	import dotsGame.models.dataObjects.PlayerData;
	
	public class Layout {
		private static const STAGE_WIDTH:uint = 1024;
		private static const STAGE_HEIGHT:uint = 768;
		private static const MARGIN:uint = 100;
		private static const Y_OFFSET:uint = 100;
		private var _gridData:GridData;
		private var _firstPlayerData:PlayerData;
		private var _secondPlayerData:PlayerData;
		private var _firstScore:uint;
		private var _secondScore:uint;
		private var _currentColor:uint;
		
		public function Layout():void {
		}
		
		public function initPlayers(firstName:String, firstColor:uint, secondName:String, secondColor:uint):void {
			_firstPlayerData = createPlayer(firstName, firstColor);
			_secondPlayerData = createPlayer(secondName, secondColor);
			swapColor();
		}
		
		private function createPlayer(name:String, color:uint):PlayerData {
			return new PlayerData(name, color);
		}
		
		public function initGrid(rows:uint, columns:uint):void {
			_gridData = new GridData(Y_OFFSET, rows, columns, boxSize(rows,columns));
		}
		
		private function boxSize(rows:uint, columns:uint):uint {
			var boxWidth:uint = (STAGE_WIDTH - MARGIN) / columns;
			var boxHeight:uint = (STAGE_HEIGHT - Y_OFFSET - MARGIN) / rows;
			return boxWidth < boxHeight ? boxWidth : boxHeight;
		}
		
		public function increaseFirstScore():void {
			_firstScore++;
		}
		
		public function increaseSecondScore():void {
			_secondScore++;
		}
		
		public function swapColor():void {
			_currentColor = (_currentColor == _firstPlayerData.color) ? _secondPlayerData.color : _firstPlayerData.color;
			trace("[Layout] new color: "+_currentColor);
		}
		
		public function get firstPlayerData():PlayerData {
			return _firstPlayerData;
		}
		
		public function get secondPlayerData():PlayerData {
			return _secondPlayerData;
		}
		
		public function get gridData():GridData {
			return _gridData;
		}
		
		public function get firstScore():uint {
			return _firstScore;
		}
		
		public function get secondScore():uint {
			return _secondScore;
		}
		
		public function get currentColor():uint {
			return _currentColor;
		}
	}
}
