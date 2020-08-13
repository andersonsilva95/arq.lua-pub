ActionList = {
  {
    ID = "WAIT",
    Motion = "Mon_Astarot_f_Wait.frm",
    Func = "CownatAstarotPhase1_WaitFunc",
    Trigger = {
      {
        AICheckFrame = 30,
        AIFunc = "CownatAstarotPhase1_Check_Targeting",
        DelayFrame = 110
      },
      {
        AICheckFrame = 55,
        AIFunc = "CownatAstarotPhase1_Check_ReleaseTarget",
        DelayFrame = 220
      },
      {
        AICheckFrame = 20,
        AIFunc = "CownatAstarotPhase1_Check_TurnToTarget",
        DelayFrame = 15
      },
      {
        AICheckFrame = 30,
        AIFunc = "CownatAstarotPhase1_Check_Walk",
        DelayFrame = 110
      },
      {
        AICheckFrame = 35,
        AIFunc = "CownatAstarotPhase1_Check_Idle",
        DelayFrame = 110
      },
      {
        AICheckFrame = 35,
        AIFunc = "CownatAstarotPhase1_Check_JumpUp",
        DelayFrame = 55
      },
      {
        AICheckFrame = 35,
        AIFunc = "CownatAstarotPhase1_Check_JumpDown",
        DelayFrame = 55
      },
      {
        AICheckFrame = 110,
        AIFunc = "CownatAstarotPhase1_Check_Attack01",
        DelayFrame = 220
      },
      {
        AICheckFrame = 110,
        AIFunc = "CownatAstarotPhase1_Check_Attack02",
        DelayFrame = 220
      },
      {
        AICheckFrame = 220,
        AIFunc = "CownatAstarotPhase1_Check_Attack03",
        DelayFrame = 1100
      },
      {
        AICheckFrame = 220,
        AIFunc = "CownatAstarotPhase1_Check_Attack04",
        DelayFrame = 1100
      }
    }
  },
  {
    ID = "WALK",
    Motion = "Mon_Astarot_f_Walk.frm",
    Func = "CownatAstarotPhase1_WalkFunc",
    EnableMoveCheck = TRUE,
    MoveFailFunc = "CownatAstarotPhase1_MoveFail",
    Trigger = {
      {
        AICheckFrame = 10,
        AIFunc = "CownatAstarotPhase1_Check_MoveStop",
        DelayFrame = 10
      },
      {
        AICheckFrame = 10,
        AIFunc = "CownatAstarotPhase1_Check_Targeting",
        DelayFrame = 110
      },
      {
        AICheckFrame = 55,
        AIFunc = "CownatAstarotPhase1_Check_ReleaseTarget",
        DelayFrame = 110
      },
      {
        AICheckFrame = 20,
        AIFunc = "CownatAstarotPhase1_Check_TurnToTarget",
        DelayFrame = 55
      },
      {
        AICheckFrame = 35,
        AIFunc = "CownatAstarotPhase1_Check_Idle",
        DelayFrame = 110
      },
      {
        AICheckFrame = 35,
        AIFunc = "CownatAstarotPhase1_Check_JumpUp",
        DelayFrame = 55
      },
      {
        AICheckFrame = 35,
        AIFunc = "CownatAstarotPhase1_Check_JumpDown",
        DelayFrame = 55
      },
      {
        AICheckFrame = 110,
        AIFunc = "CownatAstarotPhase1_Check_Attack01",
        DelayFrame = 220
      },
      {
        AICheckFrame = 110,
        AIFunc = "CownatAstarotPhase1_Check_Attack02",
        DelayFrame = 220
      },
      {
        AICheckFrame = 220,
        AIFunc = "CownatAstarotPhase1_Check_Attack03",
        DelayFrame = 1100
      },
      {
        AICheckFrame = 220,
        AIFunc = "CownatAstarotPhase1_Check_Attack04",
        DelayFrame = 1100
      }
    }
  },
  {
    ID = "IDLE",
    Motion = "Mon_Astarot_f_Walk.frm",
    Func = "CownatAstarotPhase1_IdleFunc",
    EnableMoveCheck = TRUE,
    MoveFailFunc = "CownatAstarotPhase1_MoveFail",
    Trigger = {
      {
        AICheckFrame = 10,
        AIFunc = "CownatAstarotPhase1_Check_Targeting",
        DelayFrame = 10
      },
      {
        AICheckFrame = 10,
        AIFunc = "CownatAstarotPhase1_Check_IdleStop",
        DelayFrame = 10
      }
    }
  },
  {
    ID = "ATTACK01_A",
    Motion = "Mon_Astarot_f_Attack01_A.frm",
    Func = "CownatAstarotPhase1_Attack01AFunc"
  },
  {
    ID = "ATTACK01_B",
    Motion = "Mon_Astarot_f_Attack01_B.frm",
    Func = "CownatAstarotPhase1_Attack01BFunc"
  },
  {
    ID = "ATTACK01_C",
    Motion = "Mon_Astarot_f_Attack01_C.frm",
    Func = "CownatAstarotPhase1_Attack01CFunc"
  },
  {
    ID = "ATTACK02_A",
    Motion = "Mon_Astarot_f_Attack02_A.frm",
    Func = "CownatAstarotPhase1_Attack02AFunc"
  },
  {
    ID = "ATTACK02_B",
    Motion = "Mon_Astarot_f_Attack02_B.frm",
    Func = "CownatAstarotPhase1_Attack02BFunc"
  },
  {
    ID = "ATTACK03",
    Motion = "Mon_Astarot_f_Attack03.frm",
    Func = "CownatAstarotPhase1_Attack03Func"
  },
  {
    ID = "ATTACK04_A",
    Motion = "Mon_Astarot_f_Attack04_A.frm",
    Func = "CownatAstarotPhase1_Attack04AFunc"
  },
  {
    ID = "ATTACK04_B",
    Motion = "Mon_Astarot_f_Attack04_B.frm",
    Func = "CownatAstarotPhase1_Attack04BFunc"
  },
  {
    ID = "ATTACK04_C",
    Motion = "Mon_Astarot_f_Attack04_C.frm",
    Func = "CownatAstarotPhase1_Attack04CFunc"
  },
  {
    ID = "JUMP",
    Motion = "Mon_Astarot_f_Jump_Up.frm",
    Func = "CownatAstarotPhase1_JumpFunc"
  },
  {
    ID = "JUMP_DOWN",
    Motion = "Mon_Astarot_f_Jump_Down.frm",
    Func = "CownatAstarotPhase1_JumpDownFunc"
  },
  {
    ID = "JUMP_LANDING",
    Motion = "Mon_Astarot_f_Jump_Landing.frm",
    Func = "CownatAstarotPhase1_JumpLandingFunc"
  },
  {
    ID = "DIE",
    Motion = "Mon_Astarot_f_Die.frm",
    Func = "CownatAstarotPhase1_DieFunc"
  }
}
CallBack = {
  Land = "OnCownatAstarotPhase1_Land",
  Die = "OnCownatAstarotPhase1_Die",
  Damage = "OnCownatAstarotPhase1_Damage"
}
function InitCownatAstarotPhase1( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
 pMonster:SetInitAI(true)
 pMonster:SetCountValue(0)
 pMonster:SetMapTempValue("ATTACK01_CNT", 0)
 pMonster:SetMapTempValue("ATTACK04_CNT", 0)
end
function CownatAstarotPhase1_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
 pMonster:SetNoCrashDamage(FALSE)
  g_kCamera.WideMode = 7
  if(pMonster:CheckPreState("WALK") or pMonster:CheckPreState("IDLE") )then
   pMonster:SetSpeedX(0)
   pMonster:SetSpeedY(0)
  end
  if( iFrame >= pMonster:GetLastFrame() )then
   pMonster:SetState("WAIT")
  end
end
function CownatAstarotPhase1_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
  if( iFrame == 8 )then
   pMonster:PlaySound(999039)
  elseif( iFrame == 54 )then
   pMonster:PlaySound(999039)
  elseif( iFrame >= pMonster:GetLastFrame() )then
   pMonster:SetState("WALK")
  end
end
function CownatAstarotPhase1_IdleFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
  if( iFrame == 8 )then
   pMonster:PlaySound(999039)
  elseif( iFrame == 54 )then
   pMonster:PlaySound(999039)
  elseif( iFrame >= pMonster:GetLastFrame() )then
   pMonster:SetState("IDLE")
  end
end
function CownatAstarotPhase1_Attack01AFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if( iFrame <= 1 )then
   pMonster:SetSuperArmor(true)
   pMonster:SetMapTempValue("ATTACK01_CNT", 0)
  elseif( iFrame == 75 )then
   pMonster:PlaySound(839)
  elseif( iFrame >= pMonster:GetLastFrame() )then
   pMonster:SetState("ATTACK01_B")
  end
end
function CownatAstarotPhase1_Attack01BFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if( iFrame <= 1 )then
   pMonster:SetSuperArmor(true)
  elseif( iFrame == 10 )then
	
	if( pMonster:GetCountValue() == 0 ) then
     pMonster:AddDamage(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK04_SHOT_SOUND)
     pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK01_SHOW, 0.185, 0.27, TRUE)
     pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK01_SHOW, 1.008, 0.27, TRUE)
     pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK01_SHOW, 1.531, 0.27, TRUE)
     pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK01_SHOW, 2.654, 0.27, TRUE)
     pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK01_SHOW, 3.477, 0.27, TRUE)
     pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK01_SHOW, 4.3, 0.27, TRUE)
     pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK01_SHOW, 0.4, 0.67, TRUE)
     pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK01_SHOW, 1.7, 0.67, TRUE)
     pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK01_SHOW, 2.2425, 0.67, TRUE)
     pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK01_SHOW, 3.8885, 0.67, TRUE)
     pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK01_SHOW, 1.008, 1.07, TRUE)
     pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK01_SHOW, 2.3, 1.07, TRUE)
     pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK01_SHOW, 3.477, 1.07, TRUE)
     pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK01_SHOW, 0.5965, 1.42, TRUE)
     pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK01_SHOW, 2.2425, 1.42, TRUE)
     pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK01_SHOW, 3.8885, 1.42, TRUE)
	elseif( pMonster:GetCountValue() == 1 ) then 
     pMonster:AddDamage(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK04_SHOT_SOUND)
     pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK01_SHOW, 0.5965, 0.27, TRUE)
     pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK01_SHOW, 1.4195, 0.27, TRUE)
     pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK01_SHOW, 1.9425, 0.27, TRUE)
     pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK01_SHOW, 3.0655, 0.27, TRUE)
     pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK01_SHOW, 3.8885, 0.27, TRUE)
     pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK01_SHOW, 4.7115, 0.27, TRUE)
     pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK01_SHOW, 0.8115, 0.67, TRUE)
     pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK01_SHOW, 2.1115, 0.67, TRUE)
     pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK01_SHOW, 2.654, 0.67, TRUE)
     pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK01_SHOW, 4.3, 0.67, TRUE)
     pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK01_SHOW, 0.5965, 1.07, TRUE)
     pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK01_SHOW, 2.7115, 1.07, TRUE)
     pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK01_SHOW, 3.8885, 1.07, TRUE)
     pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK01_SHOW, 0.185, 1.42, TRUE)
     pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK01_SHOW, 1.4195, 1.42, TRUE)
     pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK01_SHOW, 3.0655, 1.42, TRUE)
     pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK01_SHOW, 4.3, 1.42, TRUE)
	elseif( pMonster:GetCountValue() == 2 ) then
     pMonster:AddDamage(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK04_SHOT_SOUND)
     pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK01_SHOW, 0.185, 0.27, TRUE)
     pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK01_SHOW, 1.008, 0.27, TRUE)
     pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK01_SHOW, 1.531, 0.27, TRUE)
     pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK01_SHOW, 2.654, 0.27, TRUE)
     pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK01_SHOW, 3.477, 0.27, TRUE)
     pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK01_SHOW, 4.3, 0.27, TRUE)
     pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK01_SHOW, 0.4, 0.67, TRUE)
     pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK01_SHOW, 1.7, 0.67, TRUE)
     pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK01_SHOW, 2.2425, 0.67, TRUE)
     pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK01_SHOW, 3.8885, 0.67, TRUE)
     pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK01_SHOW, 1.008, 1.07, TRUE)
     pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK01_SHOW, 2.3, 1.07, TRUE)
     pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK01_SHOW, 3.477, 1.07, TRUE)
     pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK01_SHOW, 0.5965, 1.42, TRUE)
     pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK01_SHOW, 2.2425, 1.42, TRUE)
     pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK01_SHOW, 3.8885, 1.42, TRUE)
	elseif( pMonster:GetCountValue() == 3 ) then
     pMonster:AddDamage(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK04_SHOT_SOUND)
     pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK01_SHOW, 0.185, 0.27, TRUE)
     pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK01_SHOW, 1.008, 0.27, TRUE)
     pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK01_SHOW, 1.531, 0.27, TRUE)
     pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK01_SHOW, 2.654, 0.27, TRUE)
     pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK01_SHOW, 3.477, 0.27, TRUE)
     pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK01_SHOW, 4.3, 0.27, TRUE)
     pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK01_SHOW, 0.4, 0.67, TRUE)
     pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK01_SHOW, 1.7, 0.67, TRUE)
     pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK01_SHOW, 2.2425, 0.67, TRUE)
     pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK01_SHOW, 3.8885, 0.67, TRUE)
     pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK01_SHOW, 1.008, 1.07, TRUE)
     pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK01_SHOW, 2.3, 1.07, TRUE)
     pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK01_SHOW, 3.477, 1.07, TRUE)
     pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK01_SHOW, 0.5965, 1.42, TRUE)
     pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK01_SHOW, 2.2425, 1.42, TRUE)
     pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK01_SHOW, 3.8885, 1.42, TRUE)
	elseif( pMonster:GetCountValue() == 4 ) then
     pMonster:AddDamage(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK04_SHOT_SOUND)
     pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK01_SHOW, 0.5965, 0.27, TRUE)
     pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK01_SHOW, 1.4195, 0.27, TRUE)
     pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK01_SHOW, 1.9425, 0.27, TRUE)
     pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK01_SHOW, 3.0655, 0.27, TRUE)
     pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK01_SHOW, 3.8885, 0.27, TRUE)
     pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK01_SHOW, 4.7115, 0.27, TRUE)
     pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK01_SHOW, 0.8115, 0.67, TRUE)
     pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK01_SHOW, 2.1115, 0.67, TRUE)
     pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK01_SHOW, 2.654, 0.67, TRUE)
     pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK01_SHOW, 4.3, 0.67, TRUE)
     pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK01_SHOW, 0.5965, 1.07, TRUE)
     pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK01_SHOW, 2.7115, 1.07, TRUE)
     pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK01_SHOW, 3.8885, 1.07, TRUE)
     pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK01_SHOW, 0.185, 1.42, TRUE)
     pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK01_SHOW, 1.4195, 1.42, TRUE)
     pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK01_SHOW, 3.0655, 1.42, TRUE)
     pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK01_SHOW, 4.3, 1.42, TRUE)
	elseif( pMonster:GetCountValue() == 5 ) then 
     pMonster:AddDamage(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK04_SHOT_SOUND)
     pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK01_SHOW, 0.185, 0.27, TRUE)
     pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK01_SHOW, 1.008, 0.27, TRUE)
     pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK01_SHOW, 1.531, 0.27, TRUE)
     pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK01_SHOW, 2.654, 0.27, TRUE)
     pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK01_SHOW, 3.477, 0.27, TRUE)
     pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK01_SHOW, 4.3, 0.27, TRUE)
     pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK01_SHOW, 0.4, 0.67, TRUE)
     pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK01_SHOW, 1.7, 0.67, TRUE)
     pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK01_SHOW, 2.2425, 0.67, TRUE)
     pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK01_SHOW, 3.8885, 0.67, TRUE)
     pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK01_SHOW, 1.008, 1.07, TRUE)
     pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK01_SHOW, 2.3, 1.07, TRUE)
     pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK01_SHOW, 3.477, 1.07, TRUE)
     pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK01_SHOW, 0.5965, 1.42, TRUE)
     pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK01_SHOW, 2.2425, 1.42, TRUE)
     pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK01_SHOW, 3.8885, 1.42, TRUE)
	end 

  elseif( iFrame == 25 )then
   pMonster:AddCountValue(1)
   pMonster:PlaySound(981)
  elseif( iFrame >= pMonster:GetLastFrame() )then
	if( pMonster:GetCountValue() == 5 ) then
		pMonster:SetState("ATTACK01_C")
	else	
		pMonster:SetState("ATTACK01_B")
	end	
  end
