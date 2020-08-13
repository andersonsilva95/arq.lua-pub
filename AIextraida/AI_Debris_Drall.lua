-- AI_drall.lua

ActionList =
{	
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "drall_Wait.frm",
        Func    = "drall_WaitFunc",

        Trigger =
        {
			-- 타게팅
            {
                AICheckFrame        = 55,
                AIFunc              = "drall_Targeting",
                DelayFrame          = 200,
            },
            -- 타겟지움
            --{
            --    AICheckFrame        = 550,
            --    AIFunc              = "drall_Check_ReleaseTarget",
            --    DelayFrame          = 330,
            --},
            -- 타겟을 향해 턴
            {
                AICheckFrame        = 20,
                AIFunc              = "drall_Check_TurnToTarget",
                DelayFrame          = 20,
            },

            -- 걷기
            {
                AICheckFrame        = 165,
                AIFunc              = "drall_Check_Walk",
                DelayFrame          = 110,
            },

			-- 점프업
            {
                AICheckFrame        = 91,
                AIFunc              = "drall_Check_JumpUp",
                DelayFrame          = 100,
            },

            -- 점프다운
            {
                AICheckFrame        = 61,
                AIFunc              = "drall_Check_JumpDown",
                DelayFrame          = 80,
            },

			-- 패러독스 스윙 (점프)
            {
                AICheckFrame        = 10,
                AIFunc              = "drall_Check_Attack01",
                DelayFrame          = 90,
            },

			-- 패러독스 스윙 (상단)
            {
                AICheckFrame        = 110,
                AIFunc              = "drall_Check_Attack01_2",
                DelayFrame          = 330,
            },

            -- 3단 부스트
            {
                AICheckFrame        = 220,
                AIFunc              = "drall_Check_Attack02",
                DelayFrame          = 220,
            },

            -- 윈드밀 대쉬
            {
                AICheckFrame        = 55,
                AIFunc              = "drall_Check_Attack03",
                DelayFrame          = 550,
            },

            -- 스톰프 & 더블 스톰프 [50%]
            {
                AICheckFrame        = 200,
                AIFunc              = "drall_Check_Attack04",
                DelayFrame          = 400,
            },

            -- 데몬 파이어 (반격으로 사용)
            --{
            --    AICheckFrame        = 250,
            --    AIFunc              = "drall_Check_Attack06",
            --    DelayFrame          = 330,
            --},
        },
    },

    -- 이동
    {
        ID              = "WALK",
        Motion          = "drall_move.frm",
        Func            = "drall_WalkFunc",
        EnableMoveCheck = TRUE,
        MoveFailFunc    = "drall_MoveFail",

        Trigger =
        {
			-- 타게팅
			{
                AICheckFrame        = 55,
                AIFunc              = "drall_Targeting",
                DelayFrame          = 200,
            },
			-- 타겟을 향해 턴
            {
                AICheckFrame        = 15,
                AIFunc              = "drall_Check_TurnToTarget",
                DelayFrame          = 15,
            },

			-- 점프업
            {
                AICheckFrame        = 71,
                AIFunc              = "drall_Check_JumpUp",
                DelayFrame          = 80,
            },

            -- 점프다운
            {
                AICheckFrame        = 41,
                AIFunc              = "drall_Check_JumpDown",
                DelayFrame          = 60,
            },

			-- 멈춤 (+패러독스 스윙)
            {
                AICheckFrame        = 5,
                AIFunc              = "drall_Check_Stop",
                DelayFrame          = 30,
            },
        }
    },

    -- 패러독스 스윙
    {
        ID      = "ATTACK01",
        Motion  = "drall_Attack01.frm",
        Func    = "drall_Attack01Func",
    },
    
    -- 3단 부스트
    {
        ID      = "ATTACK02_L",
        Motion  = "drall_Attack02.frm",
        Func    = "drall_Attack02Func",
    },
    
    -- 3단 부스트
    {
        ID      = "ATTACK02_R",
        Motion  = "drall_attack02_B.frm",
        Func    = "drall_Attack02Func",
    },
    
    -- 윈드밀 대쉬
    {
        ID      = "ATTACK03",
        Motion  = "drall_Attack03.frm",
        Func    = "drall_Attack03Func",
    },
    
    -- 스톰프
    {
        ID      = "ATTACK04",
        Motion  = "drall_Attack04.frm",
        Func    = "drall_Attack04Func",
    },
    
    -- 더블 스톰프
    {
        ID      = "ATTACK05",
        Motion  = "drall_Attack05.frm",
        Func    = "drall_Attack05Func",
    },
    
    -- 데몬 파이어 A
    {
        ID      = "ATTACK06_L",
        Motion  = "drall_Attack06_A.frm",
        Func    = "drall_Attack06_AFunc",
    },
    
    -- 데몬 파이어 B
    {
        ID      = "ATTACK06_2_L",
        Motion  = "drall_Attack06_B.frm",
        Func    = "drall_Attack06_BFunc",
    },

    -- 데몬 파이어 A
    {
        ID      = "ATTACK06_R",
        Motion  = "drall_Attack07_A.frm",
        Func    = "drall_Attack06_AFunc",
    },
    
    -- 데몬 파이어 B
    {
        ID      = "ATTACK06_2_R",
        Motion  = "drall_Attack07_B.frm",
        Func    = "drall_Attack06_BFunc",
    },    
  
    -- 점프
    {
        ID      = "JUMP",
        Motion  = "drall_jump_up.frm",
        Func    = "drall_JumpFunc",
    },
    
    -- 점프
    {
        ID      = "JUMP_DOWN",
        Motion  = "drall_jump_down.frm",
        Func    = "drall_JumpDownFunc",
    },

    -- 점프
    {
        ID      = "JUMP_LANDING",
        Motion  = "drall_Jump_Landing.frm",
        Func    = "drall_ToWait",
    },

    -- 죽기 착지
    {
        ID      = "DIE_LANDING",
        Motion  = "drall_die.frm",
        Func    = "drall_DieLandingFunc",
        IsFallDownMotion    = TRUE,
    },
}

