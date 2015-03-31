package dotsGame.views {
	import dotsGame.models.Layout;
	import dotsGame.models.Score;
	import dotsGame.signals.HideGrid;
	import dotsGame.signals.HideStatus;
	import dotsGame.signals.HideVictory;
	import dotsGame.signals.ShowSpecs;

	import robotlegs.bender.bundles.mvcs.Mediator;
	
	public class VictoryMediator extends Mediator {
		
		[Inject]
		public var victory:Victory;
		
		[Inject]
		public var score:Score;
		
		[Inject]
		public var layout:Layout;
		
		[Inject]
		public var hideStatus:HideStatus;
		
		[Inject]
		public var hideGrid:HideGrid;
		
		[Inject]
		public var hideVictory:HideVictory;
		
		[Inject]
		public var showSpecs:ShowSpecs;
		
		override public function initialize():void {
			var victor:String = (score.firstScore > score.secondScore) ? layout.firstPlayerData.name : layout.secondPlayerData.name;
			victory.init(victor);
			victory.newGame.add(onNewGame);
		}
		
		private function onNewGame():void {
			hideStatus.dispatch();
			hideGrid.dispatch();
			hideVictory.dispatch();
			showSpecs.dispatch();
		}
	}
}
