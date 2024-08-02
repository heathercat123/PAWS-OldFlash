package levels.decorations
{
   import flash.geom.*;
   import game_utils.LevelItems;
   import levels.Level;
   import levels.cameras.*;
   import sprites.decorations.BurnedFlowerBaseDecorationSprite;
   import sprites.decorations.GenericDecorationSprite;
   import sprites.particles.AshParticleSprite;
   
   public class AshFlowerDecoration extends Decoration
   {
       
      
      public var isBlown:Boolean;
      
      public var HAS_COIN:Boolean;
      
      public function AshFlowerDecoration(_level:Level, _xPos:Number, _yPos:Number, _has_coin:int = 0)
      {
         super(_level,_xPos,_yPos);
         this.HAS_COIN = false;
         if(_has_coin > 0)
         {
            this.HAS_COIN = true;
         }
         sprite = new GenericDecorationSprite(GenericDecoration.ASH_FLOWER);
         Utils.topWorld.addChild(sprite);
         var x_t:int = int(xPos / Utils.TILE_WIDTH);
         if(x_t % 2 == 0)
         {
            sprite.gfxHandleClip().gotoAndPlay(2);
         }
      }
      
      override public function destroy() : void
      {
         Utils.topWorld.removeChild(sprite);
         super.destroy();
      }
      
      override public function update() : void
      {
         var point:Point = null;
         var hero:Rectangle = null;
         if(!this.isBlown)
         {
            point = new Point(xPos + 8,yPos + 8);
            hero = level.hero.getAABB();
            if(hero.containsPoint(point))
            {
               if(level.hero.stateMachine.currentState == "IS_RUNNING_STATE" || level.hero.stateMachine.currentState == "IS_BRAKING_STATE")
               {
                  if(Math.abs(level.hero.xVel) > 1)
                  {
                     this.blow();
                  }
               }
            }
         }
      }
      
      protected function blow() : void
      {
         var pSprite:AshParticleSprite = null;
         var angle:Number = NaN;
         var i:int = 0;
         SoundSystem.PlaySound("decoration_blown");
         if(this.HAS_COIN && !Utils.LEVEL_DECORATION_ITEMS[level_index])
         {
            SoundSystem.PlaySound("coin");
            Utils.AddCoins(1);
            level.topParticlesManager.createItemParticlesAt(LevelItems.ITEM_COIN,xPos + 8,yPos);
            Utils.LEVEL_DECORATION_ITEMS[level_index] = true;
         }
         var _vel:Number = 1.25;
         if(level.hero.xVel < 0)
         {
            _vel = -1.25;
         }
         this.isBlown = true;
         Utils.topWorld.removeChild(sprite);
         sprite.destroy();
         sprite.dispose();
         sprite = new BurnedFlowerBaseDecorationSprite();
         Utils.topWorld.addChild(sprite);
         var max:int = 2;
         if(Math.random() * 100 > 95)
         {
            max = 3;
         }
         for(i = 0; i < max; i++)
         {
            pSprite = new AshParticleSprite();
            angle = Math.random() * Math.PI * 2;
            if(i == 0)
            {
               pSprite.gfxHandleClip().gotoAndStop(1);
            }
            else
            {
               pSprite.gfxHandleClip().gotoAndStop(2);
            }
            level.particlesManager.pushParticle(pSprite,xPos + 7 + Math.sin(angle) * 4,yPos + 6 + Math.cos(angle) * 4,_vel * (1 + Math.random() * 0.5),-(int(Math.random() * 2) + 1),1,Math.random() * 0.02 + 0.01,Math.random() * 4 + 4,0);
         }
      }
   }
}
