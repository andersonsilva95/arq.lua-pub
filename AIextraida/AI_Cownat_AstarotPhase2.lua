ActionList = {
  {
    ID = "WAIT",
    Motion = "Mon_Astarot_Phase2_f_Wait.frm",
    Func = "CownatAstarotPhase2_WaitFunc",
    Trigger = {
      {
        AICheckFrame = 30,
        AIFunc = "CownatAstarotPhase2_Check_Targeting",
        DelayFrame = 110
      },
      {
        AICheckFrame = 55,
        AIFunc = "CownatAstarotPhase2_Check_ReleaseTarget",
        DelayFrame = 220
      },
      {
        AICheckFrame = 110,
        AIFunc = "CownatAstarotPhase2_Check_Attack01",
        DelayFrame = 220
      },
      {
        AICheckFrame = 110,
        AIFunc = "CownatAstarotPhase2_Check_Attack02",
        DelayFrame = 220
      },
      {
        AICheckFrame = 220,
        AIFunc = "CownatAstarotPhase2_Check_Attack03",
        DelayFrame = 1100
      },
      {
        AICheckFrame = 220,
        AIFunc = "CownatAstarotPhase2_Check_Attack04",
        DelayFrame = 1100
      },
      {
        AICheckFrame = 220,
        AIFunc = "CownatAstarotPhase2_Check_Attack05",
        DelayFrame = 1100
      }
    }
  },
  {
    ID = "ATTACK01_01",
    Motion = "Mon_Astarot_Phase2_f_Attack01_01.frm",
    Func = "CownatAstarotPhase2_Attack01_01Func"
  },
  {
    ID = "ATTACK01_02",
    Motion = "Mon_Astarot_Phase2_f_Attack01_02.frm",
    Func = "CownatAstarotPhase2_Attack01_02Func"
  },
  {
    ID = "ATTACK02_01",
    Motion = "Mon_Astarot_Phase2_f_Attack02_01.frm",
    Func = "CownatAstarotPhase2_Attack02_01Func"
  },
  {
    ID = "ATTACK02_02",
    Motion = "Mon_Astarot_Phase2_f_Attack02_02.frm",
    Func = "CownatAstarotPhase2_Attack02_02Func"
  },
  {
    ID = "ATTACK03_01",
    Motion = "Mon_Astarot_Phase2_f_Attack03_01.frm",
    Func = "CownatAstarotPhase2_Attack03_01Func"
  },
  {
    ID = "ATTACK03_02",
    Motion = "Mon_Astarot_Phase2_f_Attack03_02.frm",
    Func = "CownatAstarotPhase2_Attack03_02Func"
  },
  {
    ID = "ATTACK04_01",
    Motion = "Mon_Astarot_Phase2_f_Attack04_01.frm",
    Func = "CownatAstarotPhase2_Attack04_01Func"
  },
  {
    ID = "ATTACK04_02",
    Motion = "Mon_Astarot_Phase2_f_Attack04_02.frm",
    Func = "CownatAstarotPhase2_Attack04_02Func"
  },
  {
    ID = "ATTACK05_01_PATTERN1",
    Motion = "Mon_Astarot_Phase2_f_Attack05_01.frm",
    Func = "CownatAstarotPhase2_Attack05_01_Pattern1Func"
  },
  {
    ID = "ATTACK05_01_PATTERN2",
    Motion = "Mon_Astarot_Phase2_f_Attack05_01.frm",
    Func = "CownatAstarotPhase2_Attack05_01_Pattern2Func"
  },
  {
    ID = "ATTACK05_01_PATTERN3",
    Motion = "Mon_Astarot_Phase2_f_Attack05_01.frm",
    Func = "CownatAstarotPhase2_Attack05_01_Pattern3Func"
  },
  {
    ID = "ATTACK05_02_PATTERN1",
    Motion = "Mon_Astarot_Phase2_f_Attack05_02.frm",
    Func = "CownatAstarotPhase2_Attack05_02Pattern1Func"
  },
  {
    ID = "ATTACK05_02_PATTERN2",
    Motion = "Mon_Astarot_Phase2_f_Attack05_02.frm",
    Func = "CownatAstarotPhase2_Attack05_02Pattern2Func"
  },
  {
    ID = "ATTACK05_02_PATTERN3",
    Motion = "Mon_Astarot_Phase2_f_Attack05_02.frm",
    Func = "CownatAstarotPhase2_Attack05_02Pattern3Func"
  },
  {
    ID = "ATTACK05_03",
    Motion = "Mon_Astarot_Phase2_f_Attack05_03.frm",
    Func = "CownatAstarotPhase2_Attack05_03Func"
  },
  {
    ID = "DIE",
    Motion = "Mon_Astarot_Phase2_f_Die.frm",
    Func = "CownatAstarotPhase2_DieFunc"
  }
}
CallBack = {
  Die = "OnCownatAstarotPhase2_Die",
  Damage = "OnCownatAstarotPhase2_Damage"
}
function InitCownatAstarotPhase2( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
 pMonster:SetInitAI(true)
 pMonster:SetIsRight(true)
 pMonster:SetCountValue(0)
 pMonster:SetMapTempValue("ATTACK05_CNT", 0)
end
function CownatAstarotPhase2_WaitFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  g_kCamera.WideMode = 7
  if(pMonster:GetInitAI() )then
   pMonster:AddTraceParticleToBone("Dun_Achmedi7_Astarot2_Foce_01", 1, 4, 2, 2, 0, 0.4, true)
   pMonster:AddTraceParticleToBone("Dun_Achmedi7_Astarot2_Foce_02", 1, 4, 2, 2, 0, 0.9, true)
   pMonster:AddTraceParticleToBone("Dun_Achmedi7_Astarot2_Foce_05", 1, 4, 2, 2, 0, 1.2, true)
   pMonster:AddTraceParticleToBone("Dun_Achmedi7_Astarot2_Foce_06", 1, 4, 6, 6, 0, 1, true)
   pMonster:AddTraceParticleToBone("Dun_Achmedia7_Astarot2_Foce_03", 1, 7, 8, 8, 0, 0, true)
   pMonster:AddParticleToChildMeshBone("CENTER", "Dun_Achmedia7_Astarot2_Foce_03", 2, 0.5, 0, 0, true)
   pMonster:SetInitAI(false)
  end
 pMonster:ToggleExtraMesh("CENTER", TRUE)
  if( iFrame >= pMonster:GetLastFrame() )then
   pMonster:SetState("WAIT")
  end
end
function CownatAstarotPhase2_Attack01_01Func( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if( iFrame <= 1 )then
   pMonster:StartText("JUMP")
  elseif( iFrame == 10 )then
   pMonster:PlaySound(829)
  elseif( iFrame == pMonster:GetLastFrame() - 2 )then
   pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE2_ATTACK01_PUNCH, -0.5, 1.5)
  elseif( iFrame >= pMonster:GetLastFrame() )then
   pMonster:SetState("ATTACK01_02")
  end
end
function CownatAstarotPhase2_Attack01_02Func( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if( iFrame == 10 )then
   pMonster:EarthQuake(60, 0.085, 0.1)
   pMonster:AddParticleNoDirection("4th_Ryan2_Boom_10", -0.7, 0.1)
   pMonster:AddParticleNoDirection("4th_Ryan2_Boom_11", -0.7, 0.1)
   pMonster:AddParticleNoDirection("4th_Ryan2_Boom_12", -0.7, 0.1)
   pMonster:AddParticleNoDirection("4th_Ryan2_Boom_13", -0.7, 0.1)
   pMonster:AddParticleNoDirection("4th_Ryan2_Boom_15", -0.7, 0.1)
   pMonster:AddParticleNoDirection("4th_Ryan2_Boom_16", -0.7, 0.1)
   pMonster:AddParticleNoDirection("4th_Ryan2_Boom_17", -0.7, 0.1)
   pMonster:AddParticleNoDirection("4th_Ryan2_Boom_18", -0.7, 0.1)
  elseif( iFrame == 110 )then
   pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE2_ATTACK01_HAND, -0.5, 0.6)
   pMonster:PlaySound(100019)
  elseif( iFrame >= pMonster:GetLastFrame() )then
   pMonster:SetState("WAIT")
  end
end
function CownatAstarotPhase2_Attack02_01Func( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if( iFrame <= 1 )then
   pMonster:StartText("JUMP")
  elseif( iFrame == pMonster:GetLastFrame() - 2 )then
   pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE2_ATTACK01_PUNCH, 0.5, 1.5)
  elseif( iFrame == 10 )then
   pMonster:PlaySound(829)
  elseif( iFrame >= pMonster:GetLastFrame() )then
   pMonster:SetState("ATTACK02_02")
  end
end
function CownatAstarotPhase2_Attack02_02Func( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if( iFrame == 10 )then
   pMonster:EarthQuake(60, 0.085, 0.1)
   pMonster:AddParticleNoDirection("4th_Ryan2_Boom_10", 0.7, 0.1)
   pMonster:AddParticleNoDirection("4th_Ryan2_Boom_11", 0.7, 0.1)
   pMonster:AddParticleNoDirection("4th_Ryan2_Boom_12", 0.7, 0.1)
   pMonster:AddParticleNoDirection("4th_Ryan2_Boom_13", 0.7, 0.1)
   pMonster:AddParticleNoDirection("4th_Ryan2_Boom_15", 0.7, 0.1)
   pMonster:AddParticleNoDirection("4th_Ryan2_Boom_16", 0.7, 0.1)
   pMonster:AddParticleNoDirection("4th_Ryan2_Boom_17", 0.7, 0.1)
   pMonster:AddParticleNoDirection("4th_Ryan2_Boom_18", 0.7, 0.1)
  elseif( iFrame == 110 )then
   pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE2_ATTACK02_HAND, 0.5, 0.6)
   pMonster:PlaySound(100019)
  elseif( iFrame >= pMonster:GetLastFrame() )then
   pMonster:SetState("WAIT")
  end
end
function CownatAstarotPhase2_Attack03_01Func( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if( iFrame == 5 )then
   pMonster:AddTraceParticleToBone("Dun_Achemedia7_Astarot2_Attack3_Cast_01", 0.5, 7, 8, 8, 0, 0)
   pMonster:AddTraceParticleToBone("Dun_Achemedia7_Astarot2_Attack3_Cast_02", 0.5, 7, 8, 8, 0, 0)
   pMonster:AddTraceParticleToBone("Dun_Achemedia7_Astarot2_Attack3_Cast_03", 0.5, 7, 8, 8, 0, 0)
   pMonster:AddTraceParticleToBone("Dun_Achemedia7_Astarot2_Attack3_Cast_04", 0.5, 7, 8, 8, 0, 0)
   pMonster:PlaySound(977006)
  elseif( iFrame >= pMonster:GetLastFrame() )then
   pMonster:SetState("ATTACK03_02")
  end
end
function CownatAstarotPhase2_Attack03_02Func( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if( iFrame == 5 )then
   pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE2_ATTACK03, -1.8, 1.5)
   pMonster:AddTraceParticleToBone("Dun_Achemedia7_Astarot2_Attack3_01", 10, 7, 8, 8, 0, 0)
   pMonster:AddTraceParticleToBone("Dun_Achemedia7_Astarot2_Attack3_02", 10, 7, 8, 8, 0, 0)
   pMonster:AddTraceParticleToBone("Dun_Achemedia7_Astarot2_Attack3_03", 10, 7, 8, 8, 0, 0)
   pMonster:AddTraceParticleToBone("Dun_Achemedia7_Astarot2_Attack3_04", 10, 7, 8, 8, 0, 0)
   pMonster:AddTraceParticleToBone("Dun_Achemedia7_Astarot2_Attack3_05", 10, 7, 8, 8, 0, 0)
   pMonster:AddTraceParticleToBone("Dun_Achemedia7_Astarot2_Attack3_06", 10, 7, 8, 8, 0, 0)
   pMonster:AddTraceParticleToBone("Dun_Achemedia7_Astarot2_Attack3_07", 10, 7, 8, 8, 0, 0)
   pMonster:PlaySound(977007)
  elseif( iFrame == 20 )then
   pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE2_ATTACK03, -1.8, 0.5)
  elseif( iFrame == 35 )then
   pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE2_ATTACK03, -0.8, 1.5)
  elseif( iFrame == 50 )then
   pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE2_ATTACK03, -0.8, 0.5)
  elseif( iFrame == 65 )then
   pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE2_ATTACK03, 0.2, 1.5)
  elseif( iFrame == 80 )then
   pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE2_ATTACK03, 0.2, 0.5)
  elseif( iFrame == 95 )then
   pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE2_ATTACK03, 1.2, 0.5)
  elseif( iFrame == 110 )then
   pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE2_ATTACK03, 1.2, 1.5)
  elseif( iFrame == 125 )then
   pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE2_ATTACK03, 2.2, 0.5)
  elseif( iFrame >= pMonster:GetLastFrame() )then
   pMonster:SetState("WAIT")
  end
  if( iFrame > 3 and iFrame < 130 and iFrame % 2 == 0 )then
    g_kCamera:CameraVib(0, 0.3, 1)
  end
