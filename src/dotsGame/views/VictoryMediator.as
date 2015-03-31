package dotsGame.views {
	import dotsGame.models.Layout;
	import dotsGame.models.Score;
	import dotsGame.models.dataObjects.ViewName;
	import dotsGame.signals.HideView;
	import dotsGame.signals.ShowView;

	import robotlegs.bender.bundles.mvcs.Mediator;
	
	public class VictoryMediator extends Mediator {
		
		[Inject]
		public var victory:Victory;
		
		[Inject]
		public var score:Score;
		
		[Inject]
		public var layout:Layout;
		
		[Inject]
		public var hideView:HideView;
		
		[Inject]
		public var showView:ShowView;
		
		override public function initialize():void {
			trace("[VictoryMediator] initalizing");
			var victor:String = (score.firstScore > score.secondScore) ? layout.firstPlayerData.name : layout.secondPlayerData.name;
			victory.init(victor);
			victory.newGame.add(onNewGame);
		}
		
		private function onNewGame():void {
			hideView.dispatch(ViewName.STATUS);
			hideView.dispatch(ViewName.GRID);
			hideView.dispatch(ViewName.VICTORY);
			showView.dispatch(ViewName.SPECS);
		}
	}
}
