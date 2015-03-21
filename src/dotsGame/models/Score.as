package dotsGame.models {
	
	public class Score {
		private var _firstScore:uint = 0;
		private var _secondScore:uint = 0;
		
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
