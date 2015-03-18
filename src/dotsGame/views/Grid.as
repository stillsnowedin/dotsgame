package dotsGame.views {
	import dotsGame.models.dataObjects.GridData;
	import dotsGame.views.components.BasicShapes;
	import dotsGame.views.components.Components;
	import dotsGame.views.components.RectangleButton;

	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.geom.Point;
	
	public class Grid extends Sprite {
		private var layout:GridData;
		private var boxes:Vector.<Shape>;
		private var dots:Vector.<Shape>;
		private var edges:Vector.<RectangleButton>;
		private var boxLayer:Sprite;
		private var dotLayer:Sprite;
		private var edgeLayer:Sprite;
		
		public function Grid():void {
			boxLayer = new Sprite();
			dotLayer = new Sprite();
			edgeLayer = new Sprite();
			this.addChild(boxLayer);
			this.addChild(dotLayer);
			this.addChild(edgeLayer);
		}
		
		public function init(layout:GridData):void {
			this.layout = layout;
			initBoxes();
			initDots();
			initEdges();
			centerGridPosition();
		}
		
		private function initBoxes():void {
			boxes = new Vector.<Shape>();
			var row:uint = 0;
			for (var i:uint=0; i<numBoxes(); i++) {
				boxes[i] = createBox(i, row);
				boxLayer.addChild(boxes[i]);
				if (increaseBoxRow(i)) row++;
			}
		}
		
		private function numBoxes():uint {
			var total:uint = layout.rows * layout.columns;
			return total;
		}
		
		private function createBox(index:uint, row:uint):Shape {
			var box:Shape = BasicShapes.createRectangle(layout.boxSize, layout.boxSize, 0x333333, 0);
			box.x = (index % layout.columns) * layout.boxSize;
			box.y = row * layout.boxSize;
			return box;
		}
		
		private function increaseBoxRow(index:uint):Boolean {
			return index % layout.columns == 0;
		}
		
		private function initDots():void {
			dots = new Vector.<Shape>();
			var row:uint = -1;
			for (var i:uint=0; i<numDots(); i++) {
				if (increaseDotRow(i)) row++;
				dots[i] = createDot(i, row);
				dotLayer.addChild(dots[i]);
			}
		}
		
		private function numDots():uint {
			var total:uint = (layout.rows + 1) * (layout.columns + 1);
			return total;
		}
		
		private function createDot(index:uint, row:uint):Shape {
			var dot:Shape = BasicShapes.createCircle(layout.dotRadius, 0x111111);
			dot.x = (index % (layout.columns+1)) * layout.boxSize;
			dot.y = row * layout.boxSize;
			return dot;
		}
		
		private function increaseDotRow(index:uint):Boolean {
			return (index % (layout.columns + 1)) == 0;
		}
		
		private function initEdges():void {
			edges = new Vector.<RectangleButton>();
			var row:uint = -1;
			var horizontalEdges:uint = 0;
			for (var i:uint=0; i<numEdges(); i++) {
				if (increaseEdgeRow(i)) {
					row++;
					horizontalEdges = 0;
				}
				var position:Point = horizontalEdgePosition(i, row);
				var dimensions:Point = new Point(layout.edgeLength, layout.edgeWidth);
				if (horizontalEdges >= layout.columns) {
					position = verticalEdgePosition(i, position.y);
					dimensions = new Point(layout.edgeWidth, layout.edgeLength);
				}
				edges[i] = createEdge(dimensions, position);
				edgeLayer.addChild(edges[i]);
				horizontalEdges++;
			}
		}
		
		private function numEdges():uint {
			var total:uint = layout.rows * (layout.columns + 1) + (layout.rows + 1) * layout.columns;
			return total;
		}
		
		private function increaseEdgeRow(index:uint):Boolean {
			return index % (layout.columns * 2 + 1) == 0;
		}
		
		private function horizontalEdgePosition(index:uint, row:uint):Point {
			var position:Point = new Point();
			position.x = (index % layout.columns) * layout.boxSize + (layout.boxSize - layout.edgeLength)/2;
			position.y = row * layout.boxSize - layout.edgeWidth/2;
			return position;
		}
		
		private function verticalEdgePosition(index:uint, y:Number):Point {
			var position:Point = new Point();
			position.x = (index % (layout.columns + 1)) * layout.boxSize - layout.edgeWidth/2;
			position.y = y + (layout.boxSize - layout.edgeLength + layout.dotRadius)/2;
			return position;
		}
		
		private function createEdge(dimensions:Point, position:Point):RectangleButton {
			var edge:RectangleButton = Components.rectangleButton(0xffffff, 0x990099, 0x000000, dimensions, position);
			return edge;
		}
		
		private function centerGridPosition():void {
			this.x = (stage.stageWidth - layout.columns * layout.boxSize) / 2;
			this.y = layout.yOffset + ((stage.stageHeight - layout.yOffset) - layout.rows * layout.boxSize) / 2;
		}
	}
}
