-- aAI_Talin_Pollguard.lua

ActionList =
{	
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "Talin_Pollguard_wait.frm",
        Func    = "Talin_Pollguard_WaitFunc",
        
        Trigger =
        {
			-- 타게팅
            {
                AICheckFrame        = 10,
                AIFunc              = "Talin_Pollguard_Check_Walk",
                DelayFrame          = 1,
            },
        },
    },

    -- 이동
    {
        ID              = "WALK",
        Motion          = "Talin_Pollguard_move_Flatform.frm",
        Func            = "Talin_Pollguard_moveFunc",
    },
    
    -- turn
	{
		ID	  = "TURN",
		Motion  = "Talin_Pollguard_move_turn.frm",
		Func	= "Talin_Pollguard_TurnFunc",
	},
        
    -- 근접공격
    {
        ID      = "ATTACK01",
        Motion  = "Talin_Pollguard_Attack01.frm",
        Func    = "Talin_Pollguard_Attack01Func",
    },
    
    -- 근접공격2
    {
        ID      = "ATTACK02",
        Motion  = "Talin_Pollguard_Attack02.frm",
        Func    = "Talin_Pollguard_Attack02Func",
    },
    
    -- 근접공격3
    {
        ID      = "ATTACK03",
        Motion  = "Talin_Pollguard_Attack03.frm",
        Func    = "Talin_Pollguard_Attack03Func",
    },

	-- 근접공격3
    {
        ID      = "ATTACK03_REAR",
        Motion  = "Talin_Pollguard_Attack03.frm",
        Func    = "Talin_Pollguard_Attack03_RFunc",
    },
    
    -- 근접공격
    {
        ID      = "ATTACK04",
        Motion  = "Talin_Pollguard_Attack04.frm",
        Func    = "Talin_Pollguard_Attack04Func",
    },
    
    -- 근접공격2
    {
        ID      = "ATTACK05",
        Motion  = "Talin_Pollguard_Attack05.frm",
        Func    = "Talin_Pollguard_Attack05Func",
    },
    
    -- 근접공격3
    {
        ID      = "ATTACK06",
        Motion  = "Talin_Pollguard_Attack06_front.frm",
        Func    = "Talin_Pollguard_Attack06Func",
    },
    
    -- 근접공격3
    {
        ID      = "ATTACK06_2",
        Motion  = "Talin_Pollguard_Attack06_back.frm",
        Func    = "Talin_Pollguard_Attack06_2Func",
    },
    
    -- 데미지 중
    {
        ID      = "DAMAGE_MIDDLE",
        Motion  = "Talin_Pollguard_Damage_Middle.frm",
        Func    = "Talin_Pollguard_DamageFunc",
    },

    -- 죽기 착지
    {
        ID      = "DIE_LANDING",
        Motion  = "Talin_Pollguard_Die.frm",
        Func    = "Talin_Pollguard_DieLandingFunc",
        IsFallDownMotion    = TRUE,
    },
    
     -- 죽기 착지
    {
        ID      = "DIE_LOOP",
        Motion  = "Talin_Pollguard_die_action.frm",
        Func    = "Talin_Pollguard_DieLoopFunc",
    },
}