end
function CownatAstarotPhase2_Attack04_01Func( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if( iFrame == 5 )then
   pMonster:AddTraceParticleToBone("Dun_Achemedia7_Astarot2_Attack3_Cast_01", 0.5, 7, 8, 8, 0, 0)
   pMonster:AddTraceParticleToBone("Dun_Achemedia7_Astarot2_Attack3_Cast_02", 0.5, 7, 8, 8, 0, 0)
   pMonster:AddTraceParticleToBone("Dun_Achemedia7_Astarot2_Attack3_Cast_03", 0.5, 7, 8, 8, 0, 0)
   pMonster:AddTraceParticleToBone("Dun_Achemedia7_Astarot2_Attack3_Cast_04", 0.5, 7, 8, 8, 0, 0)
   pMonster:PlaySound(977006)
  elseif( iFrame >= pMonster:GetLastFrame() )then
   pMonster:SetState("ATTACK04_02")
  end
end
function CownatAstarotPhase2_Attack04_02Func( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if( iFrame == 5 )then
   pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE2_ATTACK03, 1.8, 1.5)
   pMonster:AddTraceParticleToBone("Dun_Achemedia7_Astarot2_Attack3_01_R", 10, 7, 8, 8, 0, 0)
   pMonster:AddTraceParticleToBone("Dun_Achemedia7_Astarot2_Attack3_02", 10, 7, 8, 8, 0, 0)
   pMonster:AddTraceParticleToBone("Dun_Achemedia7_Astarot2_Attack3_03", 10, 7, 8, 8, 0, 0)
   pMonster:AddTraceParticleToBone("Dun_Achemedia7_Astarot2_Attack3_04", 10, 7, 8, 8, 0, 0)
   pMonster:AddTraceParticleToBone("Dun_Achemedia7_Astarot2_Attack3_05", 10, 7, 8, 8, 0, 0)
   pMonster:AddTraceParticleToBone("Dun_Achemedia7_Astarot2_Attack3_06", 10, 7, 8, 8, 0, 0)
   pMonster:AddTraceParticleToBone("Dun_Achemedia7_Astarot2_Attack3_07", 10, 7, 8, 8, 0, 0)
   pMonster:PlaySound(977007)
  elseif( iFrame == 25 )then
   pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE2_ATTACK03, 1.8, 0.5)
  elseif( iFrame == 35 )then
   pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE2_ATTACK03, 0.8, 1.5)
  elseif( iFrame == 50 )then
   pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE2_ATTACK03, 0.8, 0.5)
  elseif( iFrame == 65 )then
   pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE2_ATTACK03, -0.2, 1.5)
  elseif( iFrame == 80 )then
   pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE2_ATTACK03, -0.2, 0.5)
  elseif( iFrame == 95 )then
   pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE2_ATTACK03, -1.2, 0.5)
  elseif( iFrame == 110 )then
   pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE2_ATTACK03, -1.2, 1.5)
  elseif( iFrame == 125 )then
   pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE2_ATTACK03, -2.2, 0.5)
  elseif( iFrame >= pMonster:GetLastFrame() )then
   pMonster:SetState("WAIT")
  end
