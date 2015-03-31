package dotsGame.models.dataObjects {

	public class PlayerData {
		public var colors:Array;
		public var name:String;
		public var color:uint;
		
		public function PlayerData(name:String, colors:Array) {
			this.name = name;
			this.colors = colors;
			color = colors[0];
		}
	}
}
