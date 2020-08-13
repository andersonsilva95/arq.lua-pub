-- AI_duel.lua

ActionList =
{	
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "duel_Wait.frm",
        Func    = "duel_WaitFunc",

        Trigger =
        {
			-- 타게팅
            {
                AICheckFrame        = 5,
                AIFunc              = "duel_Check_Targeting",
                DelayFrame          = 55,
            },

            -- 타겟지움 (일단 안함)
            --{
            --    AICheckFrame        = 220,
            --    AIFunc              = "duel_Check_ReleaseTarget",
            --    DelayFrame          = 440,
            --},

            -- 공간 비틀기
            {
                AICheckFrame        = 110,
				AICheckFrame1       = 100,
				AICheckFrame2       = 90,
				AICheckFrame3       = 90,
                AIFunc              = "duel_Check_Teleport",
                DelayFrame          = 220,
				DelayFrame1			= 190,
				DelayFrame2			= 160,
				DelayFrame3			= 160,
            },

            -- 소울 스트라이크
            {
                AICheckFrame        = 4,
                AIFunc              = "duel_Check_Attack01",
                DelayFrame          = 110,
				DelayFrame1			= 100,
				DelayFrame2			= 90,
				DelayFrame3			= 90,
            },

            -- 이블 스피어
            {
                AICheckFrame        = 80,
				AICheckFrame1       = 70,
				AICheckFrame2       = 60,
				AICheckFrame3       = 60,
                AIFunc              = "duel_Check_Attack02",
                DelayFrame          = 300,
				DelayFrame1			= 250,
				DelayFrame2			= 200,
				DelayFrame3			= 200,
            },

        },
    },

    -- 텔레포트
    {
        ID      = "TELEPORT",
        Motion  = "duel_walk_start.frm",
        Func    = "duel_TeleportFunc",
    },
    
    -- 텔레포트
    {
        ID      = "TELEPORT_DRAMA",
        Motion  = "duel_walk_start.frm",
        Func    = "duel_TeleportDramaFunc",
    },
    
    -- 텔레포트 착지
    {
        ID      = "TELEPORT_LANDING",
        Motion  = "duel_walk_landing.frm",
        Func    = "duel_TeleportLandingFunc",
    },
    
    -- drama 텔레포트 착지
    {
        ID      = "TELEPORT_LANDING_DRAMA",
        Motion  = "duel_walk_landing.frm",
        Func    = "duel_TeleportLandingDramaFunc",
    },
    
    -- 근접공격
    {
        ID      = "ATTACK01",
        Motion  = "duel_attack01_ready.frm",
        Func    = "duel_Attack01Func",
    },
    
    -- 근접공격
    {
        ID      = "ATTACK01_ING",
        Motion  = "duel_attack01_attack.frm",
        Func    = "duel_Attack01ingFunc",
    },

	-- 근접공격(1발)
    {
        ID      = "ATTACK01_1",
        Motion  = "duel_attack01_ready.frm",
        Func    = "duel_Attack01_1Func",
    },
    
    -- 근접공격(1발)
    {
        ID      = "ATTACK01_1_ING",
        Motion  = "duel_attack01_attack.frm",
        Func    = "duel_Attack01_1ingFunc",
    },
    
    -- 근접공격
    {
        ID      = "ATTACK01_END",
        Motion  = "duel_attack01_end.frm",
        Func    = "duel_Attack01endFunc",
    },
    
    -- 라이트닝
    {
        ID      = "ATTACK02",
        Motion  = "duel_Attack02.frm",
        Func    = "duel_Attack02Func",
    },
    
    -- 죽기
    {
        ID      = "DIE",
        Motion  = "duel_Wait.frm",
        Func    = "duel_DieFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- 죽기 착지
    {
        ID      = "DIE_LANDING",
        Motion  = "duel_Wait.frm",
        Func    = "duel_DieLandingFunc",
        IsFallDownMotion    = TRUE,
    },
}

CallBack =
{
    Land    = "Onduel_Land",
    Die     = "Onduel_Die",
    Damage  = "Onduel_Damage",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

local duelCount = 0

function Initduel( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    pMonster:SetFly( true )
    pMonster:SetRight( false )
    pMonster:SetX( pMonster:GetStageX() - 0.2 )
    pMonster:SetY( 0.5 )
    pMonster.DefRatio = 100.0
end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function duel_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
        pMonster:SetMagicEffect( iMonsterIndex, EGC_EFFECT_MON_INFINITY_DEFENCE, 100000.0, 1, -1, false, false );
    end
end

-- 대기 상태
function duel_SummonFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame == 2 ) then
		local posy = 0.0
		pMonster:AddParticle("Iblis_Summon_Circle_01", 0.0, posy)
		pMonster:AddParticle("Iblis_Summon_Circle_02", 0.0, posy)
		pMonster:AddParticle("Iblis_Summon_Circle_03", 0.0, posy)
		pMonster:AddParticle("Iblis_Summon_Circle_04", 0.0, posy)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
end

-- 걷기 상태
function duel_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
        
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
end

-- 죽는상태
function duel_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame == 2 ) then
		--pMonster:PlaySound(995031)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster(true)
        --pMonster:SetFrameLock( true )
        pMonster:SetState("WAIT")
    end
