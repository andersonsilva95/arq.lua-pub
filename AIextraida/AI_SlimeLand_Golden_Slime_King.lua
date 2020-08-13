ActionList = {
  {
    ID = "WAIT",
    Motion = "Slime_Wait.frm",
    Func = "Golden_Slime_King_WaitFunc",
    Trigger = {
      {
        AICheckFrame = 10,
        AIFunc = "Golden_Slime_King_Check_Targeting",
        DelayFrame = 20,
      },
      {
        AICheckFrame = 110,
        AIFunc = "Golden_Slime_King_Check_TurnToTarget",
        DelayFrame = 110,
      },
      {
        AICheckFrame = 55,
        AIFunc = "Golden_Slime_King_Check_Walk",
        DelayFrame = 55,
      },
      {
        AICheckFrame = 110,
        AIFunc = "Golden_Slime_King_Check_JumpUp",
        DelayFrame = 110
      },
      {
        AICheckFrame = 110,
        AIFunc = "Golden_Slime_King_Check_JumpDown",
        DelayFrame = 110,
      },
      {
        AICheckFrame = 100,
        AIFunc = "Golden_Slime_King_Check_Idle",
        DelayFrame = 50,
      },
      {
        AICheckFrame = 75,
        AIFunc = "Golden_Slime_King_Check_Attack01",
        DelayFrame = 165,
      },
      {
        AICheckFrame = 95,
        AIFunc = "Golden_Slime_King_Check_Attack02",
        DelayFrame = 55,
      },
      {
        AICheckFrame = 115,
        AIFunc = "Golden_Slime_King_Check_Attack03",
        DelayFrame = 165,
      },
    },
  },
  {
    ID = "WALK",
    Motion = "Slime_Walk.frm",
    Func = "Golden_Slime_King_WalkFunc",
    EnableMoveCheck = TRUE,
    MoveFailFunc = "Golden_Slime_King_MoveFail",
    Trigger = {
      {
        AICheckFrame = 10,
        AIFunc = "Golden_Slime_King_Check_Targeting",
        DelayFrame = 20,
      },
      {
        AICheckFrame = 250,
        AIFunc = "Golden_Slime_King_Check_ReleaseTarget",
        DelayFrame = 200,
      },
      {
        AICheckFrame = 110,
        AIFunc = "Golden_Slime_King_Check_TurnToTarget",
        DelayFrame = 110,
      },
      {
        AICheckFrame = 110,
        AIFunc = "Golden_Slime_King_Check_JumpUp",
        DelayFrame = 110,
      },
      {
        AICheckFrame = 55,
        AIFunc = "Golden_Slime_King_Check_JumpDown",
        DelayFrame = 55,
      },
      {
        AICheckFrame = 10,
        AIFunc = "Golden_Slime_King_Check_Stop",
        DelayFrame = 25,
      },
      {
        AICheckFrame = 75,
        AIFunc = "Golden_Slime_King_Check_Attack01",
        DelayFrame = 165,
      },
      {
        AICheckFrame = 95,
        AIFunc = "Golden_Slime_King_Check_Attack02",
        DelayFrame = 55,
      },
      {
        AICheckFrame = 115,
        AIFunc = "Golden_Slime_King_Check_Attack03",
        DelayFrame = 165,
      },
    }
  },
  {
    ID = "IDLE",
    Motion = "Slime_Walk.frm",
    Func = "Golden_Slime_King_IdleFunc",
    EnableMoveCheck = TRUE,
    MoveFailFunc = "Golden_Slime_King_IdleMoveFail",
    Trigger = {
      {
        AICheckFrame = 20,
        AIFunc = "Golden_Slime_King_Check_Targeting",
        DelayFrame = 20,
      },
      {
        AICheckFrame = 220,
        AIFunc = "Golden_Slime_King_Check_Idle_Stop",
        DelayFrame = 100,
      },
      {
        AICheckFrame = 75,
        AIFunc = "Golden_Slime_King_Check_Attack01",
        DelayFrame = 165,
      },
      {
        AICheckFrame = 95,
        AIFunc = "Golden_Slime_King_Check_Attack02",
        DelayFrame = 55,
      },
      {
        AICheckFrame = 115,
        AIFunc = "Golden_Slime_King_Check_Attack03",
        DelayFrame = 165,
      },
    }
  },
  {
    ID = "ATTACK01",
    Motion = "Slime_Attack01.frm",
    Func = "Golden_Slime_King_Attack01Func",
  },
  {
    ID = "ATTACK02",
    Motion = "Golden_Slime_King_Attack02.frm",
    Func = "Golden_Slime_King_Attack02Func",
  },
  {
    ID = "ATTACK03",
    Motion = "Mon_Golden_Slime_King_F_Attack03.frm",
    Func = "Golden_Slime_King_Attack03Func",
  },
  {
    ID = "EVASION",
    Motion = "Mon_Golden_Slime_King_F_Evasion.frm",
    Func = "Golden_Slime_King_EvasionFunc",
  },
  {
    ID = "JUMP",
    Motion = "Slime_Jump_Up.frm",
    Func = "Golden_Slime_King_JumpFunc",
  },
  {
    ID = "JUMP_DOWN",
    Motion = "Slime_Jump_Down.frm",
    Func = "Golden_Slime_King_JumpDownFunc",
  },
  {
    ID = "JUMP_LANDING",
    Motion = "Slime_Jump_Landing.frm",
    Func = "Golden_Slime_King_ToWait",
  },
  {
    ID = "DIE",
    Motion = "Slime_Die.frm",
    Func = "Golden_Slime_King_DieLandingFunc",
    IsFallDownMotion = TRUE,
  },
  {
    ID = "DIE_LANDING",
    Motion = "Slime_Die02.frm",
    Func = "Golden_Slime_King_DieLandingFunc",
    IsFallDownMotion = TRUE,
  },
  {
    ID = "STANDUP",
    Motion = "Slime_Standup.frm",
    Func = "Golden_Slime_King_StandupFunc",
  },
}
CallBack = {
  Land = "OnGolden_Slime_King_Land",
  Die = "OnGolden_Slime_King_Die",
  Damage = "OnGolden_Slime_King_Damage",
}

