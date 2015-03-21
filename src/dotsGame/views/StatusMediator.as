package dotsGame.views {
	import dotsGame.models.Layout;
	import dotsGame.models.Score;
	import dotsGame.signals.UpdateScore;

	import robotlegs.bender.bundles.mvcs.Mediator;
	/**
	 * @author Kathryn
	 */
	public class StatusMediator extends Mediator {
		
		[Inject]
		public var status:Status;
		
		[Inject]
		public var layout:Layout;
		
		[Inject]
		public var score:Score;
		
		[Inject]
		public var updateScore:UpdateScore;
		
		override public function initialize():void {
			status.init(layout.firstPlayerData, layout.secondPlayerData, score.firstScore, score.secondScore);
			updateScore.add(onUpdateScore);
		}
		
		private function onUpdateScore():void {
			status.updateFirstScore(score.firstScore);
			status.updateSecondScore(score.secondScore);
		}
	}
}
