ActionList = {
  {
    ID = "WAIT",
    Motion = "Mon_DarkMageLeader_f_Wait.frm",
    Func = "CownatDarkSpell_WaitFunc",
    Trigger = {
      {
        AICheckFrame = 55,
        AIFunc = "CownatDarkSpell_Check_Targeting",
        DelayFrame = 550
      },
      {
        AICheckFrame = 55,
        AIFunc = "CownatDarkSpell_Check_ReleaseTarget",
        DelayFrame = 550
      },
      {
        AICheckFrame = 20,
        AIFunc = "CownatDarkSpell_Check_TurnToTarget",
        DelayFrame = 15
      },
      {
        AICheckFrame = 30,
        AIFunc = "CownatDarkSpell_Check_Walk",
        DelayFrame = 5
      },
      {
        AICheckFrame = 35,
        AIFunc = "CownatDarkSpell_Check_Idle",
        DelayFrame = 35
      },
      {
        AICheckFrame = 35,
        AIFunc = "CownatDarkSpell_Check_JumpUp",
        DelayFrame = 55
      },
      {
        AICheckFrame = 35,
        AIFunc = "CownatDarkSpell_Check_JumpDown",
        DelayFrame = 55
      },
      {
        AICheckFrame = 55,
        AIFunc = "CownatDarkSpell_Check_Attack01",
        DelayFrame = 110
      },
      {
        AICheckFrame = 110,
        AIFunc = "CownatDarkSpell_Check_Attack02",
        DelayFrame = 220
      },
      {
        AICheckFrame = 165,
        AIFunc = "CownatDarkSpell_Check_Attack03",
        DelayFrame = 330
      }
    }
  },
  {
    ID = "WALK",
    Motion = "Mon_DarkMageLeader_f_Move.frm",
    Func = "CownatDarkSpell_WalkFunc",
    EnableMoveCheck = TRUE,
    MoveFailFunc = "CownatDarkSpell_MoveFail",
    Trigger = {
      {
        AICheckFrame = 10,
        AIFunc = "CownatDarkSpell_Check_MoveStop",
        DelayFrame = 10
      },
      {
        AICheckFrame = 55,
        AIFunc = "CownatDarkSpell_Check_Targeting",
        DelayFrame = 550
      },
      {
        AICheckFrame = 55,
        AIFunc = "CownatDarkSpell_Check_ReleaseTarget",
        DelayFrame = 550
      },
      {
        AICheckFrame = 20,
        AIFunc = "CownatDarkSpell_Check_TurnToTarget",
        DelayFrame = 15
      },
      {
        AICheckFrame = 35,
        AIFunc = "CownatDarkSpell_Check_Idle",
        DelayFrame = 35
      },
      {
        AICheckFrame = 35,
        AIFunc = "CownatDarkSpell_Check_JumpUp",
        DelayFrame = 55
      },
      {
        AICheckFrame = 35,
        AIFunc = "CownatDarkSpell_Check_JumpDown",
        DelayFrame = 55
      },
      {
        AICheckFrame = 55,
        AIFunc = "CownatDarkSpell_Check_Attack01",
        DelayFrame = 110
      },
      {
        AICheckFrame = 110,
        AIFunc = "CownatDarkSpell_Check_Attack02",
        DelayFrame = 220
      },
      {
        AICheckFrame = 165,
        AIFunc = "CownatDarkSpell_Check_Attack03",
        DelayFrame = 330
      }
    }
  },
  {
    ID = "IDLE",
    Motion = "Mon_DarkMageLeader_f_Move.frm",
    Func = "CownatDarkSpell_IdleFunc",
    EnableMoveCheck = TRUE,
    MoveFailFunc = "CownatDarkSpell_MoveFail",
    Trigger = {
      {
        AICheckFrame = 10,
        AIFunc = "CownatDarkSpell_Check_Targeting",
        DelayFrame = 10
      },
      {
        AICheckFrame = 10,
        AIFunc = "CownatDarkSpell_Check_IdleStop",
        DelayFrame = 10
      }
    }
  },
  {
    ID = "ATTACK01",
    Motion = "Mon_DarkMageLeader_f_Attack01.frm",
    Func = "CownatDarkSpell_Attack01Func"
  },
  {
    ID = "ATTACK02",
    Motion = "Mon_DarkMageLeader_f_Attack02.frm",
    Func = "CownatDarkSpell_Attack02Func"
  },
  {
    ID = "ATTACK03_1",
    Motion = "Mon_DarkMageLeader_f_Attack03_01.frm",
    Func = "CownatDarkSpell_Attack03_1Func"
  },
  {
    ID = "ATTACK03_2",
    Motion = "Mon_DarkMageLeader_f_Attack03_02.frm",
    Func = "CownatDarkSpell_Attack03_2Func"
  },
  {
    ID = "ATTACK03_3",
    Motion = "Mon_DarkMageLeader_f_Attack03_03.frm",
    Func = "CownatDarkSpell_Attack03_3Func"
  },
  {
    ID = "JUMP",
    Motion = "Mon_DarkMageLeader_f_Jump_Up.frm",
    Func = "CownatDarkSpell_JumpFunc"
  },
  {
    ID = "JUMP_DOWN",
    Motion = "Mon_DarkMageLeader_f_Jump_Down.frm",
    Func = "CownatDarkSpell_JumpDownFunc"
  },
  {
    ID = "JUMP_LANDING",
    Motion = "Mon_DarkMageLeader_f_Jump_Landing.frm",
    Func = "CownatDarkSpell_JumpLandingFunc"
  },
  {
    ID = "DIE",
    Motion = "Mon_DarkMageLeader_f_Die.frm",
    Func = "CownatDarkSpell_DieFunc",
    IsFallDownMotion = TRUE
  }
}
CallBack = {
  Land = "OnCownatDarkSpell_Land",
  Die = "OnCownatDarkSpell_Die",
  Damage = "OnCownatDarkSpell_Damage"
}
function InitCownatDarkSpell( iMonsterIndex )
local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
 pMonster:SetInitAI(true)
 pMonster:SetCountValue(0)
 pMonster:SetMapTempValue("ATTACK03_CNT", 0)
 pMonster:SetMapTempValue("ATTACK03_LAST_TARGET", 0)
 pMonster:SetMapTempValue("MAX_ATTACK03_SKYCOOL", 0)
