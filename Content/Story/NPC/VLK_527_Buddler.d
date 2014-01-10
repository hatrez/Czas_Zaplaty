instance VLK_527_Buddler (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_Buddler;
	npctype =						npctype_ambient;
	guild =							GIL_NONE;      
	level =							12;
	
	
	voice =							3;
	id =							527;

	//-------- abilities --------
	
	attribute[ATR_STRENGTH] =		63;
	attribute[ATR_DEXTERITY] =		10;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	94;
	attribute[ATR_HITPOINTS] =		94;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,head mesh,hairmesh,face-tex,hair-tex,skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",3,1,"Hum_Head_Bald",72,4,VLK_ARMOR_M);

	B_Scale (self); 
	Mdl_SetModelFatness (self,0);
    	
    	Npc_SetAivar(self,AIV_IMPORTANT,  TRUE);
	
	fight_tactic	=	FAI_HUMAN_STRONG; 

	//-------- Talents  --------                                    

	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);
	
	//-------- inventory --------                                    

	EquipItem (self,ItMw_1h_Sword_01);
	CreateInvItem (self,ItMwPickaxe);
	CreateInvItem (self,ItFoLoaf);
	CreateInvItem (self,ItFoBeer);
	CreateInvItem (self,ItLsTorch);
	
		
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_527;
};

FUNC VOID Rtn_start_527 ()
{
	TA_Sleep		(23,15,07,00,"OCR_HUT_77");
	TA_Boss			(07,00,07,30,"OCR_OUTSIDE_HUT_47");
	TA_WashSelf		(07,30,08,30,"OCR_LAKE_1");
	TA_StandAround  (08,30,18,00,"OCR_OUTSIDE_HUT_77");
	TA_SitCampfire	(18,00,23,00,"OCR_OUTSIDE_HUT_77");
};