end
function CownatAstarotPhase1_Attack01CFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if( iFrame <= 1 )then
   pMonster:SetSuperArmor(true)
   pMonster:SetCountValue(0)
  elseif( iFrame == 2 )then
   pMonster:PlaySound(756)
  elseif( iFrame >= pMonster:GetLastFrame() )then
   pMonster:SetState("WAIT")
  end
end
function CownatAstarotPhase1_Attack02AFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if( iFrame <= 1 )then
   pMonster:SetSuperArmor(true)
  elseif( iFrame == 100 )then
   pMonster:AddDamage(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK02_01)
   pMonster:PlaySound(829)
    if(pMonster:GetIsRight() )then
     pMonster:AddParticleNoDirection("Dun_Achemedia7_Astarot1_Slash_01", 0.4, 0.6)
     pMonster:AddParticleNoDirection("Dun_Achemedia7_Astarot1_Slash_04", 0.65, 0.45)
     pMonster:AddParticleNoDirection("Sieg01_Phantom_Rush_Finisher_02", 0.65, 0.45)
    else
     pMonster:AddParticleNoDirection("Dun_Achemedia7_Astarot1_Slash_01_R", -0.4, 0.6)
     pMonster:AddParticleNoDirection("Dun_Achemedia7_Astarot1_Slash_04", -0.65, 0.45)
     pMonster:AddParticleNoDirection("Sieg01_Phantom_Rush_Finisher_02", -0.65, 0.45)
    end
  elseif( iFrame == 145 )then
   pMonster:AddDamage(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK02_02)
   pMonster:PlaySound(830)
    if(pMonster:GetIsRight() )then
     pMonster:AddParticleNoDirection("Dun_Achemedia7_Astarot1_Slash_02", 0.45, 0.9)
     pMonster:AddParticleNoDirection("Dun_Achemedia7_Astarot1_Slash_04", 0.8, 0.65)
     pMonster:AddParticleNoDirection("Sieg01_Phantom_Rush_Finisher_02", 0.8, 0.65)
    else
     pMonster:AddParticleNoDirection("Dun_Achemedia7_Astarot1_Slash_02_R", -0.45, 0.9)
     pMonster:AddParticleNoDirection("Dun_Achemedia7_Astarot1_Slash_04", -0.8, 0.65)
     pMonster:AddParticleNoDirection("Sieg01_Phantom_Rush_Finisher_02", -0.8, 0.65)
    end
  elseif( iFrame == 180 )then
   pMonster:AddDamage(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK02_03)
   pMonster:PlaySound(829)
    if(pMonster:GetIsRight() )then
     pMonster:AddParticleNoDirection("Dun_Achemedia7_Astarot1_Slash_03", 0.45, 0.5)
     pMonster:AddParticleNoDirection("Dun_Achemedia7_Astarot1_Slash_04", 0.65, 0.65)
     pMonster:AddParticleNoDirection("Sieg01_Phantom_Rush_Finisher_02", 0.65, 0.65)
    else
     pMonster:AddParticleNoDirection("Dun_Achemedia7_Astarot1_Slash_03_R", -0.45, 0.5)
     pMonster:AddParticleNoDirection("Dun_Achemedia7_Astarot1_Slash_04", -0.65, 0.65)
     pMonster:AddParticleNoDirection("Sieg01_Phantom_Rush_Finisher_02", -0.65, 0.65)
    end
  elseif( iFrame >= pMonster:GetLastFrame() )then
   pMonster:SetState("ATTACK02_B")
  end
