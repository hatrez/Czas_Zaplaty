instance VLK_5003_Buddler (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_Buddler;
	npctype =						npctype_mine_ambient;
	guild =							GIL_VLK;      
	level =							3;
	
	
	voice =							1;
	id =							5003;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		15;
	attribute[ATR_STRENGTH] =		10;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	76;
	attribute[ATR_HITPOINTS] =		76;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,head mesh,hairmesh,face-tex,hair-tex,skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",3,1,"Hum_Head_Fighter",67,1,-1);

	B_Scale (self); 
	Mdl_SetModelFatness (self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- Talents --------                                    

	
	//-------- inventory --------                                    

	EquipItem (self,DEF_MW_1H);
	CreateInvItem (self,ItFoApple);


	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_FMstart_5003;
	};

FUNC VOID Rtn_FMstart_5003 ()	//FM
{
	TA_PickOre		(00,00,23,00,"FM_103");
	TA_PickOre		(23,00,24,00,"FM_103");
};



FUNC VOID Rtn_GO_5003 ()	//FM
{
	TA_StandAround	(19,00,06,00,"FM_148");	
	TA_StandAround	(06,00,19,00,"FM_148");	
};











