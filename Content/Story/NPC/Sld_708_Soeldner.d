instance SLD_708_Soeldner (Npc_Default)
{
	//-------- primary data --------
	
	name =					NAME_Soeldner;
	Npctype =				NPCTYPE_AMBIENT;
	guild =					GIL_SLV;      
	level =					12;
	
	voice =					11;
	id =					856;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		120;
	attribute[ATR_DEXTERITY] =		80;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	136;
	attribute[ATR_HITPOINTS] =		136;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,head mesh,hairmesh,face-tex,hair-tex,skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_FatBald",36,2,SLD_ARMOR_M);
	
	B_Scale (self);	
	Mdl_SetModelFatness (self,0);		
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	
	//-------- Talente ----------

	Npc_SetTalentSkill (self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);
	

	//-------- inventory --------   
	                                 
	CreateInvItems (self,ItKeLockpick,3);		
	CreateInvItems(self,ItMiNugget,15);
	CreateInvItems (self,ItFoRice,9);
	CreateInvItems (self,ItFoBooze,7);
	CreateInvItems (self,ItLsTorch,3);
	CreateInvItems (self,ItFo_Potion_Health_01,3);
	CreateInvItem (self,ItMi_Stuff_Plate_01);
	CreateInvItem (self,ItMi_Stuff_Cup_01);
	CreateInvItem (self,ItFoMutton);
	CreateInvItem (self,ItFoLoaf);
	CreateInvItem (self,ItAt_Teeth_01);
	EquipItem (self,MTR_MW_02);
	EquipItem (self,MTR_RW_01);
	CreateInvItems (self,ItAmArrow,20);
	
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_708;
};

FUNC VOID Rtn_NC2_708 ()
{
	TA_Sleep		    (00,00,08,00,"NC_HUT07_IN");
	TA_SitAround		(08,00,00,00,"NC_PLACE03");
};


FUNC VOID Rtn_start_708 ()
{
	TA_Guard		    (00,00,08,00,"LOCATION_19_03_SECOND_HARPYE5");
	TA_Guard		(08,00,00,00,"LOCATION_19_03_SECOND_HARPYE5");
};


FUNC VOID Rtn_NC1_708 ()
{
	TA_Guard		    (00,00,08,00,"OW_PATH_07_21_GUARD_RIGHT");
	TA_Guard		(08,00,00,00,"OW_PATH_07_21_GUARD_RIGHT");
};


FUNC VOID Rtn_NC3_708 ()
{
	TA_Guard		    (00,00,08,00,"OW_LEFT_RIGHT_CAMP");
	TA_Guard		(08,00,00,00,"OW_LEFT_RIGHT_CAMP");
};






