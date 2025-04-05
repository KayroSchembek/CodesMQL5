//+------------------------------------------------------------------+
//|                                                ProfitHistory.mq5 |
//|                                                   Kayro Schembek |
//|                        https://www.instagram.com/kayro.schembek/ |
//+------------------------------------------------------------------+
#property copyright "Kayro Schembek"
#property link      "https://www.instagram.com/kayro.schembek/"
#property version   "1.00"



void OnStart()
   {
      // example how to use
      datetime date_history_start   = D'2015.01.01 00:00';  // define data start history
      datetime date_history_end     = TimeCurrent();        // define data end history
      ulong    magic_number         = 1;                    // define magic number
      
      // overload in functions
      double profit_1 = ProfitHistory(date_history_start, date_history_end);      
      double profit_2 = ProfitHistory(date_history_start, date_history_end, magic_number);

      PrintFormat("All ExpertAdvisor: %f.", profit_1);      
      PrintFormat("ExpertAdvisor %u: %f.", magic_number, profit_2);
   }

// Function 1 - Get total profit
double ProfitHistory(datetime data_start, datetime data_end)
   {
      double profit = 0;
      HistorySelect(data_start, data_end);
      int total = HistoryDealsTotal();
      for(int i = 0; i < HistoryDealsTotal(); i++)
         {
            ulong ticket = HistoryDealGetTicket(i);
            if(HistoryDealGetInteger(ticket, DEAL_ENTRY) == DEAL_ENTRY_OUT)
               profit = profit + HistoryDealGetDouble(ticket, DEAL_PROFIT);
         }  
      return profit;
   }  
   
// Function 2 - Get profit by expert advisor
double ProfitHistory(datetime data_start, datetime data_end, ulong magic_number)
   {
      double profit = 0;
      HistorySelect(data_start, data_end);
      int total = HistoryDealsTotal();
      for(int i = 0; i < HistoryDealsTotal(); i++)
         {
            ulong ticket = HistoryDealGetTicket(i);
            if(HistoryDealGetInteger(ticket, DEAL_ENTRY) == DEAL_ENTRY_OUT)
               if(HistoryDealGetInteger(ticket, DEAL_MAGIC) == magic_number)
                  profit = profit + HistoryDealGetDouble(ticket, DEAL_PROFIT);
         }  
      return profit;
   }
 