CallBack =
{
    Land    = "Ondrall_Land",
    Die     = "Ondrall_Die",
    Damage  = "Ondrall_Damage",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function Initdrall( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:AddParticle( "Nemo_Field_Boom_01", 0.0, 0.5 )
    pMonster:AddParticle( "Nemo_Field_Boom_02", 0.0, 0.5 )
    pMonster:AddParticle( "Nemo_Field_Boom_03", 0.0, 0.5 )
    pMonster:AddParticle( "Nemo_Field_Boom_05", 0.0, 0.5 )
    pMonster:AddParticle( "Nemo_Field_Boom_06", 0.0, 0.5 )
    pMonster:AddParticle( "Nemo_Field_Boom_09", 0.0, 0.5 )
    pMonster:AddParticle( "Debris_Tel_out", 0.0, 0.5 )

	pMonster:SetCountValue(0)
end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function drall_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	g_kCamera.WideMode = 8
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:TurnToTarget()
        pMonster:SetState( "WAIT" )
    end
end

-- 걷기 상태
function drall_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetRunSpeed() )
        
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
end

-- 죽기 착지
function drall_DieLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame == 2 ) then
		pMonster:PlaySound(984001)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

--  패러독스 스윙
function drall_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 27 ) then 
	    pMonster:AddDamage(DT_DEBRIS_DRALL_ATK1)
	    pMonster:SetDrawSlash( 0 , true )
	    pMonster:PlaySound(984002)
	elseif( iFrame == 48 ) then
	    pMonster:SetDrawSlash( 0 , false )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  3단 부스트 