end
function CownatAstarotPhase2_Attack05_01_Pattern1Func( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if( iFrame <= 1 )then
   pMonster:StartText("JUMP")
  elseif( iFrame == 205 )then
   pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE2_ATTACK05_PUNCH, -1.4, 1.5)
   pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE2_ATTACK05_PUNCH, 1.4, 1.5)
  elseif( iFrame == 215 )then
   pMonster:EarthQuake(60, 0.08, 0.1)
   pMonster:AddParticleNoDirection("4th_Ryan2_Boom_10", 1.5, 0.1)
   pMonster:AddParticleNoDirection("4th_Ryan2_Boom_11", 1.5, 0.1)
   pMonster:AddParticleNoDirection("4th_Ryan2_Boom_12", 1.5, 0.1)
   pMonster:AddParticleNoDirection("4th_Ryan2_Boom_13", 1.5, 0.1)
   pMonster:AddParticleNoDirection("4th_Ryan2_Boom_15", 1.5, 0.1)
   pMonster:AddParticleNoDirection("4th_Ryan2_Boom_16", 1.5, 0.1)
   pMonster:AddParticleNoDirection("4th_Ryan2_Boom_17", 1.5, 0.1)
   pMonster:AddParticleNoDirection("4th_Ryan2_Boom_18", 1.5, 0.1)
   pMonster:AddParticleNoDirection("4th_Ryan2_Boom_10", -1.5, 0.1)
   pMonster:AddParticleNoDirection("4th_Ryan2_Boom_11", -1.5, 0.1)
   pMonster:AddParticleNoDirection("4th_Ryan2_Boom_12", -1.5, 0.1)
   pMonster:AddParticleNoDirection("4th_Ryan2_Boom_13", -1.5, 0.1)
   pMonster:AddParticleNoDirection("4th_Ryan2_Boom_15", -1.5, 0.1)
   pMonster:AddParticleNoDirection("4th_Ryan2_Boom_16", -1.5, 0.1)
   pMonster:AddParticleNoDirection("4th_Ryan2_Boom_17", -1.5, 0.1)
   pMonster:AddParticleNoDirection("4th_Ryan2_Boom_18", -1.5, 0.1)
  elseif( iFrame >= pMonster:GetLastFrame() )then
   pMonster:SetState("ATTACK05_02_PATTERN1")
  elseif( iFrame == 55 )then
   pMonster:PlaySound(977008)
  end
