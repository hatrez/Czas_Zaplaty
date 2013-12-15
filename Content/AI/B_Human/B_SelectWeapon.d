//////////////////////////////////////////////////////////////////////////
//	B_FillQuiver
//	============
//	F�llt den K�cher des NSCs 'slf' auf 20 auf. Diese Funktion geht davon
//	aus, da� der NSC die entsprechende Fernkampfwaffe in der Hand h�lt.
//////////////////////////////////////////////////////////////////////////
func void B_FillQuiver(var C_NPC slf)
{
	//PrintDebugInt		(PD_ZS_DETAIL,	"B_FillQuiver");
	
	var int		addedAmmo;
	var C_ITEM	readiedWeapon;	

	readiedWeapon = Npc_GetReadiedWeapon(slf);
	if (readiedWeapon.munition == ItAmArrow)
	{
		//PrintDebugInt	(PD_ZS_DETAIL,	"...aktive Waffe benutzt Pfeile!");
		addedAmmo = 20 - C_NpcHasAmmo(slf, ItAmArrow);
		CreateInvItems(slf, ItAmArrow, addedAmmo);
		//PrintDebugInt	(PD_ZS_DETAIL,	"...hinzugef�gte Pfeile: ", addedAmmo);
	}
	else if (readiedWeapon.munition == ItAmBolt)
	{
		//PrintDebugInt	(PD_ZS_DETAIL,	"...aktive Waffe benutzt Bolzen!");
		addedAmmo = 20 - C_NpcHasAmmo(slf, ItAmBolt);
		CreateInvItems(slf, ItAmBolt, addedAmmo);
		//PrintDebugInt	(PD_ZS_DETAIL,	"...hinzugef�gte Bolzen: ", addedAmmo);
	}
	else
	{
		//PrintDebugInt	(PD_ZS_DETAIL,	"...ERROR: aktive Waffe hat KEINE g�ltige Munitionsart!!!");
	};
};


func int B_EquipAndDrawBestRangedWeapon_Copy(var C_NPC slf,var C_NPC oth)
{
	
	//PrintDebugInt		(PD_ZS_FRAME,	"B_EquipAndDrawBestRangedWeapon");

	// ---- Zauber noch aktiv ? ---- 
	if (Npc_IsInFightMode(slf, FMODE_MAGIC))
	{
		//PrintDebugInt	(PD_ZS_CHECK,	"...vorher Zauber wegstecken!");
		AI_UnreadySpell	(slf);										// ... dann weg damit
	};

	// ---- Fernkampfwaffe dabei ? ---- 
	if (Npc_HasRangedWeaponWithAmmo(slf))
	{
		//PrintDebugInt				(PD_ZS_CHECK,	"...Fernkampfwaffe mit Ammo vorhanden!");
		if (!Npc_HasReadiedRangedWeapon(slf))
		{
			//PrintDebugInt			(PD_ZS_CHECK,	"...noch keine Fernkampfwaffe gezogen!");
			B_FullStop 				(slf);
			AI_RemoveWeapon			(slf);
			AI_EquipBestRangedWeapon(slf);	
			AI_ReadyRangedWeapon	(slf);
		}
		else
		{
			if (slf.fight_tactic == FAI_HUMAN_RANGED)
			{
				B_FillQuiver(slf);
			};
		};
		return TRUE;
	}
	else
	{
		//PrintDebugInt				(PD_ZS_CHECK,	"...KEINE Fernkampfwaffe mit Ammo vorhanden!");
	};

};

//////////////////////////////////////////////////////////////////////////
//	B_EquipAndDrawBestMeleeWeapon
//	=============================
//	Legt die beste Nahkampfwaffe an, die sich im Inventory befindet
//	und zieht sie auch gleich.
//	-> gibt TRUE zur�ck, wenn Waffe angelegt werden konnte, sonst FALSE
//////////////////////////////////////////////////////////////////////////
func int B_EquipAndDrawBestMeleeWeapon(var C_NPC slf,var C_NPC oth)
{
	//PrintDebugInt		(PD_ZS_FRAME,	"B_EquipAndDrawBestMeleeWeapon");
	
	// ---- Zauber noch aktiv ? ---- 
	if (Npc_IsInFightMode(slf, FMODE_MAGIC))
	{
		//PrintDebugInt	(PD_ZS_CHECK,	"...vorher Zauber wegstecken!");
		AI_UnreadySpell	(slf);										// ... dann weg damit
	};

	// ---- Nahkampfwaffe dabei ? ---- 
	//	if (C_NpcHasWeapon(slf, ITEM_KAT_NF))
	//	{
	if (!Npc_HasReadiedMeleeWeapon(slf))
	{
		//PrintDebugInt			(PD_ZS_CHECK,	"...noch keine Nahkampfwaffe gezogen!");
		B_FullStop 				(slf);
		AI_StopAim				(slf);
		AI_RemoveWeapon			(slf);
		AI_EquipBestMeleeWeapon	(slf);	
		AI_ReadyMeleeWeapon		(slf);
	};

	return TRUE;
	//	};
	
	return FALSE;
};

