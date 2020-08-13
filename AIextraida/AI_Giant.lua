-- AI_Giant.lua

ActionList =
{
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "Giant_Wait.frm",
        Func    = "Giant_WaitFunc",

        Trigger =
        {
			-- 타게팅
			{
				AICheckFrame	= 25,
				AIFunc			= "Giant_Check_Targeting",
				DelayFrame		= 110,
			},

            -- 지진크~
            {
                AICheckFrame        = 400,
                AIFunc              = "Giant_Check_Attack01",
                DelayFrame          = 120,
            },

            -- 석화의 고리 상
            {
                AICheckFrame        = 200,
                AIFunc              = "Giant_Check_Attack02_UP",
                DelayFrame          = 200,
            },

            -- 석화의 고리 하
            {
                AICheckFrame        = 400,
				AICheckFrame1       = 300,
				AICheckFrame2       = 200,
				AICheckFrame3       = 200,
                AIFunc              = "Giant_Check_Attack02_DOWN",
                DelayFrame          = 260,
            },

            -- 벽치기
            {
                AICheckFrame        = 110,
                AIFunc              = "Giant_Check_Attack03",
                DelayFrame          = 150,
            },

            -- 파리채 상
            {
                AICheckFrame        = 180,
				AICheckFrame1       = 120,
				AICheckFrame2       = 60,
				AICheckFrame3       = 60,
                AIFunc              = "Giant_Check_Attack04_UP",
                DelayFrame          = 370,
            },

            -- 파리채 중
            {
                AICheckFrame        = 240,
				AICheckFrame1       = 160,
				AICheckFrame2       = 80,
				AICheckFrame3       = 80,
                AIFunc              = "Giant_Check_Attack04_MIDDLE",
                DelayFrame          = 350,
            },

            -- 파리채 하
            {
                AICheckFrame        = 200,
				AICheckFrame1       = 150,
				AICheckFrame2       = 100,
				AICheckFrame3       = 100,
                AIFunc              = "Giant_Check_Attack04_DOWN",
                DelayFrame          = 330,
            },

            -- 레이쪼
            {
                AICheckFrame        = 165,
                AIFunc              = "Giant_Check_Attack05",
                DelayFrame          = 500,
				DelayFrame1			= 350,
				DelayFrame2			= 200,
				DelayFrame3			= 200,
            },

        },
    },
    
    -- 지진크
    {
        ID      = "ATTACK01",
        Motion  = "Giant_Attack01.frm",
        Func    = "Giant_Attack01Func",
    },
    -- 석화의 고리 상
    {
        ID      = "ATTACK02_UP",
        Motion  = "Giant_Attack02_Up.frm",
        Func    = "Giant_Attack02Func",
    },
    -- 석화의 고리 하
    {
        ID      = "ATTACK02_DOWN",
        Motion  = "Giant_Attack02_Down.frm",
        Func    = "Giant_Attack02Func",
    },
    -- 벽치기 왼
    {
        ID      = "ATTACK03_L",
        Motion  = "Giant_Attack03_A.frm",
        Func    = "Giant_Attack03Func",
    },
    -- 벽치기 오른
    {
        ID      = "ATTACK03_R",
        Motion  = "Giant_Attack03_B.frm",
        Func    = "Giant_Attack03Func",
    },
    -- 파리채 상
    {
        ID      = "ATTACK04_UP",
        Motion  = "Giant_Attack04_A.frm",
        Func    = "Giant_Attack04Func",
    },
    -- 파리채 중
    {
        ID      = "ATTACK04_MIDDLE",
        Motion  = "Giant_Attack04_B.frm",
        Func    = "Giant_Attack04Func",
    },
    -- 파리채 하
    {
        ID      = "ATTACK04_DOWN",
        Motion  = "Giant_Attack04_C.frm",
        Func    = "Giant_Attack04Func",
    },
    -- 레이쪼 쭉쭝쭝
    {
        ID      = "ATTACK05",
        Motion  = "Giant_Attack06.frm",
        Func    = "Giant_Attack05Func",
    },
    
    {
        ID                  = "DIE",
        Motion              = "Giant_Die.frm",
        Func                = "Giant_DieFunc",
    },
    
    {
        ID                  = "END",
        Motion              = "Giant_Die.frm",
        Func                = "Giant_EndFunc",
    },
}

