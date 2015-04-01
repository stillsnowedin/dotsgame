package dotsGame.signals {
	import dotsGame.models.Layout;
	import dotsGame.models.Score;
	import dotsGame.models.dataObjects.ViewName;
	
	public class UpdateScoreCommand {
		
		[Inject]
		public var layout:Layout;
		
		[Inject]
		public var score:Score;
		
		[Inject]
		public var showView:ShowView;
		
		public function execute():void {
			var totalBoxes:uint = layout.gridData.rows * layout.gridData.columns;
			var currentBoxes:uint = score.firstScore + score.secondScore;
			trace("[UpdateScoreCommand] total: "+totalBoxes+"  current: "+currentBoxes);
			if (currentBoxes == totalBoxes) {
				showView.dispatch(ViewName.VICTORY);
			}
		}
	}
}
