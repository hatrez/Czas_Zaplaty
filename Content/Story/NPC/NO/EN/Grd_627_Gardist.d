instance Grd_627_Gardist (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	NAME_Gardist;
	npctype		= 	npctype_guard;
	guild 		=	GIL_GRD;
	level 		=	22;
	voice 		=	8;
	id 			=	627;
	
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 120;
	attribute[ATR_DEXTERITY] 	= 90;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 220;
	attribute[ATR_HITPOINTS] 	= 220;
	
	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_FIGHTER",115,1,GRD_ARMOR_H);
        
	B_Scale (self);
    	Mdl_SetModelFatness(self,1);
    	
    	fight_tactic	=	FAI_HUMAN_MASTER;

	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_2H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_CROSSBOW,1);		
			
	//-------- inventory --------
	
	EquipItem	(self,GRD_MW_03);
	CreateInvItem	(self,ItFoBeer);
	CreateInvItem	(self,ItFo_Stew);
	CreateInvItem	(self,ItLsTorch);
	
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_627;
};

FUNC VOID Rtn_start_627 ()
{
	TA_Stay	(00,00,00,05,"NC_EN_MAINHALL1_05");
	TA_Stay	(00,05,00,10,"NC_EN_MAINHALL1_02");
	TA_Stay	(00,10,00,15,"NC_EN_MAINHALL1_08");
	TA_Stay	(00,15,00,20,"NC_EN_MAINHALL1_06");
	TA_Stay	(00,20,00,25,"NC_EN_MAINHALL1_05");	
	TA_Stay	(00,25,00,30,"NC_EN_MAINHALL1_02");
	TA_Stay	(00,30,00,35,"NC_EN_MAINHALL1_08");
	TA_Stay	(00,35,00,40,"NC_EN_MAINHALL1_06");
	TA_Stay	(00,40,00,45,"NC_EN_MAINHALL1_05");
	TA_Stay	(00,45,00,50,"NC_EN_MAINHALL1_02");
	TA_Stay	(00,50,00,55,"NC_EN_MAINHALL1_08");	
	TA_Stay	(00,55,00,59,"NC_EN_MAINHALL1_06");	
	
	TA_Stay	(01,00,01,05,"NC_EN_MAINHALL1_05");
	TA_Stay	(01,05,01,10,"NC_EN_MAINHALL1_02");
	TA_Stay	(01,10,01,15,"NC_EN_MAINHALL1_08");
	TA_Stay	(01,15,01,20,"NC_EN_MAINHALL1_06");
	TA_Stay	(01,20,01,25,"NC_EN_MAINHALL1_05");	
	TA_Stay	(01,25,01,30,"NC_EN_MAINHALL1_02");
	TA_Stay	(01,30,01,35,"NC_EN_MAINHALL1_08");
	TA_Stay	(01,35,01,40,"NC_EN_MAINHALL1_06");
	TA_Stay	(01,40,01,45,"NC_EN_MAINHALL1_05");
	TA_Stay	(01,45,01,50,"NC_EN_MAINHALL1_02");
	TA_Stay	(01,50,01,55,"NC_EN_MAINHALL1_08");	
	TA_Stay	(01,55,01,59,"NC_EN_MAINHALL1_06");		
	
	TA_Stay	(02,00,02,05,"NC_EN_MAINHALL1_05");
	TA_Stay	(02,05,02,10,"NC_EN_MAINHALL1_02");
	TA_Stay	(02,10,02,15,"NC_EN_MAINHALL1_08");
	TA_Stay	(02,15,02,20,"NC_EN_MAINHALL1_06");
	TA_Stay	(02,20,02,25,"NC_EN_MAINHALL1_05");	
	TA_Stay	(02,25,02,30,"NC_EN_MAINHALL1_02");
	TA_Stay	(02,30,02,35,"NC_EN_MAINHALL1_08");
	TA_Stay	(02,35,02,40,"NC_EN_MAINHALL1_06");
	TA_Stay	(02,40,02,45,"NC_EN_MAINHALL1_05");
	TA_Stay	(02,45,02,50,"NC_EN_MAINHALL1_02");
	TA_Stay	(02,50,02,55,"NC_EN_MAINHALL1_08");	
	TA_Stay	(02,55,02,59,"NC_EN_MAINHALL1_06");		
	                                            
	TA_Stay	(03,00,03,05,"NC_EN_MAINHALL1_05");
	TA_Stay	(03,05,03,10,"NC_EN_MAINHALL1_02");
	TA_Stay	(03,10,03,15,"NC_EN_MAINHALL1_08");
	TA_Stay	(03,15,03,20,"NC_EN_MAINHALL1_06");
	TA_Stay	(03,20,03,25,"NC_EN_MAINHALL1_05");	
	TA_Stay	(03,25,03,30,"NC_EN_MAINHALL1_02");
	TA_Stay	(03,30,03,35,"NC_EN_MAINHALL1_08");
	TA_Stay	(03,35,03,40,"NC_EN_MAINHALL1_06");
	TA_Stay	(03,40,03,45,"NC_EN_MAINHALL1_05");
	TA_Stay	(03,45,03,50,"NC_EN_MAINHALL1_02");
	TA_Stay	(03,50,03,55,"NC_EN_MAINHALL1_08");	
	TA_Stay	(03,55,03,59,"NC_EN_MAINHALL1_06");		
	
	TA_Stay	(04,00,04,05,"NC_EN_MAINHALL1_05");
	TA_Stay	(04,05,04,10,"NC_EN_MAINHALL1_02");
	TA_Stay	(04,10,04,15,"NC_EN_MAINHALL1_08");
	TA_Stay	(04,15,04,20,"NC_EN_MAINHALL1_06");
	TA_Stay	(04,20,04,25,"NC_EN_MAINHALL1_05");	
	TA_Stay	(04,25,04,30,"NC_EN_MAINHALL1_02");
	TA_Stay	(04,30,04,35,"NC_EN_MAINHALL1_08");
	TA_Stay	(04,35,04,40,"NC_EN_MAINHALL1_06");
	TA_Stay	(04,40,04,45,"NC_EN_MAINHALL1_05");
	TA_Stay	(04,45,04,50,"NC_EN_MAINHALL1_02");
	TA_Stay	(04,50,04,55,"NC_EN_MAINHALL1_08");	
	TA_Stay	(04,55,04,59,"NC_EN_MAINHALL1_06");		
	                                            
	TA_Stay	(05,00,05,05,"NC_EN_MAINHALL1_05");
	TA_Stay	(05,05,05,10,"NC_EN_MAINHALL1_02");
	TA_Stay	(05,10,05,15,"NC_EN_MAINHALL1_08");
	TA_Stay	(05,15,05,20,"NC_EN_MAINHALL1_06");
	TA_Stay	(05,20,05,25,"NC_EN_MAINHALL1_05");	
	TA_Stay	(05,25,05,30,"NC_EN_MAINHALL1_02");
	TA_Stay	(05,30,05,35,"NC_EN_MAINHALL1_08");
	TA_Stay	(05,35,05,40,"NC_EN_MAINHALL1_06");
	TA_Stay	(05,40,05,45,"NC_EN_MAINHALL1_05");
	TA_Stay	(05,45,05,50,"NC_EN_MAINHALL1_02");
	TA_Stay	(05,50,05,55,"NC_EN_MAINHALL1_08");	
	TA_Stay	(05,55,05,59,"NC_EN_MAINHALL1_06");		
	                                            
	TA_Stay	(06,00,06,05,"NC_EN_MAINHALL1_05");
	TA_Stay	(06,05,06,10,"NC_EN_MAINHALL1_02");
	TA_Stay	(06,10,06,15,"NC_EN_MAINHALL1_08");
	TA_Stay	(06,15,06,20,"NC_EN_MAINHALL1_06");
	TA_Stay	(06,20,06,25,"NC_EN_MAINHALL1_05");	
	TA_Stay	(06,25,06,30,"NC_EN_MAINHALL1_02");
	TA_Stay	(06,30,06,35,"NC_EN_MAINHALL1_08");
	TA_Stay	(06,35,06,40,"NC_EN_MAINHALL1_06");
	TA_Stay	(06,40,06,45,"NC_EN_MAINHALL1_05");
	TA_Stay	(06,45,06,50,"NC_EN_MAINHALL1_02");
	TA_Stay	(06,50,06,55,"NC_EN_MAINHALL1_08");	
	TA_Stay	(06,55,06,59,"NC_EN_MAINHALL1_06");		
	                                            
	TA_Stay	(07,00,07,05,"NC_EN_MAINHALL1_05");
	TA_Stay	(07,05,07,10,"NC_EN_MAINHALL1_02");
	TA_Stay	(07,10,07,15,"NC_EN_MAINHALL1_08");
	TA_Stay	(07,15,07,20,"NC_EN_MAINHALL1_06");
	TA_Stay	(07,20,07,25,"NC_EN_MAINHALL1_05");	
	TA_Stay	(07,25,07,30,"NC_EN_MAINHALL1_02");
	TA_Stay	(07,30,07,35,"NC_EN_MAINHALL1_08");
	TA_Stay	(07,35,07,40,"NC_EN_MAINHALL1_06");
	TA_Stay	(07,40,07,45,"NC_EN_MAINHALL1_05");
	TA_Stay	(07,45,07,50,"NC_EN_MAINHALL1_02");
	TA_Stay	(07,50,07,55,"NC_EN_MAINHALL1_08");	
	TA_Stay	(07,55,07,59,"NC_EN_MAINHALL1_06");		
	
	TA_Stay	(08,00,08,05,"NC_EN_MAINHALL1_05");
	TA_Stay	(08,05,08,10,"NC_EN_MAINHALL1_02");
	TA_Stay	(08,10,08,15,"NC_EN_MAINHALL1_08");
	TA_Stay	(08,15,08,20,"NC_EN_MAINHALL1_06");
	TA_Stay	(08,20,08,25,"NC_EN_MAINHALL1_05");	
	TA_Stay	(08,25,08,30,"NC_EN_MAINHALL1_02");
	TA_Stay	(08,30,08,35,"NC_EN_MAINHALL1_08");
	TA_Stay	(08,35,08,40,"NC_EN_MAINHALL1_06");
	TA_Stay	(08,40,08,45,"NC_EN_MAINHALL1_05");
	TA_Stay	(08,45,08,50,"NC_EN_MAINHALL1_02");
	TA_Stay	(08,50,08,55,"NC_EN_MAINHALL1_08");	
	TA_Stay	(08,55,08,59,"NC_EN_MAINHALL1_06");		
	                                            
	TA_Stay	(09,00,09,05,"NC_EN_MAINHALL1_05");
	TA_Stay	(09,05,09,10,"NC_EN_MAINHALL1_02");
	TA_Stay	(09,10,09,15,"NC_EN_MAINHALL1_08");
	TA_Stay	(09,15,09,20,"NC_EN_MAINHALL1_06");
	TA_Stay	(09,20,09,25,"NC_EN_MAINHALL1_05");	
	TA_Stay	(09,25,09,30,"NC_EN_MAINHALL1_02");
	TA_Stay	(09,30,09,35,"NC_EN_MAINHALL1_08");
	TA_Stay	(09,35,09,40,"NC_EN_MAINHALL1_06");
	TA_Stay	(09,40,09,45,"NC_EN_MAINHALL1_05");
	TA_Stay	(09,45,09,50,"NC_EN_MAINHALL1_02");
	TA_Stay	(09,50,09,55,"NC_EN_MAINHALL1_08");	
	TA_Stay	(09,55,09,59,"NC_EN_MAINHALL1_06");		
	                                            
	TA_Stay	(10,00,10,05,"NC_EN_MAINHALL1_05");
	TA_Stay	(10,05,10,10,"NC_EN_MAINHALL1_02");
	TA_Stay	(10,10,10,15,"NC_EN_MAINHALL1_08");
	TA_Stay	(10,15,10,20,"NC_EN_MAINHALL1_06");
	TA_Stay	(10,20,10,25,"NC_EN_MAINHALL1_05");	
	TA_Stay	(10,25,10,30,"NC_EN_MAINHALL1_02");
	TA_Stay	(10,30,10,35,"NC_EN_MAINHALL1_08");
	TA_Stay	(10,35,10,40,"NC_EN_MAINHALL1_06");
	TA_Stay	(10,40,10,45,"NC_EN_MAINHALL1_05");
	TA_Stay	(10,45,10,50,"NC_EN_MAINHALL1_02");
	TA_Stay	(10,50,10,55,"NC_EN_MAINHALL1_08");	
	TA_Stay	(10,55,10,59,"NC_EN_MAINHALL1_06");		
	                                            
	TA_Stay	(11,00,11,05,"NC_EN_MAINHALL1_05");
	TA_Stay	(11,05,11,10,"NC_EN_MAINHALL1_02");
	TA_Stay	(11,10,11,15,"NC_EN_MAINHALL1_08");
	TA_Stay	(11,15,11,20,"NC_EN_MAINHALL1_06");
	TA_Stay	(11,20,11,25,"NC_EN_MAINHALL1_05");	
	TA_Stay	(11,25,11,30,"NC_EN_MAINHALL1_02");
	TA_Stay	(11,30,11,35,"NC_EN_MAINHALL1_08");
	TA_Stay	(11,35,11,40,"NC_EN_MAINHALL1_06");
	TA_Stay	(11,40,11,45,"NC_EN_MAINHALL1_05");
	TA_Stay	(11,45,11,50,"NC_EN_MAINHALL1_02");
	TA_Stay	(11,50,11,55,"NC_EN_MAINHALL1_08");	
	TA_Stay	(11,55,11,59,"NC_EN_MAINHALL1_06");		
	
	TA_Stay	(12,00,12,05,"NC_EN_MAINHALL1_05");
	TA_Stay	(12,05,12,10,"NC_EN_MAINHALL1_02");
	TA_Stay	(12,10,12,15,"NC_EN_MAINHALL1_08");
	TA_Stay	(12,15,12,20,"NC_EN_MAINHALL1_06");
	TA_Stay	(12,20,12,25,"NC_EN_MAINHALL1_05");	
	TA_Stay	(12,25,12,30,"NC_EN_MAINHALL1_02");
	TA_Stay	(12,30,12,35,"NC_EN_MAINHALL1_08");
	TA_Stay	(12,35,12,40,"NC_EN_MAINHALL1_06");
	TA_Stay	(12,40,12,45,"NC_EN_MAINHALL1_05");
	TA_Stay	(12,45,12,50,"NC_EN_MAINHALL1_02");
	TA_Stay	(12,50,12,55,"NC_EN_MAINHALL1_08");	
	TA_Stay	(12,55,12,59,"NC_EN_MAINHALL1_06");		
	                                            
	TA_Stay	(13,00,13,05,"NC_EN_MAINHALL1_05");
	TA_Stay	(13,05,13,10,"NC_EN_MAINHALL1_02");
	TA_Stay	(13,10,13,15,"NC_EN_MAINHALL1_08");
	TA_Stay	(13,15,13,20,"NC_EN_MAINHALL1_06");
	TA_Stay	(13,20,13,25,"NC_EN_MAINHALL1_05");	
	TA_Stay	(13,25,13,30,"NC_EN_MAINHALL1_02");
	TA_Stay	(13,30,13,35,"NC_EN_MAINHALL1_08");
	TA_Stay	(13,35,13,40,"NC_EN_MAINHALL1_06");
	TA_Stay	(13,40,13,45,"NC_EN_MAINHALL1_05");
	TA_Stay	(13,45,13,50,"NC_EN_MAINHALL1_02");
	TA_Stay	(13,50,13,55,"NC_EN_MAINHALL1_08");	
	TA_Stay	(13,55,13,59,"NC_EN_MAINHALL1_06");		
	                                            
	TA_Stay	(14,00,14,05,"NC_EN_MAINHALL1_05");
	TA_Stay	(14,05,14,10,"NC_EN_MAINHALL1_02");
	TA_Stay	(14,10,14,15,"NC_EN_MAINHALL1_08");
	TA_Stay	(14,15,14,20,"NC_EN_MAINHALL1_06");
	TA_Stay	(14,20,14,25,"NC_EN_MAINHALL1_05");	
	TA_Stay	(14,25,14,30,"NC_EN_MAINHALL1_02");
	TA_Stay	(14,30,14,35,"NC_EN_MAINHALL1_08");
	TA_Stay	(14,35,14,40,"NC_EN_MAINHALL1_06");
	TA_Stay	(14,40,14,45,"NC_EN_MAINHALL1_05");
	TA_Stay	(14,45,14,50,"NC_EN_MAINHALL1_02");
	TA_Stay	(14,50,14,55,"NC_EN_MAINHALL1_08");	
	TA_Stay	(14,55,14,59,"NC_EN_MAINHALL1_06");		
	                                            
	TA_Stay	(15,00,15,05,"NC_EN_MAINHALL1_05");
	TA_Stay	(15,05,15,10,"NC_EN_MAINHALL1_02");
	TA_Stay	(15,10,15,15,"NC_EN_MAINHALL1_08");
	TA_Stay	(15,15,15,20,"NC_EN_MAINHALL1_06");
	TA_Stay	(15,20,15,25,"NC_EN_MAINHALL1_05");	
	TA_Stay	(15,25,15,30,"NC_EN_MAINHALL1_02");
	TA_Stay	(15,30,15,35,"NC_EN_MAINHALL1_08");
	TA_Stay	(15,35,15,40,"NC_EN_MAINHALL1_06");
	TA_Stay	(15,40,15,45,"NC_EN_MAINHALL1_05");
	TA_Stay	(15,45,15,50,"NC_EN_MAINHALL1_02");
	TA_Stay	(15,50,15,55,"NC_EN_MAINHALL1_08");	
	TA_Stay	(15,55,15,59,"NC_EN_MAINHALL1_06");		
	                                            
	TA_Stay	(16,00,16,05,"NC_EN_MAINHALL1_05");
	TA_Stay	(16,05,16,10,"NC_EN_MAINHALL1_02");
	TA_Stay	(16,10,16,15,"NC_EN_MAINHALL1_08");
	TA_Stay	(16,15,16,20,"NC_EN_MAINHALL1_06");
	TA_Stay	(16,20,16,25,"NC_EN_MAINHALL1_05");	
	TA_Stay	(16,25,16,30,"NC_EN_MAINHALL1_02");
	TA_Stay	(16,30,16,35,"NC_EN_MAINHALL1_08");
	TA_Stay	(16,35,16,40,"NC_EN_MAINHALL1_06");
	TA_Stay	(16,40,16,45,"NC_EN_MAINHALL1_05");
	TA_Stay	(16,45,16,50,"NC_EN_MAINHALL1_02");
	TA_Stay	(16,50,16,55,"NC_EN_MAINHALL1_08");	
	TA_Stay	(16,55,16,59,"NC_EN_MAINHALL1_06");		
	                                            
	TA_Stay	(17,00,17,05,"NC_EN_MAINHALL1_05");
	TA_Stay	(17,05,17,10,"NC_EN_MAINHALL1_02");
	TA_Stay	(17,10,17,15,"NC_EN_MAINHALL1_08");
	TA_Stay	(17,15,17,20,"NC_EN_MAINHALL1_06");
	TA_Stay	(17,20,17,25,"NC_EN_MAINHALL1_05");	
	TA_Stay	(17,25,17,30,"NC_EN_MAINHALL1_02");
	TA_Stay	(17,30,17,35,"NC_EN_MAINHALL1_08");
	TA_Stay	(17,35,17,40,"NC_EN_MAINHALL1_06");
	TA_Stay	(17,40,17,45,"NC_EN_MAINHALL1_05");
	TA_Stay	(17,45,17,50,"NC_EN_MAINHALL1_02");
	TA_Stay	(17,50,17,55,"NC_EN_MAINHALL1_08");	
	TA_Stay	(17,55,17,59,"NC_EN_MAINHALL1_06");		
	                                            
	TA_Stay	(18,00,18,05,"NC_EN_MAINHALL1_05");
	TA_Stay	(18,05,18,10,"NC_EN_MAINHALL1_02");
	TA_Stay	(18,10,18,15,"NC_EN_MAINHALL1_08");
	TA_Stay	(18,15,18,20,"NC_EN_MAINHALL1_06");
	TA_Stay	(18,20,18,25,"NC_EN_MAINHALL1_05");	
	TA_Stay	(18,25,18,30,"NC_EN_MAINHALL1_02");
	TA_Stay	(18,30,18,35,"NC_EN_MAINHALL1_08");
	TA_Stay	(18,35,18,40,"NC_EN_MAINHALL1_06");
	TA_Stay	(18,40,18,45,"NC_EN_MAINHALL1_05");
	TA_Stay	(18,45,18,50,"NC_EN_MAINHALL1_02");
	TA_Stay	(18,50,18,55,"NC_EN_MAINHALL1_08");	
	TA_Stay	(18,55,18,59,"NC_EN_MAINHALL1_06");		
	                                            
	TA_Stay	(19,00,19,05,"NC_EN_MAINHALL1_05");
	TA_Stay	(19,05,19,10,"NC_EN_MAINHALL1_02");
	TA_Stay	(19,10,19,15,"NC_EN_MAINHALL1_08");
	TA_Stay	(19,15,19,20,"NC_EN_MAINHALL1_06");
	TA_Stay	(19,20,19,25,"NC_EN_MAINHALL1_05");	
	TA_Stay	(19,25,19,30,"NC_EN_MAINHALL1_02");
	TA_Stay	(19,30,19,35,"NC_EN_MAINHALL1_08");
	TA_Stay	(19,35,19,40,"NC_EN_MAINHALL1_06");
	TA_Stay	(19,40,19,45,"NC_EN_MAINHALL1_05");
	TA_Stay	(19,45,19,50,"NC_EN_MAINHALL1_02");
	TA_Stay	(19,50,19,55,"NC_EN_MAINHALL1_08");	
	TA_Stay	(19,55,19,59,"NC_EN_MAINHALL1_06");		
	                                            
	TA_Stay	(20,00,20,05,"NC_EN_MAINHALL1_05");
	TA_Stay	(20,05,20,10,"NC_EN_MAINHALL1_02");
	TA_Stay	(20,10,20,15,"NC_EN_MAINHALL1_08");
	TA_Stay	(20,15,20,20,"NC_EN_MAINHALL1_06");
	TA_Stay	(20,20,20,25,"NC_EN_MAINHALL1_05");	
	TA_Stay	(20,25,20,30,"NC_EN_MAINHALL1_02");
	TA_Stay	(20,30,20,35,"NC_EN_MAINHALL1_08");
	TA_Stay	(20,35,20,40,"NC_EN_MAINHALL1_06");
	TA_Stay	(20,40,20,45,"NC_EN_MAINHALL1_05");
	TA_Stay	(20,45,20,50,"NC_EN_MAINHALL1_02");
	TA_Stay	(20,50,20,55,"NC_EN_MAINHALL1_08");	
	TA_Stay	(20,55,20,59,"NC_EN_MAINHALL1_06");		
	                                            
	TA_Stay	(21,00,21,05,"NC_EN_MAINHALL1_05");
	TA_Stay	(21,05,21,10,"NC_EN_MAINHALL1_02");
	TA_Stay	(21,10,21,15,"NC_EN_MAINHALL1_08");
	TA_Stay	(21,15,21,20,"NC_EN_MAINHALL1_06");
	TA_Stay	(21,20,21,25,"NC_EN_MAINHALL1_05");	
	TA_Stay	(21,25,21,30,"NC_EN_MAINHALL1_02");
	TA_Stay	(21,30,21,35,"NC_EN_MAINHALL1_08");
	TA_Stay	(21,35,21,40,"NC_EN_MAINHALL1_06");
	TA_Stay	(21,40,21,45,"NC_EN_MAINHALL1_05");
	TA_Stay	(21,45,21,50,"NC_EN_MAINHALL1_02");
	TA_Stay	(21,50,21,55,"NC_EN_MAINHALL1_08");	
	TA_Stay	(21,55,21,59,"NC_EN_MAINHALL1_06");		
	                                            
	TA_Stay	(22,00,22,05,"NC_EN_MAINHALL1_05");
	TA_Stay	(22,05,22,10,"NC_EN_MAINHALL1_02");
	TA_Stay	(22,10,22,15,"NC_EN_MAINHALL1_08");
	TA_Stay	(22,15,22,20,"NC_EN_MAINHALL1_06");
	TA_Stay	(22,20,22,25,"NC_EN_MAINHALL1_05");	
	TA_Stay	(22,25,22,30,"NC_EN_MAINHALL1_02");
	TA_Stay	(22,30,22,35,"NC_EN_MAINHALL1_08");
	TA_Stay	(22,35,22,40,"NC_EN_MAINHALL1_06");
	TA_Stay	(22,40,22,45,"NC_EN_MAINHALL1_05");
	TA_Stay	(22,45,22,50,"NC_EN_MAINHALL1_02");
	TA_Stay	(22,50,22,55,"NC_EN_MAINHALL1_08");	
	TA_Stay	(22,55,22,59,"NC_EN_MAINHALL1_06");		
	                                            
	TA_Stay	(23,00,23,05,"NC_EN_MAINHALL1_05");
	TA_Stay	(23,05,23,10,"NC_EN_MAINHALL1_02");
	TA_Stay	(23,10,23,15,"NC_EN_MAINHALL1_08");
	TA_Stay	(23,15,23,20,"NC_EN_MAINHALL1_06");
	TA_Stay	(23,20,23,25,"NC_EN_MAINHALL1_05");	
	TA_Stay	(23,25,23,30,"NC_EN_MAINHALL1_02");
	TA_Stay	(23,30,23,35,"NC_EN_MAINHALL1_08");
	TA_Stay	(23,35,23,40,"NC_EN_MAINHALL1_06");
	TA_Stay	(23,40,23,45,"NC_EN_MAINHALL1_05");
	TA_Stay	(23,45,23,50,"NC_EN_MAINHALL1_02");
	TA_Stay	(23,50,23,55,"NC_EN_MAINHALL1_08");	
	TA_Stay	(23,55,23,59,"NC_EN_MAINHALL1_06");	
};