function drall_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )

    elseif( iFrame == 35 ) then
		if( pMonster:GetIsRight() ) then
        	pMonster:AddParticle( "Drall_Rage_02", 0.0, 0.2 )
	    	pMonster:AddParticle( "Drall_Rage_03", 0.0, 0.2 )
		else
			pMonster:AddParticle( "Drall_Rage_02", -0.15, 0.2 )
	    	pMonster:AddParticle( "Drall_Rage_03", -0.15, 0.2 )
		end
		pMonster:PlaySound(984021)

	elseif( iFrame == 40 ) then
		if( pMonster:GetIsRight() ) then
			pMonster:AddParticle( "Drall_HandFlame_01", 0.7, 0.55 )
	    	pMonster:AddParticle( "Drall_HandFlame_02", 0.7, 0.55 )
		else
	    	pMonster:AddParticle( "Drall_HandFlame_01", -0.7, 0.45 )
	    	pMonster:AddParticle( "Drall_HandFlame_02", -0.7, 0.45 )
		end

	elseif( iFrame == 73 ) then
	    local posX = pMonster:GetX()
	    local posY = pMonster:GetY()
	    pMonster:AddDamageWithLocate( DT_DEBRIS_DRALL_ATK2, posX, posY + 0.25, true, false )
	    pMonster:AddDamageWithLocate( DT_DEBRIS_DRALL_ATK2, posX, posY + 0.25, true, true )
	    
	    pMonster:AddParticleNoDirection( "HellBigboy_Punch_01", 0.0, 0.0 )
	    pMonster:AddParticleNoDirection( "HellBigboy_Punch_02", 0.0, 0.0 )
	    pMonster:AddParticleNoDirection( "HellBigboy_Punch_03", -0.1, 0.0 )
	    pMonster:AddParticleNoDirection( "HellBigboy_Punch_03_R", 0.1, 0.0 )
	    pMonster:AddParticleNoDirection( "Deathworm_Storm_07", 0.0, 0.0 )
        pMonster:PlaySound(984003)
        
	elseif( iFrame == 95 ) then
	    local posX = pMonster:GetX()
	    local posY = pMonster:GetY()
	    pMonster:AddDamageWithLocate( DT_DEBRIS_DRALL_ATK2, posX, posY + 0.65, true, false )
	    pMonster:AddDamageWithLocate( DT_DEBRIS_DRALL_ATK2, posX, posY + 0.65, true, true )
	    
	    pMonster:AddParticleNoDirection( "HellBigboy_Punch_01", 0.0, 0.35 )
	    pMonster:AddParticleNoDirection( "HellBigboy_Punch_02", 0.0, 0.35 )
	    pMonster:AddParticleNoDirection( "HellBigboy_Punch_03", -0.1, 0.35 )
	    pMonster:AddParticleNoDirection( "HellBigboy_Punch_03_R", 0.1, 0.35 )
	    pMonster:AddParticleNoDirection( "Deathworm_Storm_07", 0.0, 0.35 )
	    pMonster:PlaySound(984003)
	elseif( iFrame == 117 ) then
	    local posX = pMonster:GetX()
	    local posY = pMonster:GetY()
	    
	    pMonster:AddDamageWithLocate( DT_DEBRIS_DRALL_ATK2, posX, posY + 1.05, true, false )
	    pMonster:AddDamageWithLocate( DT_DEBRIS_DRALL_ATK2, posX, posY + 1.05, true, true )
	    
	    pMonster:AddParticleNoDirection( "HellBigboy_Punch_01", 0.0, 0.75 )
	    pMonster:AddParticleNoDirection( "HellBigboy_Punch_02", 0.0, 0.75 )
	    pMonster:AddParticleNoDirection( "HellBigboy_Punch_03", -0.1, 0.75 )
	    pMonster:AddParticleNoDirection( "HellBigboy_Punch_03_R", 0.1, 0.75 )
	    pMonster:AddParticleNoDirection( "Deathworm_Storm_07", 0.0, 0.75 )
	    pMonster:PlaySound(984003)

	elseif( iFrame == 118 ) then
		if( pMonster:GetIsRight() ) then
	    	pMonster:AddParticle( "Deathworm_Storm_05", 0.5, 0.55 )
	    	pMonster:AddParticle( "Deathworm_Storm_07", 0.5, 0.55 )
		else
			pMonster:AddParticle( "Deathworm_Storm_05", -0.4, 0.55 )
	    	pMonster:AddParticle( "Deathworm_Storm_07", -0.4, 0.55 )
		end

    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 윈드밀 대쉬 