end

-- 죽는상태 착지
function duel_DieLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame == 2 ) then
		--pMonster:PlaySound(995031)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster(true)
		
        --pMonster:SetFrameLock( true )
        pMonster:SetState("WAIT")
    end
end

function duel_Attack01Func( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
		pMonster:SetCountValue(0)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "ATTACK01_ING" )
    end
end

--  근접공격 상태
function duel_Attack01ingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
    elseif( iFrame == 6 ) then
		local posx = 0.185
		local posy = 0.45
		if( pMonster:GetIsRight() == false ) then
			posx = posx * -1.0
		end
		
		pMonster:AddParticleNoDirection( "Statue_Homing_Spark_02", posx, posy )
		pMonster:AddParticleNoDirection( "Statue_Homing_Spark_03", posx, posy )
		pMonster:AddParticleNoDirection( "Iblis_Laser_Shot_03", posx, posy )
		
		pMonster:ComputeAngleToTarget( 0.15, 0.28 ) -- 타겟으로의 각도를 계산
		local angle = pMonster:GetAngleToTarget()
		if( pMonster:GetIsRight() ) then
			pMonster:AddDamageWithLocateAngle( DT_THUNDER_HAMMER_DUEL_ATK1, 0.15, 0.46, false, angle )
		else
			pMonster:AddDamageWithLocateAngle( DT_THUNDER_HAMMER_DUEL_ATK1, 0.15, 0.46, false, -angle )
		end
		pMonster:PlaySound(987008)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        if( pMonster:GetCountValue() >= 2 ) then
			pMonster:SetState( "ATTACK01_END" )
		else
			pMonster:AddCountValue(1)
			pMonster:SetState( "ATTACK01_ING" )
		end
    end
end

function duel_Attack01_1Func( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
		pMonster:SetCountValue(0)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "ATTACK01_1_ING" )
    end
end

--  근접공격 상태
function duel_Attack01_1ingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
    elseif( iFrame == 6 ) then
		local posx = 0.185
		local posy = 0.45
		if( pMonster:GetIsRight() == false ) then
			posx = posx * -1.0
		end
		
		pMonster:AddParticleNoDirection( "Statue_Homing_Spark_02", posx, posy )
		pMonster:AddParticleNoDirection( "Statue_Homing_Spark_03", posx, posy )
		pMonster:AddParticleNoDirection( "Iblis_Laser_Shot_03", posx, posy )
		
		pMonster:ComputeAngleToTarget( 0.15, 0.28 ) -- 타겟으로의 각도를 계산
		local angle = pMonster:GetAngleToTarget()
		if( pMonster:GetIsRight() ) then
			pMonster:AddDamageWithLocateAngle( DT_THUNDER_HAMMER_DUEL_ATK1, 0.15, 0.46, false, angle )
		else
			pMonster:AddDamageWithLocateAngle( DT_THUNDER_HAMMER_DUEL_ATK1, 0.15, 0.46, false, -angle )
		end
		pMonster:PlaySound(987008)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "ATTACK01_END" )
    end
end

function duel_Attack01endFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  라이트닝 상태
function duel_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 10 ) then
        pMonster:PlaySound(987009)
		pMonster:PlaySound(987036)
        local posx = 0.25
		local posy = 0.45
		
		if(pMonster:GetIsRight() == false) then
			posx = posx * -1.0
		end
		
		pMonster:AddParticleNoDirection( "Duel_Evil_Spear_Shot_01", posx, posy )
		pMonster:AddParticleNoDirection( "Duel_Evil_Spear_Shot_02", posx, posy )
		pMonster:AddParticleNoDirection( "Duel_Evil_Spear_Shot_03", posx, posy )
		pMonster:AddParticleNoDirection( "Duel_Evil_Spear_Shot_04", posx, posy )
		pMonster:AddParticleNoDirection( "Duel_Evil_Spear_Shot_05", posx, posy )
		pMonster:AddParticleNoDirection( "Duel_Evil_Spear_Shot_06", posx, posy )
    elseif( iFrame == 70 ) then
        pMonster:AddDamageToAlivePlayer(DT_THUNDER_HAMMER_DUEL_ATK2, 0.25, 0.45, true)
        pMonster:PlaySound(987010)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end


