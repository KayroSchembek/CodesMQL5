//+------------------------------------------------------------------+
//|                                               DistancePrices.mq5 |
//|                                                   Kayro Schembek |
//|                        https://www.instagram.com/kayro.schembek/ |
//+------------------------------------------------------------------+
#property copyright "Kayro Schembek"
#property link      "https://www.instagram.com/kayro.schembek/"
#property version   "1.00"



void OnStart()
   {
      // example how to use 
      double distance_point = DistancePrices(1.1000, 1.1100);
   
   }
//+------------------------------------------------------------------+

double DistancePrices(double price_1, double price_2)
   {
      double reslt = (price_1 - price_2)*MathPow(10,_Digits);
      return reslt;
   }
