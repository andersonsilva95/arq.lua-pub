-- AI_death_worm.lua

ActionList =
{
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "death_worm_wait.frm",
        Func    = "death_worm_WaitFunc",

        Trigger =
        {
			-- 타게팅
			{
				AICheckFrame	= 100,
				AICheckFrame1	= 50,
				AICheckFrame2	= 20,
				AIFunc			= "death_worm_Check_Targeting",
				DelayFrame		= 100,
				DelayFrame1		= 50,
				DelayFrame2		= 20,
			},

            -- 콩켝
            {
                AICheckFrame        = 1000,
				AICheckFrame1       = 800,
				AICheckFrame2       = 500,
                AIFunc              = "death_worm_Check_Attack01",
                DelayFrame          = 1500,
				DelayFrame1         = 800,
				DelayFrame2         = 500,
            },
            
            -- 콩켝
            {
                AICheckFrame        = 450,
				AICheckFrame1       = 300,
				AICheckFrame2       = 150,
                AIFunc              = "death_worm_Check_Attack02",
                DelayFrame          = 800,
				DelayFrame1         = 700,
				DelayFrame2         = 300,
            },
            
            -- 콩켝
            {
                AICheckFrame        = 300,
				AICheckFrame1       = 200,
				AICheckFrame2       = 100,
                AIFunc              = "death_worm_Check_Attack03",
                DelayFrame          = 500,
				DelayFrame1         = 500,
				DelayFrame2         = 300,
            },
            
            -- 콩켝
            {
                AICheckFrame        = 500,
				AICheckFrame1       = 400,
				AICheckFrame2       = 300,
                AIFunc              = "death_worm_Check_Attack04",
                DelayFrame          = 500,
				DelayFrame1         = 500,
				DelayFrame2         = 300,
            },
			
			 -- 두개골방어
            {
                AICheckFrame        = 500,
				AICheckFrame1       = 300,
				AICheckFrame2       = 200,
                AIFunc              = "death_worm_Check_TOCLOSE",
                DelayFrame          = 700,
				DelayFrame1         = 500,
				DelayFrame2         = 300,
            },
        },
    },
    -- 
    {
        ID      = "ATTACK01",
        Motion  = "death_worm_Attack01.frm",
        Func    = "death_worm_Attack01Func",
    },
    
    -- 
    {
        ID      = "ATTACK02",
        Motion  = "death_worm_Attack02.frm",
        Func    = "death_worm_Attack02Func",
    },
    
    -- 
    {
        ID      = "ATTACK03",
        Motion  = "death_worm_Attack03.frm",
        Func    = "death_worm_Attack03Func",
    },
    
    -- 
    {
        ID      = "ATTACK04",
        Motion  = "death_worm_Attack04.frm",
        Func    = "death_worm_Attack04Func",
    },
    
    -- 
    {
        ID      = "ATTACK05",
        Motion  = "death_worm_Attack05.frm",
        Func    = "death_worm_Attack05Func",
    },

	-- 
    {
        ID      = "TOCLOSE",
        Motion  = "death_worm_wait_close.frm",
        Func    = "death_worm_ToCloseFunc",
    },
    
    -- 
    {
        ID      = "DEFENCE_WAIT",
        Motion  = "death_worm_wait_defence.frm",
        Func    = "death_worm_DefenceFunc",
        
        Trigger =
        {
			-- 타게팅
			{
				AICheckFrame	= 100,
				AICheckFrame1	= 50,
				AICheckFrame2	= 20,
				AIFunc			= "death_worm_Check_Targeting",
				DelayFrame		= 100,
				DelayFrame1		= 50,
				DelayFrame2		= 20,
			},

            -- 콩켝
            {
                AICheckFrame        = 300,
				AICheckFrame1       = 250,
				AICheckFrame2       = 200,
                AIFunc              = "death_worm_Check_Attack05",
                DelayFrame          = 1500,
				DelayFrame1         = 1000,
				DelayFrame2         = 500,
            },
        },
    },
    
    -- 
    {
        ID      = "TOWAIT",
        Motion  = "death_worm_wait_open.frm",
        Func    = "death_worm_ToWaitFunc",
    },

    {
        ID                  = "DIE",
        Motion              = "death_worm_Die.frm",
        Func                = "death_worm_DieFunc",
    },
}

