package y.theme
{
	import feathers.controls.text.TextFieldTextRenderer;

	import starling.core.Starling;
	import starling.display.Image;
	import starling.textures.ConcreteTexture;
	import starling.textures.Texture;

	import flash.display.BitmapData;
	import flash.display3D.textures.Texture;
	import flash.geom.Matrix;
	public class YTextFieldRenderer extends TextFieldTextRenderer
	{
		private var _filters : Array = [];
		
		public function get filters() : Array
		{
			return _filters;
		}

		public function set filters(value : Array) : void
		{
			_filters = value;
			if(_textField)
				_textField.filters = _filters;			
		}
				
		override protected function initialize() : void
		{
			super.initialize();
			_textField.filters = _filters;
		}
	
		override public function set text(value : String) : void
		{
			super.text = " " + value + " ";
		}
		
		private static const HELPER_MATRIX:Matrix = new Matrix();
				
		override protected function refreshSnapshot():void
		{
			if(this._textField.width == 0 || this._textField.height == 0)
			{
				return;
			}
			if(this._needsNewBitmap || !this._textSnapshotBitmapData)
			{
				if(this._textSnapshotBitmapData)
				{
					this._textSnapshotBitmapData.dispose();
				}
				this._textSnapshotBitmapData = new BitmapData(this._snapshotWidth, this._snapshotHeight, true, 0x00ff00ff);
			}
			if(!this._textSnapshotBitmapData)
			{
				return;
			}
			HELPER_MATRIX.identity();
			HELPER_MATRIX.scale(Starling.contentScaleFactor, Starling.contentScaleFactor);
			this._textSnapshotBitmapData.fillRect(this._textSnapshotBitmapData.rect, 0x00ff00ff);
			this._textSnapshotBitmapData.draw(this._textField, HELPER_MATRIX);
			if(!this._textSnapshot)
			{
				this._textSnapshot = new Image(starling.textures.Texture.fromBitmapData(this._textSnapshotBitmapData, false, false, Starling.contentScaleFactor));
				this.addChild(this._textSnapshot);
			}
			else
			{
				if(this._needsNewBitmap)
				{
					this._textSnapshot.texture.dispose();
					this._textSnapshot.texture = starling.textures.Texture.fromBitmapData(this._textSnapshotBitmapData, false, false, Starling.contentScaleFactor);
					this._textSnapshot.readjustSize();
				}
				else
				{
					//this is faster if we haven't resized the bitmapdata
					const texture:starling.textures.Texture = this._textSnapshot.texture;
					if(Starling.handleLostContext && texture is ConcreteTexture)
					{
						ConcreteTexture(texture).restoreOnLostContext(this._textSnapshotBitmapData);
					}
					flash.display3D.textures.Texture(texture.base).uploadFromBitmapData(this._textSnapshotBitmapData);
				}
			}
			this._needsNewBitmap = false;
		}		
	}
}