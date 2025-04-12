//+------------------------------------------------------------------+
//|                                                     LoteInfo.mq5 |
//|                                                   Kayro Schembek |
//|                        https://www.instagram.com/kayro.schembek/ |
//+------------------------------------------------------------------+
#property copyright "Kayro Schembek"
#property link      "https://www.instagram.com/kayro.schembek/"
#property version   "1.00"



void OnStart()
   {
      // example    
      double lote = 1.3;   // lot calculated by margem or any other method
      double lote_calc  = LoteCalculate(lote);
      
      Print("Lote Calc: ", lote_calc);
   }

double LoteMin()
   {
      double lote_min = SymbolInfoDouble(_Symbol, SYMBOL_VOLUME_MIN);
      return lote_min;
   }
   
double LoteStep()
   {
      double lote_min = SymbolInfoDouble(_Symbol, SYMBOL_VOLUME_STEP);
      return lote_min;
   }   
   
double LoteCalculate(double lote)
   {
      double lote_min   = LoteMin();
      double lote_step  = LoteStep();
      
      double factor = NormalizeDouble(lote/lote_step, 0);
      double lote_new = factor*lote_step;

      if(lote_new < lote_min)
         lote_new = lote_min;      
         
      return lote_new;
   }   