CallBack =
{
    Land    = "OnTalin_Pollguard_Land",
    Die     = "OnTalin_Pollguard_Die",
    Damage  = "OnTalin_Pollguard_Damage",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function InitTalinPoolguard_Tank( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    pMonster:SetFly(true)
    --pMonster:SetPushCheck( false )
	pMonster:SetIgnoreFHCheck( true )
    pMonster:SetX(0.0)
    pMonster:SetY(0.27)
    
    pMonster:AddTraceParticleToBone( "Machine_Steam", 1.0, 16, 8, 8, 0.0, 0.0, true )
end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function Talin_Pollguard_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	local pMon = g_MyD3D:GetMonster( 1 )
	
	Talin_Pollguard_Smoke( iMonsterIndex, iFrame )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
		pMon:SetState( "WAIT" )
    end
end

-- 걷기 상태
function Talin_Pollguard_moveFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	local pMon = g_MyD3D:GetMonster( 1 )
	
	Talin_Pollguard_Smoke( iMonsterIndex, iFrame )
	
    pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.5)
    
    if( pMonster:GetX() > pMonster:GetStageX() + 1.5 ) then
		pMonster:SetX( -1.5 )
    end
    
    if( math.mod(iFrame, 8) == 1 ) then
		pMonster:AddDamage(DT_TALIN_DSR_DASH)
    end
    
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
		if( pMonster:FloatRand() < 0.5 and pMonster:GetX() > 0.4 and pMonster:GetX() < pMonster:GetStageX() - 0.4 ) then
			pMon:SetState( "ATTACK03" )
		else
			pMon:SetState( "WAIT" )
		end
    end
end

-- 죽기 착지
function Talin_Pollguard_DieLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	local pMon = g_MyD3D:GetMonster( 1 )

    if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame == 2 ) then
		pMonster:PlaySound(992021)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster(true)
        pMonster:SetState( "DIE_LOOP" )
        pMon:SetState( "DIE_LOOP" )
    end
end

-- 죽기 착지
function Talin_Pollguard_DieLoopFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    local pMon = g_MyD3D:GetMonster( 1 )

    if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "DIE_LOOP" )
        pMon:SetState( "DIE_LOOP" )
    end
end

-- 데미지 입은거
function Talin_Pollguard_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	local pMon = g_MyD3D:GetMonster( 1 )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
		pMon:SetState( "WAIT" )
    end
end

function Talin_Pollguard_TurnFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetInvincible( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
	    pMonster:SetIsRight( not pMonster:GetIsRight() )
        pMonster:SetState( "WAIT" )
    end
end

--  근접공격 상태
function Talin_Pollguard_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	local pMon = g_MyD3D:GetMonster( 1 )
	
	Talin_Pollguard_Smoke( iMonsterIndex, iFrame )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 38 ) then
		pMonster:PlaySound(992023)
    elseif( iFrame == 60 ) then
		pMonster:AddDamage(DT_TALIN_CRUEL_CRUSH)
    elseif( iFrame >= 62 and iFrame <= 128 ) then
        pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 2.0 )
        if( iFrame == 65 ) then
			local posx = -0.05
			local posy = -0.23
			if (pMonster:GetIsRight() ) then
				pMonster:AddTraceParticleToBone( "Talin_Dash_01", 1.0, 32, 8, 8, posx, posy, true )
				pMonster:AddTraceParticleToBone( "Talin_Dash_02", 1.0, 32, 8, 8, posx, posy, true )
				pMonster:AddTraceParticleToBone( "Talin_Dash_03", 1.0, 32, 8, 8, posx, posy, true )
				
				pMonster:AddTraceParticleToBone( "Talin_Dash_01", 1.0, 28, 8, 8, posx, posy, true )
				pMonster:AddTraceParticleToBone( "Talin_Dash_02", 1.0, 28, 8, 8, posx, posy, true )
				pMonster:AddTraceParticleToBone( "Talin_Dash_03", 1.0, 28, 8, 8, posx, posy, true )
				
				pMonster:AddTraceParticleToBone( "Talin_Dash_01", 1.0, 9, 8, 8, posx, posy + 0.08, true )
				pMonster:AddTraceParticleToBone( "Talin_Dash_02", 1.0, 9, 8, 8, posx, posy + 0.08, true )
				pMonster:AddTraceParticleToBone( "Talin_Dash_03", 1.0, 9, 8, 8, posx, posy + 0.08, true )
			else
				pMonster:AddTraceParticleToBone( "Talin_Dash_01_R", 1.0, 28, 8, 8, -posx, posy, true )
				pMonster:AddTraceParticleToBone( "Talin_Dash_02_R", 1.0, 28, 8, 8, -posx, posy, true )
				pMonster:AddTraceParticleToBone( "Talin_Dash_03_R", 1.0, 28, 8, 8, -posx, posy, true )
				
				pMonster:AddTraceParticleToBone( "Talin_Dash_01_R", 1.0, 13, 8, 8, -posx, posy + 0.08, true )
				pMonster:AddTraceParticleToBone( "Talin_Dash_02_R", 1.0, 13, 8, 8, -posx, posy + 0.08, true )
				pMonster:AddTraceParticleToBone( "Talin_Dash_03_R", 1.0, 13, 8, 8, -posx, posy + 0.08, true )
				
				pMonster:AddTraceParticleToBone( "Talin_Dash_01_R", 1.0, 9, 8, 6, -posx, posy + 0.08, true )
				--pMonster:AddTraceParticleToBone( "Talin_Dash_02_R", 1.0, 9, 8, 6, -posx, posy + 0.08, true )
				--pMonster:AddTraceParticleToBone( "Talin_Dash_03_R", 1.0, 9, 8, 6, -posx, posy + 0.08, true )
			end
			pMonster:PlaySound(992024)
        end
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
		pMon:SetState( "WAIT" )
    end

