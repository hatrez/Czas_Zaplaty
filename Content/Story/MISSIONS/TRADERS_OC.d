// ************************************************************
// 			  		TRADERS OLDCAMP 
// ************************************************************
//
//-Jeff
//-?
//

// ************************************************************
// 			  		JEFF
// ************************************************************
// Bro�, mikstury amunicja, magia i klamoty
// ************************************************************

// ************************************************************
// 			  		 VARIBLE
// ************************************************************
var int Jeff_TradeInvGiven;
// ************************************************************
// 			  		CONTAINER
// ************************************************************
instance Jeff_Container(Npc_Default)
{
	name	=	"Magazynek Jeffa";
	//trader start inventory
	CreateInvItems(self,ItMINugget,500);
	
	CreateInvItems(self,GRD_MW_01_short,2);
	CreateInvItems(self,GRD_MW_01,2);
	CreateInvItems(self,GRD_MW_02,2);
	CreateInvItems(self,GRD_MW_03,2);
	CreateInvItems(self,GRD_MW_04,2);
	CreateInvItem(self,GRD_RW_01);
	CreateInvItem(self,GRD_RW_01);

	
	CreateInvItems(self,ItAmArrow,50);
	CreateInvItems(self,ItAmBolt,50);
	CreateInvItems(self,ItAmBolt_10,10);

	CreateInvItem(self,ItAt_WolfTeeth);
	CreateInvItems(self,ItAt_OrcTeeth,2);
	
	CreateInvItem(self,ItKe_Mis_SO_Warehouse2U);
	
	CreateInvItems(self,ItFo_Fish,3);
	CreateInvItems(self,ItFo_BeerMug,5);
	CreateInvItems(self,ItFo_Milk,2);

	CreateInvItems(self,ItFo_wineberrys_01,3);
	CreateInvItems(self,ItFoLoaf,2);
	CreateInvItems(self,ItFoMutton,3);
	CreateInvItems(self,ItFoCheese,5);
	CreateInvItems(self,ItFoSoup,2);
	CreateInvItems(self,ItFo_Gin,1);
	CreateInvItems(self,ItFo_Stew,2);
	CreateInvItems(self, ItKeLockpick,5);

	CreateInvItem(self,ItMwPickaxe);	
	CreateInvItem(self,ItMw_1H_Sword_Short_02);	
	CreateInvItem(self,ItMw_1H_Sword_Long_02);	
	CreateInvItems(self,ItMiSwordRaw,3);

	
	CreateInvItems(self, ItFo_Potion_Health_01,1);
	CreateInvItems(self, ItFo_Potion_Health_02,1);
	
	CreateInvItems(self, ItFo_Potion_Dex_2_temp,1);
	CreateInvItems(self, ItFo_Potion_Str_3_temp,1);
	CreateInvItems(self, ItFo_Potion_Str_Dex_1_temp,1);

	CreateInvItem(self,ItRw_Bow_Long_03);	
	
	//-------- visuals --------
	// 						animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//						Body-Mesh			Body-Tex	Skin-Color	Head-MMS    		Head-Tex	Teeth-Tex 	Armor-Tex
	Mdl_SetVisualBody (self,"hum_body_Naked0",4,1,"Hum_Head_Pony",9,0,-1);
};
//-----------------------------------------------------------------
// EXIT Jeff
//-----------------------------------------------------------------
INSTANCE DIA_Grd_1246_Jeff_Exit (C_INFO)
{
	npc			= Grd_1246_Jeff;
	nr			= 999;
	condition	= DIA_Grd_1246_Jeff_Exit_Condition;
	information	= DIA_Grd_1246_Jeff_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Grd_1246_Jeff_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Grd_1246_Jeff_Exit_Info()
{
	Jeff_TradeInvGiven=FALSE;
	var c_npc container; container = HLP_GetNpc(Jeff_Container);
	B_ClearTraderInv(self,container);
	B_StopProcessInfos	( self );
};

//-----------------------------------------------------------------
// Jeff TRADE
//-----------------------------------------------------------------
instance Info_GRD_Jeff_TRADE(C_INFO)
{
	npc				= Grd_1246_Jeff;
	condition		= Info_GRD_Jeff_TRADE_Condition;
	information		= Info_GRD_Jeff_TRADE_Info;
	//important		= 1;
	permanent		= 1;
	trade 			= 1;
	nr				= 990;
	description		= "(handel)";
};

FUNC int  Info_GRD_Jeff_TRADE_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Jeff_Hello))
	{
      return 1;
	};
};
func void  Info_GRD_Jeff_TRADE_Info()
{
	AI_Output (other, self,"DIA_Jeff_TRADE_Info_15_01"); //Pohandlujmy.
	AI_Output (self, other,"DIA_Jeff_TRADE_Info_07_02"); //Mam nadziej�, �e masz rud�...
	
   if(!Jeff_TradeInvGiven)
	{
      var c_npc container; container = HLP_GetNpc(Jeff_Container);
      B_ClearTraderInv(container,self);		
	};
   
	Jeff_TradeInvGiven=TRUE;
	
	Trade_EraseValue();	//BUGFIX has to be in every trade dialog
	Trade_WEAPON_Mul	= mulf(Trade_ALL_Mul,1041865113);//0.15*
};