end
function CownatDarkSpell_WaitFunc( iMonsterIndex, iFrame )
local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if(pMonster:GetInitAI() )then
   pMonster:AddTraceParticleToBone("Cownat_Magician_Body_Ball_01", 1, 43, 8, 6, 0, 0, true)
   pMonster:AddTraceParticleToBone("Cownat_Magician_Body_Ball_01", 1, 46, 8, 6, 0, 0, true)
   pMonster:AddTraceParticleToBone("Cownat_Magician_Body_Ball_011", 1, 43, 7, 5, 0, 0, true)
   pMonster:AddTraceParticleToBone("Cownat_Magician_Body_Ball_011", 1, 46, 7, 5, 0, 0, true)
   pMonster:AddTraceParticleToBone("Cownat_Magician_Body_Ball_02", 1, 43, 8, 6, 0, 0, true)
   pMonster:AddTraceParticleToBone("Cownat_Magician_Body_Ball_02", 1, 46, 8, 6, 0, 0, true)
   pMonster:SetInitAI(false)
  end
  if( iFrame >=pMonster:GetLastFrame() )then
   pMonster:SetState("WAIT")
  end
end
function CownatDarkSpell_WalkFunc( iMonsterIndex, iFrame )
local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
 pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
  if( iFrame >=pMonster:GetLastFrame() )then
   pMonster:SetState("WALK")
  end
end
function CownatDarkSpell_IdleFunc( iMonsterIndex, iFrame )
local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
 pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
  if( iFrame >=pMonster:GetLastFrame() )then
   pMonster:SetState("IDLE")
  end
end
function CownatDarkSpell_Attack01Func( iMonsterIndex, iFrame )
local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if( iFrame <= 1 )then
   pMonster:SetSuperArmor(true)
  elseif( iFrame == 55 )then
   pMonster:PlaySound(1009)
   pMonster:AddParticleNoDirection("Cownat_Magician_Charge_01", 0, 0.4)
   pMonster:AddParticleNoDirection("Cownat_Magician_Charge_01", 0, 1)
   pMonster:AddParticleNoDirection("Cownat_Magician_Charge_02", 0, 0.6)
   pMonster:AddParticleNoDirection("Cownat_Magician_Charge_03", 0, 0.6)
  elseif( iFrame == 70 )then  
   pMonster:PlaySound(1002)
   pMonster:AddParticleNoDirection("4th_Amy1_Cast_01", 0, 1)
   pMonster:AddParticleNoDirection("4th_Amy1_Cast_02", 0, 1)
   pMonster:AddParticleNoDirection("4th_Amy1_Cast_03", 0, 1)
   pMonster:AddParticleNoDirection("4th_Amy1_Cast_07", 0, 1)
  elseif( iFrame == 149 )then     
	pMonster:AddDamageToAlivePlayer(DT_COWNAT_MON_DARKSPELL_ATTACK01_BEGIN)       
  elseif( iFrame == 150 )then     
   pMonster:AddDamage(DT_ARME1_SPECIAL4_LIGHTNING_MARK_1)    
  elseif( iFrame == 180 )then 
    g_kCamera:SetEarthQuake(20)
   pMonster:PlaySound(1010)
  elseif( iFrame >=pMonster:GetLastFrame() )then
   pMonster:SetState("WAIT")
  end
