instance RBL_1410_Templer (Npc_Default)
{
	//-------- primary data --------
	name =							Name_Templer;
	npctype =						NPCTYPE_GUARD;
	guild =							GIL_RBL;
	level =							17;
	flags =							0;
	
	voice =							11;
	id =							1410;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] =		85;
	attribute[ATR_DEXTERITY] =		65;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	244*PSI_DREAM_FGT_TIME;
	attribute[ATR_HITPOINTS] =		244*PSI_DREAM_FGT_TIME;


	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",1,1 ,"Hum_Head_Bald",64 ,4,TPL_ARMOR_M);

	B_Scale (self);
	Mdl_SetModelFatness(self,-1);
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 

	Npc_SetTalentSkill (self,NPC_TALENT_2H,1);
	
	//-------- inventory --------
	
	EquipItem (self,ItMw_2H_Sword_Light_01);
	CreateInvItem (self,ItFoSoup);
	CreateInvItem (self,ItMiJoint_1);
	
	
	//-------------Daily Routine-------------
 Npc_SetAivar(self,AIV_SPECIALCOMBATDAMAGEREACTION,  TRUE);
	daily_routine = Rtn_start_1410;
};

FUNC VOID Rtn_start_1410 ()
{

    TA_Stand	(00,00,08,00,"PSI_GUARD_TEMPLE_5_2");
	TA_Stand	(08,00,24,00,"PSI_GUARD_TEMPLE_5_2");	
};