end

--  근접공격2 상태
function Talin_Pollguard_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	local pMon = g_MyD3D:GetMonster( 1 )
	
	Talin_Pollguard_Smoke( iMonsterIndex, iFrame )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 58 ) then
		pMonster:AddDamage(DT_TALIN_SPIKE)
	elseif( iFrame == 60 ) then
		local posx = 0.7
		local posy = 0.2
		if (pMonster:GetIsRight() ) then
			pMonster:AddParticleNoDirection("Talin_Spike_01", posx, posy)
			pMonster:AddParticleNoDirection("Talin_Spike_02", posx, posy)
		else
			pMonster:AddParticleNoDirection("Talin_Spike_01", -posx, posy)
			pMonster:AddParticleNoDirection("Talin_Spike_02_R", -posx, posy)
		end
		pMonster:PlaySound(992025)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
		pMon:SetState( "WAIT" )
    end
end

--  
function Talin_Pollguard_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	local pMon = g_MyD3D:GetMonster( 1 )
	
	Talin_Pollguard_Smoke( iMonsterIndex, iFrame )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 36 ) then
		--pMonster:PlaySound(992026)
		pMonster:AddDamage(DT_TALIN_SUPERFRAME_LAUNCHER)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
		pMon:SetState( "WAIT" )
    end
end

function Talin_Pollguard_Attack03_RFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	local pMon = g_MyD3D:GetMonster( 1 )
	
	Talin_Pollguard_Smoke( iMonsterIndex, iFrame )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 36 ) then
		--pMonster:PlaySound(992026)
		pMonster:AddDamage(DT_TALIN_SUPERFRAME_LAUNCHER_BOTTOM)		
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
		pMon:SetState( "WAIT" )
    end
end

--  근접공격2 상태
function Talin_Pollguard_Attack04Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	local pMon = g_MyD3D:GetMonster( 1 )
	
	Talin_Pollguard_Smoke( iMonsterIndex, iFrame )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 75 ) then
		pMonster:ComputeAngleToTarget( 0.54, 0.58, -60, 60 ) -- 타겟으로의 각도를 계산
        angle = pMonster:GetAngleToTarget()
        if( not pMonster:GetIsRight() ) then
			angle = angle * -1.0
        end

        pMonster:AddDamageWithLocateAngle( DT_TALIN_HIGH_CANON, 0.54, 0.76, false, angle )
    elseif( iFrame == 78 ) then
		pMonster:PlaySound(992027)
		local posx = 0.5
		local posy = 0.75
		if (pMonster:GetIsRight() ) then
			pMonster:AddParticleNoDirection("Talin_Cannon_Shot_01", posx, posy)
			pMonster:AddParticleNoDirection("Talin_Cannon_Shot_02", posx, posy)
			pMonster:AddParticleNoDirection("Talin_Cannon_Shot_03", posx, posy)
		else
			pMonster:AddParticleNoDirection("Talin_Cannon_Shot_01_R", -posx, posy)
			pMonster:AddParticleNoDirection("Talin_Cannon_Shot_02", -posx, posy)
			pMonster:AddParticleNoDirection("Talin_Cannon_Shot_03", -posx, posy)
		end
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
		pMon:SetState( "WAIT" )
    end
