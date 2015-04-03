package dotsGame.models {
	import dotsGame.models.dataObjects.GridData;
	import dotsGame.models.dataObjects.PlayerData;
	
	public class Layout {
		private static const STAGE_WIDTH:uint = 1024;
		private static const STAGE_HEIGHT:uint = 720;
		private static const MARGIN:uint = 100;
		private static const FIRST_COLORS:Array = [0xD23600, 0x167F39, 0xB0925F, 0x67B8DE, 0x7B52AB];
		private static const SECOND_COLORS:Array = [0x3399CC, 0x9768D1, 0x6D4320, 0xD95100, 0xC1D74E];
		private static const DEFAULT_SIZE:uint = 5;
		private var _gridData:GridData;
		private var _firstPlayerData:PlayerData;
		private var _secondPlayerData:PlayerData;
		private var _currentColor:uint;
		
		public function Layout():void {
			_firstPlayerData = new PlayerData("PLAYER 1", FIRST_COLORS);
			_secondPlayerData = new PlayerData("PLAYER 2", SECOND_COLORS);
			_gridData = new GridData(MARGIN, DEFAULT_SIZE, DEFAULT_SIZE, boxSize(DEFAULT_SIZE,DEFAULT_SIZE));
		}
		
		public function setPlayers(firstName:String, firstColor:uint, secondName:String, secondColor:uint):void {
			updatePlayer(_firstPlayerData, firstName, firstColor);
			updatePlayer(_secondPlayerData, secondName, secondColor);
			swapColor();
		}
		
		private function updatePlayer(player:PlayerData, name:String, color:uint):void {
			player.name = name;
			player.color = color;
		}
		
		public function swapColor():void {
			_currentColor = (_currentColor == _firstPlayerData.color) ? _secondPlayerData.color : _firstPlayerData.color;
		}
		
		public function setGrid(rows:uint, columns:uint):void {
			_gridData.update(rows, columns, boxSize(rows,columns));
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
