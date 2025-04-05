//+------------------------------------------------------------------+
//|                                           CreateVerticalLine.mq5 |
//|                                                   Kayro Schembek |
//|                        https://www.instagram.com/kayro.schembek/ |
//+------------------------------------------------------------------+
#property copyright "Kayro Schembek"
#property link      "https://www.instagram.com/kayro.schembek/"
#property version   "1.00"



void OnStart()
   {
      // example how to use
      datetime data  = TimeCurrent();     // define datetime in creatin;
      string   name  = "Vertical Line";   // define name vertical line
      
      if(CreateVerticalLine(data, name))
         Print("Vertical line created successful.");
      else
         Print("Error in creation vertical line.");  
   }


bool CreateVerticalLine(datetime data, string name_object)
   {
      if(!ObjectCreate(0, name_object, OBJ_VLINE, 0, data, 0))
         return false;
      if(!ObjectSetInteger(0, name_object, OBJPROP_COLOR, clrRed))
         return false;
      if(!ObjectSetInteger(0, name_object, OBJPROP_STYLE, STYLE_DASH))
         return false;
      return true;   
   }