end
function CownatDarkSpell_Attack02Func( iMonsterIndex, iFrame )
local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if( iFrame <= 1 )then
   pMonster:SetSuperArmor(true)
   pMonster:AddParticleNoDirection("4th_Las4_Slash_04", 0, 0.5)
   pMonster:PlaySound(995)
  elseif( iFrame == 45 )then
   pMonster:PlaySound(92019)
   pMonster:AddDamage(DT_COWNAT_MON_DARKSPELL_ATTACK02_LEFT)
   pMonster:AddDamage(DT_COWNAT_MON_DARKSPELL_ATTACK02_RIGHT)
    g_kCamera:SetEarthQuake(20)
   pMonster:AddParticleNoDirection("4th_Mari1_Boom_03", -0.37, 0.52)
   pMonster:AddParticleNoDirection("4th_Mari1_Boom_04", -0.37, 0.52)
   pMonster:AddParticleNoDirection("4th_Mari1_Boom_03", 0.37, 0.52)
   pMonster:AddParticleNoDirection("4th_Mari1_Boom_04", 0.37, 0.52)
  elseif( iFrame == 110 )then
    g_kCamera:SetEarthQuake(20)
   pMonster:PlaySound(92018)
  elseif( iFrame >=pMonster:GetLastFrame() )then
   pMonster:SetState("WAIT")
  end
end
function CownatDarkSpell_Attack03_1Func( iMonsterIndex, iFrame )
local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if( iFrame <= 1 )then
   pMonster:SetSuperArmor(true)
   pMonster:StartText("DANGER")
   --pMonster:SetMapTempValue("MAX_ATTACK03_SKYCOOL", 0)
  elseif( iFrame == 5 )then
   pMonster:PlaySound(960)
  elseif( iFrame >=pMonster:GetLastFrame() )then
   pMonster:SetState("ATTACK03_2")
  end
end
function CownatDarkSpell_Attack03_2Func( iMonsterIndex, iFrame )
local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if( iFrame <= 1 )then
   pMonster:SetSuperArmor(true)
  elseif( iFrame == 10 )then
   pMonster:AddDamage(DT_COWNAT_MON_DARKSPELL_ATTACK03_LEFT01)
   pMonster:AddDamage(DT_COWNAT_MON_DARKSPELL_ATTACK03_RIGHT01)
   pMonster:AddDamage(DT_COWNAT_MON_DARKSPELL_ATTACK03_LEFT02)
   pMonster:AddDamage(DT_COWNAT_MON_DARKSPELL_ATTACK03_RIGHT02)
   pMonster:AddDamage(DT_COWNAT_MON_DARKSPELL_ATTACK03_LEFT03)
   pMonster:AddDamage(DT_COWNAT_MON_DARKSPELL_ATTACK03_RIGHT03)
   pMonster:AddDamage(DT_COWNAT_MON_DARKSPELL_ATTACK03_LEFT04)
   pMonster:AddDamage(DT_COWNAT_MON_DARKSPELL_ATTACK03_RIGHT04)
   pMonster:AddDamage(DT_COWNAT_MON_DARKSPELL_ATTACK03_LEFT05)
   pMonster:AddDamage(DT_COWNAT_MON_DARKSPELL_ATTACK03_RIGHT05)
   pMonster:AddDamage(DT_COWNAT_MON_DARKSPELL_ATTACK03_LEFT06)
   pMonster:AddDamage(DT_COWNAT_MON_DARKSPELL_ATTACK03_RIGHT06)
  elseif( iFrame == 45 )then
   pMonster:AddDamage(DT_COWNAT_MON_DARKSPELL_ATTACK03_CENTER)
  elseif( iFrame >=pMonster:GetLastFrame() )then
     pMonster:SetState("ATTACK03_3")
  end
