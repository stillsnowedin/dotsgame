package dotsGame {
	import robotlegs.bender.bundles.mvcs.MVCSBundle;
	import robotlegs.bender.extensions.contextView.ContextView;
	import robotlegs.bender.extensions.signalCommandMap.SignalCommandMapExtension;
	import robotlegs.bender.framework.api.IContext;
	import robotlegs.bender.framework.impl.Context;

	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;

	[SWF(width="1024", height="720", backgroundColor="#292929")]
	
	public class DotsGame extends Sprite {
		
		public function DotsGame():void {
			stage.align = StageAlign.TOP_LEFT;
            stage.scaleMode = StageScaleMode.NO_SCALE;
            addEventListener(Event.ADDED_TO_STAGE, createContext);
		}
		
		private function createContext(evt:Event):void {
			removeEventListener(Event.ADDED_TO_STAGE, createContext);
			var context:IContext = new Context()
				.install(MVCSBundle, SignalCommandMapExtension)
				.configure(GameConfig)
				.configure(FontConfig)
				.configure(new ContextView(this));
		}
	}
}