end

--  근접공격2 상태
function Talin_Pollguard_Attack05Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	local pMon = g_MyD3D:GetMonster( 1 )
	
	Talin_Pollguard_Smoke( iMonsterIndex, iFrame )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 77 ) then
		pMonster:ComputeAngleToTarget( 0.54, 0.58, -60, 60 ) -- 타겟으로의 각도를 계산
        angle = pMonster:GetAngleToTarget()
        if( not pMonster:GetIsRight() ) then
			angle = angle * -1.0
        end
        pMonster:AddDamageWithLocateAngle( DT_TALIN_HIGH_CANON, 0.54, 0.76, false, angle )
    elseif( iFrame == 80 ) then
		pMonster:PlaySound(992027)
		local posx = 0.5
		local posy = 0.75
		if (pMonster:GetIsRight() ) then
			pMonster:AddParticleNoDirection("Talin_Cannon_Shot_01", posx, posy)
			pMonster:AddParticleNoDirection("Talin_Cannon_Shot_02", posx, posy)
			pMonster:AddParticleNoDirection("Talin_Cannon_Shot_03", posx, posy)
		else
			pMonster:AddParticleNoDirection("Talin_Cannon_Shot_01_R", -posx, posy)
			pMonster:AddParticleNoDirection("Talin_Cannon_Shot_02", -posx, posy)
			pMonster:AddParticleNoDirection("Talin_Cannon_Shot_03", -posx, posy)
		end
    elseif( iFrame == 96 ) then
		pMonster:ComputeAngleToTarget( 0.54, 0.58 ) -- 타겟으로의 각도를 계산
        angle = pMonster:GetAngleToTarget()
        if( not pMonster:GetIsRight() ) then
			angle = angle * -1.0
        end
        pMonster:AddDamageWithLocateAngle( DT_TALIN_HIGH_CANON, 0.54, 0.76, false, angle )
    elseif( iFrame == 99 ) then
		pMonster:PlaySound(992027)
		local posx = 0.5
		local posy = 0.75
		if (pMonster:GetIsRight() ) then
			pMonster:AddParticleNoDirection("Talin_Cannon_Shot_01", posx, posy)
			pMonster:AddParticleNoDirection("Talin_Cannon_Shot_02", posx, posy)
			pMonster:AddParticleNoDirection("Talin_Cannon_Shot_03", posx, posy)
		else
			pMonster:AddParticleNoDirection("Talin_Cannon_Shot_01_R", -posx, posy)
			pMonster:AddParticleNoDirection("Talin_Cannon_Shot_02", -posx, posy)
			pMonster:AddParticleNoDirection("Talin_Cannon_Shot_03", -posx, posy)
		end
    elseif( iFrame == 115 ) then
		pMonster:ComputeAngleToTarget( 0.54, 0.58 ) -- 타겟으로의 각도를 계산
        angle = pMonster:GetAngleToTarget()
        if( not pMonster:GetIsRight() ) then
			angle = angle * -1.0
        end
        pMonster:AddDamageWithLocateAngle( DT_TALIN_HIGH_CANON, 0.54, 0.76, false, angle )
    elseif( iFrame == 118 ) then
		pMonster:PlaySound(992027)
		local posx = 0.5
		local posy = 0.75
		if (pMonster:GetIsRight() ) then
			pMonster:AddParticleNoDirection("Talin_Cannon_Shot_01", posx, posy)
			pMonster:AddParticleNoDirection("Talin_Cannon_Shot_02", posx, posy)
			pMonster:AddParticleNoDirection("Talin_Cannon_Shot_03", posx, posy)
		else
			pMonster:AddParticleNoDirection("Talin_Cannon_Shot_01_R", -posx, posy)
			pMonster:AddParticleNoDirection("Talin_Cannon_Shot_02", -posx, posy)
			pMonster:AddParticleNoDirection("Talin_Cannon_Shot_03", -posx, posy)
		end
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
		pMon:SetState( "WAIT" )
    end
