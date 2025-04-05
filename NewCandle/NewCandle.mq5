//+------------------------------------------------------------------+
//|                                                    NewCandle.mq5 |
//|                                                   Kayro Schembek |
//|                        https://www.instagram.com/kayro.schembek/ |
//+------------------------------------------------------------------+
#property copyright "Kayro Schembek"
#property link      "https://www.instagram.com/kayro.schembek/"
#property version   "1.00"


void OnStart()
   {
      // example how to use 
      if(NewCandle(PERIOD_M1))
         Print("Started New Candle.");
         
   }

bool NewCandle(ENUM_TIMEFRAMES time_frame)
   {
      static int index = 0;
      int new_index = Bars(_Symbol, time_frame); 
      if(index != new_index)  
         {  
            index = new_index;   
            return true;  
         } 
      return false;     
   }