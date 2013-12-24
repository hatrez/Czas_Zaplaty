var int Hook_oCNPC_OnDamage_slfAdr;
// NOTE: Hooki działają poprawnie tylko w wypadku obrażeń
// zadanych w zwarciu oraz od obrażeń zadanych z broni dystansowych.
func void OCNPC_ONDAMAGE_Begin()
{
	Hook_oCNPC_OnDamage_slfAdr = getECX();
	//CheckAdress(getESP(),180,1,false);
};

func void OCNPC_ONDAMAGE_POSTEVENTCALL()
{
	var int oCNpc_slf_Adr_in_oCDamageDescriptor;
	var int oCNpc_oth_Adr_in_oCDamageDescriptor;
	oCNpc_slf_Adr_in_oCDamageDescriptor = Hook_oCNPC_OnDamage_slfAdr;
	oCNpc_oth_Adr_in_oCDamageDescriptor = MEM_ReadInt(getECX() + 76);//0x48
	//_slf = MEM_CpyInst(slf);
	//_oth = MEM_CpyInst(oth);
	//Ork: PERCe kompletnie wyłączam i opieram się wyłacznie na tym hook'u
	if (Hook_oCNPC_OnDamage_slfAdr > oCNpc_vtbl && oCNpc_oth_Adr_in_oCDamageDescriptor  > oCNpc_vtbl)
	{
		printDebug_s_i_s_i(">#DamageReact: oth adr: ",oCNpc_oth_Adr_in_oCDamageDescriptor,", valid:",Hlp_Is_oCNpc(oCNpc_oth_Adr_in_oCDamageDescriptor));
		printDebug_s_i_s_i(">#DamageReact: slf adr: ",oCNpc_slf_Adr_in_oCDamageDescriptor,", valid:",Hlp_Is_oCNpc(oCNpc_slf_Adr_in_oCDamageDescriptor));
		if (Hlp_Is_oCNpc(Hook_oCNPC_OnDamage_slfAdr)
	    && Hlp_Is_oCNpc(oCNpc_oth_Adr_in_oCDamageDescriptor))		
		{
			var C_NPC _slf; 	
			var C_NPC _oth; 
			MEM_AssignInst (_slf, oCNpc_slf_Adr_in_oCDamageDescriptor);
			MEM_AssignInst (_oth, oCNpc_oth_Adr_in_oCDamageDescriptor);
			B_SpecialCombatDamageReaction(_slf,_oth);
		};
	};
};