end

--  근접공격2 상태
function Talin_Pollguard_Attack06Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	local pMon = g_MyD3D:GetMonster( 1 )
	
	Talin_Pollguard_Smoke( iMonsterIndex, iFrame )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 37 ) then
		pMonster:PlaySound(992023)
	elseif( iFrame == 67 ) then
		pMonster:PlaySound(992023)
	elseif( iFrame == 81 ) then
		pMonster:AddDamageWithLocate( DT_TALIN_SMART_HOMMING, 0.36, 0.06 )
	elseif( iFrame == 84 ) then
		pMonster:PlaySound(992029)
		local posx = 0.35
		local posy = 0.8
		pMonster:AddParticleNoDirection("Talin_Cannon_Shot_02", posx, posy)
		pMonster:AddParticleNoDirection("Talin_Cannon_Shot_03", posx, posy)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
		pMon:SetState( "WAIT" )
    end
end

--  근접공격2 상태
function Talin_Pollguard_Attack06_2Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	local pMon = g_MyD3D:GetMonster( 1 )
	
	Talin_Pollguard_Smoke( iMonsterIndex, iFrame )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 37 ) then
		pMonster:PlaySound(992023)
	elseif( iFrame == 67 ) then
		pMonster:PlaySound(992023)
	elseif( iFrame == 81 ) then
		pMonster:AddDamageWithLocate( DT_TALIN_SMART_HOMMING, -0.06, 0.06 )
	elseif( iFrame == 84 ) then
		pMonster:PlaySound(992029)
		local posx = 0.05
		local posy = 0.8
		pMonster:AddParticleNoDirection("Talin_Cannon_Shot_02", -posx, posy)
		pMonster:AddParticleNoDirection("Talin_Cannon_Shot_03", -posx, posy)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
		pMon:SetState( "WAIT" )
    end
end

-----------------------------------------------------------------------
-- 컨디션체크
-----------------------------------------------------------------------

function Talin_Pollguard_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	local pMon = g_MyD3D:GetMonster( 1 )

    if( pMonster:SetTarget( 100, -1600, 800, 1600, -100 ) == true ) then
		pMonster:TurnToTarget()
		
        pMonster:ResetDelay()
    end  
end

function Talin_Pollguard_Check_ReleaseTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	local pMon = g_MyD3D:GetMonster( 1 )

	if( pMonster:CheckTargetInRange( 0, -800, 800, 800, -100 ) == false ) then
		pMonster:ReleaseTarget()
		pMonster:ResetDelay()
	end
end

function Talin_Pollguard_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	local pMon = g_MyD3D:GetMonster( 1 )

	if( pMonster:IsTarget() == true and ( pMonster:GetIsRight() and ( pMonster:GetX() > pMonster:GetTargetX() ) ) or ( false == pMonster:GetIsRight() and ( pMonster:GetX() < pMonster:GetTargetX() ) )) then
		--pMonster:TurnToTarget()
		pMonster:SetState( "TURN" )
		pMon:SetState( "TURN" )
		pMonster:ResetDelay()
	end
end

function Talin_Pollguard_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	local pMon = g_MyD3D:GetMonster( 1 )
	pMonster:SetState( "WALK" )
	pMonster:ResetDelay()
end

