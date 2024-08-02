package sprites.particles
{
   import sprites.GameMovieClip;
   import sprites.GameSprite;
   
   public class QuestionMarkParticleSprite extends GameSprite
   {
       
      
      protected var standAnimation:GameMovieClip;
      
      public function QuestionMarkParticleSprite()
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
         this.standAnimation = new GameMovieClip(TextureManager.sTextureAtlas.getTextures("questionMarkParticleSpriteAnim_"));
         this.standAnimation.setFrameDuration(0,0.1);
         this.standAnimation.textureSmoothing = Utils.getSmoothing();
         this.standAnimation.touchable = false;
         this.standAnimation.x = -8;
         this.standAnimation.y = -8;
         this.standAnimation.loop = false;
         Utils.juggler.add(this.standAnimation);
      }
   }
}
