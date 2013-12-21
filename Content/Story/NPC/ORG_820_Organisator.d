instance ORG_820_Organisator (Npc_Default)
{
	//-------- primary data --------
	
	name =					Name_Organisator;
	Npctype =				Npctype_Ambient;
	guild =					GIL_SLV;      
	level =					8;
	
	voice =					13;
	id =					820;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		30;
	attribute[ATR_DEXTERITY] =		30;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	136;
	attribute[ATR_HITPOINTS] =		136;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,head mesh,hairmesh,face-tex,hair-tex,skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_FatBald",36,2,ORG_ARMOR_L);
	
	B_Scale (self);	
	Mdl_SetModelFatness (self,0);		
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	
	//-------- Talente ----------

	Npc_SetTalentSkill (self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);
	

	//-------- inventory --------   
	                                 
	CreateInvItems (self,ItKeLockpick,2);		
	CreateInvItems(self,ItMiNugget,15);
	CreateInvItems (self,ItFoRice,6);
	CreateInvItems (self,ItFoBooze,2);
	CreateInvItems (self,ItLsTorch,1);
	CreateInvItems (self,ItFo_Potion_Health_01,3);
	CreateInvItem (self,ItMi_Stuff_Plate_01);
	CreateInvItem (self,ItMi_Stuff_Cup_01);
	CreateInvItem (self,ItFoLoaf);
	CreateInvItem (self,ItAt_Claws_01);
	EquipItem (self,ItMw_1H_Mace_03);
	EquipItem (self,ItRw_Bow_Long_01);
	CreateInvItems (self,ItAmArrow,20);
	
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_820;
};

FUNC VOID Rtn_start_820 ()
{
	TA_Sleep		(00,30,08,30,"NC_HUT12_IN");
	TA_StandAround	(08,30,00,30,"NC_PATH11");
};

FUNC VOID Rtn_NC1_820 ()
{
	TA_SitCampfire		(00,05,08,05,"NC_SLVCAMPFIRE2");
	TA_SitCampfire	(08,05,00,05,"NC_SLVCAMPFIRE2");
};


FUNC VOID Rtn_NC2_820 ()
{
	TA_Sleep		(00,30,08,30,"NC_HUT12_IN");
	TA_StandAround	(08,30,00,30,"NC_PATH11");
};




