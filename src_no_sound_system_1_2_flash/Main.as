package
{
   import flash.desktop.*;
   import flash.display.*;
   import flash.events.*;
   import flash.geom.*;
   import flash.system.*;
   import flash.utils.*;
   import game_utils.LevelTimer;
   import starling.core.Starling;
   
   public dynamic class Main extends MovieClip
   {
      
      public static var rootStage:Stage;
       
      
      private var myStarling:Starling;
      
      private var game:Game;
      
      public function Main()
      {
         super();
         this.init();
      }
      
      private function init() : void
      {
         var viewport:Rectangle = null;
         var screenWidth:Number = NaN;
         var screenHeight:Number = NaN;
         var myOS:String = null;
         var myOSLowerCase:String = null;
         var screenRatio:Number = NaN;
         stage.quality = StageQuality.LOW;
         stage.scaleMode = StageScaleMode.NO_SCALE;
         stage.align = StageAlign.TOP_RIGHT;
         Utils.IS_BROWSER = false;
         Utils.DEBUG = false;
         Utils.LOW_RES = false;
         rootStage = stage;
         if(true)
         {
            Utils.IS_ON_WINDOWS = true;
         }
         Utils.IS_ANDROID = true;
         if(Utils.IS_BROWSER)
         {
            viewport = new Rectangle(0,0,640,480);
         }
         else
         {
            myOS = Capabilities.os;
            myOSLowerCase = myOS.toLowerCase();
            Utils.OS = myOSLowerCase;
            if(Utils.IS_ON_WINDOWS)
            {
               Utils.IS_ON_WINDOWS = true;
               screenWidth = stage.stageWidth;
               screenHeight = stage.stageHeight;
               Utils.MODEL = Utils.OS;
               Utils.LOW_RES = false;
               if(screenWidth == 812 && screenHeight == 375)
               {
                  Utils.IS_IPHONE_X = true;
               }
               else if(screenWidth == 896 && screenHeight == 414)
               {
                  Utils.IS_IPHONE_X = true;
               }
               else if(screenWidth == 1334 && screenHeight == 621)
               {
                  Utils.IS_IPHONE_X = true;
               }
               else if(screenWidth == 2016 && screenHeight == 931)
               {
                  Utils.IS_IPHONE_X = true;
               }
               else if(screenWidth == 1792 && screenHeight == 828)
               {
                  Utils.IS_IPHONE_X = true;
               }
               else if(screenWidth == 1344 && screenHeight == 621)
               {
                  Utils.IS_IPHONE_X = true;
               }
               else if(screenWidth == 1840 && screenHeight == 860)
               {
                  Utils.IS_IPHONE_X = true;
               }
               else if(screenWidth == 1024 && screenHeight == 768)
               {
                  Utils.IS_IPAD = true;
               }
            }
            else
            {
               screenWidth = stage.fullScreenWidth;
               screenHeight = stage.fullScreenHeight;
               Utils.IS_ON_WINDOWS = false;
            }
            screenRatio = Number(screenWidth / screenHeight);
            Utils.ratio = screenRatio;
            Utils.__width = screenWidth;
            Utils.__height = screenHeight;
            viewport = new Rectangle(0,0,screenWidth,screenHeight);
         }
         if(Utils.IS_ON_WINDOWS == false)
         {
            Starling.multitouchEnabled = true;
         }
         this.myStarling = new Starling(Game,stage,viewport);
         this.myStarling.antiAliasing = 1;
         this.myStarling.simulateMultitouch = true;
         this.myStarling.stage.color = 2698291;
         this.myStarling.start();
         this.myStarling.skipUnchangedFrames = true;
         this.fetchLanguage();
      }
      
      private function fetchLanguage() : void
      {
         Utils.Lang = "_en";
         Utils.EnableFontStrings = false;
         Utils.IsLanguageWithNoSpaces = false;
      }
      
      private function keyHandler(event:KeyboardEvent) : void
      {
      }
      
      protected function activate(e:Event) : void
      {
         this.myStarling.start();
         if(Utils.IS_ANDROID)
         {
            SoundSystem.PlayLastMusic(true);
         }
      }
      
      protected function deactivate(e:Event) : void
      {
         this.myStarling.stop();
         if(!Utils.PauseOn && !Utils.FreezeOn && !Utils.CatOn && !Utils.RateOn && !Utils.ShopOn && !Utils.HelperOn && !Utils.GameOverOn && !Utils.GateUnlockOn && !Utils.PremiumOn && !Utils.QuestOn && !Utils.QuestAvailablePanelOn && !Utils.DoubleCoinsOn)
         {
            Utils.CheckPause = true;
            LevelTimer.getInstance().startPause();
         }
         if(Utils.IS_ANDROID)
         {
            SoundSystem.StopMusic(true,true);
         }
      }
      
      private function getWords(_string:String, _index:int) : String
      {
         var array:Array = _string.split(" ");
         return array[_index];
      }
      
      private function getIOSWords(_string:String, _index:int) : String
      {
         var array:Array = _string.split(",");
         return array[_index];
      }
      
      internal function focusHandler(event:Event) : void
      {
         trace("focus = " + event.type);
      }
   }
}