function drall_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 30 ) then
		pMonster:SkillReadyEffectNoStop( 255, 128, 128, 0.20 )
	elseif( iFrame == 45 ) then
	    pMonster:AddDamage(DT_DEBRIS_DRALL_ATK3)
	    pMonster:PlaySound(984004)
	    pMonster:AddParticle( "FlameBasil_Windy", 0.0, 0.0 )
	elseif( iFrame == 71 ) then 
	    pMonster:AddParticle( "Guardiankung_Shining_02", 0.1, 0.23 )
	    pMonster:AddParticle( "Vulcanus_Rageboom_Under", 0.5, 0.12 )
	elseif( iFrame == 82 ) then
	    pMonster:AddDamage(DT_DEBRIS_DRALL_ATK3_2)
	    --pMonster:SetDrawSlash( 0 , true )
	elseif( iFrame == 85 ) then
	    if( pMonster:GetIsRight() ) then 
		pMonster:AddParticleNoDirection( "Guardiankung_Shining_05", 0.4, 0.25 )
	    	pMonster:AddParticleNoDirection( "Drall_Upper", 0.65, 0.8 )
	    else
		pMonster:AddParticleNoDirection( "Guardiankung_Shining_05_R", -0.4, 0.25 )
	    	pMonster:AddParticleNoDirection( "Drall_Upper_R", -0.65, 0.8 )
	    end

    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end


--  스톰프
function drall_Attack04Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 43 ) then
	    pMonster:EarthQuake( 30, 0.06, 0.04 )
	    pMonster:AddParticle( "Vulcanus_Crash_01", 0.41, 0.12 )
	    pMonster:AddParticle( "Vulcanus_Crash_02", 0.41, 0.12 )
	    pMonster:AddParticle( "Vulcanus_Crash_03", 0.41, 0.12 )
	    pMonster:AddParticle( "Vulcanus_Crash_04", 0.41, 0.12 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  더블 스톰프
function drall_Attack05Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 43 ) then 
	    pMonster:EarthQuake( 30, 0.06, 0.04 )
	    pMonster:AddParticle( "Vulcanus_Crash_01", 0.41, 0.12 )
	    pMonster:AddParticle( "Vulcanus_Crash_02", 0.41, 0.12 )
	    pMonster:AddParticle( "Vulcanus_Crash_03", 0.41, 0.12 )
	    pMonster:AddParticle( "Vulcanus_Crash_04", 0.41, 0.12 )
	elseif( iFrame == 90 ) then 
	    pMonster:EarthQuake( 30, 0.06, 0.04 )
	    pMonster:AddParticle( "Vulcanus_Rageboom_Under", 0.0, 0.12 )
	    pMonster:AddParticle( "Vulcanus_Crash_01", 0.0, 0.12 )
	    pMonster:AddParticle( "Vulcanus_Crash_02", 0.0, 0.12 )
	    pMonster:AddParticle( "Vulcanus_Crash_03", 0.0, 0.12 )
	    --pMonster:AddParticle( "Vulcanus_Crash_04", 0.0, 0.12 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  데몬 파이어 A
function drall_Attack06_AFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 65 ) then 
		pMonster:AddParticle( "Vulcanus_Rageboom_01", 0.0, 0.2 )
	    pMonster:AddParticle( "Vulcanus_Rageboom_02", 0.0, 0.2 )
		pMonster:AddParticle( "Vulcanus_Rageboom_03", 0.0, 0.2 )
	    pMonster:AddParticle( "Vulcanus_Rageboom_04", 0.0, 0.2 )
		pMonster:PlaySound(984005)
	elseif( iFrame == 69 ) then
	    pMonster:AddDamage(DT_DEBRIS_DRALL_ATK4)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        if( pMonster:GetIsRight() ) then 
            pMonster:SetState( "ATTACK06_2_R" )
        else 
            pMonster:SetState( "ATTACK06_2_L" )
        end
    end
end