function Talin_Pollguard_Check_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	local pMon = g_MyD3D:GetMonster( 1 )    

	if( pMonster:CheckTargetInRange( 0, -500, 800, 500, -100 ) == true ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetState( "WAIT" )
		pMon:SetState( "WAIT" )
		pMonster:ResetDelay()
	end
end

function Talin_Pollguard_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	local pMon = g_MyD3D:GetMonster( 1 )    

	if( pMonster:CheckTargetInRange( 400, -400, 250, 400, -100 ) == true and pMonster:FloatRand() < 0.5 ) then
		pMonster:SetState( "ATTACK01" )
		pMon:SetState( "ATTACK01" )
		pMonster:ResetDelay()
	end
end

function Talin_Pollguard_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	local pMon = g_MyD3D:GetMonster( 1 )    

	if( pMonster:CheckTargetInRange( 250, -250, 150, 250, -100 ) == true ) then
		pMonster:SetState( "ATTACK02" )
		pMon:SetState( "ATTACK02" )
		pMonster:ResetDelay()
	end
end

function Talin_Pollguard_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	local pMon = g_MyD3D:GetMonster( 1 )    

	if( pMonster:FloatRand() < 0.8 ) then
		if ( pMonster:FloatRand() < 0.5 ) then
			pMonster:SetState( "ATTACK03_REAR" )
		else
			pMonster:SetState( "ATTACK03" )
		end
		pMon:SetState( "ATTACK03" )
		pMonster:ResetDelay()
	end
end

function Talin_Pollguard_Check_Attack04( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	local pMon = g_MyD3D:GetMonster( 1 )    

	if( pMonster:CheckTargetInRange( 700, -400, 800, 400, 100 ) == true ) then
		pMonster:SetState( "ATTACK04" )
		pMon:SetState( "ATTACK04" )
		pMonster:ResetDelay()
	end
end

function Talin_Pollguard_Check_Attack05( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	local pMon = g_MyD3D:GetMonster( 1 )    

	if( pMonster:CheckTargetInRange( 700, -400, 800, 400, 180 ) == true ) then
		pMonster:SetState( "ATTACK05" )
		pMon:SetState( "ATTACK05" )
		pMonster:ResetDelay()
	end
end

function Talin_Pollguard_Check_Attack06( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	local pMon = g_MyD3D:GetMonster( 1 )    

	if( pMonster:CheckTargetInRange( 0, -360, 800, 360, 260 ) == true ) then
		if( pMonster:GetIsRight() == true ) then
			pMonster:SetState( "ATTACK06" )
			pMon:SetState( "ATTACK06" )
		else
			pMonster:SetState( "ATTACK06_2" )
			pMon:SetState( "ATTACK06_2" )
		end
		pMonster:ResetDelay()
	end
end

function Talin_Pollguard_Check_Attack06_2( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	local pMon = g_MyD3D:GetMonster( 1 )    

	if( pMonster:CheckTargetInRange( 200, -200, 330, 200, -100 ) == true ) then
		pMonster:SetState( "ATTACK06_2" )
		pMon:SetState( "ATTACK06_2" )
		pMonster:ResetDelay()
	end
end

-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------
function OnTalin_Pollguard_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	local pMon = g_MyD3D:GetMonster( 1 )

	pMonster:SetSpeedX( pMonster:GetSpeedX() * (2.0 / 3.0) )
	
    if( pMonster:CheckState( "JUMP" ) == true or pMonster:CheckState( "JUMP_DOWN" ) == true ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "JUMP_LANDING" )
    end   
end

function OnTalin_Pollguard_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	local pMon = g_MyD3D:GetMonster( 1 )
	
	pMonster:TurnToTarget()
	
	if( pMonster:GetIsRight() == true ) then
		pMonster:SetSpeedX( -0.02 )
	else
		pMonster:SetSpeedX( 0.02 )
	end

	pMonster:SetState( "DIE_LANDING" )
	pMon:SetState( "DIE_LANDING" )
end

function OnTalin_Pollguard_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
end

function Talin_Pollguard_Jump( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	local pMon = g_MyD3D:GetMonster( 1 )
	
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


function Talin_Pollguard_MoveFail( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:GetIsContact() == true )then		
		if( pMonster:GetIsRight() == true ) then
            pMonster:SetIsRight( false )
            pMonster:SetSpeedX( pMonster:GetWalkSpeed() )        
        else
            pMonster:SetIsRight( true )
            pMonster:SetSpeedX( pMonster:GetWalkSpeed() )        
        end    
        
        pMonster:SetState( "WAIT" )			        
	end
end

function Talin_Pollguard_Smoke( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	local posx = 0.0
	local posy = 0.15

	if( math.mod( iFrame, 55 ) == 1 ) then
		if( pMonster:GetIsRight() ) then
			pMonster:AddTraceParticleToBone( "Talin_Steam_03", 1.0, 22, 8, 8, posx - 0.11, 0.05 )
			pMonster:AddTraceParticleToBone( "Talin_Steam_03", 1.0, 24, 8, 8, posx -0.08, posy - 0.05 )
		else
			posx = posx * -1.0
			pMonster:AddTraceParticleToBone( "Talin_Steam_03_R", 1.0, 22, 8, 8, posx + 0.11, 0.05, true )
			pMonster:AddTraceParticleToBone( "Talin_Steam_03_R", 1.0, 24, 8, 8, posx + 0.08, posy - 0.05, true )
		end
	end
	
	if( math.mod( iFrame, 80 ) == 1 ) then
		if( pMonster:GetIsRight() ) then
			pMonster:AddTraceParticleToBone( "Talin_Steam", 1.0, 18, 8, 8, posx -0.09, posy +0.06 )
			--pMonster:AddTraceParticleToBone( "Talin_Steam", 1.0, 20, 8, 8, posx -0.02, posy +0.06 )
			--pMonster:AddTraceParticleToBone( "Talin_Steam_02", 1.0, 18, 8, 8, posx -0.09, posy +0.06 )
			--pMonster:AddTraceParticleToBone( "Talin_Steam_02", 1.0, 20, 8, 8, posx -0.02, posy +0.06 )
		else
			posx = posx * -1.0
			pMonster:AddTraceParticleToBone( "Talin_Steam", 1.0, 18, 8, 8, posx +0.09, posy +0.06, true )
			--pMonster:AddTraceParticleToBone( "Talin_Steam", 1.0, 20, 8, 8, posx +0.02, posy +0.06, true )
			--pMonster:AddTraceParticleToBone( "Talin_Steam_02", 1.0, 18, 8, 8, posx +0.09, posy +0.06, true )
			--pMonster:AddTraceParticleToBone( "Talin_Steam_02", 1.0, 20, 8, 8, posx +0.02, posy +0.06, true )
		end
	end

	if( iFrame == 60 ) then
		if( pMonster:GetIsRight() ) then
			--pMonster:AddTraceParticleToBone( "Talin_Steam", 1.0, 18, 8, 8, posx -0.09, posy +0.06 )
			pMonster:AddTraceParticleToBone( "Talin_Steam", 1.0, 20, 8, 8, posx -0.02, posy +0.06 )
			--pMonster:AddTraceParticleToBone( "Talin_Steam_02", 1.0, 18, 8, 8, posx -0.09, posy +0.06 )
			--pMonster:AddTraceParticleToBone( "Talin_Steam_02", 1.0, 20, 8, 8, posx -0.02, posy +0.06 )
		else
			posx = posx * -1.0
			--pMonster:AddTraceParticleToBone( "Talin_Steam", 1.0, 18, 8, 8, posx +0.09, posy +0.06, true )
			pMonster:AddTraceParticleToBone( "Talin_Steam", 1.0, 20, 8, 8, posx +0.02, posy +0.06, true )
			--pMonster:AddTraceParticleToBone( "Talin_Steam_02", 1.0, 18, 8, 8, posx +0.09, posy +0.06, true )
			--pMonster:AddTraceParticleToBone( "Talin_Steam_02", 1.0, 20, 8, 8, posx +0.02, posy +0.06, true )
		end
	end
end