function InitGolden_Slime_King( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
end

function Golden_Slime_King_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

function Golden_Slime_King_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame == 4 ) then
		pMonster:PlaySound(988002)
	elseif( iFrame >= 8 and iFrame <= 34 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
end

function Golden_Slime_King_IdleFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame == 4 ) then
		pMonster:PlaySound(988002)
    elseif( iFrame >= 8 and iFrame <= 34 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "IDLE" )
    end
end

function Golden_Slime_King_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
        
    if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "DIE_LANDING" )
    end
end

function Golden_Slime_King_DieLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1) then
		pMonster:SetInvincible( true )
	elseif( iFrame == 42) then
		pMonster:PlaySound(988001)
		pMonster:AddParticle( "SlimDie", -0.01, 0.07 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:ToggleRender( false )
        pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

function Golden_Slime_King_DownUp03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame == 5 ) then
		pMonster:SetPushCheck( false )
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetFrameLock( true )		
		
		if( pMonster:GetHP() <= 0 ) then
			pMonster:SetState( "DIE_LANDING" )
		end    		
    end
end

function Golden_Slime_King_StandupFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetPushCheck( true )
        pMonster:SetSuperArmor( true )
	elseif( iFrame == 16 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 2.0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

function Golden_Slime_King_Attack01Func( iMonsterIndex, iFrame )
  local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if( iFrame <= 1 ) then
    pMonster:SetSuperArmor(true)
    pMonster:StartText("SLIME RUSH!")
  elseif( iFrame == 77 ) then
    pMonster:TurnToTarget()
    pMonster:SetSpeedX(pMonster:GetWalkSpeed() * 2)
    pMonster:SetNoCheckContact(5)
    pMonster:SetSpeedY(0.01)
    pMonster:PlaySound(988003)
  elseif( iFrame == 80 ) then
    pMonster:StartAttack(100, PAR_FRONTDOWN_1, 0)
  elseif( iFrame == 85 ) then
    pMonster:EndAttack()
  elseif( iFrame == pMonster:GetLastFrame() - 20) then --possivelerro
    pMonster:EarthQuake(25, 0.06, 17000)
    pMonster:AddParticleNoDirection("Blutus_Earthquake_01", posx, 0)
    pMonster:AddParticleNoDirection("Blutus_Earthquake_02", posx, 0)
    pMonster:AddParticleNoDirection("Blutus_Earthquake_03", posx, 0)
    pMonster:AddParticleNoDirection("Scolpis_Rush_02", posx, 0)
  elseif( iFrame >= pMonster:GetLastFrame()) then
    pMonster:SetState("WAIT")
  end
end
function Golden_Slime_King_Attack02Func( iMonsterIndex, iFrame )
  local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if( iFrame <= 1 ) then
    pMonster:SetSuperArmor(true)
    pMonster:StartText("SLIME BOMB!")
  elseif( iFrame == 110 ) then
    pMonster:PlaySound(988003)
    pMonster:AddDamage(DT_GOLDEN_SLIMEKING_ATK2)
  elseif( iFrame == 115 ) then
    pMonster:AddParticle("Dun_Slime_Attack01_01", 0, 0.5)
    pMonster:AddParticle("Dun_Slime_Attack01_02", 0, 0.5)
    pMonster:AddParticle("Dun_Slime_Attack01_03", 0, 0.5)
    pMonster:AddParticle("Dun_Slime_Attack01_04", 0, 0.5)
    pMonster:AddParticle("Dun_Slime_Attack01_05", 0, 0.5)
  elseif( iFrame >= pMonster:GetLastFrame() ) then
    pMonster:SetState("WAIT")
  end
end
function Golden_Slime_King_Attack03Func( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if( iFrame == 1 ) then
    pMonster:SetSuperArmor(true)
    pMonster:StartText("SLIME PANG!")
  elseif( iFrame == 120 ) then
    pMonster:PlaySound(988003)
    pMonster:EarthQuake(25, 0.06, 20000)
    pMonster:AddParticle("Jin01_SP3-1_Boom_Under_01", 0, 0.5)
    pMonster:AddParticle("Jin01_SP3-1_Boom_Under_02", 0, 0.5)
  elseif( iFrame == 145 ) then
    pMonster:AddDamageWithLocate(DT_GOLDEN_SLIMEKING_ATK3, -1.85, 2.5)
    pMonster:AddDamageWithLocate(DT_GOLDEN_SLIMEKING_ATK3, -1.4, 0.9)
    pMonster:AddDamageWithLocate(DT_GOLDEN_SLIMEKING_ATK3, -1.1, 1.8)
    pMonster:AddDamageWithLocate(DT_GOLDEN_SLIMEKING_ATK3, -0.7, 1.4)
    pMonster:AddDamageWithLocate(DT_GOLDEN_SLIMEKING_ATK3, -0.3, 0.4)
    pMonster:AddDamageWithLocate(DT_GOLDEN_SLIMEKING_ATK3, 0.3, 1.1)
    pMonster:AddDamageWithLocate(DT_GOLDEN_SLIMEKING_ATK3, 0.7, 2.1)
    pMonster:AddDamageWithLocate(DT_GOLDEN_SLIMEKING_ATK3, 1.1, 0.7)
    pMonster:AddDamageWithLocate(DT_GOLDEN_SLIMEKING_ATK3, 1.5, 1.7)
    pMonster:AddDamageWithLocate(DT_GOLDEN_SLIMEKING_ATK3, 1.9, 2.7)
   elseif( iFrame >= pMonster:GetLastFrame() ) then
    pMonster:SetState("WAIT")
  end
end
function Golden_Slime_King_EvasionFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if( iFrame == 1 ) then
    pMonster:TurnToTarget()
    pMonster:SetPushCheck(false)
    pMonster:SetSuperArmor(true)
  elseif( iFrame >= pMonster:GetLastFrame() ) then
    pMonster:SetIsRight(not pMonster:GetIsRight()) --possivelerro
    pMonster:SetState("WAIT")
  end
end
function Golden_Slime_King_JumpFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if pMonster:GetSpeedY() <= 0 then
    pMonster:SetState("JUMP_DOWN")
    pMonster:SetFrameLock(false)
  end
  if _ARG_1_ >= pMonster:GetLastFrame() then
    pMonster:SetFrameLock(true)
  end
end
function Golden_Slime_King_JumpDownFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if( iFrame >= pMonster:GetLastFrame() ) then
    pMonster:SetFrameLock(true)
  end
end
function Golden_Slime_King_ToWait( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if( iFrame >= pMonster:GetLastFrame() ) then
    pMonster:SetState("WAIT")
  end
end

function Golden_Slime_King_Check_Targeting( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if( pMonster:SetTarget(0, -400, 300, 400, -300) == true) then
    pMonster:TurnToTarget()
    if( pMonster:CheckState("IDLE") == true) then
      pMonster:SetState("WAIT")
    end
    pMonster:ResetDelay()
  end
end
function Golden_Slime_King_Check_ReleaseTarget( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if( pMonster:CheckTargetInRange(100, -500, 360, 500, -360) == false) then
    pMonster:ReleaseTarget()
    pMonster:ResetDelay()
  end
end
function Golden_Slime_King_Check_TurnToTarget( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if( pMonster:IsTarget() == true) then
    pMonster:TurnToTarget()
    pMonster:ResetDelay()
  end
end
function Golden_Slime_King_Check_Walk( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if( pMonster:IsTarget() == true and pMonster:CheckTargetInRange(0, -1, 1, 1, -1) == false) then
    pMonster:TurnToTarget()
    pMonster:SetState("WALK")
    pMonster:ResetDelay()
  end
end
function Golden_Slime_King_Check_Stop( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if( pMonster:CheckTargetInRange(0, -140, 360, 140, -400) == true or pMonster:FloatRand() < 0.15 ) then
    pMonster:SetSpeedX(0)
    pMonster:SetState("WAIT")
    pMonster:ResetDelay()
  end
end
function Golden_Slime_King_Check_Attack01( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if( pMonster:CheckTargetInRange(70, -70, 40, 70, -100) == true) then
    pMonster:SetState("ATTACK01")
    pMonster:ResetDelay()
  end
end
function Golden_Slime_King_Check_Attack02( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if( pMonster:CheckTargetInRange(70, -70, 40, 70, -100) == true) then
    pMonster:SetState("ATTACK02")
    pMonster:ResetDelay()
  end
end
function Golden_Slime_King_Check_Attack03( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if( pMonster:CheckTargetInRange(70, -70, 40, 70, -100) == true ) then
    pMonster:SetState("ATTACK03")
    pMonster:ResetDelay()
  end
end
function Golden_Slime_King_Check_JumpUp( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if( pMonster:CheckTargetInRange(0, -300, 1000, 300, 100) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true) then
    Slime_Jump( iMonsterIndex )
    pMonster:SetState("JUMP")
    pMonster:ResetDelay()
  end
end
function Golden_Slime_King_Check_JumpDown( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if( pMonster:CheckTargetInRange(0, -300, -100, 300, -1000) == true) then
    pMonster:SetNoCheckContact(30)
    pMonster:SetIgnoreFHCheck(true)
    pMonster:SetState("JUMP_DOWN")
    pMonster:SetSpeedX(pMonster:GetWalkSpeed() * 1.2)
    pMonster:SetSpeedY(0.01)
    pMonster:ResetDelay()
  end
end
function Golden_Slime_King_Check_Idle( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if( pMonster:IsTarget() == false) then
    pMonster:SetState("IDLE")
    pMonster:ResetDelay()
  end
end
function Golden_Slime_King_Check_Idle_Stop( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if( pMonster:FloatRand() < 0.5) then
    pMonster:SetSpeedX(0)
    pMonster:SetState("WAIT")
  end
end
function OnGolden_Slime_King_Land( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  pMonster:SetSpeedX(pMonster:GetSpeedX() * 0.6666666666666666)
  if( pMonster:CheckState("JUMP") == true or pMonster:CheckState("JUMP_DOWN") == true) then
    pMonster:TurnToTarget()
    pMonster:SetState("JUMP_LANDING")
  end
end
function OnGolden_Slime_King_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  pMonster:TurnToTarget()
  pMonster:SetSpeedX(pMonster:GetRunSpeed() * -1.5)
  pMonster:SetState("DIE")
end
function OnGolden_Slime_King_Damage( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  if( pMonster:CheckState("JUMP") == true and pMonster:IsSuperArmor() == false) then
    pMonster:SetNoCheckContact(5)
  end
  if( pMonster:FloatRand() < 0.15 and (pMonster:CheckState("WAIT") == true or pMonster:CheckState("WALK") == true or pMonster:CheckState("IDLE") == true)) then --possivelerro
    pMonster:SetState("EVASION")
  end
end
function Golden_Slime_King_Jump( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	--adaptado da gosma original possivel revisao
	
	local fTargetX = pMonster:GetTargetX()
	local fTargetY = pMonster:GetTargetY()
	
	local fMonX = pMonster:GetX()
	local fMonY = pMonster:GetY()
		
	fSpeedX = ( fTargetX - fMonX ) * 1.5
	if ( (fTargetY - fMonY) == 0.0 ) then
		fTargetY = fMonY + 0.1
	end
	fSpeedY = ((fTargetY - fMonY) / ((fTargetY - fMonY) / 4.0)) + (((fTargetY - fMonY) * 1.5) + pMonster:FloatAbs((fSpeedX / 3.1)))
	
	pMonster:SetNoCheckContact(26 + (fSpeedY * 4.9))
	pMonster:AddCountValue(1)
	pMonster:TurnToTarget()
	pMonster:SetSpeedX( fSpeedX * 0.01 )
	pMonster:SetSpeedY( fSpeedY * 0.01 )
end

function Golden_Slime_King_MoveFail( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	if( pMonster:GetIsContact() == true )then		
		if( pMonster:GetY() - (0.2) < pMonster:GetTargetY() )then			
			pMonster:SetNoCheckContact(27)
			pMonster:SetIgnoreFHCheck(true)
			pMonster:SetState( "JUMP" )			
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )			
			pMonster:SetSpeedY( 0.038 )			
		else
			pMonster:SetNoCheckContact(15)
			pMonster:SetIgnoreFHCheck(true)
			pMonster:SetState( "JUMP" )		
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )
			pMonster:SetSpeedY( 0.019 )			
		end
	end
end
function Golden_Slime_King_IdleMoveFail( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	if( pMonster:GetIsContact() == true )then		
		if( pMonster:GetIsRight() == true ) then
            pMonster:SetIsRight( false )
            pMonster:SetSpeedX( -0.005 )        
        else
            pMonster:SetIsRight( true )
            pMonster:SetSpeedX( 0.005 )        
        end    
        
        pMonster:SetState( "IDLE" )			        
	end
end