end
function CownatAstarotPhase2_Attack05_01_Pattern2Func( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if( iFrame <= 1 )then
   pMonster:StartText("JUMP")
  elseif( iFrame == 205 )then
   pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE2_ATTACK05_PUNCH, -1.4, 1.5)
   pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE2_ATTACK05_PUNCH, 1.4, 1.5)
  elseif( iFrame == 215 )then
   pMonster:EarthQuake(60, 0.08, 0.1)
   pMonster:AddParticleNoDirection("4th_Ryan2_Boom_10", 1.5, 0.1)
   pMonster:AddParticleNoDirection("4th_Ryan2_Boom_11", 1.5, 0.1)
   pMonster:AddParticleNoDirection("4th_Ryan2_Boom_12", 1.5, 0.1)
   pMonster:AddParticleNoDirection("4th_Ryan2_Boom_13", 1.5, 0.1)
   pMonster:AddParticleNoDirection("4th_Ryan2_Boom_15", 1.5, 0.1)
   pMonster:AddParticleNoDirection("4th_Ryan2_Boom_16", 1.5, 0.1)
   pMonster:AddParticleNoDirection("4th_Ryan2_Boom_17", 1.5, 0.1)
   pMonster:AddParticleNoDirection("4th_Ryan2_Boom_18", 1.5, 0.1)
   pMonster:AddParticleNoDirection("4th_Ryan2_Boom_10", -1.5, 0.1)
   pMonster:AddParticleNoDirection("4th_Ryan2_Boom_11", -1.5, 0.1)
   pMonster:AddParticleNoDirection("4th_Ryan2_Boom_12", -1.5, 0.1)
   pMonster:AddParticleNoDirection("4th_Ryan2_Boom_13", -1.5, 0.1)
   pMonster:AddParticleNoDirection("4th_Ryan2_Boom_15", -1.5, 0.1)
   pMonster:AddParticleNoDirection("4th_Ryan2_Boom_16", -1.5, 0.1)
   pMonster:AddParticleNoDirection("4th_Ryan2_Boom_17", -1.5, 0.1)
   pMonster:AddParticleNoDirection("4th_Ryan2_Boom_18", -1.5, 0.1)
  elseif( iFrame >= pMonster:GetLastFrame() )then
   pMonster:SetState("ATTACK05_02_PATTERN2")
  elseif( iFrame == 55 )then
   pMonster:PlaySound(977008)
  end