--  데몬 파이어 B
function drall_Attack06_BFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    local iDir = 1

    if( pMonster:GetIsRight() ) then
        iDir = 1
    else
        iDir = -1
    end
    
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
		pMonster:AddParticle( "Drall_Spin_01", 0.0, 0.0 )
		pMonster:AddParticle( "Drall_Spin_02", 0.0, 0.2 )
		pMonster:AddParticle( "Drall_Spin_03", 0.0, 0.2 )
	elseif( math.mod(iFrame, 26 ) == 2 and iFrame <= 200  ) then
        --pMonster:AddDamageWithLocateAngle( DT_DEBRIS_DRALL_ATK4_2_1, 0.0, 0.0, false, 1.57 * iDir )
        --pMonster:AddDamageWithLocateAngle( DT_DEBRIS_DRALL_ATK4_2_2, 0.0, 0.0, false, 4.71 * iDir )
		pMonster:AddDamage(DT_DEBRIS_DRALL_ATK4_2_1)
		pMonster:AddDamage(DT_DEBRIS_DRALL_ATK4_2_2)

		if( iFrame == 2 ) then
	        pMonster:AddDamageWithLocateAngle( DT_DEBRIS_DRALL_ATK4_2_3, 0.0, 0.0, false, 0.13 * iDir )
	        pMonster:AddDamageWithLocateAngle( DT_DEBRIS_DRALL_ATK4_2_4, 0.0, 0.0, false, 3.27 * iDir )
		elseif( iFrame == 28 ) then
	        pMonster:AddDamageWithLocateAngle( DT_DEBRIS_DRALL_ATK4_2_3, 0.0, 0.0, false, 0.13 * iDir )
	        pMonster:AddDamageWithLocateAngle( DT_DEBRIS_DRALL_ATK4_2_4, 0.0, 0.0, false, 3.27 * iDir )
		elseif( iFrame == 54 ) then
	        pMonster:AddDamageWithLocateAngle( DT_DEBRIS_DRALL_ATK4_2_3, 0.0, 0.0, false, -0.13 * iDir )
	        pMonster:AddDamageWithLocateAngle( DT_DEBRIS_DRALL_ATK4_2_4, 0.0, 0.0, false, 3.01 * iDir )
		elseif( iFrame == 80 ) then
	        pMonster:AddDamageWithLocateAngle( DT_DEBRIS_DRALL_ATK4_2_3, 0.0, 0.0, false, 0.13 * iDir )
	        pMonster:AddDamageWithLocateAngle( DT_DEBRIS_DRALL_ATK4_2_4, 0.0, 0.0, false, 3.27 * iDir )
		elseif( iFrame == 106 ) then
	        pMonster:AddDamageWithLocateAngle( DT_DEBRIS_DRALL_ATK4_2_3, 0.0, 0.0, false, -0.13 * iDir )
	        pMonster:AddDamageWithLocateAngle( DT_DEBRIS_DRALL_ATK4_2_4, 0.0, 0.0, false, 3.01 * iDir )
		elseif( iFrame == 132 ) then
	        pMonster:AddDamageWithLocateAngle( DT_DEBRIS_DRALL_ATK4_2_3, 0.0, 0.0, false, -0.13 * iDir )
	        pMonster:AddDamageWithLocateAngle( DT_DEBRIS_DRALL_ATK4_2_4, 0.0, 0.0, false, 3.01 * iDir )
		elseif( iFrame == 158 ) then
	        pMonster:AddDamageWithLocateAngle( DT_DEBRIS_DRALL_ATK4_2_3, 0.0, 0.0, false, 0.13 * iDir )
	        pMonster:AddDamageWithLocateAngle( DT_DEBRIS_DRALL_ATK4_2_4, 0.0, 0.0, false, 3.27 * iDir )
		elseif( iFrame == 184 ) then
	        pMonster:AddDamageWithLocateAngle( DT_DEBRIS_DRALL_ATK4_2_3, 0.0, 0.0, false, -0.13 * iDir )
	        pMonster:AddDamageWithLocateAngle( DT_DEBRIS_DRALL_ATK4_2_4, 0.0, 0.0, false, 3.01 * iDir )
		end

		pMonster:PlaySound(984006)

    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  점프 상태
function drall_JumpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	 if( pMonster:GetSpeedY() <= 0.0 ) then
		pMonster:SetState("JUMP_DOWN")
		pMonster:SetFrameLock( false )
	end

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
	       pMonster:SetFrameLock( true )

    end
end

--  점프 다운 상태
function drall_JumpDownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

--  점프 상태
function drall_ToWait( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-----------------------------------------------------------------------
-- 컨디션체크
-----------------------------------------------------------------------

function drall_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 0, -3400, 1100, 3400, -1100 ) == true ) then
		pMonster:TurnToTarget()
        pMonster:ResetDelay()
    end  
end

function drall_Check_ReleaseTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 0, -1200, 800, 1200, -800 ) == false and pMonster:FloatRand() < 0.5 ) then
		pMonster:ReleaseTarget()
		pMonster:ResetDelay()
	end
end

function drall_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function drall_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		if( pMonster:CheckTargetInRange( 0, -370, 1100, 370, -1100 ) == false ) then
			pMonster:TurnToTarget()
			pMonster:SetState( "WALK" )
			pMonster:ResetDelay()
		end
	end
end

