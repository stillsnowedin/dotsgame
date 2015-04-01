package dotsGame.models {
	
	public class Score {
		private var onFirst:Boolean = true;
		private var _firstScore:uint = 0;
		private var _secondScore:uint = 0;
		
		public function increaseScore():void {
			onFirst ? _firstScore++ : _secondScore++;
		}
		
		public function swapTurn():void {
			onFirst = !onFirst;
		}
		
		public function reset():void {
			onFirst = true;
			_firstScore = 0;
			_secondScore = 0;
		}
		
		public function get firstScore():uint {
			return _firstScore;
		}
		
		public function get secondScore():uint {
			return _secondScore;
		}
	}
}
