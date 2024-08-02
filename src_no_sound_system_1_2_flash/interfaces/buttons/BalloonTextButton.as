package interfaces.buttons
{
   import flash.geom.Matrix;
   import interfaces.texts.GameText;
   import starling.display.Button;
   import starling.display.Image;
   import starling.textures.RenderTexture;
   
   public class BalloonTextButton extends Button
   {
       
      
      public var WIDTH:int;
      
      public var HEIGHT:int;
      
      protected var upTexture:RenderTexture;
      
      protected var downTexture:RenderTexture;
      
      protected var buy_text:GameText;
      
      public function BalloonTextButton(_string:String, _WIDTH:Number, _HEIGHT:Number)
      {
         this.WIDTH = _WIDTH;
         this.HEIGHT = _HEIGHT;
         this.upTexture = this.createUpTexture();
         this.downTexture = this.createDownTexture();
         super(this.upTexture,"",this.downTexture);
         this.buy_text = new GameText(_string,GameText.TYPE_SMALL_DARK);
         this.buy_text.pivotX = int(this.buy_text.WIDTH * 0.5);
         this.buy_text.pivotY = int(this.buy_text.HEIGHT * 0.5);
         this.buy_text.x = int(_WIDTH * 0.5);
         this.buy_text.y = int(_HEIGHT * 0.5);
         this.buy_text.touchable = false;
         addChild(this.buy_text);
      }
      
      public function destroy() : void
      {
         this.downTexture.dispose();
         this.downTexture = null;
         this.upTexture.dispose();
         this.upTexture = null;
         removeChild(this.buy_text);
         this.buy_text.destroy();
         this.buy_text = null;
      }
      
      protected function createUpTexture() : RenderTexture
      {
         var matrix:Matrix = null;
         var image:Image = null;
         var renderTexture:RenderTexture = new RenderTexture(this.WIDTH,this.HEIGHT);
         image = new Image(TextureManager.hudTextureAtlas.getTexture("textButton2UpPart1"));
         renderTexture.draw(image);
         image = new Image(TextureManager.hudTextureAtlas.getTexture("textButton2UpPart2"));
         matrix = new Matrix();
         matrix.scale((this.WIDTH - 16) / 8,1);
         matrix.translate(8,0);
         renderTexture.draw(image,matrix);
         image = new Image(TextureManager.hudTextureAtlas.getTexture("textButton2UpPart3"));
         matrix = new Matrix();
         matrix.translate(this.WIDTH - 8,0);
         renderTexture.draw(image,matrix);
         image = new Image(TextureManager.hudTextureAtlas.getTexture("textButton2UpPart4"));
         matrix = new Matrix();
         matrix.scale(1,(this.HEIGHT - 16) / 8);
         matrix.translate(this.WIDTH - 8,8);
         renderTexture.draw(image,matrix);
         image = new Image(TextureManager.hudTextureAtlas.getTexture("textButton2UpPart5"));
         matrix = new Matrix();
         matrix.translate(this.WIDTH - 8,this.HEIGHT - 8);
         renderTexture.draw(image,matrix);
         image = new Image(TextureManager.hudTextureAtlas.getTexture("textButton2UpPart6"));
         matrix = new Matrix();
         matrix.scale((this.WIDTH - 16) / 8,1);
         matrix.translate(8,this.HEIGHT - 8);
         renderTexture.draw(image,matrix);
         image = new Image(TextureManager.hudTextureAtlas.getTexture("textButton2UpPart7"));
         matrix = new Matrix();
         matrix.translate(0,this.HEIGHT - 8);
         renderTexture.draw(image,matrix);
         image = new Image(TextureManager.hudTextureAtlas.getTexture("textButton2UpPart8"));
         matrix = new Matrix();
         matrix.scale(1,(this.HEIGHT - 16) / 8);
         matrix.translate(0,8);
         renderTexture.draw(image,matrix);
         image = new Image(TextureManager.hudTextureAtlas.getTexture("whiteQuad"));
         matrix = new Matrix();
         matrix.scale((this.WIDTH - 16) / 16,(this.HEIGHT - 16) / 16);
         matrix.translate(8,8);
         renderTexture.draw(image,matrix);
         return renderTexture;
      }
      
      protected function createDownTexture() : RenderTexture
      {
         var matrix:Matrix = null;
         var image:Image = null;
         var renderTexture:RenderTexture = new RenderTexture(this.WIDTH,this.HEIGHT);
         image = new Image(TextureManager.hudTextureAtlas.getTexture("textButton2DownPart1"));
         matrix = new Matrix();
         matrix.translate(0,0);
         renderTexture.draw(image,matrix);
         image = new Image(TextureManager.hudTextureAtlas.getTexture("textButton2DownPart2"));
         matrix = new Matrix();
         matrix.scale((this.WIDTH - 16) / 8,1);
         matrix.translate(8,0);
         renderTexture.draw(image,matrix);
         image = new Image(TextureManager.hudTextureAtlas.getTexture("textButton2DownPart3"));
         matrix = new Matrix();
         matrix.translate(this.WIDTH - 8,0);
         renderTexture.draw(image,matrix);
         image = new Image(TextureManager.hudTextureAtlas.getTexture("textButton2DownPart4"));
         matrix = new Matrix();
         matrix.scale(1,(this.HEIGHT - 16) / 8);
         matrix.translate(this.WIDTH - 8,8);
         renderTexture.draw(image,matrix);
         image = new Image(TextureManager.hudTextureAtlas.getTexture("textButton2DownPart5"));
         matrix = new Matrix();
         matrix.translate(this.WIDTH - 8,this.HEIGHT - 8);
         renderTexture.draw(image,matrix);
         image = new Image(TextureManager.hudTextureAtlas.getTexture("textButton2DownPart6"));
         matrix = new Matrix();
         matrix.scale((this.WIDTH - 16) / 8,1);
         matrix.translate(8,this.HEIGHT - 8);
         renderTexture.draw(image,matrix);
         image = new Image(TextureManager.hudTextureAtlas.getTexture("textButton2DownPart7"));
         matrix = new Matrix();
         matrix.translate(0,this.HEIGHT - 8);
         renderTexture.draw(image,matrix);
         image = new Image(TextureManager.hudTextureAtlas.getTexture("textButton2DownPart8"));
         matrix = new Matrix();
         matrix.scale(1,(this.HEIGHT - 16) / 8);
         matrix.translate(0,8);
         renderTexture.draw(image,matrix);
         image = new Image(TextureManager.hudTextureAtlas.getTexture("greyQuad"));
         matrix = new Matrix();
         matrix.scale((this.WIDTH - 16) / 16,(this.HEIGHT - 16) / 16);
         matrix.translate(8,8);
         renderTexture.draw(image,matrix);
         return renderTexture;
      }
   }
}