--  텔레포트 상태
function duel_TeleportFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		duelCount = 0
		pMonster:SetPushCheck( false )
		pMonster:SetInvincibleFrame( 50 )

	elseif( iFrame == 3) then
		pMonster:PlaySound(987007)
	elseif( iFrame == 10 ) then
		local posx = 0.4
		local posy = 0.4
		if( pMonster:GetIsRight() == false ) then
			posx = posx * -1.0
			pMonster:AddParticleNoDirection( "Duel_Portal_04", posx, posy )
			pMonster:AddParticleNoDirection( "Duel_Portal_03", posx, posy )
			pMonster:AddParticleNoDirection( "Duel_Portal_02", posx, posy )
			pMonster:AddParticleNoDirection( "Duel_Portal_01", posx, posy )
		else
			pMonster:AddParticleNoDirection( "Duel_Portal_04_R", posx, posy )
			pMonster:AddParticleNoDirection( "Duel_Portal_03_R", posx, posy )
			pMonster:AddParticleNoDirection( "Duel_Portal_02_R", posx, posy )
			pMonster:AddParticleNoDirection( "Duel_Portal_01_R", posx, posy )
		end
		pMonster:AddParticleNoDirection( "Duel_Portal_05", posx, posy )
		pMonster:AddParticleNoDirection( "Duel_Portal_06", posx, posy )
		pMonster:AddParticleNoDirection( "Duel_Portal_07", posx, posy )
	elseif( iFrame == 30 ) then
		pMonster:PlaySound(991018)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        --pMonster:SetFrameLock( true )
        pMonster:ToggleRender( false )
        pMonster:SetState("TELEPORT_LANDING")
    end
end

--  텔레포트 착지 상태
function duel_TeleportLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 3 ) then
		pMonster:ToggleRender( true )
    end
    
    if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
	elseif( iFrame == 3 ) then
		pMonster:SetPushCheck( true )
		if( pMonster:GetIsRight() == true ) then
			pMonster:SetX( pMonster:GetStageX() - 0.2 )
			pMonster:SetIsRight(false)
		else
			pMonster:SetX( 0.2 )
			pMonster:SetIsRight(true)
		end
		pMonster:SetY( 0.66 )
		local posx = 0.0
		local posy = 0.4
		
		if( pMonster:GetIsRight() == true ) then
			pMonster:AddParticleNoDirection( "Duel_Portal_02", posx, posy )
			pMonster:AddParticleNoDirection( "Duel_Portal_04_Just", posx, posy )
			pMonster:AddParticleNoDirection( "Duel_Portal_03_Just", posx, posy )
			pMonster:AddParticleNoDirection( "Duel_Portal_01", posx, posy )
		else
			pMonster:AddParticleNoDirection( "Duel_Portal_02_R", posx, posy )
			pMonster:AddParticleNoDirection( "Duel_Portal_04_Just_R", posx, posy )
			pMonster:AddParticleNoDirection( "Duel_Portal_03_Just_R", posx, posy )
			pMonster:AddParticleNoDirection( "Duel_Portal_01_R", posx, posy )
		end
		pMonster:AddParticleNoDirection( "Duel_Portal_05", posx, posy )
		pMonster:AddParticleNoDirection( "Duel_Portal_06", posx, posy )
		pMonster:AddParticleNoDirection( "Duel_Portal_07", posx, posy )
		--pMonster:PlaySound(987007)
    elseif( iFrame == 10 ) then
		pMonster:SetInvincible( false )
		pMonster:SetPushCheck( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )   -- 가만있기
		pMonster:SetCountValue(0)
    end
end


--  텔레포트 상태
function duel_TeleportDramaFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
		pMonster:SetInvincibleFrame( 50 )
	elseif( iFrame == 10 ) then
		local posx = 0.4
		local posy = 0.4
		if( pMonster:GetIsRight() == false ) then
			posx = posx * -1.0
			pMonster:AddParticleNoDirection( "Duel_Portal_04", posx, posy )
			pMonster:AddParticleNoDirection( "Duel_Portal_03", posx, posy )
			pMonster:AddParticleNoDirection( "Duel_Portal_02", posx, posy )
			pMonster:AddParticleNoDirection( "Duel_Portal_01", posx, posy )
		else
			pMonster:AddParticleNoDirection( "Duel_Portal_04_R", posx, posy )
			pMonster:AddParticleNoDirection( "Duel_Portal_03_R", posx, posy )
			pMonster:AddParticleNoDirection( "Duel_Portal_02_R", posx, posy )
			pMonster:AddParticleNoDirection( "Duel_Portal_01_R", posx, posy )
		end
		pMonster:AddParticleNoDirection( "Duel_Portal_05", posx, posy )
		pMonster:AddParticleNoDirection( "Duel_Portal_06", posx, posy )
		pMonster:AddParticleNoDirection( "Duel_Portal_07", posx, posy )
	elseif( iFrame == 30 ) then
		pMonster:PlaySound(987007)
		pMonster:SendDropInfo()
		pMonster:SendMonsterKill()
		pMonster:ClearMagicEffect( iMonsterIndex, EGC_EFFECT_MON_INFINITY_DEFENCE )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
        pMonster:ToggleRender( false )
    end