CallBack =
{
	Die     = "OnGiant_Die",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function InitGiant( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    pMonster:SetInvincible( true )
    pMonster:SetIsRight( true )
    pMonster:SetSpeedX( 0.0 )
	pMonster:SetSpeedY( 0.0 )
    pMonster:SetPushCheck( false )
    pMonster:SetFly( true )
    pMonster:SetX( 2.25 )
    pMonster:SetY( 0.3 )
end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function Giant_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	g_kCamera.WideMode = 7
	if( iFrame == 2 ) then
		if( pMonster:FloatRand() < 0.33 ) then
			pMonster:AddTraceParticleToBone( "Giant_Clap_Dust_01", 1.0, 3, 0, 0, posx, -0.1 )		-- 문
			pMonster:AddTraceParticleToBone( "Giant_Clap_Dust_01", 1.0, 31, 0, 0, posx, -0.1 )	-- 발목 왼
			pMonster:AddTraceParticleToBone( "Giant_Clap_Dust_01", 1.0, 10, 0, 0, posx, -0.1 )	-- 팔꿈치 오른
		elseif( pMonster:FloatRand() < 0.66 ) then
			pMonster:AddTraceParticleToBone( "Giant_Clap_Dust_01", 1.0, 27, 0, 0, posx, -0.1 )	-- 발목 오른
			pMonster:AddTraceParticleToBone( "Giant_Clap_Dust_01", 1.0, 6, 0, 0, posx, -0.1 )		-- 입
		elseif( pMonster:FloatRand() < 0.99 ) then
			pMonster:AddTraceParticleToBone( "Giant_Clap_Dust_01", 1.0, 9, 0, 0, posx, -0.1 )		-- 팔꿈치 왼
			pMonster:AddTraceParticleToBone( "Giant_Clap_Dust_01", 1.0, 18, 0, 0, posx, -0.1 )	-- 손목 왼
			pMonster:AddTraceParticleToBone( "Giant_Clap_Dust_01", 1.0, 19, 0, 0, posx, -0.1 )	-- 손목 오른
		end
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  근접공격 상태
function Giant_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame == 1) then
		pMonster:StartText("DANGER")
    elseif( iFrame == 67 ) then
		pMonster:PlaySound(998029)
    elseif( iFrame == 70 ) then
		pMonster:EarthQuake( 30, 0.06, 0.02 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 석화의 고리 
function Giant_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    local posY
    
    if( iFrame <= 1) then
    elseif( iFrame == 55 ) then
		posY = 4.7
		pMonster:PlaySound(998030)
		pMonster:AddParticle("Giant_Ring_01", 0.0, posY)
		pMonster:AddParticle("Giant_Ring_02", 0.0, posY)
		pMonster:AddParticle("Giant_Ring_03", 0.0, posY)
		pMonster:AddParticle("Giant_Ring_04", 0.0, posY)
		pMonster:AddDamageWithLocate(DT_GIANT_STONE_RING, 0.0, 4.6 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 벽치기
function Giant_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1) then
    elseif( iFrame == 69 ) then
		pMonster:PlaySound(998029)
		pMonster:CameraVib( 0, 2.6, 0.04 )
	elseif( iFrame == 70 ) then
		if( pMonster:CheckState( "ATTACK03_L" ) == true ) then
			pMonster:AddDamageWithLocate( DT_GAINT_FALLING_STONE, -1.40, 4.5)
			pMonster:AddDamageWithLocate( DT_GAINT_FALLING_STONE_2, -1.00, 5.1)
			pMonster:AddDamageWithLocate( DT_GAINT_FALLING_STONE, -1.60, 5.4)
			pMonster:AddDamageWithLocate( DT_GAINT_FALLING_STONE_2, -0.20, 5.6)
			pMonster:AddDamageWithLocate( DT_GAINT_FALLING_STONE, -1.76, 5.9)
			pMonster:AddDamageWithLocate( DT_GAINT_FALLING_STONE_2, -0.90, 6.1)
			pMonster:AddDamageWithLocate( DT_GAINT_FALLING_STONE, -1.40, 6.3)
			pMonster:AddDamageWithLocate( DT_GAINT_FALLING_STONE_2, -0.30, 6.6)
			pMonster:AddDamageWithLocate( DT_GAINT_FALLING_STONE, -2.00, 7.1)
			pMonster:AddDamageWithLocate( DT_GAINT_FALLING_STONE, -0.00, 7.5)
			pMonster:AddDamageWithLocate( DT_GAINT_FALLING_STONE, -0.55, 4.9)
			pMonster:AddDamageWithLocate( DT_GAINT_FALLING_STONE_2, -1.70, 8.0)
			pMonster:AddTraceParticleToBone( "Giant_Clap_Wall_01", 1.0, 14, 0, 0, 0.0, 0.0 )
		else
			pMonster:AddDamageWithLocate( DT_GAINT_FALLING_STONE, 1.40, 4.5)
			pMonster:AddDamageWithLocate( DT_GAINT_FALLING_STONE_2, 1.00, 5.1)
			pMonster:AddDamageWithLocate( DT_GAINT_FALLING_STONE, 1.60, 5.4)
			pMonster:AddDamageWithLocate( DT_GAINT_FALLING_STONE_2, 0.20, 5.6)
			pMonster:AddDamageWithLocate( DT_GAINT_FALLING_STONE, 1.76, 5.9)
			pMonster:AddDamageWithLocate( DT_GAINT_FALLING_STONE_2, 0.90, 6.1)
			pMonster:AddDamageWithLocate( DT_GAINT_FALLING_STONE, 1.40, 6.3)
			pMonster:AddDamageWithLocate( DT_GAINT_FALLING_STONE, 0.30, 6.6)
			pMonster:AddDamageWithLocate( DT_GAINT_FALLING_STONE_2, 2.00, 7.1)
			pMonster:AddDamageWithLocate( DT_GAINT_FALLING_STONE, 0.00, 7.5)
			pMonster:AddDamageWithLocate( DT_GAINT_FALLING_STONE, 0.55, 4.9)
			pMonster:AddDamageWithLocate( DT_GAINT_FALLING_STONE_2, 1.70, 8.0)
			pMonster:AddTraceParticleToBone( "Giant_Clap_Wall_01", 1.0, 23, 0, 0, 0.0, 0.0 )
		end
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 파리채
function Giant_Attack04Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1) then
	elseif( iFrame == 65 ) then
		pMonster:StartAttack( 9, PAR_FRONTDOWN_1, 1.5, 13, 13, 18)
		pMonster:StartAttack( 9, PAR_FRONTDOWN_1, 1.5, 22, 22, 18)
	elseif( iFrame == 82 ) then
		pMonster:EndAttack()
    elseif( iFrame == 67 ) then
		pMonster:PlaySound(998031)
		if( pMonster:CheckState( "ATTACK04_UP" ) == true ) then
			posY = 6.2
		elseif( pMonster:CheckState( "ATTACK04_MIDDLE" ) == true ) then
			posY = 4.7
		else
			posY = 3.1
		end
		pMonster:AddParticle("Giant_Clap_01", 0.0, posY)
		pMonster:AddParticle("Giant_Clap_02", 0.0, posY)
		pMonster:AddParticle("Giant_Clap_03", 0.0, posY)
		pMonster:AddParticle("Giant_Clap_04", 0.0, posY)
		pMonster:AddParticle("Giant_Clap_05", 0.0, posY)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 레이쪼
function Giant_Attack05Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    local posY
    local angle
    if( iFrame <= 1) then
    elseif( iFrame == 50 ) then
		posY = 5.85
		pMonster:PlaySound(998033)
		pMonster:AddParticle("Giant_Beam_01", 0.0, posY)
		pMonster:AddParticle("Giant_Beam_02", 0.0, posY)
		pMonster:AddParticle("Giant_Beam_03", 0.0, posY)
		pMonster:AddParticle("Giant_Beam_04", 0.0, posY)
		pMonster:ComputeAngleToTarget( 0.0, 5.85 ) -- 타겟으로의 각도를 계산
	elseif( iFrame == 51 ) then
		angle = pMonster:GetAngleToTarget()
		if( pMonster:GetX() > pMonster:GetTargetX() ) then
			angle = angle * -1.0 + 3.141592
		end
		pMonster:AddDamageWithLocateAngle( DT_GIANT_LASER_BEAM, 0.0, 5.85, false, angle )
	elseif( iFrame == 70 ) then
		posY = 5.85
		pMonster:PlaySound(998033)
		pMonster:AddParticle("Giant_Beam_01", 0.0, posY)
		pMonster:AddParticle("Giant_Beam_02", 0.0, posY)
		pMonster:AddParticle("Giant_Beam_03", 0.0, posY)
		pMonster:AddParticle("Giant_Beam_04", 0.0, posY)
	elseif( iFrame == 71 ) then
		pMonster:SetTarget( 0, -2024, 2000, 2024, -800 )
		pMonster:ComputeAngleToTarget( 0.0, 5.85 ) -- 타겟으로의 각도를 계산
		angle = pMonster:GetAngleToTarget()
		if( pMonster:GetX() > pMonster:GetTargetX() ) then
			angle = angle * -1.0 + 3.141592
		end
		pMonster:AddDamageWithLocateAngle( DT_GIANT_LASER_BEAM, 0.0, 5.85, false, angle )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  죽었어
function Giant_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame == 2 ) then
		pMonster:PlaySound(998020)
		pMonster:AddTraceParticleToBone( "Giant_Clap_Dust_01", 1.0, 3, 0, 0, posx, -0.1 )		-- 문
		pMonster:AddTraceParticleToBone( "Giant_Clap_Dust_01", 1.0, 9, 0, 0, posx, -0.1 )		-- 입
		pMonster:AddTraceParticleToBone( "Giant_Clap_Dust_01", 1.0, 9, 0, 0, posx, -0.1 )		-- 팔꿈치 왼
		pMonster:AddTraceParticleToBone( "Giant_Clap_Dust_01", 1.0, 10, 0, 0, posx, -0.1 )	-- 팔꿈치 오른
		pMonster:AddTraceParticleToBone( "Giant_Clap_Dust_01", 1.0, 18, 0, 0, posx, -0.1 )	-- 손목 왼
		pMonster:AddTraceParticleToBone( "Giant_Clap_Dust_01", 1.0, 19, 0, 0, posx, -0.1 )	-- 손목 오른
		pMonster:AddTraceParticleToBone( "Giant_Clap_Dust_01", 1.0, 31, 0, 0, posx, -0.1 )	-- 발목 왼
		pMonster:AddTraceParticleToBone( "Giant_Clap_Dust_01", 1.0, 27, 0, 0, posx, -0.1 )	-- 발목 오른
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster(true)
        pMonster:SetFrameLock( true )
    end