end
function CownatAstarotPhase2_Attack05_01_Pattern3Func( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if( iFrame <= 1 )then
   pMonster:StartText("JUMP")
  elseif( iFrame == 205 )then
   pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE2_ATTACK05_PUNCH, -1.4, 1.5)
   pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE2_ATTACK05_PUNCH, 1.4, 1.5)
  elseif( iFrame == 215 )then
   pMonster:EarthQuake(60, 0.08, 0.1)
   pMonster:AddParticleNoDirection("4th_Ryan2_Boom_10", 1.5, 0.1)
   pMonster:AddParticleNoDirection("4th_Ryan2_Boom_11", 1.5, 0.1)
   pMonster:AddParticleNoDirection("4th_Ryan2_Boom_12", 1.5, 0.1)
   pMonster:AddParticleNoDirection("4th_Ryan2_Boom_13", 1.5, 0.1)
   pMonster:AddParticleNoDirection("4th_Ryan2_Boom_15", 1.5, 0.1)
   pMonster:AddParticleNoDirection("4th_Ryan2_Boom_16", 1.5, 0.1)
   pMonster:AddParticleNoDirection("4th_Ryan2_Boom_17", 1.5, 0.1)
   pMonster:AddParticleNoDirection("4th_Ryan2_Boom_18", 1.5, 0.1)
   pMonster:AddParticleNoDirection("4th_Ryan2_Boom_10", -1.5, 0.1)
   pMonster:AddParticleNoDirection("4th_Ryan2_Boom_11", -1.5, 0.1)
   pMonster:AddParticleNoDirection("4th_Ryan2_Boom_12", -1.5, 0.1)
   pMonster:AddParticleNoDirection("4th_Ryan2_Boom_13", -1.5, 0.1)
   pMonster:AddParticleNoDirection("4th_Ryan2_Boom_15", -1.5, 0.1)
   pMonster:AddParticleNoDirection("4th_Ryan2_Boom_16", -1.5, 0.1)
   pMonster:AddParticleNoDirection("4th_Ryan2_Boom_17", -1.5, 0.1)
   pMonster:AddParticleNoDirection("4th_Ryan2_Boom_18", -1.5, 0.1)
  elseif( iFrame >= pMonster:GetLastFrame() )then
   pMonster:SetState("ATTACK05_02_PATTERN3")
  elseif( iFrame == 55 )then
   pMonster:PlaySound(977008)
  end