end
function CownatAstarotPhase1_Attack02BFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if( iFrame <= 1 )then
   pMonster:SetSuperArmor(true)
  elseif( iFrame == 10 )then
   pMonster:AddDamage(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK02_04)
   pMonster:PlaySound(668)
  elseif( iFrame == 40 )then
   pMonster:AddDamage(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK02_05)
  elseif( iFrame == 45 )then
   pMonster:PlaySound(994)
  elseif( iFrame >= pMonster:GetLastFrame() )then
   pMonster:SetState("WAIT")
  end
  if( iFrame > 15 and iFrame < 55 and iFrame % 2 == 0 )then
    g_kCamera:CameraVib(0, 0.3, 1)
  end
end
function CownatAstarotPhase1_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if( iFrame <= 1 )then
   pMonster:SetSuperArmor(true)
   pMonster:StartText("JUMP")
  elseif( iFrame == 80 )then
   pMonster:PlaySound(843)
  elseif( iFrame == 120 )then
   pMonster:EarthQuake(50, 0.05, 0.05)
  elseif( iFrame == 130 )then
   pMonster:AddDamage(DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK03)
  elseif( iFrame >= pMonster:GetLastFrame() )then
   pMonster:SetState("WAIT")
  end
end
function CownatAstarotPhase1_Attack04AFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if( iFrame <= 1 )then
   pMonster:SetIsRight(false)
   pMonster:SetSuperArmor(true)
   pMonster:SetMapTempValue("ATTACK04_CNT", 0)
   pMonster:SetNoCrashDamage(TRUE)
  elseif( iFrame == 15 )then
   pMonster:PlaySound(969)
  elseif( iFrame >= pMonster:GetLastFrame() )then
   pMonster:SetState("ATTACK04_B")
  end