end

--  죽었어
function Giant_EndFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
		pMonster:SetY(0.0)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end


-----------------------------------------------------------------------
-- 컨디션체크
-----------------------------------------------------------------------
function Giant_Check_Targeting( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:SetTarget( 0, -2024, 2000, 2024, -800 ) == true ) then
		pMonster:ResetDelay()
	end
end

function Giant_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    
	pMonster:SetState( "ATTACK01" )
	pMonster:ResetDelay()
end

function Giant_Check_Attack02_UP( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 0, -800, 900, 800, -100, 2100 ) == true ) then
		pMonster:SetState( "ATTACK05" )
		pMonster:ResetDelay()
	end
end

function Giant_Check_Attack02_DOWN( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 0, -800, 2000, 800, 1000, 0 ) == true ) then
		pMonster:SetState( "ATTACK02_DOWN" )
		pMonster:ResetDelay()
	end
end

function Giant_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( -900, -600, 2500, 600, 1000, 0 ) == true ) then
		pMonster:SetState( "ATTACK03_L" )
		pMonster:ResetDelay()
	elseif( pMonster:CheckTargetInRange( 900, -600, 2500, 600, 1000, 0 ) == true ) then
		pMonster:SetState( "ATTACK03_R" )
		pMonster:ResetDelay()
	end
end

function Giant_Check_Attack04_UP( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 0, -900, 500, 900, -100, 2200 ) == true ) then
		pMonster:SetState( "ATTACK04_UP" )
		pMonster:ResetDelay()
	end
end

function Giant_Check_Attack04_MIDDLE( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 0, -700, 700, 700, -100, 1600 ) == true ) then
		pMonster:SetState( "ATTACK04_MIDDLE" )
		pMonster:ResetDelay()
	end
end

function Giant_Check_Attack04_DOWN( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 0, -900, 400, 900, -100, 1100 ) == true ) then
		pMonster:SetState( "ATTACK04_DOWN" )
		pMonster:ResetDelay()
	end
end

function Giant_Check_Attack05( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:SetTarget( 0, -2024, 2500, 2024, -800 ) == true ) then
		pMonster:SetState( "ATTACK05" )
		pMonster:ResetDelay()
	end
end

-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------
function OnGiant_Die( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    pMonster:SetState( "DIE" )
end

function OnGiant_End( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    pMonster:SetState( "END" )
end
