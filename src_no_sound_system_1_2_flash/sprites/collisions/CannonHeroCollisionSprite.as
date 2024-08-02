package sprites.collisions
{
   import sprites.GameMovieClip;
   import sprites.GameSprite;
   
   public class CannonHeroCollisionSprite extends GameSprite
   {
       
      
      protected var standAnimation:GameMovieClip;
      
      public function CannonHeroCollisionSprite()
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
         this.standAnimation = new GameMovieClip(TextureManager.sTextureAtlas.getTextures("cannonHeroCollisionSpriteAnim_"),12);
         this.standAnimation.touchable = false;
         this.standAnimation.x = this.standAnimation.y = -20;
         this.standAnimation.loop = true;
         Utils.juggler.add(this.standAnimation);
      }
   }
}
