package sprites.particles
{
   import sprites.GameMovieClip;
   import sprites.GameSprite;
   
   public class EnemyHurtStarParticleSprite extends GameSprite
   {
       
      
      protected var standAnimation:GameMovieClip;
      
      public function EnemyHurtStarParticleSprite()
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
         var i:int = 0;
         this.standAnimation = new GameMovieClip(TextureManager.sTextureAtlas.getTextures("enemyHurtStarParticleSpriteAnim_"));
         this.standAnimation.textureSmoothing = Utils.getSmoothing();
         this.standAnimation.touchable = false;
         this.standAnimation.x = this.standAnimation.y = -4;
         this.standAnimation.loop = false;
         Utils.juggler.add(this.standAnimation);
      }
   }
}