end
function CownatDarkSpell_Attack03_3Func( iMonsterIndex, iFrame )
local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if( iFrame <= 1 )then
   pMonster:SetSuperArmor(true)
  elseif( iFrame == 30 )then
   pMonster:PlaySound(961)
  elseif( iFrame >=pMonster:GetLastFrame() )then
   pMonster:SetState("WAIT")
  end
end
function CownatDarkSpell_JumpFunc( iMonsterIndex, iFrame )
local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
 pMonster:SetSuperArmor(true)
  if(pMonster:GetSpeedY() <= 0 )then
   pMonster:SetState("JUMP_DOWN")
  end
  if( iFrame >=pMonster:GetLastFrame() )then
   pMonster:SetFrameLock(true)
  end
end
function CownatDarkSpell_JumpDownFunc( iMonsterIndex, iFrame )
local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
 pMonster:SetSuperArmor(true)
  if( iFrame <= 1 )then
   pMonster:SetFrameLock(false)
  end
  if( iFrame >=pMonster:GetLastFrame() )then
    if(pMonster:GetIsContact() )then
     pMonster:SetState("WAIT")
    else
     pMonster:SetFrameLock(true)
    end
  end
end
function CownatDarkSpell_JumpLandingFunc( iMonsterIndex, iFrame )
local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
 pMonster:SetFrameLock(false)
  if( iFrame >=pMonster:GetLastFrame() )then
   pMonster:SetState("WAIT")
  end
end
function CownatDarkSpell_DieFunc( iMonsterIndex, iFrame )
local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if( iFrame <= 1 )then
   pMonster:SetInvincible(true)
  elseif( iFrame == 5 )then
   pMonster:PlaySound(984007)
  elseif( iFrame >=pMonster:GetLastFrame() )then
   pMonster:EndMonster()
   pMonster:SetFrameLock(true)
  end
end
function CownatDarkSpell_Check_Targeting( iMonsterIndex, iFrame )
local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if(pMonster:SetTarget(0, -1000, 500, 1000, -500) )then
   pMonster:ResetDelay()
  end
end
function CownatDarkSpell_Check_ReleaseTarget( iMonsterIndex, iFrame )
local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if( false == pMonster:CheckTargetInRange(0, -1000, 500, 1000, -500) )then
   pMonster:ReleaseTarget(TRUE)
   pMonster:ResetDelay()
  end
end
function CownatDarkSpell_Check_TurnToTarget( iMonsterIndex, iFrame )
local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if(pMonster:IsTarget() )then
   pMonster:TurnToTarget()
   pMonster:ResetDelay()
  end
end
function CownatDarkSpell_Check_Walk( iMonsterIndex, iFrame )
local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if( false == pMonster:CheckTargetInRange(0, -150, 550, 150, -100) )then
   pMonster:SetState("WALK")
   pMonster:ResetDelay()
  end
end
function CownatDarkSpell_Check_JumpUp( iMonsterIndex, iFrame )
local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if( 1.1 <pMonster:GetY() )then
    return
  end
  if(pMonster:CheckTargetInRange(100, -150, 550, 150, 200) and CownatDarkSpell_Jump(_ARG_0_,pMonster:GetTargetX(),pMonster:GetTargetY()) )then
   pMonster:SetState("JUMP")
   pMonster:ResetDelay()
  end
end
function CownatDarkSpell_Check_JumpDown( iMonsterIndex, iFrame )
local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if( 0.5 >pMonster:GetY() )then
    return
  end
  if(pMonster:CheckTargetInRange(100, -150, 0, 150, -300) )then
   pMonster:SetState("JUMP_DOWN")
   pMonster:SetNoCheckContact(15)
   pMonster:SetSpeedY(-0.01)
   pMonster:ResetDelay()
  end
end
function CownatDarkSpell_Check_Attack01( iMonsterIndex, iFrame )
local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if( 0 == pMonster:GetEnemyCntInRange(0, -250, 350, 250, -100, 0, FALSE, TRUE) )then
   pMonster:SetState("ATTACK01")
   pMonster:ResetDelay()
  end
end
function CownatDarkSpell_Check_Attack02( iMonsterIndex, iFrame )
local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if(pMonster:CheckTargetInRange(0, -500, 350, 500, -250) )then
   pMonster:SetState("ATTACK02")
   pMonster:ResetDelay()
  end
end
function CownatDarkSpell_Check_Attack03( iMonsterIndex, iFrame )
local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if(pMonster:GetHP() /pMonster:GetMaxHP() < 0.9 and 0.1 >pMonster:FloatRand() )then
   pMonster:SetState("ATTACK03_1")
   pMonster:ResetDelay()
  end
