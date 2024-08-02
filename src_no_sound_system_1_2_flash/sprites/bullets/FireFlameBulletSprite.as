package sprites.bullets
{
   import sprites.GameMovieClip;
   import sprites.GameSprite;
   
   public class FireFlameBulletSprite extends GameSprite
   {
       
      
      protected var standAnimation:GameMovieClip;
      
      public function FireFlameBulletSprite()
      {
         super();
         this.initAnims();
         addChild(this.standAnimation);
      }
      
      override public function destroy() : void
      {
         Utils.juggler.remove(this.standAnimation);
         this.standAnimation.dispose();
         this.standAnimation = null;
         super.destroy();
      }
      
      protected function initAnims() : void
      {
         this.standAnimation = new GameMovieClip(TextureManager.sTextureAtlas.getTextures("fireFlameBulletSpriteAnim_"));
         this.standAnimation.setFrameDuration(0,0.1);
         this.standAnimation.setFrameDuration(1,0.1);
         this.standAnimation.textureSmoothing = Utils.getSmoothing();
         this.standAnimation.touchable = false;
         this.standAnimation.x = this.standAnimation.y = -6;
         this.standAnimation.loop = true;
         Utils.juggler.add(this.standAnimation);
      }
   }
}