end
function CownatAstarotPhase1_Attack04BFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if( iFrame <= 1 )then
   pMonster:SetSuperArmor(true) 
  elseif( iFrame == 25 )then
	pMonster:AddCountValue(1)
	pMonster:AddDamageToAlivePlayer( DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK04_GUID, 0.0, 0.0 )
  elseif( iFrame == 49 )then
	pMonster:AddDamageToAlivePlayer( DT_COWNAT_MON_ASTAROT_PHASE1_ATTACK04_GUID, 0.0, 0.0 )
  elseif( iFrame >= pMonster:GetLastFrame() )then
	if( pMonster:GetCountValue() == 4 ) then
		pMonster:SetState("ATTACK04_C")
	else	
		pMonster:SetState("ATTACK04_B")
	end	  
  end
end
function CownatAstarotPhase1_Attack04CFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if( iFrame <= 1 )then
   pMonster:SetSuperArmor(true)
   pMonster:SetNoCrashDamage(FALSE)
   pMonster:SetCountValue(0)
  elseif( iFrame >= pMonster:GetLastFrame() )then
   pMonster:SetState("WAIT")
  end
end
function CownatAstarotPhase1_JumpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
 pMonster:SetSuperArmor(true)
  if(pMonster:GetSpeedY() <= 0 )then
   pMonster:SetState("JUMP_DOWN")
  end
  if( iFrame >= pMonster:GetLastFrame() )then
   pMonster:SetFrameLock(true)
  end
