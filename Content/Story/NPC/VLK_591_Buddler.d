instance VLK_591_Buddler (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_Buddler;
	npctype =						npctype_mine_ambient;
	guild =							GIL_VLK;      
	level =							5;
	
	
	voice =							3;
	id =							591;


	//-------- abilities --------
	
	attribute[ATR_STRENGTH] =		25;
	attribute[ATR_DEXTERITY] =		15;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	100;
	attribute[ATR_HITPOINTS] =		100;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,head mesh,hairmesh,face-tex,hair-tex,skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,1,"Hum_Head_FatBald",71,1,VLK_ARMOR_L);

	B_Scale (self); 
	Mdl_SetModelFatness (self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	
	//-------- Talents  --------                                    
	
	//-------- inventory --------                                    

	EquipItem (self,ALL_MW_02);
	CreateInvItem (self,ItMwPickaxe);
	CreateInvItem (self,ItFoLoaf);
	CreateInvItem (self,ItFoBeer);
	CreateInvItem (self,ItLsTorch);


	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_591;
};

FUNC VOID Rtn_start_591 ()
{
	TA_PickOre		(21,00,04,00,"OM_CAVE3_25");
    TA_PickOre	    (04,00,21,00,"OM_CAVE3_25");	
};