//////////////////////////////////////////////////////////////////////////
//	B_EquipAndDrawBestRangedWeapon
//	==============================
//	Legt die beste Fernkampfwaffe an, die sich im Inventory befindet
//	und zieht sie auch gleich.
//	-> gibt TRUE zur�ck, wenn Waffe angelegt werden konnte, sonst FALSE
//////////////////////////////////////////////////////////////////////////
func int B_EquipAndDrawBestRangedWeapon(var C_NPC slf,var C_NPC oth)
{
	
	//PrintDebugInt		(PD_ZS_FRAME,	"B_EquipAndDrawBestRangedWeapon");

	// ---- Zauber noch aktiv ? ---- 
	if (Npc_IsInFightMode(slf, FMODE_MAGIC))
	{
		//PrintDebugInt	(PD_ZS_CHECK,	"...vorher Zauber wegstecken!");
		AI_UnreadySpell	(slf);										// ... dann weg damit
	};

	// ---- Fernkampfwaffe dabei ? ---- 
	if (Npc_HasRangedWeaponWithAmmo(slf))
	{
		//PrintDebugInt				(PD_ZS_CHECK,	"...Fernkampfwaffe mit Ammo vorhanden!");
		if (!Npc_HasReadiedRangedWeapon(slf))
		{
			//PrintDebugInt			(PD_ZS_CHECK,	"...noch keine Fernkampfwaffe gezogen!");
			B_FullStop 				(slf);
			AI_RemoveWeapon			(slf);
			AI_EquipBestRangedWeapon(slf);	
			AI_ReadyRangedWeapon	(slf);
		}
		else
		{
			if (slf.fight_tactic == FAI_HUMAN_RANGED)
			{
				B_FillQuiver(slf);
			};
		};
		return TRUE;
	}
	else
	{
		//PrintDebugInt				(PD_ZS_CHECK,	"...KEINE Fernkampfwaffe mit Ammo vorhanden!");
	};
	return FALSE;

};

//////////////////////////////////////////////////////////////////////////
//	B_DrawSpell
//	===========
//	Zieht den angegebenen Spruch unter Ber�cksichtigung, da� eventuell
//	vorher ein AI_UnreadySpell durchgef�hrt werden mu�.
//////////////////////////////////////////////////////////////////////////
func void B_DrawSpell(var C_NPC slf, var int spell, var int mana)
{
	//PrintDebugInt				(PD_ZS_FRAME,	"B_DrawSpell");

	if (Npc_IsInFightMode(slf, FMODE_MAGIC))
	{
		//PrintDebugInt			(PD_ZS_CHECK,	"...bereits im Magiemodus!");
		if (Npc_GetActiveSpell(slf) != spell)
		{
			//PrintDebugInt		(PD_ZS_CHECK,	"...dieser Zauber liegt noch nicht auf der Hand!");
			AI_UnreadySpell		(slf);
			// Das folgende AI_ReadySpell() verursacht den Kollisionsbug
			// "only one moving vob without collision..." wenn die Funktion
			// zweimal hintereinander aufgerufen wird, ohne ein
			// AI_UnreadySpell dawzischen. Genau das ist aber n�tig
			// wenn der NSC die St�rke des Zaubers �ndern will ohne
			// den Zauber wegzustecken und wieder hervorzuholen!
		};
		AI_ReadySpell			(slf, spell, mana);
	}
	else
	{
		if (Npc_IsInFightMode(slf, FMODE_MELEE)||Npc_IsInFightMode(slf, FMODE_FIST))
		{
			AI_RemoveWeapon		(slf);
		};
		if (Npc_IsInFightMode(slf, FMODE_FAR))
		{
			AI_StopAim			(slf);
			AI_RemoveWeapon		(slf);
		};
		
		//PrintDebugInt			(PD_ZS_CHECK,	"...noch nicht im Magiemodus!");
		AI_ReadySpell			(slf, spell, mana);
	};

	//-------- "echte" Magier bekommen Mana dazugeschummelt --------
	if (slf.fight_tactic == FAI_HUMAN_MAGE)
	{
		//PrintDebugInt			(PD_ZS_CHECK,	"...Magier-Kampftaktik!");

		var int manaLeft;	manaLeft = slf.attribute[ATR_MANA];
		var int manaMax;	manaMax	 = slf.attribute[ATR_MANA_MAX];
		var int manaRefill;
		if ( manaLeft < (manaMax/2) )
		{
			//PrintDebugInt		(PD_ZS_CHECK,	"...Mana �brig: ", manaLeft);
			manaRefill =		(manaMax/2) - manaLeft;		
			B_ChangeAttribute	(slf,	ATR_MANA,	manaRefill);
			//PrintDebugInt		(PD_ZS_CHECK,	"...Mana hinzugef�gt: ", manaRefill);
		};
	};
	
	return;
};

