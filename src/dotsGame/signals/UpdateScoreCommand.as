package dotsGame.signals {
	import dotsGame.models.Layout;
	import dotsGame.models.Score;
	
	public class UpdateScoreCommand {
		
		[Inject]
		public var layout:Layout;
		
		[Inject]
		public var score:Score;
		
		[Inject]
		public var showVictory:ShowVictory;
		
		public function execute():void {
			var totalBoxes:uint = layout.gridData.rows * layout.gridData.columns;
			var currentBoxes:uint = score.firstScore + score.secondScore;
			if (currentBoxes == totalBoxes) {
				showVictory.dispatch();
			}
		}
	}
}
