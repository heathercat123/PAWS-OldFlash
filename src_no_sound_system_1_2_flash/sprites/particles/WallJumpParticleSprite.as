package sprites.particles
{
   import sprites.GameMovieClip;
   import sprites.GameSprite;
   
   public class WallJumpParticleSprite extends GameSprite
   {
       
      
      protected var standAnimation:GameMovieClip;
      
      public function WallJumpParticleSprite()
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
         this.standAnimation = new GameMovieClip(TextureManager.sTextureAtlas.getTextures("wallJumpParticleSpriteAnim_"),12);
         this.standAnimation.setFrameDuration(0,0.05);
         this.standAnimation.setFrameDuration(1,0.05);
         this.standAnimation.setFrameDuration(2,0.05);
         this.standAnimation.setFrameDuration(3,0.05);
         this.standAnimation.textureSmoothing = Utils.getSmoothing();
         this.standAnimation.touchable = false;
         this.standAnimation.x = 0;
         this.standAnimation.y = -12;
         this.standAnimation.loop = false;
         Utils.juggler.add(this.standAnimation);
      }
   }
}