end
function CownatAstarotPhase2_Attack05_02Pattern1Func( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if( iFrame == 10 )then
     pMonster:AddDamage(DT_COWNAT_MON_ASTAROT_PHASE2_ATTACK05_PATTERN1)
  elseif( iFrame >= pMonster:GetLastFrame() )then
     pMonster:SetState("ATTACK05_03")
  end
end
function CownatAstarotPhase2_Attack05_02Pattern2Func( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if( iFrame == 10 )then
     pMonster:AddDamage(DT_COWNAT_MON_ASTAROT_PHASE2_ATTACK05_PATTERN2)
  elseif( iFrame >= pMonster:GetLastFrame() )then
     pMonster:SetState("ATTACK05_03")
  end
end
function CownatAstarotPhase2_Attack05_02Pattern3Func( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if( iFrame == 10 )then
     pMonster:AddDamage(DT_COWNAT_MON_ASTAROT_PHASE2_ATTACK05_PATTERN3)
  elseif( iFrame >= pMonster:GetLastFrame() )then
     pMonster:SetState("ATTACK05_03")
  end
end
function CownatAstarotPhase2_Attack05_03Func( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if( iFrame >= pMonster:GetLastFrame() )then
   pMonster:SetState("WAIT")
  end
end
function CownatAstarotPhase2_DieFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if( iFrame <= 1 )then
   pMonster:SetInvincible(true)
  elseif( iFrame == 5 )then
   pMonster:PlaySound(977009)
  elseif( iFrame == pMonster:GetLastFrame() - 1 )then
   pMonster:EarthQuake(40, 0, 0)
  elseif( iFrame >= pMonster:GetLastFrame() )then
   pMonster:EndMonster(true, true, true)
   pMonster:SetFrameLock(true)
  end
end
function CownatAstarotPhase2_Check_Targeting( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if(pMonster:SetTarget(0, -1000, 500, 1000, -100) )then
   pMonster:ResetDelay()
  end
end
function CownatAstarotPhase2_Check_ReleaseTarget( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if( false == pMonster:CheckTargetInRange(0, -1000, 500, 1000, -100) )then
   pMonster:ReleaseTarget(TRUE)
   pMonster:ResetDelay()
  end
end
function CownatAstarotPhase2_Check_Attack01( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if( true )then
   pMonster:SetState("ATTACK01_01")
   pMonster:ResetDelay()
  end
end
function CownatAstarotPhase2_Check_Attack02( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if( true )then
   pMonster:SetState("ATTACK02_01")
   pMonster:ResetDelay()
  end
end
function CownatAstarotPhase2_Check_Attack03( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if( 0.3 >pMonster:FloatRand() )then
   pMonster:SetState("ATTACK03_01")
   pMonster:ResetDelay()
  end
end
function CownatAstarotPhase2_Check_Attack04( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if( 0.3 >pMonster:FloatRand() )then
   pMonster:SetState("ATTACK04_01")
   pMonster:ResetDelay()
  end
end
function CownatAstarotPhase2_Check_Attack05( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if( 0.2 >pMonster:FloatRand() )then
    if(pMonster:FloatRand() >= 0 and pMonster:FloatRand() < 0.33 )then
     pMonster:SetState("ATTACK05_01_PATTERN1")
    elseif(pMonster:FloatRand() >= 0.33 and pMonster:FloatRand() < 0.66 )then
     pMonster:SetState("ATTACK05_01_PATTERN2")
    else
     pMonster:SetState("ATTACK05_01_PATTERN3")
    end
   pMonster:ResetDelay()
  end
end
function OnCownatAstarotPhase2_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
 pMonster:SetState("DIE")
end
function OnCownatAstarotPhase2_Damage( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
 pMonster:SetIsRight(true)
 pMonster:SetSpeedX(0)
 pMonster:SetSpeedY(0)
end
function CownatAstarotPhase2_Attack05Action( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if( iFrame <= 1 )then
   pMonster:StartText("JUMP")
  elseif( iFrame == 205 )then
   pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE2_ATTACK05_PUNCH, -1.4, 1.5)
   pMonster:AddDamageWithLocate(DT_COWNAT_MON_ASTAROT_PHASE2_ATTACK05_PUNCH, 1.4, 1.5)
  elseif( iFrame == 215 )then
   pMonster:EarthQuake(60, 0.08, 0.1)
   pMonster:AddParticleNoDirection("4th_Ryan2_Boom_10", 1.5, 0.1)
   pMonster:AddParticleNoDirection("4th_Ryan2_Boom_11", 1.5, 0.1)
   pMonster:AddParticleNoDirection("4th_Ryan2_Boom_12", 1.5, 0.1)
   pMonster:AddParticleNoDirection("4th_Ryan2_Boom_13", 1.5, 0.1)
   pMonster:AddParticleNoDirection("4th_Ryan2_Boom_15", 1.5, 0.1)
   pMonster:AddParticleNoDirection("4th_Ryan2_Boom_16", 1.5, 0.1)
   pMonster:AddParticleNoDirection("4th_Ryan2_Boom_17", 1.5, 0.1)
   pMonster:AddParticleNoDirection("4th_Ryan2_Boom_18", 1.5, 0.1)
   pMonster:AddParticleNoDirection("4th_Ryan2_Boom_10", -1.5, 0.1)
   pMonster:AddParticleNoDirection("4th_Ryan2_Boom_11", -1.5, 0.1)
   pMonster:AddParticleNoDirection("4th_Ryan2_Boom_12", -1.5, 0.1)
   pMonster:AddParticleNoDirection("4th_Ryan2_Boom_13", -1.5, 0.1)
   pMonster:AddParticleNoDirection("4th_Ryan2_Boom_15", -1.5, 0.1)
   pMonster:AddParticleNoDirection("4th_Ryan2_Boom_16", -1.5, 0.1)
   pMonster:AddParticleNoDirection("4th_Ryan2_Boom_17", -1.5, 0.1)
   pMonster:AddParticleNoDirection("4th_Ryan2_Boom_18", -1.5, 0.1)
  end
end