end
function CownatAstarotPhase1_JumpDownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
 pMonster:SetSuperArmor(true)
  if(pMonster:GetIsContact() )then
   pMonster:SetFrameLock(false)
   pMonster:SetState("JUMP_LANDING")
    return
  end
  if( iFrame <= 1 )then
   pMonster:SetFrameLock(false)
  elseif( iFrame >= pMonster:GetLastFrame() )then
   pMonster:SetFrameLock(true)
  end
end
function CownatAstarotPhase1_JumpLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
 pMonster:SetSuperArmor(true)
  if( iFrame <= 1 )then
   pMonster:SetFrameLock(false)
  elseif( iFrame == 8 )then
   pMonster:PlaySound(999039)
  elseif( iFrame >= pMonster:GetLastFrame() )then
   pMonster:SetState("WAIT")
  end
end
function CownatAstarotPhase1_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if( iFrame <= 1 )then
   pMonster:SetInvincible(true)
  elseif( iFrame == 3 )then
   pMonster:PlaySound(977005)
  elseif( iFrame == 45 )then
   pMonster:PlaySound(839)
  elseif( iFrame >= pMonster:GetLastFrame() )then
   pMonster:EndMonster(true, true, true)
   pMonster:SetFrameLock(true)
  end
end
function CownatAstarotPhase1_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if(pMonster:SetTarget(0, -300, 200, 300, -200) )then
   pMonster:ResetDelay()
  end
