ActionList = {
  {
    ID = "WAIT",
    Motion = "Mon_DarkSwordLeader_f_Wait.frm",
    Func = "CownatDarkSword_WaitFunc",
    Trigger = {
      {
        AICheckFrame = 30,
        AIFunc = "CownatDarkSword_Check_Targeting",
        DelayFrame = 550
      },
      {
        AICheckFrame = 55,
        AIFunc = "CownatDarkSword_Check_ReleaseTarget",
        DelayFrame = 550
      },
      {
        AICheckFrame = 20,
        AIFunc = "CownatDarkSword_Check_TurnToTarget",
        DelayFrame = 15
      },
      {
        AICheckFrame = 30,
        AIFunc = "CownatDarkSword_Check_Walk",
        DelayFrame = 5
      },
      {
        AICheckFrame = 35,
        AIFunc = "CownatDarkSword_Check_Idle",
        DelayFrame = 35
      },
      {
        AICheckFrame = 35,
        AIFunc = "CownatDarkSword_Check_JumpUp",
        DelayFrame = 55
      },
      {
        AICheckFrame = 35,
        AIFunc = "CownatDarkSword_Check_JumpDown",
        DelayFrame = 55
      },
      {
        AICheckFrame = 110,
        AIFunc = "CownatDarkSword_Check_Attack01",
        DelayFrame = 220
      },
      {
        AICheckFrame = 110,
        AIFunc = "CownatDarkSword_Check_Attack02",
        DelayFrame = 220
      },
      {
        AICheckFrame = 165,
        AIFunc = "CownatDarkSword_Check_Attack03",
        DelayFrame = 330
      }
    }
  },
  {
    ID = "WALK",
    Motion = "Mon_DarkSwordLeader_f_Move.frm",
    Func = "CownatDarkSword_WalkFunc",
    EnableMoveCheck = TRUE,
    MoveFailFunc = "CownatDarkSword_MoveFail",
    Trigger = {
      {
        AICheckFrame = 10,
        AIFunc = "CownatDarkSword_Check_MoveStop",
        DelayFrame = 10
      },
      {
        AICheckFrame = 10,
        AIFunc = "CownatDarkSword_Check_Targeting",
        DelayFrame = 550
      },
      {
        AICheckFrame = 55,
        AIFunc = "CownatDarkSword_Check_ReleaseTarget",
        DelayFrame = 550
      },
      {
        AICheckFrame = 20,
        AIFunc = "CownatDarkSword_Check_TurnToTarget",
        DelayFrame = 15
      },
      {
        AICheckFrame = 35,
        AIFunc = "CownatDarkSword_Check_Idle",
        DelayFrame = 35
      },
      {
        AICheckFrame = 35,
        AIFunc = "CownatDarkSword_Check_JumpUp",
        DelayFrame = 55
      },
      {
        AICheckFrame = 35,
        AIFunc = "CownatDarkSword_Check_JumpDown",
        DelayFrame = 55
      },
      {
        AICheckFrame = 110,
        AIFunc = "CownatDarkSword_Check_Attack01",
        DelayFrame = 220
      },
      {
        AICheckFrame = 110,
        AIFunc = "CownatDarkSword_Check_Attack02",
        DelayFrame = 220
      },
      {
        AICheckFrame = 110,
        AIFunc = "CownatDarkSword_Check_Attack03",
        DelayFrame = 220
      }
    }
  },
  {
    ID = "IDLE",
    Motion = "Mon_DarkSwordLeader_f_Move.frm",
    Func = "CownatDarkSword_IdleFunc",
    EnableMoveCheck = TRUE,
    MoveFailFunc = "CownatDarkSword_MoveFail",
    Trigger = {
      {
        AICheckFrame = 10,
        AIFunc = "CownatDarkSword_Check_Targeting",
        DelayFrame = 10
      },
      {
        AICheckFrame = 10,
        AIFunc = "CownatDarkSword_Check_IdleStop",
        DelayFrame = 10
      }
    }
  },
  {
    ID = "ATTACK01",
    Motion = "Mon_DarkSwordLeader_f_Attack01.frm",
    Func = "CownatDarkSword_Attack01Func"
  },
  {
    ID = "ATTACK02_1",
    Motion = "Mon_DarkSwordLeader_f_Attack02_01.frm",
    Func = "CownatDarkSword_Attack02_1Func"
  },
  {
    ID = "ATTACK02_2",
    Motion = "Mon_DarkSwordLeader_f_Attack02_02.frm",
    Func = "CownatDarkSword_Attack02_2Func"
  },
  {
    ID = "ATTACK02_3",
    Motion = "Mon_DarkSwordLeader_f_Attack02_03.frm",
    Func = "CownatDarkSword_Attack02_3Func"
  },
  {
    ID = "ATTACK03_1",
    Motion = "Mon_DarkSwordLeader_f_Attack03_01.frm",
    Func = "CownatDarkSword_Attack03_1Func"
  },
  {
    ID = "ATTACK03_2",
    Motion = "Mon_DarkSwordLeader_f_Wait.frm",
    Func = "CownatDarkSword_Attack03_2Func"
  },
  {
    ID = "JUMP",
    Motion = "Mon_DarkSwordLeader_f_Jump_Up.frm",
    Func = "CownatDarkSword_JumpFunc"
  },
  {
    ID = "JUMP_DOWN",
    Motion = "Mon_DarkSwordLeader_f_Jump_Down.frm",
    Func = "CownatDarkSword_JumpDownFunc"
  },
  {
    ID = "JUMP_LANDING",
    Motion = "Mon_DarkSwordLeader_f_Jump_Landing.frm",
    Func = "CownatDarkSword_JumpLandingFunc"
  },
  {
    ID = "DIE",
    Motion = "Mon_DarkSwordLeader_f_Die.frm",
    Func = "CownatDarkSword_DieFunc",
    IsFallDownMotion = TRUE
  }
}
CallBack = {
  Land = "OnCownatDarkSword_Land",
  Die = "OnCownatDarkSword_Die",
  Damage = "OnCownatDarkSword_Damage"
}
function InitCownatDarkSword( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
 pMonster:SetInitAI(true)
 pMonster:SetCountValue(0)
 pMonster:SetMapTempValue("ATTACK03_CNT", 0)
 pMonster:SetMapTempValue("ATTACK03_LAST_TARGET", 0)
end
function CownatDarkSword_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if( iFrame >= pMonster:GetLastFrame() )then
   pMonster:SetState("WAIT")
  end
end
function CownatDarkSword_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
  if( iFrame == 7 )then
   pMonster:PlaySound(999039)
  elseif( iFrame == 70 )then
   pMonster:PlaySound(999039)
  elseif( iFrame >= pMonster:GetLastFrame() )then
   pMonster:SetState("WALK")
  end
end
function CownatDarkSword_IdleFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
  if( iFrame == 7 )then
   pMonster:PlaySound(999039)
  elseif( iFrame == 70 )then
   pMonster:PlaySound(999039)
  elseif( iFrame >= pMonster:GetLastFrame() )then
   pMonster:SetState("IDLE")
  end
end
function CownatDarkSword_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if( iFrame <= 1 )then
   pMonster:SetSuperArmor(true)
  elseif( iFrame == 100 )then
   pMonster:AddDamage(DT_COWNAT_MON_DARKSWORD_ATTACK01_01)
  elseif( iFrame == 110 )then
   pMonster:EarthQuake(20, 0, 0)
    if(pMonster:GetIsRight() )then
     pMonster:AddParticleNoDirection("Train_Captain_Punch_Under_02_R", 0.4, 0.2)
     pMonster:AddParticleNoDirection("Train_Prisoner_Crash_01", 0.4, 0.1)
     pMonster:AddParticleNoDirection("Train_Prisoner_Crash_02", 0.4, 0.1)
     pMonster:AddParticleNoDirection("Train_Prisoner_Crash_04", 0.4, 0.1)
    else
     pMonster:AddParticleNoDirection("Train_Captain_Punch_Under_02", -0.4, 0.2)
     pMonster:AddParticleNoDirection("Train_Prisoner_Crash_01", -0.4, 0.1)
     pMonster:AddParticleNoDirection("Train_Prisoner_Crash_02", -0.4, 0.1)
     pMonster:AddParticleNoDirection("Train_Prisoner_Crash_04", -0.4, 0.1)
    end
  elseif( iFrame == 160 )then
   pMonster:AddDamage(DT_COWNAT_MON_DARKSWORD_ATTACK01_02)
   pMonster:PlaySound(984003)
    if(pMonster:GetIsRight() )then
     pMonster:AddParticleNoDirection("Cownat_Sword_Swing_01", 0.2, 0.5)
     pMonster:AddParticleNoDirection("Cownat_Sword_Swing_01", 0.1, 0.3)
    else
     pMonster:AddParticleNoDirection("Cownat_Sword_Swing_01_R", -0.2, 0.5)
     pMonster:AddParticleNoDirection("Cownat_Sword_Swing_01_R", -0.1, 0.3)
    end
  elseif( iFrame >= pMonster:GetLastFrame() )then
   pMonster:SetState("WAIT")
  end
end
function CownatDarkSword_Attack02_1Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
 pMonster:SetSuperArmor(true)
  if( iFrame <= 1 )then
   pMonster:StartText("JUMP")
   pMonster:SetPushCheck(FALSE)
  elseif( iFrame == 45 )then
   pMonster:PlaySound(342)
  elseif( iFrame == 105 )then
   pMonster:AddDamage(DT_COWNAT_MON_DARKSWORD_ATTACK02_EARTHQUAKE)
  elseif( iFrame == 110 )then
   pMonster:SetPushCheck(TRUE)
   pMonster:EarthQuake(30, 0.08, 0.05)
   pMonster:AddParticleNoDirection("4th_Dio1_Quake_01", 0, 0.15)
   pMonster:AddParticleNoDirection("4th_Dio1_Quake_02", 0, 0.15)
  elseif( iFrame == 195 )then
   pMonster:AddDamage(DT_COWNAT_MON_DARKSWORD_ATTACK02_SWORD)
   pMonster:PlaySound(867)
  elseif( iFrame == 210 )then
   pMonster:EarthQuake(20, 0, 0)
  elseif( iFrame >= pMonster:GetLastFrame() )then
   pMonster:SetState("ATTACK02_2")
  end
  if( iFrame > 220 and iFrame < 330 and iFrame % 2 == 0 )then
    g_kCamera:CameraVib(0, 0.4, 1)
  end
end
function CownatDarkSword_Attack02_2Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if( iFrame >= pMonster:GetLastFrame() )then
   pMonster:SetState("ATTACK02_3")
  elseif( iFrame > 1 and iFrame < 50 and iFrame % 2 == 0 )then
    g_kCamera:CameraVib(0, 0.3, 1)
  end
end
function CownatDarkSword_Attack02_3Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if( iFrame <= 1 )then
   pMonster:SetSuperArmor(true)
  elseif( iFrame == 10 )then
   pMonster:PlaySound(1295)
  elseif( iFrame == 20 )then
   pMonster:EarthQuake(10, 0, 0)
  elseif( iFrame >= pMonster:GetLastFrame() )then
   pMonster:SetState("WAIT")
  end
  if( iFrame > 1 and iFrame < 20 and iFrame % 2 == 0 )then
    g_kCamera:CameraVib(0, 0.3, 1)
  end
end
function CownatDarkSword_Attack03_1Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if( iFrame <= 1 )then
   pMonster:SetSuperArmor(true)
   pMonster:SetMapTempValue("ATTACK03_CNT", 0)
   pMonster:SetMapTempValue("ATTACK03_LAST_TARGET", 0)
  elseif( iFrame == 60 )then
   pMonster:PlaySound(342)
  elseif( iFrame == 70 )then
   pMonster:PlaySound(984005)
   pMonster:AddDamage( DT_DARKTEMPLAR_DOUBLEFRAME )
   pMonster:AddParticleNoDirection("Cownat_Sword_Rage_01", 0, 0.3)
   pMonster:AddParticleNoDirection("Cownat_Sword_Rage_02", 0, 0.3)
   pMonster:AddParticleNoDirection("Cownat_Sword_Rage_03", 0, 0.3)
   pMonster:AddParticleNoDirection("Cownat_Sword_Rage_04", 0, 0.3)
   pMonster:AddParticleNoDirection("Cownat_Sword_Rage_05", 0, 0.3)
  elseif( iFrame == 159 )then
   pMonster:EarthQuake(30, 0, 0)
   pMonster:AddParticleNoDirection("Train_Prisoner_Crash_01", 0, 0.1)
   pMonster:AddParticleNoDirection("Train_Prisoner_Crash_02", 0, 0.1)
   pMonster:AddParticleNoDirection("Train_Prisoner_Crash_04", 0, 0)
   pMonster:AddParticleNoDirection("Circus_Zidler_PBbung_Start_02", 0, 0)
   pMonster:AddDamage(DT_COWNAT_MON_DARKSWORD_ATTACK03_HORRIBLE)
   pMonster:PlaySound(342)
   pMonster:AddDamageWithLocateDirect( DT_GHOST_PRIEST_ATK2, 0.0, 0.0, true )
   pMonster:AddDamageWithLocateDirect( DT_GHOST_PRIEST_ATK2_R, 0.0, 0.0, true )   
  elseif( iFrame == 160 )then
   pMonster:SetState("WAIT")
  end
  if( iFrame > 65 and iFrame < 140 and iFrame % 2 == 0 )then
    g_kCamera:CameraVib(0, 0.3, 1)
  end
end
function CownatDarkSword_Attack03_2Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	if( iFrame == 0 )then
		--pMonster.m_bRender = TRUE
		--pMonster:SetFly(FALSE)
		pMonster:SetSpeedY(-0.3)
		pMonster:SetNoCheckContact(20)
	elseif( iFrame == 5 )then
		pMonster:PlaySound(1245)
		pMonster:PlaySound(832)		
		pMonster:AddParticleNoDirectionPos( "4th_Ryan2_Boom_16", 0, 0.07, 0.0, -0.3 )	
		pMonster:AddParticleNoDirectionPos( "Jin2_special3_Finisher_Upgrade_03", 0, 0.07, 0.2, 0.5 )				
		pMonster:AddParticleNoDirectionPos( "Jin4_Hadoken_Spark_03", 0, 0.07, 0.2, 0.5 )		
		pMonster:AddParticleNoDirectionPos( "Jin4_Hadoken_Spark_04", 0, 0.07, 0.2, 0.5 )		
		pMonster:AddParticleNoDirectionPos( "Jin4_Hadoken_Spark_05", 0, 0.07, 0.2, 0.5 )		
		pMonster:AddParticleNoDirectionPos( "Jin4_special3_Upgrade_Finisher_07", 0, 0.07, -0.35, 0.5 )		
		pMonster:AddParticleNoDirectionPos( "Jin4_special3_Upgrade_Finisher_08", 0, 0.07, -0.35, 0.53)
	elseif( iFrame == 6 ) then	
		pMonster:PlaySound(1245)
		pMonster:PlaySound(832)		
		pMonster:AddParticleNoDirectionPos( "4th_Ryan2_Boom_16", 0, 0.07, 0.0, -0.3 )	
		pMonster:AddParticleNoDirectionPos( "Jin2_special3_Finisher_Upgrade_03", 0, 0.07, 0.2, 0.5 )				
		pMonster:AddParticleNoDirectionPos( "Jin4_Hadoken_Spark_03", 0, 0.07, 0.2, 0.5 )		
		pMonster:AddParticleNoDirectionPos( "Jin4_Hadoken_Spark_04", 0, 0.07, 0.2, 0.5 )		
		pMonster:AddParticleNoDirectionPos( "Jin4_Hadoken_Spark_05", 0, 0.07, 0.2, 0.5 )		
		pMonster:AddParticleNoDirectionPos( "Jin4_special3_Upgrade_Finisher_07", 0, 0.07, -0.35, 0.5 )		
		pMonster:AddParticleNoDirectionPos( "Jin4_special3_Upgrade_Finisher_08", 0, 0.07, -0.35, 0.5 )	
	elseif( iFrame == 7 ) then
		pMonster:AddParticleNoDirectionPos( "4th_Ryan2_Boom_01", 0, 0.07, 0.0, 0.5 )			
		pMonster:AddParticleNoDirectionPos( "4th_Ryan2_Boom_02", 0, 0.07, 0.0, 0.5 )			
		pMonster:AddParticleNoDirectionPos( "4th_Ryan2_Boom_03", 0, 0.07, 0.0, 0.5 )			
		pMonster:AddParticleNoDirectionPos( "4th_Ryan2_Boom_04", 0, 0.07, 0.0, 0.5 )			
		pMonster:AddParticleNoDirectionPos( "4th_Ryan2_Boom_05", 0, 0.07, 0.0, 0.5 )			
		pMonster:AddParticleNoDirectionPos( "4th_Ryan2_Boom_06", 0, 0.07, 0.0, 0.5 )			
		pMonster:AddParticleNoDirectionPos( "4th_Ryan2_Boom_07", 0, 0.07, 0.0, 0.5 )			
		pMonster:AddParticleNoDirectionPos( "4th_Ryan2_Boom_08", 0, 0.07, 0.0, 0.5 )			
		pMonster:AddParticleNoDirectionPos( "4th_Ryan2_Boom_09", 0, 0.07, 0.0, 0.5 )			
		pMonster:AddParticleNoDirectionPos( "4th_Ryan2_Boom_10", 0, 0.07, 0.0, 0.5 )			
		pMonster:AddParticleNoDirectionPos( "4th_Ryan2_Boom_11", 0, 0.07, 0.0, 0.5 )			
		pMonster:AddParticleNoDirectionPos( "4th_Ryan2_Boom_12", 0, 0.07, 0.0, 0.5 )			
		pMonster:AddParticleNoDirectionPos( "4th_Ryan2_Boom_13", 0, 0.07, 0.0, 0.5 )			
		pMonster:AddParticleNoDirectionPos( "4th_Ryan2_Boom_14", 0, 0.07, 0.0, 0.5 )			
		pMonster:AddParticleNoDirectionPos( "4th_Ryan2_Boom_15", 0, 0.07, 0.0, 0.5 )					
		pMonster:AddParticleNoDirectionPos( "4th_Ryan2_Boom_17", 0, 0.07, 0.0, 0.5 )			
		pMonster:AddParticleNoDirectionPos( "4th_Ryan2_Boom_18", 0, 0.07, 0.0, 0.5 )		
		pMonster:AddParticleNoDirectionPos( "Jin2_special3_Finisher_Upgrade_04", 0, 0.07, 0.0, 0.5 )			
		pMonster:AddParticleNoDirectionPos( "Ryan1_Glourious_Stamping_05", 0, 0.07, 0.1, 0.5 )			
	elseif( iFrame == 8 ) then
		pMonster:AddDamage(DT_RYAN2_SPECIAL4_DOWN_DMG)
	elseif( iFrame == 30 )then		
		pMonster:OnReverseGravity( 0.7, 0.1, TRUE, 0.035, 2.5, 0.0, 0.0)
		pMonster:SetNoCheckContact(20)
		pMonster:SetState("JUMP_DOWN")
	end
end
function CownatDarkSword_JumpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
 pMonster:SetSuperArmor(true)
  if(pMonster:GetSpeedY() <= 0 )then
   pMonster:SetState("JUMP_DOWN")
  end
  if( iFrame >= pMonster:GetLastFrame() )then
   pMonster:SetFrameLock(true)
  end
end
function CownatDarkSword_JumpDownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
 pMonster:SetSuperArmor(true)
  if( iFrame <= 1 )then
   pMonster.m_bRender = TRUE
   pMonster:SetFly(FALSE)
   pMonster:SetFrameLock(false)
  end
  if( iFrame >= pMonster:GetLastFrame() )then
    if(pMonster:GetIsContact() )then
     pMonster:SetState("WAIT")
    else
     pMonster:SetFrameLock(true)
    end
  end
end
function CownatDarkSword_JumpLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
 pMonster:SetFrameLock(false)
  if( iFrame == 5 )then
   pMonster:PlaySound(999039)
  elseif( iFrame >= pMonster:GetLastFrame() )then
   pMonster:SetState("WAIT")
  end
end
function CownatDarkSword_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if( iFrame <= 1 )then
   pMonster:SetInvincible(true)
  elseif( iFrame == 5 )then
   pMonster:PlaySound(984001)
  elseif( iFrame >= pMonster:GetLastFrame() )then
   pMonster:EndMonster()
   pMonster:SetFrameLock(true)
  end
end
function CownatDarkSword_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if(pMonster:SetTarget(0, -1000, 500, 1000, -500) )then
   pMonster:ResetDelay()
  end
end
function CownatDarkSword_Check_ReleaseTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if( false == pMonster:CheckTargetInRange(0, -1000, 500, 1000, -500) )then
   pMonster:ReleaseTarget(TRUE)
   pMonster:ResetDelay()
  end
end
function CownatDarkSword_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if(pMonster:IsTarget() )then
   pMonster:TurnToTarget()
   pMonster:ResetDelay()
  end
end
function CownatDarkSword_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if( false == pMonster:CheckTargetInRange(0, -150, 350, 150, -300) )then
   pMonster:SetState("WALK")
   pMonster:ResetDelay()
  end
end
function CownatDarkSword_Check_JumpUp( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if( 1.1 < pMonster:GetY() )then
    return
  end
  if(pMonster:CheckTargetInRange(100, -250, 350, 250, 50) and CownatDarkSword_Jump(iMonsterIndex,pMonster:GetTargetX(),pMonster:GetTargetY()) )then
   pMonster:SetState("JUMP")
   pMonster:ResetDelay()
  end
end
function CownatDarkSword_Check_JumpDown( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if( 0.5 >pMonster:GetY() )then
    return
  end
  if(pMonster:CheckTargetInRange(100, -250, -100, 250, -450) )then
   pMonster:SetState("JUMP_DOWN")
   pMonster:SetNoCheckContact(15)
   pMonster:SetSpeedY(-0.01)
   pMonster:ResetDelay()
  end
end
function CownatDarkSword_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if(pMonster:CheckTargetInRange(250, -250, 150, 250, -100) )then
   pMonster:SetState("ATTACK01")
   pMonster:ResetDelay()
  end
end
function CownatDarkSword_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if(pMonster:CheckTargetInRange(250, -250, 150, 250, -100) )then
   pMonster:SetState("ATTACK02_1")
   pMonster:ResetDelay()
  end
end
function CownatDarkSword_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if( 0 == pMonster:GetEnemyCntInRange(0, -350, 150, 350, -100, 0, FALSE, TRUE) )then
   pMonster:SetState("ATTACK03_1")
   pMonster:ResetDelay()
  end
end
function CownatDarkSword_Check_IdleStop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if(pMonster:IsTempTarget() or pMonster:IsTarget() )then
   pMonster:TurnToTarget()
   pMonster:SetState("WAIT")
   pMonster:ResetDelay()
  end
end
function CownatDarkSword_Check_MoveStop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if(pMonster:CheckTargetInRange(0, -150, 50, 150, -100) )then
   pMonster:SetState("WAIT")
   pMonster:ResetDelay()
  end
end
function OnCownatDarkSword_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	pMonster:SetSpeedX( pMonster:GetSpeedX() * (2.0 / 3.0) )
  if(pMonster:CheckState("JUMP") == true or pMonster:CheckState("JUMP_DOWN") == true )then
   pMonster:SetState("JUMP_LANDING")
  end
end
function OnCownatDarkSword_Die( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if(pMonster:IsTarget() )then
   pMonster:TurnToTarget()
  end
 pMonster:SetState("DIE")
end
function OnCownatDarkSword_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if(pMonster:CheckState("ATTACK01") or pMonster:CheckState("ATTACK02_1") or pMonster:CheckState("ATTACK02_2") or pMonster:CheckState("ATTACK02_3") or pMonster:CheckState("ATTACK03_1") or pMonster:CheckState("ATTACK03_2") )then
    return
  end
 pMonster:SetPushCheck(true)
 pMonster:SetSpeedX(0)
 pMonster:SetSpeedY(0)
  if(pMonster:FloatRand() < 0.05 )then
   pMonster:TurnToTarget()
   pMonster:SetState("ATTACK02_1")
  elseif(pMonster:FloatRand() > 0.45 and pMonster:FloatRand() < 0.5 )then
   pMonster:TurnToTarget()
   pMonster:SetState("ATTACK03_1")
  elseif(pMonster:FloatRand() > 0.8 )then
   pMonster:TurnToTarget()
   pMonster:SetState("ATTACK01")
  end
end
function CownatDarkSword_MoveFail( iMonsterIndex )
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

function CownatDarkSword_Jump( iMonsterIndex )
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
