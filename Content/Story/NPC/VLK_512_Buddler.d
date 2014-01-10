instance VLK_512_Buddler (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_Buddler;
	npctype =						npctype_ambient;
	guild =							GIL_VLK;      
	level =							2;
	
	
	voice =							1;
	id =							512;


	//-------- abilities --------
	
	attribute[ATR_STRENGTH] =		73;
	attribute[ATR_DEXTERITY] =		10;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	564;
	attribute[ATR_HITPOINTS] =		564;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,head mesh,hairmesh,face-tex,hair-tex,skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",3,0,"Hum_Head_Psionic",16,3,VLK_ARMOR_L);

	B_Scale (self); 
	Mdl_SetModelFatness (self,1);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 
	
	//-------- Talents  --------                                    

	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);
	
	//-------- inventory --------                                    

	EquipItem (self,ALL_MW_02);
	CreateInvItem (self,ItMwPickaxe);
	CreateInvItem (self,ItFoLoaf);
	CreateInvItem (self,ItLsTorch);

	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_512;
	};

FUNC VOID Rtn_start_512 () //Durchgangsh?tte Bloodwyn/Markt
{
	TA_Sleep	    (23,00,08,00,"OCR_HUT_14");
	TA_Smalltalk	(08,00,12,00,"OCR_OUTSIDE_HUT_63_SMALLTALK");
	TA_SitAround   	(12,00,16,00,"OCR_OUTSIDE_HUT_23");
	TA_SitAround   	(16,00,23,00,"OCR_OUTSIDE_HUT_34");
};