end
function CownatAstarotPhase1_Check_ReleaseTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if( false == pMonster:CheckTargetInRange(0, -300, 200, 300, -200) )then
   pMonster:ReleaseTarget(TRUE)
   pMonster:ResetDelay()
  end
end
function CownatAstarotPhase1_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if(pMonster:IsTarget() )then
   pMonster:TurnToTarget()
   pMonster:ResetDelay()
  end
end
function CownatAstarotPhase1_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if( false == pMonster:CheckTargetInRange(0, -200, 550, 200, -550) )then
   pMonster:SetState("WALK")
   pMonster:ResetDelay()
  end
end
function CownatAstarotPhase1_Check_JumpUp( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if( 1.1 <pMonster:GetY() )then
    return
  end
  if(pMonster:CheckTargetInRange(100, -150, 550, 150, 100) and CownatAstarotPhase1_Jump(iMonsterIndex,pMonster:GetTargetX(),pMonster:GetTargetY()) )then
   pMonster:SetState("JUMP")
   pMonster:ResetDelay()
  end
end
function CownatAstarotPhase1_Check_JumpDown( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if( 0.5 > pMonster:GetY() )then
    return
  end
  if(pMonster:CheckTargetInRange(100, -150, -150, 150, -550) )then
   pMonster:SetState("JUMP_DOWN")
   pMonster:SetNoCheckContact(15)
   pMonster:SetSpeedY(-0.01)
   pMonster:ResetDelay()
  end
end
function CownatAstarotPhase1_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if( 0 == pMonster:GetEnemyCntInRange(0, -300, 350, 300, -250, 0, FALSE, TRUE) )then
   pMonster:SetState("ATTACK01_A")
   pMonster:ResetDelay()
  end
end
function CownatAstarotPhase1_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if(pMonster:CheckTargetInRange(150, -150, 200, 150, -100) )then
   pMonster:SetState("ATTACK02_A")
   pMonster:ResetDelay()
  end
end
function CownatAstarotPhase1_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if(pMonster:CheckTargetInRange(250, -250, 200, 250, -100) )then
   pMonster:SetState("ATTACK03")
   pMonster:ResetDelay()
  end
end
function CownatAstarotPhase1_Check_Attack04( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if(pMonster:GetHP() <pMonster:GetMaxHP() / 2 and 0.2 > pMonster:FloatRand() )then
   pMonster:SetState("ATTACK04_A")
   pMonster:ResetDelay()
  end
end
function CownatAstarotPhase1_Check_IdleStop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if(pMonster:IsTarget() )then
   pMonster:TurnToTarget()
   pMonster:SetState("WAIT")
   pMonster:ResetDelay()
  end
end
function CownatAstarotPhase1_Check_MoveStop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if(pMonster:CheckTargetInRange(0, -200, 550, 200, -550) )then
   pMonster:SetState("WAIT")
   pMonster:ResetDelay()
  end
end
function OnCownatAstarotPhase1_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	pMonster:SetSpeedX( pMonster:GetSpeedX() * (2.0 / 3.0) )
  if(pMonster:CheckState("JUMP") == true or pMonster:CheckState("JUMP_DOWN") == true )then
   pMonster:SetState("JUMP_LANDING")
  end
end
function OnCownatAstarotPhase1_Die( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
 pMonster:SetState("DIE")
end
function OnCownatAstarotPhase1_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
 pMonster:SetPushCheck(true)
 pMonster:SetSpeedX(0)
 pMonster:SetSpeedY(0)
  if(pMonster:CheckState("ATTACK01_A") or pMonster:CheckState("ATTACK01_B") or pMonster:CheckState("ATTACK01_C") or pMonster:CheckState("ATTACK02_A") or pMonster:CheckState("ATTACK02_B") or pMonster:CheckState("ATTACK03") or pMonster:CheckState("ATTACK04_A") or pMonster:CheckState("ATTACK04_B") or pMonster:CheckState("ATTACK04_C") )then
    return
  end
  if( 0 <pMonster:FloatRand() and pMonster:FloatRand() < 0.15 )then
   pMonster:SetState("ATTACK01_A")
  elseif(pMonster:FloatRand() > 0.15 and pMonster:FloatRand() < 0.35 )then
   pMonster:TurnToTarget()
   pMonster:SetState("ATTACK02_A")
  elseif(pMonster:FloatRand() > 0.35 and pMonster:FloatRand() < 0.5 )then
   pMonster:TurnToTarget()
   pMonster:SetState("ATTACK03")
  elseif(pMonster:FloatRand() > 0.5 and pMonster:FloatRand() < 0.65 )then
   pMonster:SetState("ATTACK04_A")
  end
end
function CownatAstarotPhase1_MoveFail( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if(pMonster:GetIsContact() == true )then
    if( false == pMonster:GetIsRight() and 0.5 > pMonster:GetX() )then
     pMonster:SetIsRight(true)
     pMonster:SetSpeedX(0.005)
     pMonster:SetState("WALK")
    elseif( true == pMonster:GetIsRight() and pMonster:GetX() > 3.8 )then
     pMonster:SetIsRight(false)
     pMonster:SetSpeedX(-0.005)
     pMonster:SetState("WALK")
    elseif( 1.1 > pMonster:GetY() )then
     pMonster:SetNoCheckContact(27)
     pMonster:SetIgnoreFHCheck(true)
     pMonster:SetState("JUMP")
     pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 2.5 )
     pMonster:SetSpeedY(0.038)
    elseif( 0.5 <pMonster:GetY() )then
     pMonster:SetNoCheckContact(15)
     pMonster:SetIgnoreFHCheck(true)
     pMonster:SetState("JUMP_DOWN")
     pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 2.5 )
     pMonster:SetSpeedY(-0.01)
    end
  else
   pMonster:SetState("WAIT")
   pMonster:SetSpeedX(0)
  end
end

function CownatAstarotPhase1_Jump( iMonsterIndex )
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
	pMonster:TurnToTarget()
	pMonster:SetSpeedX( fSpeedX * 0.015 )
	pMonster:SetSpeedY( fSpeedY * 0.01 )
end