//////////////////////////////////////////////////////////////////////////
//	B_SelectWeapon
//	==============
//	W�hlt f�r den NSC 'slf' unter Ber�cksichtigung der Kampfsitution
//	die jeweils passende Waffe aus.
//	Diese Funktion wird w�hrend der ZS_Attack alle 3 Sekunden
//	aufgerufen und interpretiert den NSC 'oth' als das anzugreifende
//	Ziel. 
//////////////////////////////////////////////////////////////////////////
CONST INT B_SelectWeapon_Choosen_Melee = 1;
CONST INT B_SelectWeapon_Choosen_Ranged = 2;
CONST INT B_SelectWeapon_Choosen_Magic = 3;
func int B_SelectWeapon(var C_NPC slf, var C_NPC oth)
{
	var int proMelee;
	var int proRanged;
	var int proMagic;
	var int damageSumMelee;
	var int damageSumRanged;
	var c_item myWeapon;	
	// wow I'm shocked, vars need to be reseted
	// cuz them value are stored
	proMelee  = 1;
	proRanged = 1;
	proMagic  = 1;	
	//add Points because of self FAItactic:
	if(slf.fight_tactic!=FAI_HUMAN_MAGE)&&(slf.fight_tactic!=FAI_HUMAN_RANGED)
	{
		proMelee+=10;
	};
	if(slf.fight_tactic==FAI_HUMAN_RANGED)||(self.fight_Tactic == FAI_HUMAN_MULTI)
	{
		proRanged+=10;		
	};
	//magic is far better than anything else!
	if(slf.fight_tactic==FAI_HUMAN_MAGE)||(self.fight_Tactic == FAI_HUMAN_MULTI)||C_NpcIsMonsterMage(slf)
	{
		if(slf.fight_tactic==FAI_HUMAN_MAGE || C_NpcIsMonsterMage(slf)) {proMagic+=20;}; // mages are mostly shity at other stuff
		proMagic+=15;	
		proRanged-=5;
		proMelee-=5;
	}
	else
	{	
		PrintDebug_s_i("Attack: promagic: -",512);
		proMagic-=512;//magic? what is it?	
	};
	
	//other weapon is melee? Better if I use melee too!
	if(Npc_HasReadiedMeleeWeapon(oth))
	{
		proMelee+=proMelee;//x2
		proRanged -= proRanged/2;
		PrintDebug_s_i("Attack: promagic: -",5 + proMagic/2);
		proMagic -= proMagic/2;
	}
	else
	{
		proMelee -= proMelee/2;
	};	
	//Other is Far? So I Can use Far too
	if(Npc_GetDistToNpc(slf, oth)>HAI_DIST_MELEE)
	{
		proMelee-=10+ Npc_GetDistToNpc(slf, oth)/100;
		proRanged+= 5 + Npc_GetDistToNpc(slf, oth)/100;
		PrintDebug_s_i("Attack: promagic: -",5 + Npc_GetDistToNpc(slf, oth)/100);
		proMagic+= 5 + Npc_GetDistToNpc(slf, oth)/100;		
	};	
	//My melee weapon can affect him?
	myWeapon = Npc_GetEquippedMeleeWeapon(slf);
	if(!Hlp_IsValidItem(myWeapon))
	{
		myWeapon = Npc_GetReadiedWeapon(slf);	
	};	
	if(Hlp_IsValidItem(myWeapon))
	{
		damageSumMelee = myWeapon.damage+slf.attribute[ATR_STRENGTH];
		//edge&blunt:
		if((myWeapon.damagetype==DAM_EDGE)&&(myWeapon.damage+slf.attribute[ATR_STRENGTH]<oth.protection[PROT_EDGE]))
		||((myWeapon.damagetype==DAM_BLUNT)&&(myWeapon.damage+slf.attribute[ATR_STRENGTH]<oth.protection[PROT_BLUNT]))
		{
			proMelee-=30;	
		};
	}
	else
	{ // Brak broni do walki w zwarciu:
		proMelee-=50;
	};
	
	//My ranged weapon can affect him?
	myWeapon = Npc_GetEquippedRangedWeapon(slf);
	if(!Hlp_IsValidItem(myWeapon))
	{
		myWeapon = Npc_GetReadiedWeapon(slf);	
	};
	if(Hlp_IsValidItem(myWeapon))
	{
		damageSumRanged= myWeapon.damage;
		if(myWeapon.damagetype==DAM_FIRE)
		{ damageSumRanged+=myWeapon.damage*3;}
		else if(myWeapon.damagetype==DAM_MAGIC)
		{ damageSumRanged+=myWeapon.damage*2;};
		//point&fire&magic:
		if((myWeapon.damagetype==DAM_POINT)&&(myWeapon.damage<oth.protection[PROT_POINT]))
		||((myWeapon.damagetype==DAM_FIRE)&&(myWeapon.damage<oth.protection[PROT_FIRE]))
		||((myWeapon.damagetype==DAM_MAGIC)&&(myWeapon.damage<oth.protection[PROT_MAGIC]))
		{
			proRanged-=20;	
		};	
	}
	else { proRanged-=50;}; // brak ranged�w
	
	//analyze his magic prot
	//proMagic+=(-oth.protection[PROT_FIRE]+90)/5 - ((-oth.protection[PROT_FIRE]+90)%5);
	//proMagic+=(-oth.protection[PROT_MAGIC]+60)/5 - ((-oth.protection[PROT_MAGIC]+60)%5);
	
	if(slf.attribute[ATR_MANA]==0)&&(!Npc_HasManaPotions(slf))
	{
		PrintDebug_s_i("Attack: promagic: -",-512);
		proMagic-=512;//no mana no fun!
	};	
	//grab full melee & ranged dmg:
	proRanged += (damageSumRanged-damageSumMelee)/10 - (damageSumRanged-damageSumMelee)%10;
	proMelee +=  (damageSumMelee-damageSumRanged)/10 - (damageSumMelee-damageSumRanged)%10;
	
	
	//######## magiebasierte Kampftaktik ? ########
	//folgende Zauber sind f�r NSCs m�glich:
	// - Firebolt/Thunderbolt/BreathOfDeath	schnelles Gescho�			
	// - Fireball/Thunderball				Aufblas-Gescho�
	// - Windfist							Abstand schaffen
	// - ChainLightning/Pyrokinesis/IceCube	Festhalten mit Schaden
	// - Summon Demon/Skeleton?		
	// - Sleep?

	PrintDebug_ss("Attack: NPC: ",self.name);
	PrintDebug_s_i("Attack: proMelee: ",proMelee);
	PrintDebug_s_i("Attack: proRanged: ",proRanged);
	PrintDebug_s_i("Attack: proMagic: ",proMagic);
	
	if (proMagic>proRanged)&&(proMagic>proMelee)
	{	
		PrintDebug("Attack: Npc choose magic!");
		if(Npc_GetAivar(self,AIV_TPMULT)<6)&&(Npc_HasItems(self,ItFo_Potion_Spec_MultiCast))
		{
			AI_UseItem(self,ItFo_Potion_Spec_MultiCast);
		};
		//PrintDebugInt			(PD_ZS_CHECK,	"...NSC ist ein Magier!");
		//-------- Summon Demon --------
		if ((C_NpcHasSpell(slf,SPL_SUMMONDEMON)) && (Npc_GetDistToNpc(slf, oth)>1200))
		{
			Npc_PerceiveAll		(slf);
			if (!Wld_DetectNpc	(slf, SummonedByNPC_Demon, ZS_MM_Attack, GIL_DEMON))		
			{
				B_DrawSpell		(slf,	SPL_SUMMONDEMON,	SPL_SENDCAST_SUMMONDEMON);
				return B_SelectWeapon_Choosen_Magic;
			};
		};
		//-------- Summon Golem --------
		if ((C_NpcHasSpell(slf,SPL_SUMMONGOLEM)) && (Npc_GetDistToNpc(slf, oth)>1000))
		{
			Npc_PerceiveAll		(slf);
			if (!Wld_DetectNpc	(slf, SummonedByNPC_StoneGolem, ZS_MM_Attack, GIL_GOLEM))		
			{
				B_DrawSpell		(slf,	SPL_SUMMONGOLEM,	SPL_SENDCAST_SUMMONGOLEM);
				return B_SelectWeapon_Choosen_Magic;
			};
		};
		//-------- Summon Skeleton --------
		if	((C_NpcHasSpell(slf,SPL_SUMMONSKELETON)) && (Npc_GetDistToNpc(slf, oth)>800))
		{
			Npc_PerceiveAll		(slf);
			if (!Wld_DetectNpc	(slf, SummonedByNPC_Skeleton, ZS_MM_Attack, GIL_SKELETON))		
			{
				B_DrawSpell		(slf,	SPL_SUMMONSKELETON,	SPL_SENDCAST_SUMMONSKELETON);
				return B_SelectWeapon_Choosen_Magic;
			};
		};

		//-------- Icecube --------
		if (C_NpcHasSpell		(slf,SPL_ICECUBE) && !Npc_IsInState(oth,ZS_MagicFreeze) )
		{
			B_DrawSpell			(slf,	SPL_ICECUBE,	SPL_SENDCAST_ICECUBE);
			return B_SelectWeapon_Choosen_Magic;
		}
		//-------- Icecube-Attack (Monster) --------
		//else if (C_NpcHasSpell	(slf,SPL_ICECUBE) && C_NpcIsMonsterMage(slf) && (Npc_GetDistToNpc(slf,oth) < SPL_RANGE_ICEATTACK) && !Npc_IsInState(oth,ZS_MagicFreeze) )
		//{
		//	B_DrawSpell			(slf,	SPL_ICECUBE,	SPL_SENDCAST_ICECUBE);
		//	return B_SelectWeapon_Choosen_Magic;
		//}
		//-------- Meteor ---------------
		else if	(C_NpcHasSpell(slf,SPL_METEOR))&&(Npc_GetDistToNpc(slf,oth) > 1800)
		{
			B_DrawSpell			(slf,	SPL_METEOR,	SPL_SENDCAST_METEOR);
			return B_SelectWeapon_Choosen_Magic;
		}
		//-------- Curse ---------------
		else if	(C_NpcHasSpell(slf,SPL_WEAKNESS))
		{
			B_DrawSpell			(slf,	SPL_WEAKNESS,	SPL_SENDCAST_WEAKNESS);
			return B_SelectWeapon_Choosen_Magic;
		}
		//-------- stuningBall ---------------
		else if	(C_NpcHasSpell(slf,SPL_STUNINGBALL))&&(Npc_GetDistToNpc(slf,oth)<2000) 
		&&(!Npc_IsInState(oth,ZS_Stuned))
		{
			B_DrawSpell			(slf,	SPL_STUNINGBALL,	SPL_SENDCAST_STUNINGBALL);
			return B_SelectWeapon_Choosen_Magic;
		}
		//-------- Thunder ---------------
		
		else if	(C_NpcHasSpell(slf,SPL_THUNDER) && (Npc_GetDistToNpc(slf,oth)>1000) )
		{
			B_DrawSpell			(slf,	SPL_THUNDER,	SPL_SENDCAST_THUNDER);
			return B_SelectWeapon_Choosen_Magic;
		}
		else if	(C_NpcHasSpell(slf,SPL_FireWall) && (Npc_GetDistToNpc(slf,oth)<1500) )
		{	B_DrawSpell			(slf,	SPL_FireWall,	SPL_SENDCAST_THUNDER);
			return B_SelectWeapon_Choosen_Magic;
		}
		//-------- Chainlightning --------
		else if	(C_NpcHasSpell(slf,SPL_CHAINLIGHTNING) && (Npc_GetDistToNpc(slf,oth)<SPL_RANGE_CHAINLIGHTNING) )
		{
			B_DrawSpell			(slf,	SPL_CHAINLIGHTNING,	1);
			return B_SelectWeapon_Choosen_Magic;
		}
		//--------Sleep --------
		else if ((C_NpcHasSpell(slf,SPL_SLEEP)) && (!Npc_IsInState(oth, ZS_MagicSleep)) && (Npc_GetDistToNpc(slf,oth)<SPL_RANGE_SLEEP) )
		{
			B_DrawSpell			(slf,	SPL_SLEEP,	SPL_SENDCAST_SLEEP);
			return B_SelectWeapon_Choosen_Magic;
		}
		//-------- Windfist --------
		else if (C_NpcHasSpell(slf,SPL_WINDFIST)  && (Npc_GetDistToNpc(slf,oth)<SPL_RANGE_WINDFIST) )
		{
			if 	( (Npc_GetDistToNpc(slf,oth)>SPL_RANGE_WINDFIST) && (slf.attribute[ATR_MANA]>=SPL_SENDCAST_WINDFIST) )
			{
				B_DrawSpell		(slf,	SPL_WINDFIST,	SPL_SENDCAST_WINDFIST);
			}
			else if ( (Npc_GetDistToNpc(slf,oth)>(SPL_RANGE_WINDFIST/2)) && (slf.attribute[ATR_MANA]>=SPL_SENDCAST_WINDFIST/2) )
			{
				B_DrawSpell		(slf,	SPL_WINDFIST,	SPL_SENDCAST_WINDFIST/2);
			}
			else
			{
				B_DrawSpell		(slf,	SPL_WINDFIST,	1);
			};
			return B_SelectWeapon_Choosen_Magic;
		}		
		//-------- Breath of Death --------
		else if (C_NpcHasSpell	(slf,SPL_BREATHOFDEATH))
		{
			B_DrawSpell			(slf,	SPL_BREATHOFDEATH,	SPL_SENDCAST_BREATHOFDEATH);
			return B_SelectWeapon_Choosen_Magic;
		}
		//-------- Firestorm --------
		else if ( C_NpcHasSpell(slf,SPL_FIRESTORM) )
		{
			if 		( (Npc_GetDistToNpc(slf,oth)>1500) && (slf.attribute[ATR_MANA]>=SPL_SENDCAST_FIRESTORM) )
			{	
				B_DrawSpell		(slf,	SPL_FIRESTORM,	SPL_SENDCAST_FIREBALL);
			}
			else if ( (Npc_GetDistToNpc(slf,oth)>800) && (slf.attribute[ATR_MANA]>=SPL_SENDCAST_FIRESTORM/2) )
			{
				B_DrawSpell		(slf,	SPL_FIRESTORM,	SPL_SENDCAST_FIRESTORM/2);
			}
			else
			{
				B_DrawSpell		(slf,	SPL_FIRESTORM,	1);
			};
			return B_SelectWeapon_Choosen_Magic;
		}
		//-------- Thunderball --------
		else if ( C_NpcHasSpell(slf,SPL_THUNDERBALL) )
		{
			if 		( (Npc_GetDistToNpc(slf,oth)>1500) && (slf.attribute[ATR_MANA]>=SPL_SENDCAST_THUNDERBALL) )
			{
				B_DrawSpell		(slf,	SPL_THUNDERBALL,	SPL_SENDCAST_THUNDERBALL);
			}
			else if ( (Npc_GetDistToNpc(slf,oth)>800) && (slf.attribute[ATR_MANA]>=SPL_SENDCAST_THUNDERBALL/2) )
			{
				B_DrawSpell		(slf,	SPL_THUNDERBALL,	SPL_SENDCAST_THUNDERBALL/2);
			}
			else
			{
				B_DrawSpell		(slf,	SPL_THUNDERBALL,	1);
			};
			return B_SelectWeapon_Choosen_Magic;
		}
		//-------- Fireball --------
		else if ( C_NpcHasSpell(slf,SPL_FIREBALL) )
		{
			if 		( (Npc_GetDistToNpc(slf,oth)>1500) && (slf.attribute[ATR_MANA]>=SPL_SENDCAST_FIREBALL) )
			{
				B_DrawSpell		(slf,	SPL_FIREBALL,	SPL_SENDCAST_FIREBALL);
			}
			else if ( (Npc_GetDistToNpc(slf,oth)>800) && (slf.attribute[ATR_MANA]>=SPL_SENDCAST_FIREBALL/2) )
			{
				B_DrawSpell		(slf,	SPL_FIREBALL,	SPL_SENDCAST_FIREBALL/2);
			}
			else
			{
				B_DrawSpell		(slf,	SPL_FIREBALL,	1);
			};
			return B_SelectWeapon_Choosen_Magic;
		}
		//-------- Pyrokinesis --------
		else if (C_NpcHasSpell	(slf,SPL_PYROKINESIS))
		{
			B_DrawSpell			(slf,	SPL_PYROKINESIS,	10);
			return B_SelectWeapon_Choosen_Magic;
		}
		//-------- Firebolt --------
		else if (C_NpcHasSpell	(slf,SPL_FIREBOLT))
		{
			B_DrawSpell			(slf,	SPL_FIREBOLT,	SPL_SENDCAST_FIREBOLT);
			return B_SelectWeapon_Choosen_Magic;
		}
		//-------- Thunderbolt --------
		else if (C_NpcHasSpell	(slf,SPL_THUNDERBOLT))
		{
			B_DrawSpell			(slf,	SPL_THUNDERBOLT,	SPL_SENDCAST_THUNDERBOLT);
			return B_SelectWeapon_Choosen_Magic;
		}
		else if (C_NpcHasSpell		(slf,SPL_FEAR))
		{
			B_DrawSpell			(slf,	SPL_FEAR,	SPL_SENDCAST_FEAR);
			return B_SelectWeapon_Choosen_Magic;
		};
	};   

	//######## Waffenbasierte Kampftaktik ?  ########
	//PrintDebugInt		(PD_ZS_CHECK,	"...Waffenbasierte Kampftaktik!");
	//-------- Gegner in Nahkampfdistanz ? --------
	if (proMelee>proRanged)&&(proMelee>proMagic)
	{
		PrintDebug("Attack: Npc choose melee!");
		//PrintDebugInt			(PD_ZS_CHECK,	"...Gegner in Nahkampfreichweite & kein purer Fernk�mpfer!");
		if(Npc_GetAivar(self,AIV_TPBASH)<6)&&(Npc_HasItems(self,ItFo_Potion_Spec_Bash))
		{
			AI_UseItem(self,ItFo_Potion_Spec_Bash);
		};
		// ---- Erst Nahkampfwaffe probieren... ---- 
		if (B_EquipAndDrawBestMeleeWeapon(slf,oth))
		{
			return B_SelectWeapon_Choosen_Melee;
		};

		// ---- ...sonst mit den F�usten k�mpfen ---- 								
		//PrintDebugInt			(PD_ZS_CHECK, "...keine Nahkampfwaffe im Inv -> Faustkampf!");
		AI_ReadyMeleeWeapon		(slf);	// VORSICHT: in v0.96c werden hier nicht die F�uste, sondern die letzte Waffe gezogen !!! -> wird in v0.97 behoben sein (Kommentar dann l�schen)
		return B_SelectWeapon_Choosen_Melee;//Fist		
	}
	else if (proRanged>proMelee)&&(proRanged>proMagic)
	{
		PrintDebug("Attack: Npc choose ranged!");
		// ---- Erst Fernkampfwaffe probieren... ---- 
		if (B_EquipAndDrawBestRangedWeapon(slf,oth))
		{
			return B_SelectWeapon_Choosen_Ranged;
		};		
		// ---- ...sonst Nahkampfwaffe versuchen... ---- 
		if (B_EquipAndDrawBestMeleeWeapon(slf,oth))
		{
			return B_SelectWeapon_Choosen_Melee;
		};

		// ---- ...herumliegende Waffe suchen, sonst mit den F�usten k�mpfen ---- 								
		if (!B_FetchWeapon())
		{
			//PrintDebugInt		(PD_ZS_CHECK, "...keine Waffe gefunden -> Faustkampf!");
			AI_ReadyMeleeWeapon	(slf);
			return B_SelectWeapon_Choosen_Melee;		
		};
	};			

	return B_SelectWeapon_Choosen_Melee;			
};
//--------------------------------------------------------------------------

