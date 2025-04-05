//+------------------------------------------------------------------+
//|                                               CreateTemplate.mq5 |
//|                                                   Kayro Schembek |
//|                        https://www.instagram.com/kayro.schembek/ |
//+------------------------------------------------------------------+
#property copyright "Kayro Schembek"
#property link      "https://www.instagram.com/kayro.schembek/"
#property version   "1.00"



void OnStart()
   {
      CreateTemplate();
   }

void CreateTemplate()
   {
      ChartSetInteger(0, CHART_SHOW_GRID, false);
      ChartSetInteger(0, CHART_SHOW_TRADE_LEVELS, false);
      
      color bg_color    = C'25,25,25';
      color candle_high = C'38,166,154';
      color candle_low  = C'239,83,80';
      
      ChartSetInteger(0, CHART_COLOR_BACKGROUND, bg_color);
      ChartSetInteger(0, CHART_COLOR_FOREGROUND, clrSilver);
      ChartSetInteger(0, CHART_COLOR_CHART_UP, clrSeashell);
      ChartSetInteger(0, CHART_COLOR_CHART_DOWN, clrSeashell);
      ChartSetInteger(0, CHART_COLOR_CANDLE_BULL, candle_high);
      ChartSetInteger(0, CHART_COLOR_CANDLE_BEAR, candle_low);
      ChartSetInteger(0, CHART_COLOR_CHART_LINE, candle_high);
      ChartSetInteger(0, CHART_COLOR_LAST, clrSilver);
      ChartSetInteger(0, CHART_COLOR_ASK, clrSilver);      
      ChartSetInteger(0, CHART_COLOR_BID, clrSilver);
      ChartSetInteger(0, CHART_COLOR_STOP_LEVEL, candle_low);
      ChartSetInteger(0, CHART_COLOR_VOLUME, clrSilver);
      ChartSetInteger(0, CHART_COLOR_GRID, clrSilver);   
   }            