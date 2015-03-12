package dotsGame.views {
	import dotsGame.views.components.BasicShapes;
	import dotsGame.views.components.Components;
	import dotsGame.views.components.RectangleButton;

	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.geom.Point;
	
	public class Grid extends Sprite {
		private static const GRID_X:Number = 350;
		private static const GRID_Y:Number = 200;
		private static const BOX_ROWS:uint = 6;
		private static const BOX_COLUMNS:uint = 6;
		private static const EDGE_WIDTH:uint = 7;
		private static const EDGE_LENGTH:uint = 60;
		private static const DOT_RADIUS:uint = 6;
		private static const BOX_SIZE:uint = 80;
		private var boxes:Vector.<Shape>;
		private var dots:Vector.<Shape>;
		private var edges:Vector.<RectangleButton>;
		private var boxLayer:Sprite;
		private var dotLayer:Sprite;
		private var edgeLayer:Sprite;
		
		public function Grid():void {
			this.x = GRID_X;
			this.y = GRID_Y;
		}
		
		public function init():void {
			trace("[Grid] init");
			boxLayer = new Sprite();
			dotLayer = new Sprite();
			edgeLayer = new Sprite();
			this.addChild(boxLayer);
			this.addChild(dotLayer);
			this.addChild(edgeLayer);
			initBoxes();
			initDots();
			initEdges();
		}
		
		private function initBoxes():void {
			boxes = new Vector.<Shape>();
			var row:uint = -1;
			for (var i:uint=0; i<numBoxes(); i++) {
				if (i % BOX_COLUMNS == 0)
					row++;
				boxes[i] = BasicShapes.createRectangle(BOX_SIZE, BOX_SIZE, 0x333333, 0);
				boxes[i].x = (i % BOX_COLUMNS) * BOX_SIZE;
				boxes[i].y = row * BOX_SIZE;
				boxLayer.addChild(boxes[i]);
			}
		}
		
		private function initDots():void {
			dots = new Vector.<Shape>();
			var row:uint = -1;
			for (var i:uint=0; i<numDots(); i++) {
				if ((i % (BOX_COLUMNS + 1)) == 0)
					row++;
				dots[i] = BasicShapes.createCircle(DOT_RADIUS, 0x111111);
				dots[i].x = (i % (BOX_COLUMNS+1)) * BOX_SIZE;
				dots[i].y = row * BOX_SIZE;
				dotLayer.addChild(dots[i]);
			}
		}
		
		private function initEdges():void {
			edges = new Vector.<RectangleButton>();
			var row:uint = -1;
			var count:uint = 0;
			for (var i:uint=0; i<numEdges(); i++) {
				if (i % (BOX_COLUMNS * 2 + 1) == 0) {
					row++;
					count = 0;
				}
				var position:Point = new Point();
				position.x = (i % BOX_COLUMNS) * BOX_SIZE + (BOX_SIZE-EDGE_LENGTH)/2;
				position.y = row * BOX_SIZE - EDGE_WIDTH/2;
				var dimensions:Point = new Point(EDGE_LENGTH, EDGE_WIDTH);
				if (count >= BOX_COLUMNS) {
					position.x = (i % (BOX_COLUMNS+1)) * BOX_SIZE - EDGE_WIDTH/2;
					position.y += (BOX_SIZE-EDGE_LENGTH+DOT_RADIUS)/2;
					dimensions = new Point(EDGE_WIDTH, EDGE_LENGTH);
				}
				trace("[Grid] edge "+i+": ("+position.x+", "+position.y+")");
				edges[i] = Components.rectangleButton(0xffffff, 0x990099, 0x000000, dimensions, position);
				edgeLayer.addChild(edges[i]);
				count++;
			}
		}
		
		private function numBoxes():uint {
			var total:uint = BOX_ROWS * BOX_COLUMNS;
			return total;
		}
		
		private function numDots():uint {
			var total:uint = (BOX_ROWS + 1) * (BOX_COLUMNS + 1);
			return total;
		}
		
		private function numEdges():uint {
			var total:uint = BOX_ROWS * (BOX_COLUMNS + 1) + (BOX_ROWS + 1) * BOX_COLUMNS;
			return total;
		}
	}
}
