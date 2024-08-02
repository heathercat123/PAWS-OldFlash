package sprites.enemies
{
   import sprites.GameMovieClip;
   import sprites.GameSprite;
   
   public class GiantDragonWingSprite extends GameSprite
   {
       
      
      protected var standAnimation:GameMovieClip;
      
      public function GiantDragonWingSprite()
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
         this.standAnimation = new GameMovieClip(TextureManager.sTextureAtlas.getTextures("giantDragonEnemyWingAnim_"),12);
         this.standAnimation.setFrameDuration(0,0.1);
         this.standAnimation.setFrameDuration(1,0.1);
         this.standAnimation.setFrameDuration(2,0.1);
         this.standAnimation.setFrameDuration(3,0.1);
         this.standAnimation.touchable = false;
         this.standAnimation.x = this.standAnimation.y = -8;
         this.standAnimation.loop = true;
         Utils.juggler.add(this.standAnimation);
      }
   }
}
