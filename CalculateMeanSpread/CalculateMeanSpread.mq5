//+------------------------------------------------------------------+
//|                                          CalculateMeanSpread.mq5 |
//|                                                   Kayro Schembek |
//|                        https://www.instagram.com/kayro.schembek/ |
//+------------------------------------------------------------------+
#property copyright "Kayro Schembek"
#property link      "https://www.instagram.com/kayro.schembek/"
#property version   "1.00"



void OnStart()
   {
      
      CalculateMeanSpread();
   }

void CalculateMeanSpread()
   {
      ENUM_TIMEFRAMES timeframe = PERIOD_M1;
      datetime hour_start  = D'2025.04.01 00:00';
      datetime hour_end    = TimeCurrent();
      
      int numberBar = Bars(_Symbol, timeframe, hour_start, hour_end);
      
      MqlRates candles[];
      ArraySetAsSeries(candles, true);
      CopyRates(_Symbol, timeframe, 1, numberBar, candles);


      double spread[];
      ArrayResize(spread, numberBar);
      for(int i = 0; i < numberBar; i++)
         spread[i] = candles[i].spread;
      
      double mean = Mean(spread);
      double standard_deviation = StandarDeviation(spread);
      double mean_sd_1 = mean + 1*standard_deviation;
      double mean_sd_2 = mean + 2*standard_deviation;
      double mean_sd_3 = mean + 3*standard_deviation;
      
      double frequency_0 = Frequency(spread, mean);
      double frequency_1 = Frequency(spread, mean_sd_1);
      double frequency_2 = Frequency(spread, mean_sd_2);
      double frequency_3 = Frequency(spread, mean_sd_3);
      
      double frequency_0_perc = frequency_0/numberBar;
      double frequency_1_perc = frequency_1/numberBar;
      double frequency_2_perc = frequency_2/numberBar;
      double frequency_3_perc = frequency_3/numberBar;
      
      Print("------Spread------");
      Print("Symbol: ", _Symbol);
      Print("Number of Candles: ", numberBar);
      Print("Mean : ", mean, " | Frequency: ", frequency_0 , " | " , frequency_0_perc , "%");
      Print("Mean + 1StD: ", mean_sd_1, " | Frequency: ", frequency_1 , " | " , frequency_1_perc , "%");
      Print("Mean + 2StD: ", mean_sd_2, " | Frequency: ", frequency_2 , " | " , frequency_2_perc , "%");
      Print("Mean + 3StD: ", mean_sd_3, " | Frequency: ", frequency_3 , " | " , frequency_3_perc , "%");
      Print("------------------");
   }

double Mean(double &array[])
   {
      int size = ArraySize(array);
      double sum = 0;
      for(int i = 0; i < size; i++)
         sum = sum + array[i]; 
      double mean = sum/size;
      return mean;
   }
double StandarDeviation(double &array[])
   {
      int size = ArraySize(array);
      double mean = Mean(array);

      double sum_2 = 0;
      double sum_sqrt[];
      ArrayResize(sum_sqrt, size);
      for(int i = 0; i < size; i++)
         {
            double aux = array[i];
            sum_sqrt[i] = MathPow(aux - mean, 2);
            sum_2 += sum_sqrt[i];
         }      
      double standard_deviation = MathSqrt(sum_2/size);
      return standard_deviation;
   } 
double Frequency(double &array[], double value)
   {
      int size = ArraySize(array);
      int frequency = 0;    
      for(int i = 0; i < size; i++)
         {
            if(array[i] >= value)
               frequency++;     
         }   
      return frequency;
   }   