CallBack =
{
	Die     = "Ondeath_worm_Die",
	--Damage	= "Ondeath_worm_Damage",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function Initdeath_worm( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    pMonster:SetIsRight( false )
    pMonster:SetSpeedX( 0.0 )
	pMonster:SetSpeedY( 0.0 )
    pMonster:SetPushCheck( true )
    pMonster:SetFly( true )
	
	g_kCamera.WideMode = 9
end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function death_worm_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetX( pMonster:GetStageX() + 1.15 )
	pMonster:SetY( -0.25 )
	pMonster:SetSpeedX( 0.0 )
	pMonster:SetSpeedY( 0.0 )
    pMonster:SetFly( true )
	--pMonster:CheckTargetInRange( 300, -2000, 800, 20, -800, 300 )

	if( iFrame == 7 ) then
		pMonster:ClearMagicEffect( iMonsterIndex, EGC_EFFECT_MON_INFINITY_DEFENCE );
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end


-- 물기
function death_worm_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	--pMonster:SetSpeedY(0)
    if( iFrame == 1) then
		pMonster:SetSuperArmor(true)
    elseif( iFrame == 69 ) then
    	pMonster:EarthQuake( 38, 0.06, 0.025 )
    	pMonster:AddDamageWithLocate( DT_HELL_DEATHWORM_STONE, 1.40, 1.7, true)
		pMonster:AddDamageWithLocate( DT_HELL_DEATHWORM_STONE, 3.00, 1.8, true)
		pMonster:AddDamageWithLocate( DT_HELL_DEATHWORM_STONE, 1.60, 2.0, true)
		pMonster:AddDamageWithLocate( DT_HELL_DEATHWORM_STONE, 0.20, 2.1, true)
		pMonster:AddDamageWithLocate( DT_HELL_DEATHWORM_STONE, 2.26, 2.3, true)
		pMonster:AddDamageWithLocate( DT_HELL_DEATHWORM_STONE, 0.90, 2.4, true)
		pMonster:AddDamageWithLocate( DT_HELL_DEATHWORM_STONE, 1.40, 2.6, true)
		pMonster:AddDamageWithLocate( DT_HELL_DEATHWORM_STONE, 0.30, 2.7, true)
		pMonster:AddDamageWithLocate( DT_HELL_DEATHWORM_STONE, 3.50, 2.7, true)
		pMonster:AddDamageWithLocate( DT_HELL_DEATHWORM_STONE, 0.00, 2.8, true)
		pMonster:AddDamageWithLocate( DT_HELL_DEATHWORM_STONE, 2.00, 3.0, true)
		pMonster:AddDamageWithLocate( DT_HELL_DEATHWORM_STONE, 0.50, 3.1, true)
		pMonster:PlaySound(985013)
		local posX = 4.0
		local posY = 0.7
		pMonster:AddParticle( "Vulcanus_Crash_01", posX, posY )
		pMonster:AddParticle( "Vulcanus_Crash_02", posX, posY )
		pMonster:AddParticle( "Vulcanus_Crash_03", posX, posY )
    elseif( iFrame == 124 ) then
    	pMonster:EarthQuake( 38, 0.06, 0.025 )
		pMonster:PlaySound(985013)
		local posX = 4.0
		local posY = 0.7
		pMonster:AddParticle( "Vulcanus_Crash_01", posX, posY )
		pMonster:AddParticle( "Vulcanus_Crash_02", posX, posY )
		pMonster:AddParticle( "Vulcanus_Crash_03", posX, posY )
    elseif( iFrame == 150 ) then
		pMonster:PlaySound(985014)
    elseif( iFrame == 169 ) then
		pMonster:EarthQuake( 38, 0.06, 0.025 )
		pMonster:PlaySound(985013)
		local posX = 4.0
		local posY = 0.7
		pMonster:AddParticle( "Vulcanus_Crash_01", posX, posY )
		pMonster:AddParticle( "Vulcanus_Crash_02", posX, posY )
		pMonster:AddParticle( "Vulcanus_Crash_03", posX, posY )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end


-- 물기
function death_worm_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetSpeedY(0)
	
    if( iFrame == 1) then
		pMonster:SetSuperArmor(true)
    elseif( iFrame == 67 ) then
		pMonster:AddTraceParticleToBone( "Jin01_SP3-1_Boom_02", 1.0, 29, 0, 0, 0.1, -0.1 )
		pMonster:AddTraceParticleToBone( "Jin01_SP3-1_Boom_03", 1.0, 29, 0, 0, 0.1, -0.1 )
		pMonster:AddTraceParticleToBone( "Jin01_SP3-1_Boom_04", 1.0, 29, 0, 0, 0.1, -0.1 )
		pMonster:AddTraceParticleToBone( "Jin01_SP3-1_Boom_06", 1.0, 29, 0, 0, 0.1, -0.1 )
	
		pMonster:PlaySound(985016)
		
		local posX = 2.2
		local posY = 2.0
		if( false == pMonster:GetIsRight() ) then
			--posX = -1.0 * posX
		end
		pMonster:ComputeAngleToTarget( posX, posY ) -- 타겟으로의 각도를 계산
		local angle = pMonster:GetAngleToTarget()
		if( pMonster:GetIsRight() ) then
			pMonster:AddDamageWithLocateAngle( DT_HELL_DEATHWORM_FIREPOLL, posX, posY, false, angle )
		else
			pMonster:AddDamageWithLocateAngle( DT_HELL_DEATHWORM_FIREPOLL, posX, posY, false, -angle )
		end
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 물기
function death_worm_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame <= 1 ) then
		pMonster:SetFly( true )
		pMonster:SetSuperArmor(true)
		pMonster:SetPushCheck( true )
	elseif( iFrame == 57 ) then
		pMonster:PlaySound( 998004 )
		pMonster:PlaySound( 998005 )
		pMonster:AddDamage(DT_HELL_DEATHWORM_FLAME_BREATH)
	elseif( iFrame == 60 ) then
		local posX = -0.05
		local posY = -0.07
		
		pMonster:AddTraceParticleToBone( "Drakeworm_Flame_01", 1.0, 29, 0, 0, posX, posY )
		pMonster:AddTraceParticleToBone( "Deathworm_Flame", 1.0, 29, 0, 0, posX, posY )
		pMonster:AddTraceParticleToBone( "Drakeworm_Flame_03", 1.0, 29, 0, 0, posX, posY )
		pMonster:AddTraceParticleToBone( "Vulcanus_Hellrock_05", 1.0, 29, 0, 0, 0.0, 0.0 )
		if( pMonster:GetIsRight() ) then
			pMonster:AddTraceParticleToBone( "Drakeworm_Flame_04", 1.0, 29, 0, 0, posX, posY )
		else
			pMonster:AddTraceParticleToBone( "Drakeworm_Flame_04_R", 1.0, 29, 0, 0, -posX, posY )
		end
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
	end
end

-- 물기
function death_worm_Attack04Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetSpeedY(0)
	
    if( iFrame <= 1 ) then
		pMonster:SetFly( true )
		pMonster:SetSuperArmor(true)
		pMonster:SetPushCheck( true )
	elseif( iFrame == 60 ) then
		pMonster:PlaySound(985018)
		pMonster:StartAttack( 7, PAR_DOWN, 1.3, 25, 25, 10)
	elseif( iFrame == 70 ) then
		pMonster:AddTraceParticleToBone( "Jin01_SP3-1_Boom_02", 0.2, 29, 0, 0, 0.1, -0.1 )
		pMonster:AddTraceParticleToBone( "Jin01_SP3-1_Boom_06", 0.2, 29, 0, 0, 0.1, -0.1 )
	elseif( iFrame == 108 ) then
		pMonster:PlaySound(985019)
		pMonster:StartAttack( 7, PAR_DOWN, 1.3, 25, 25, 10)
	elseif( iFrame == 117 ) then
		pMonster:AddTraceParticleToBone( "Jin01_SP3-1_Boom_02", 0.2, 29, 0, 0, 0.1, -0.1 )
		pMonster:AddTraceParticleToBone( "Jin01_SP3-1_Boom_06", 0.2, 29, 0, 0, 0.1, -0.1 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:EndAttack()
		pMonster:SetState( "WAIT" )
	end
end

-- 물기
function death_worm_Attack05Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetSpeedY(0)
	
    if( iFrame <= 1 ) then
		pMonster:SetFly( true )
		pMonster:SetSuperArmor(true)
		pMonster:SetPushCheck( true )
	elseif( iFrame == 70 ) then
		pMonster:EarthQuake( 38, 0.06, 0.025 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "TOWAIT" )
	end
end

-- 물기
function death_worm_ToCloseFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetSpeedY(0)
	
    if( iFrame == 1) then
		pMonster:PlaySound(985020)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		local buffTime = 999999.0
		pMonster:SetMagicEffect( iMonsterIndex, EGC_EFFECT_MON_INFINITY_DEFENCE, buffTime, 1, -1, false, false );
        pMonster:SetState( "DEFENCE_WAIT" )
    end
end


-- 대기 상태
function death_worm_DefenceFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetX( pMonster:GetStageX() + 1.15 )
	pMonster:SetY( -0.25 )
	pMonster:SetSpeedX( 0.0 )
	pMonster:SetSpeedY( 0.0 )

	if( iFrame == 2 ) then
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "DEFENCE_WAIT" )
    end
end

-- 물기
function death_worm_ToWaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetSpeedY(0)
	
    if( iFrame == 1) then
		pMonster:PlaySound(985021)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:ClearMagicEffect( iMonsterIndex, EGC_EFFECT_MON_INFINITY_DEFENCE );
        pMonster:SetState( "WAIT" )
    end
end

--  죽었어
function death_worm_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame == 2 ) then
		pMonster:PlaySound(996007)
	elseif( iFrame == 100 ) then
		pMonster:CameraVib( 1, 1.0, 0.037 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-----------------------------------------------------------------------
-- 컨디션체크
-----------------------------------------------------------------------
function death_worm_Check_Targeting( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:SetTarget( 300, -2000, 800, 20, -800, 300 ) == true ) then
		pMonster:ResetDelay()
	end
end

function death_worm_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:SetTarget( 300, -2000, 800, 20, -800, 300 ) == true ) then
		pMonster:SetState( "ATTACK01" )
		pMonster:StartText("DANGER")
	end

	pMonster:ResetDelay()
end

function death_worm_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 300, -2000, 800, 20, -800, 300 ) == true ) then
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
	end
end

function death_worm_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 300, -2000, 800, 20, -800, 300 ) == true ) then
		pMonster:SetState( "ATTACK03" )
		pMonster:ResetDelay()
	end
end

function death_worm_Check_Attack04( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 300, -2000, 800, 20, -800, 300 ) == true ) then
		pMonster:SetState( "ATTACK04" )
		pMonster:ResetDelay()
	end
end

function death_worm_Check_TOCLOSE( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:FloatRand() < 0.30 ) then
		pMonster:SetState( "TOCLOSE" )
		pMonster:ResetDelay()
	end
end

function death_worm_Check_Attack05( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 300, -2000, 800, 20, -800, 300 ) == true ) then
		pMonster:SetState( "ATTACK05" )
		pMonster:StartText("DANGER")
		pMonster:ResetDelay()
	end
	
end
-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------
function Ondeath_worm_Die( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    pMonster:SetState( "DIE" )
end