function drall_Check_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 0, -370, 1100, 370, -1100 ) == true ) then
		if( pMonster:CheckTargetInRange( 270, -250, 380, 250, -90 ) == true ) then
			pMonster:SetState( "ATTACK01" )
		else
			pMonster:SetSpeedX( 0.0 )
			pMonster:SetState( "WAIT" )
		end
		pMonster:ResetDelay()
	end
end

function drall_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 270, -250, 380, 250, -90 ) == true) then
		if( pMonster:GetCountValue() >= 1 ) then
			pMonster:SetState( "ATTACK01" )
			pMonster:ResetDelay()

			pMonster:SetCountValue(0)
		end
	end
end

function drall_Check_Attack01_2( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 270, -250, 380, 250, 250 ) == true ) then
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
	end
end 

function drall_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    
		
	if( pMonster:CheckTargetInRange( 0, -3800, 380, 3800, -100 ) == true ) then
	    if( pMonster:GetIsRight() ) then
		    pMonster:SetState( "ATTACK02_R" )
		    pMonster:ResetDelay()
		else
		    pMonster:SetState( "ATTACK02_L" )
		    pMonster:ResetDelay()
		end
	end
end

function drall_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    
		
	if( pMonster:CheckTargetInRange( 400, -400, 380, 400, -90 ) == true ) then
		pMonster:SetState( "ATTACK03" )
		pMonster:ResetDelay()
	end
end

function drall_Check_Attack04( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:FloatRand() < 0.5 ) then
		if( pMonster:FloatRand() < 0.5 ) then
			pMonster:SetState( "ATTACK04" )
		else
			pMonster:SetState( "ATTACK05" )
		end
		pMonster:ResetDelay()
	end
end

function drall_Check_Attack06( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:IsTarget() == true ) then
		if( pMonster:FloatRand() < 0.5 ) then
	        if( pMonster:GetIsRight() ) then 
			    pMonster:SetState( "ATTACK06_R" )
			else
			    pMonster:SetState( "ATTACK06_L" )
			end
			pMonster:ResetDelay()
		end
	end
end

function drall_Check_JumpUp( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 220, -220, 1200, 220, 370 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		drall_Jump( iMonsterIndex )
		pMonster:SetState( "JUMP" )
		pMonster:ResetDelay()

		pMonster:SetCountValue(1)
	end
end

function drall_Check_JumpDown( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 300, -300, -100, 300, -1200 ) == true ) then
		pMonster:SetNoCheckContact(30)
		pMonster:SetIgnoreFHCheck(true)
		pMonster:SetState( "JUMP_DOWN" )
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )
		pMonster:SetSpeedY( 0.01 )	
		pMonster:ResetDelay()

		pMonster:SetCountValue(1)
	end
end

-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------
function Ondrall_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetSpeedX( pMonster:GetSpeedX() * (2.0 / 3.0) )
	
    if( pMonster:CheckState( "JUMP" ) == true or pMonster:CheckState( "JUMP_DOWN" ) == true ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "JUMP_LANDING" )
    end   
end

function Ondrall_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:TurnToTarget()
	
	if( pMonster:GetIsRight() == true ) then
		pMonster:SetSpeedX( -0.02 )
	else
		pMonster:SetSpeedX( 0.02 )
	end

	pMonster:SetState( "DIE_LANDING" )
end

function Ondrall_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
    pMonster:SetPushCheck( true )
    pMonster:SetSpeedX( (pMonster:GetSpeedX() * 3.0 ) / 10.0 )
    pMonster:SetSpeedY( 0 )
    
	if( pMonster:GetHP() <= (pMonster:GetMaxHP() * 0.5) ) then
		if( pMonster:IsSuperArmor() == false ) then
			if( pMonster:FloatRand() < 0.05 ) then
			    if( pMonster:GetIsRight() ) then
				    pMonster:SetState( "ATTACK06_R" )
				else 
				    pMonster:SetState( "ATTACK06_L" )
				end
			end
		end
	end
end

function drall_Jump( iMonsterIndex )
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
	
	pMonster:SetNoCheckContact(26 + (fSpeedY * 4.9))
	pMonster:TurnToTarget()
	pMonster:SetSpeedX( fSpeedX * 0.01 )
	pMonster:SetSpeedY( fSpeedY * 0.01 )
end

function drall_MoveFail( iMonsterIndex )
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