end
function CownatDarkSpell_Check_IdleStop( iMonsterIndex, iFrame )
local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if(pMonster:IsTempTarget() or pMonster:IsTarget() )then
   pMonster:TurnToTarget()
   pMonster:SetState("WAIT")
   pMonster:ResetDelay()
  end
end
function CownatDarkSpell_Check_MoveStop( iMonsterIndex, iFrame )
local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if(pMonster:CheckTargetInRange(0, -150, 550, 150, -100) )then
   pMonster:SetState("WAIT")
   pMonster:ResetDelay()
  end
end
function OnCownatDarkSpell_Land( iMonsterIndex )
local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
 pMonster:SetSpeedX( pMonster:GetSpeedX() * (2.0 / 3.0) )
  if(pMonster:CheckState("JUMP") == true or pMonster:CheckState("JUMP_DOWN") == true )then
   pMonster:SetState("JUMP_LANDING")
  end
end
function OnCownatDarkSpell_Die( iMonsterIndex )
local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if(pMonster:IsTarget() )then
   pMonster:TurnToTarget()
  end
 pMonster:SetState("DIE")
end
function OnCownatDarkSpell_Damage( iMonsterIndex )
local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if(pMonster:CheckState("ATTACK01") or pMonster:CheckState("ATTACK02") or pMonster:CheckState("ATTACK03_1") or pMonster:CheckState("ATTACK03_2") or pMonster:CheckState("ATTACK03_3") )then
    return
  end
 pMonster:SetPushCheck(true)
 pMonster:SetSpeedX(0)
 pMonster:SetSpeedY(0)
  if( false == pMonster:CheckState("ATTACK01") and false == pMonster:CheckState("ATTACK02") and false == pMonster:CheckState("ATTACK03_1") )then
    if( 0 <pMonster:FloatRand() and pMonster:FloatRand() < 0.2 )then
     pMonster:TurnToTarget()
     pMonster:SetState("ATTACK01")
    elseif(pMonster:FloatRand() > 0.5 and pMonster:FloatRand() < 0.7 )then
     pMonster:TurnToTarget()
     pMonster:SetState("ATTACK02")
    elseif(pMonster:FloatRand() > 0.8 and pMonster:FloatRand() < 0.9 )then
     pMonster:TurnToTarget()
     pMonster:SetState("ATTACK03_1")
    end
  end
end
function CownatDarkSpell_MoveFail( iMonsterIndex )
local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if(pMonster:GetIsContact() == true )then
    if( false == pMonster:GetIsRight() and 0.5 >pMonster:GetX() )then
     pMonster:SetIsRight(true)
     pMonster:SetSpeedX(0.005)
     pMonster:SetState("WALK")
    elseif( true == pMonster:GetIsRight() and pMonster:GetX() > 3.8 )then
     pMonster:SetIsRight(false)
     pMonster:SetSpeedX(-0.005)
     pMonster:SetState("WALK")
    elseif( 1.3 >pMonster:GetY() )then
     pMonster:SetNoCheckContact(27)
     pMonster:SetIgnoreFHCheck(true)
     pMonster:SetState("JUMP")
     pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 2.5)
     pMonster:SetSpeedY(0.038)
    elseif( 0.5 <pMonster:GetY() )then
     pMonster:SetNoCheckContact(15)
     pMonster:SetIgnoreFHCheck(true)
     pMonster:SetState("JUMP_DOWN")
     pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 2.5)
     pMonster:SetSpeedY(-0.01)
    end
  else
   pMonster:SetState("WAIT")
   pMonster:SetSpeedX(0)
  end
end

function CownatDarkSpell_Jump( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	local fTargetX = pMonster:GetTargetX()
	local fTargetY = pMonster:GetTargetY()
	
	local fMonX = pMonster:GetX()
	local fMonY = pMonster:GetY()
		
	fSpeedX = ( fTargetX - fMonX ) * 1.5
	
	if (fTargetY - fMonY == 0.0) then
		fTargetY = fMonY + 0.01
	end
	fSpeedY = ((fTargetY - fMonY) / ((fTargetY - fMonY) / 4.0)) + (((fTargetY - fMonY) * 1.5) + pMonster:FloatAbs((fSpeedX / 3.1)))
	
	pMonster:SetNoCheckContact(26 + (fSpeedY * 5))
	--pMonster:AddCountValue(1)
	pMonster:TurnToTarget()
	pMonster:SetSpeedX( fSpeedX * 0.015 )
	pMonster:SetSpeedY( fSpeedY * 0.01 )
end