end

--  텔레포트 착지 상태
function duel_TeleportLandingDramaFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
	elseif( iFrame == 3 ) then
		pMonster:ToggleRender( true )
		pMonster:SetPushCheck( true )
		pMonster:SetX( pMonster:GetStageX() - 0.2 )
		pMonster:SetIsRight(false)
		pMonster:SetY( 0.66 )
		local posx = 0.0
		local posy = 0.4
		
		if( pMonster:GetIsRight() == true ) then
			pMonster:AddParticleNoDirection( "Duel_Portal_02", posx, posy )
			pMonster:AddParticleNoDirection( "Duel_Portal_04_Just", posx, posy )
			pMonster:AddParticleNoDirection( "Duel_Portal_03_Just", posx, posy )
			pMonster:AddParticleNoDirection( "Duel_Portal_01", posx, posy )
		else
			pMonster:AddParticleNoDirection( "Duel_Portal_02_R", posx, posy )
			pMonster:AddParticleNoDirection( "Duel_Portal_04_Just_R", posx, posy )
			pMonster:AddParticleNoDirection( "Duel_Portal_03_Just_R", posx, posy )
			pMonster:AddParticleNoDirection( "Duel_Portal_01_R", posx, posy )
		end
		pMonster:AddParticleNoDirection( "Duel_Portal_05", posx, posy )
		pMonster:AddParticleNoDirection( "Duel_Portal_06", posx, posy )
		pMonster:AddParticleNoDirection( "Duel_Portal_07", posx, posy )
		--pMonster:PlaySound(987007)
    elseif( iFrame == 10 ) then
		pMonster:SetInvincible( false )
		pMonster:SetPushCheck( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )   -- 가만있기
		pMonster:SetCountValue(0)
    end
end

-----------------------------------------------------------------------
-- 컨디션체크
-----------------------------------------------------------------------

function duel_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 0, -600, 700, 600, -300 ) == true ) then
        pMonster:ResetDelay()
    end
end

function duel_Check_ReleaseTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 0, -1000, 1000, 1000, -800 ) == false ) then
		pMonster:ReleaseTarget()
		pMonster:ResetDelay()
	end
end

function duel_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:IsTarget() == true ) then
		if( pMonster:CheckTargetInRange( 1299, -999, 700, 999, -300 ) == true ) then
			if( pMonster:FloatRand() < 0.5 ) then
				pMonster:SetState( "ATTACK01" )
			else
				pMonster:SetState( "ATTACK01_1" )
			end
			pMonster:ResetDelay()
		end
    end
end

function duel_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:IsTarget() == true ) then
		if ( pMonster:CheckTargetInRange( 0, -300, 700, 300, -300 ) == true ) then
			if( pMonster:FloatRand() < 0.5 ) then
				pMonster:SetState( "ATTACK02" )
				pMonster:ResetDelay()
			end
		end
    end
end

function duel_Check_Teleport( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 0, -400, 700, 400, -300 ) == true ) then
		if( pMonster:FloatRand() < 0.5 ) then
			pMonster:SetState( "TELEPORT" )
			pMonster:ResetDelay()
		end
    end
end

function duel_Check_TeleportLanding( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	pMonster:SetState( "TELEPORT_LANDING" )
	pMonster:ResetDelay()	
end

-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------
function Onduel_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    pMonster:SetSpeedX(0)
    pMonster:SetSpeedY(0)
end

function Onduel_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( pMonster:CheckState( "DOWN_UP01" ) == false and pMonster:CheckState( "DOWN_UP02" ) == false and pMonster:CheckState( "DOWN_MIDDLE" ) == false and pMonster:CheckState( "DOWN_DOWN" ) == false and pMonster:CheckState( "DOWN_SPECIAL" ) == false and pMonster:CheckState( "STONECURSE" ) == false and pMonster:CheckState( "ICECURSE" ) == false  and pMonster:CheckState( "HOLD" ) == false ) then
		pMonster:SetState( "DIE" )
	end
	
end

function Onduel_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	duelCount = duelCount + 1

	if( pMonster:CheckState( "WAIT" ) == true ) then
		if ( duelCount >= 20 ) then
			pMonster:SetInvincible( true )
			pMonster:SetState( "TELEPORT" )
		end
	end

	pMonster:SetPushCheck( true )
	pMonster:SetFly( true )
	
    pMonster:SetSpeedX(0)
    pMonster:SetSpeedY(0)
end