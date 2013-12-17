instance Grd_256_Gardist (Npc_Default)
{
	//-------- primary data --------
	//Chase Hero
	name 		=	NAME_Gardist;
	npctype		=	NPCTYPE_GUARD;
	guild 		=	GIL_GRD;
	level 		=	20;
	voice 		=	7;
	id 			=	256;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 100;
	attribute[ATR_DEXTERITY] 	= 105;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 220;
	attribute[ATR_HITPOINTS] 	= 220;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_FatBald",84,1,GRD_ARMOR_M);

	B_Scale (self);
    	Mdl_SetModelFatness(self,2);
    	
    	Npc_SetAivar(self,AIV_IMPORTANT,  TRUE);
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_2H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_CROSSBOW,2);		
			
	//-------- inventory --------
	
	EquipItem	(self,GRD_MW_03);
	CreateInvItem	(self,ItFo_Potion_Water_01);
	CreateInvItem	(self,ItLsTorch);
	
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_256;
};

FUNC VOID Rtn_start_256 ()
{
    TA_MIS_ChaseHero	(00,30,20,00,"OCR_TO_HUT_43");	//
    TA_MIS_ChaseHero		(20,00,07,00,"OCR_TO_HUT_43"); //
};

FUNC VOID Rtn_DEAD_256 ()
{
	TA_Stay		(05,00,10,00,"INVISIBLE2");
	TA_Stay 	(10,00,05,00,"INVISIBLE2");

};
