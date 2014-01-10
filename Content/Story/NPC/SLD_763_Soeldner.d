instance SLD_763_Soeldner (Npc_Default)
{
	//-------- primary data --------
	
	name =					Name_Soeldner;
	Npctype =				NPCTYPE_MINE_GUARD;
	guild =					GIL_SLV;
	level =					16;
	
	voice =					8;
	id =					763;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		75;
	attribute[ATR_DEXTERITY] =		55;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	232;
	attribute[ATR_HITPOINTS] =		232;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");

	//				body mesh,head mesh,hairmesh,face-tex,hair-tex,skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,3,"Hum_Head_FatBald",8,0,SLD_ARMOR_M);
	
	B_Scale (self);
	Mdl_SetModelFatness (self,0);
	
	fight_tactic	=	FAI_HUMAN_STRONG; 
	
	//-------- Talente --------
	
	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);
	Npc_SetTalentSkill (self,NPC_TALENT_2H,1);
	

	//-------- inventory --------                                    

	EquipItem (self,MTR_MW_02);
	EquipItem (self,ItRw_Bow_Long_01);
	CreateInvItems(self,ItAmArrow,20);
	CreateInvItems (self,ItFoRice,7);
	CreateInvItems (self,ItFoLoaf,5);
	CreateInvItems (self,ItFoMutton,4);
	CreateInvItems(self,ItMiNugget,20);
	CreateInvItems (self,ItFoBooze,5);
	CreateInvItems (self,ItLsTorch,5);
	CreateInvItems (self,ItFo_Potion_Health_02,8);
	CreateInvItem (self,ItMi_Stuff_Barbknife_01);
	CreateInvItem (self,ItMi_Stuff_Amphore_01);
	
	//-------------Daily Routine-------------

	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_FMCstart_763;

};

FUNC VOID Rtn_FMCstart_763 ()
{
	TA_Guard	(01,00,13,00,"FMC_PATH05");
	TA_Guard	(13,00,01,00,"FMC_PATH05");
};


FUNC VOID Rtn_NC1_763 ()
{
	TA_SmallTalk	(01,00,13,00,"NC_TAVERN_TOP05");
	TA_SmallTalk	(13,00,01,00,"NC_TAVERN_TOP05");
};


FUNC VOID Rtn_NC2_763 ()
{
	TA_Guard	(01,00,13,00,"FMC_PATH05");
	TA_Guard	(13,00,01,00,"FMC_PATH05");
};


FUNC VOID Rtn_NC3_763 ()
{
	TA_FollowPC		(02,00,14,00,"NC_EN_SLVCAMP_01");	
	TA_FollowPC		(14,00,02,00,"NC_EN_SLVCAMP_01");
};

FUNC VOID Rtn_NC4_763 ()
{
	TA_Guard		(02,00,14,00,"NC_EN_SLVCAMP_01");	
	TA_Guard		(14,00,02,00,"NC_EN_SLVCAMP_01");
};


FUNC VOID Rtn_NC5_763 ()
{
	TA_Guard		(02,00,14,00,"MERC_WP3");	
	TA_Guard		(14,00,02,00,"MERC_WP3");
};
