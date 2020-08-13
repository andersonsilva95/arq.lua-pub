-- AI_nemophila.lua

PHASESHIFT_HP = 0.8
local sheild_check = false

ActionList =
{	
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "nemophila_Wait.frm",
        Func    = "nemophila_WaitFunc",

        Trigger =
        {
			-- 쉴드 없어짐 체크
            {
                AICheckFrame        = 10,
                AIFunc              = "nemophila_Check_shield",
                DelayFrame          = 10,
            },
            
			-- 타게팅
            {
                AICheckFrame        = 75,
				AICheckFrame1       = 55,
				AICheckFrame2       = 30,
                AIFunc              = "nemophila_Check_Targeting",
                DelayFrame          = 110,
				DelayFrame1         = 75,
				DelayFrame2         = 50,
            },

            -- 타겟지움 (일단 안함)
            --{
            --    AICheckFrame        = 220,
            --    AIFunc              = "nemophila_Check_ReleaseTarget",
            --    DelayFrame          = 440,
            --},

            -- 타겟을 향해 턴
            {
                AICheckFrame        = 55,
                AIFunc              = "nemophila_Check_TurnToTarget",
                DelayFrame          = 55,
            },

            -- 실명의 저주 [75%]
            {
                AICheckFrame        = 200,
                AIFunc              = "nemophila_Check_Attack01",
                DelayFrame          = 800,
				DelayFrame1			= 650,
				DelayFrame2			= 550,
            },

            -- 영혼 지배
            {
                AICheckFrame        = 100,
				AICheckFrame1       = 75,
				AICheckFrame2       = 35,
                AIFunc              = "nemophila_Check_Attack02",
                DelayFrame          = 250,
				DelayFrame1			= 110,
				DelayFrame2			= 75,
            },

            -- 영혼의 불꽃1
            {
                AICheckFrame        = 30,
				AICheckFrame1       = 70,
				AICheckFrame2       = 55,
                AIFunc              = "nemophila_Check_Attack03",
                DelayFrame          = 150,
				DelayFrame1			= 150,
				DelayFrame2			= 75,
            },

			-- 텔레포트(타겟에서 도망치기)
            {
                AICheckFrame        = 75,
                AIFunc              = "nemophila_Check_Teleport",
                DelayFrame          = 75,
            },

            -- 영혼의 불꽃2
            {
                AICheckFrame        = 70,
				AICheckFrame1       = 30,
				AICheckFrame2       = 30,
                AIFunc              = "nemophila_Check_Attack04",
                DelayFrame          = 450,
				DelayFrame1			= 300,
				DelayFrame2			= 200,
            },
			
			-- 영혼의 불꽃3
            {
                AICheckFrame        = 110,
				AICheckFrame1       = 110,
				AICheckFrame2       = 55,
                AIFunc              = "nemophila_Check_Attack05",
                DelayFrame          = 550,
				DelayFrame1			= 450,
				DelayFrame2			= 350,
            },

			-- 저주의 샘
            {
                AICheckFrame        = 100,
				AICheckFrame1       = 100,
				AICheckFrame2       = 75,
                AIFunc              = "nemophila_Check_Attack06",
                DelayFrame          = 150,
				DelayFrame1			= 100,
				DelayFrame2			= 75,
            },
            
            -- 도플 갱어
            {
                AICheckFrame        = 100,
				AICheckFrame1       = 75,
				AICheckFrame2       = 35,
                AIFunc              = "nemophila_Check_Attack08",
                DelayFrame          = 750,
				DelayFrame1			= 350,
				DelayFrame2			= 110,
            },
			
			-- 다크 시드
            {
                AICheckFrame        = 20,
                AIFunc              = "nemophila_Check_Attack11",
                DelayFrame          = 20,
            },
			
            -- 무리의 보호
            {
                AICheckFrame        = 220,
				AICheckFrame1       = 110,
				AICheckFrame2       = 75,
                AIFunc              = "nemophila_Check_Attack12",
				DelayFrame          = 220,
				DelayFrame1			= 120,
				DelayFrame2			= 110,
            },
			
			-- 배반의 폭포
            {
                AICheckFrame        = 55,
                AIFunc              = "nemophila_Check_Attack09",
				DelayFrame          = 110,
				DelayFrame1			= 75,
				DelayFrame2			= 55,
            },
            
			-- 텔레포트(타겟에게로)
            {
                AICheckFrame        = 150,
				AICheckFrame1       = 110,
				AICheckFrame2       = 75,
                AIFunc              = "nemophila_Check_Teleport2",
                DelayFrame          = 300,
				DelayFrame1			= 250,
				DelayFrame2			= 150,
            },

        },
    },

    -- 이동
    {
        ID      = "WALK",
        Motion  = "nemophila_wait.frm",
        Func    = "nemophila_WalkFunc",

        Trigger =
        {
			-- 타게팅
			{
                AICheckFrame        = 75,
                AIFunc              = "nemophila_Check_Targeting",
                DelayFrame          = 110,
				DelayFrame1         = 75,
				DelayFrame2         = 50,
            },

			-- 타겟을 향해 턴
            {
                AICheckFrame        = 55,
                AIFunc              = "nemophila_Check_TurnToTarget",
                DelayFrame          = 55,
            },

            -- 텔레포트(타겟에서 도망치기)
            {
                AICheckFrame        = 55,
                AIFunc              = "nemophila_Check_Teleport2",
                DelayFrame          = 55,
            },
			
			-- 저주의 샘
            {
                AICheckFrame        = 100,
				AICheckFrame1       = 100,
				AICheckFrame2       = 75,
                AIFunc              = "nemophila_Check_Attack06",
                DelayFrame          = 150,
				DelayFrame1			= 100,
				DelayFrame2			= 75,
            },
			
			-- 도플 갱어
            {
                AICheckFrame        = 100,
				AICheckFrame1       = 75,
				AICheckFrame2       = 35,
                AIFunc              = "nemophila_Check_Attack08",
                DelayFrame          = 750,
				DelayFrame1			= 350,
				DelayFrame2			= 110,
            },
			
			-- 다크 시드
            {
                AICheckFrame        = 20,
                AIFunc              = "nemophila_Check_Attack11",
                DelayFrame          = 20,
            },
			
            -- 무리의 보호
            {
                AICheckFrame        = 220,
				AICheckFrame1       = 110,
				AICheckFrame2       = 75,
                AIFunc              = "nemophila_Check_Attack12",
				DelayFrame          = 220,
				DelayFrame1			= 220,
				DelayFrame2			= 220,
            },
			
			-- 배반의 폭포
            {
                AICheckFrame        = 75,
                AIFunc              = "nemophila_Check_Attack09",
				DelayFrame          = 110,
				DelayFrame1			= 75,
				DelayFrame2			= 55,
            },
			
			-- 멈추기
            {
                AICheckFrame        = 110,
                AIFunc              = "nemophila_Check_WalkStop",
                DelayFrame          = 150,
            },

        }
    },
    
    -- 쉴드깨짐!
    {
        ID      = "SHEILD_BREAK",
        Motion  = "nemophila_Attack11.frm",
        Func    = "nemophila_breakFunc",
    },
    
    -- 실명의 저주
    {
        ID      = "ATTACK01",
        Motion  = "nemophila_Attack01.frm",
        Func    = "nemophila_Attack01Func",
    },
    
    -- 영혼 지배(건트 변이)
    {
        ID      = "ATTACK02",
        Motion  = "nemophila_Attack02.frm",
        Func    = "nemophila_Attack02Func",
    },
    
    -- 영혼의 불꽃1
    {
        ID      = "ATTACK03",
        Motion  = "nemophila_Attack03.frm",
        Func    = "nemophila_Attack03Func",
    },
    
    -- 영혼의 불꽃2
    {
        ID      = "ATTACK04",
        Motion  = "nemophila_Attack03.frm",
        Func    = "nemophila_Attack04Func",
    },
    
    -- 영혼의 불꽃3
    {
        ID      = "ATTACK05",
        Motion  = "nemophila_Attack03.frm",
        Func    = "nemophila_Attack05Func",
    },

    -- 영혼의 불꽃 쏘는 중
    {
        ID      = "ATTACK03_ING",
        Motion  = "nemophila_Attack04.frm",
        Func    = "nemophila_Attack03_ingFunc",
    },

    -- 영혼의 불꽃 끝
    {
        ID      = "ATTACK03_END",
        Motion  = "nemophila_Attack05.frm",
        Func    = "nemophila_Attack03_endFunc",
    },

    -- 저주의 샘
    {
        ID      = "ATTACK06",
        Motion  = "nemophila_Attack06.frm",
        Func    = "nemophila_Attack06Func",
    },

    -- 도플갱어
    {
        ID      = "ATTACK08",
        Motion  = "nemophila_Attack08.frm",
        Func    = "nemophila_Attack08Func",
    },

    -- 배반의 폭포
    {
        ID      = "ATTACK09",
        Motion  = "nemophila_Attack09.frm",
        Func    = "nemophila_Attack09Func",
    },

    -- 강인한 건트 소환(그런데 다크시드로 되어 있음;)
    {
        ID      = "ATTACK10",
        Motion  = "nemophila_Attack10.frm",
        Func    = "nemophila_Attack10Func",
    },

    -- 다크시드
    {
        ID      = "ATTACK11",
        Motion  = "nemophila_Attack11.frm",
        Func    = "nemophila_Attack11Func",
    },
    
    -- 무리의 소환(나약한 건트 소환)
    {
        ID      = "ATTACK12",
        Motion  = "nemophila_Attack12.frm",
        Func    = "nemophila_Attack12Func",
    },
    
    -- 악마의 생명
    {
        ID      = "ATTACK13",
        Motion  = "nemophila_Attack13.frm",
        Func    = "nemophila_Attack13Func",
    },

    -- 데몬코어 카운트..
    {
        ID      = "COUNTER",
        Motion  = "nemophila_down01.frm",
        Func    = "nemophila_CounterFunc",
    },
    
    -- 데미지 중
    {
        ID      = "COUNTER_DOWN",
        Motion  = "nemophila_down02.frm",
        Func    = "nemophila_CounterDownFunc",
    },
    
    -- 데미지 하
    {
        ID      = "STANDUP",
        Motion  = "nemophila_standup.frm",
        Func    = "nemophila_StandupFunc",
    },

    -- 죽기
    {
        ID      = "DIE",
        Motion  = "nemophila_die.frm",
        Func    = "nemophila_DieFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- 텔레포트
    {
        ID      = "TELEPORT",
        Motion  = "nemophila_attack07_A.frm",
        Func    = "nemophila_TeleportFunc",
        
        Trigger =
        {
			-- 타게팅
			{
                AICheckFrame        = 10,
                AIFunc              = "nemophila_Check_TeleportLanding",
                DelayFrame          = 10,
            },
        }
    },
    
    -- 텔레포트 착지
    {
        ID      = "TELEPORT_LANDING",
        Motion  = "nemophila_attack07_B.frm",
        Func    = "nemophila_TeleportLandingFunc",
    },
    
    {
        ID      = "SUMMON",
        Motion  = "nemophila_attack02.frm",
        Func    = "nemophila_SummonFunc",
    },
    
    -- 죽기 착지
    {
        ID      = "DIE_LANDING",
        Motion  = "nemophila_die.frm",
        Func    = "nemophila_DieLandingFunc",
        IsFallDownMotion    = TRUE,
    },
}

CallBack =
{
    Land    = "Onnemophila_Land",
    Die     = "Onnemophila_Die",
    Damage  = "Onnemophila_Damage",
    --ShieldDamage= "Onnemophila_ShieldDamage"
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function Initnemophila( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    local pMon = g_MyD3D:GetMonster(13)
	pMon:EndMonster()
    pMonster:RegisterSummonMonsterType( MON_STRONG_GAUNT )
    pMonster:RegisterSummonMonsterType( MON_WEAK_GAUNT )
    pMonster:SetShield(100000)
    pMonster:SetShieldEffect("Hatshepsut_Fury_01", 0.0, 0.4)
    pMonster:SetShieldEffect("Hatshepsut_Fury_02", 0.0, 0.4)
    pMonster:SetShieldEffect("Setesh_Field_Effect_04", 0.0, 0.55)
    pMonster:SetShieldEffect("Nemo_Shield", 0.0, 0.37)
    sheild_check = false
end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function nemophila_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    pMonster:ToggleRender( true )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 대기 상태
function nemophila_SummonFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    pMonster:ToggleRender( true )

	if( iFrame == 2 ) then
		local posy = 0.0
		pMonster:AddParticle("nemophila_Summon_Circle_01", 0.0, posy)
		pMonster:AddParticle("nemophila_Summon_Circle_02", 0.0, posy)
		pMonster:AddParticle("nemophila_Summon_Circle_03", 0.0, posy)
		pMonster:AddParticle("nemophila_Summon_Circle_04", 0.0, posy)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
end

-- 대기 상태
function nemophila_StunFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    pMonster:ToggleRender( true )

	if( iFrame <= 1 ) then
		pMonster:InitTimer()
		pMonster:StartTimer()
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		if( pMonster:GetTimer() > 275 ) then
			pMonster:SetState( "WAIT" )
			pMonster:InitTimer()
		else
			pMonster:SetFrameLock( true )
		end
    end
end

-- 걷기 상태
function nemophila_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    pMonster:ToggleRender( true )

    pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
        
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
end

-- 죽는상태
function nemophila_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.0 )
	elseif( iFrame == 2 ) then
		pMonster:PlaySound( "986034" )			
	elseif( iFrame == 77 ) then
		pMonster:AddParticleNoDirection( "Nemo_Die_01", 0.05, 0.15 )
		pMonster:AddParticleNoDirection( "Nemo_Die_02", 0.05, 0.15 )
		pMonster:AddParticleNoDirection( "Nemo_Die_03", 0.05, 0.15 )
		pMonster:AddParticleNoDirection( "Nemo_Die_04", 0.05, 0.15 )
		pMonster:AddParticleNoDirection( "Nemo_Die_05", 0.05, 0.15 )
		pMonster:AddParticleNoDirection( "Nemo_Die_06", 0.05, 0.15 )
		pMonster:AddParticleNoDirection( "Nemo_Die_07", 0.05, 0.15 )
		pMonster:AddParticleNoDirection( "Nemo_Die_08", 0.05, 0.15 )

	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-- 죽는상태 착지
function nemophila_DieLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.0 )
	elseif( iFrame == 2 ) then
		pMonster:PlaySound( "986034" )
	elseif( iFrame == 77 ) then
		pMonster:AddParticleNoDirection( "Nemo_Die_01", 0, 0.1 )
		pMonster:AddParticleNoDirection( "Nemo_Die_02", 0, 0.1 )
		pMonster:AddParticleNoDirection( "Nemo_Die_03", 0, 0.1 )
		pMonster:AddParticleNoDirection( "Nemo_Die_04", 0, 0.1 )
		pMonster:AddParticleNoDirection( "Nemo_Die_05", 0, 0.1 )
		pMonster:AddParticleNoDirection( "Nemo_Die_06", 0, 0.1 )
		pMonster:AddParticleNoDirection( "Nemo_Die_07", 0, 0.1 )
		pMonster:AddParticleNoDirection( "Nemo_Die_08", 0, 0.1 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end



-- 데미지 입은거
function nemophila_CounterFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    pMonster:ToggleRender( true )

	if( iFrame == 6 ) then
		pMonster:PlaySound( "986033" )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "COUNTER_DOWN" )
    end
end

-- 데미지 입은거
local appa = 1
function nemophila_CounterDownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    pMonster:ToggleRender( true )

    if( iFrame >= pMonster:GetLastFrame() ) then
        if( appa >= 3 ) then
			pMonster:SetState( "STANDUP" )
		else
			appa = appa + 1
			pMonster:SetState( "COUNTER_DOWN" )
		end
    end
end

-- 데미지 입은거
function nemophila_StandupFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    pMonster:ToggleRender( true )

	appa = 1
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  근접공격 상태
function nemophila_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    pMonster:ToggleRender( true )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 6 ) then
		pMonster:PlaySound( "986017" )
	elseif( iFrame == 50 ) then
		local index = pMonster:GetLastAttackedMe()
		if ( index >= 0 and index < DUNGEON_PLAYER_NUM ) then
			local pPlayer = g_MyD3D:GetPlayer(index)
			if ( pPlayer:IsLocalPlayer() ) then
				pPlayer:AddDamage(DT_HERO_NEMOPHILLA_BLIND)
			end
			pMonster:AddDamageLastPlayers(DT_HERO_NEMOPHILLA_BLIND_SIGN)
		end
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  라이트닝 상태
function nemophila_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    pMonster:ToggleRender( true )

	if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
		elseif( iFrame == 84 ) then

			if( not pMonster:GetIsRight() ) then
				pMonster:AddParticleNoDirection( "Nemo_Change_Shot_01", -0.2, 0.95 )
				pMonster:AddParticleNoDirection( "Nemo_Change_Shot_02", -0.2, 0.95 )
				pMonster:AddParticleNoDirection( "Nemo_Change_Shot_03", -0.2, 0.95 )
			else
				pMonster:AddParticleNoDirection( "Nemo_Change_Shot_01", 0.2, 0.95 )
				pMonster:AddParticleNoDirection( "Nemo_Change_Shot_02_R", 0.2, 0.95 )
				pMonster:AddParticleNoDirection( "Nemo_Change_Shot_03_R", 0.2, 0.95 )
			end
		
		
			pMonster:AddDamage(DT_HERO_NEMOPHILLA_MIND_STARTER)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  영혼의 불꽃
function nemophila_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    pMonster:ToggleRender( true )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
		pMonster:SetCountValue(1)
	elseif( iFrame == 15 ) then
		pMonster:AddParticle( "Nemo_Flame_Shot_01", 0.42, 0.85 )
		pMonster:AddParticle( "Nemo_Flame_Shot_02", 0.38, 0.85 )
		pMonster:AddParticle( "Nemo_Flame_Shot_03", 0.42, 0.85 )
		pMonster:AddParticle( "Nemo_Flame_Shot_04", 0.35, 0.85 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "ATTACK03_ING" )
    end
end

--  영혼의 불꽃(쏘는 중)
local count = 1
function nemophila_Attack03_ingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    pMonster:ToggleRender( true )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 12 ) then
		pMonster:PlaySound( "986018" )
		pMonster:PlaySound( "986019" )
		
    elseif( iFrame == 15 ) then
		local offsetX = 0.3
		local offsetY = 0.9
		
		pMonster:ComputeAngleToTarget( offsetX, offsetY ) -- 타겟으로의 각도를 계산
		local angle = pMonster:GetAngleToTarget()
		if( ( pMonster:GetX() + offsetX > pMonster:GetTargetX() and pMonster:GetIsRight() ) or
		    ( pMonster:GetX() - offsetX< pMonster:GetTargetX() and not pMonster:GetIsRight() ) ) then
			angle = angle * -1.0 + 3.141592
		end
		if( pMonster:GetIsRight() ) then
			pMonster:AddDamageWithLocateAngle( DT_HERO_NEMOPHILLA_FLAME, offsetX, offsetY, false, angle )
		else
			pMonster:AddDamageWithLocateAngle( DT_HERO_NEMOPHILLA_FLAME, offsetX, offsetY, false, -angle )
		end
		pMonster:AddParticle( "Iblis_Laser_Shot_01", 0.34, 0.85 )
		pMonster:AddParticle( "Iblis_Laser_Shot_02", 0.34, 0.85 )
		pMonster:AddParticle( "Mistone_Spark_04", 0.34, 0.85 )
		
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        if( count >= pMonster:GetCountValue() ) then
			pMonster:SetState( "ATTACK03_END" )
		else
			count = count + 1
			pMonster:SetState( "ATTACK03_ING" )
		end
    end
end

--  영혼의 불꽃(끝)
function nemophila_Attack03_endFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    pMonster:ToggleRender( true )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
		count = 1
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end


-- 서먼
function nemophila_Attack04Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    local pMon = g_MyD3D:GetMonster( 1 )
    pMonster:ToggleRender( true )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
		pMonster:SetCountValue(2)		
    elseif( iFrame == 15 ) then
		pMonster:AddParticle( "Nemo_Flame_Shot_01", 0.42, 0.85 )
		pMonster:AddParticle( "Nemo_Flame_Shot_02", 0.38, 0.85 )
		pMonster:AddParticle( "Nemo_Flame_Shot_03", 0.42, 0.85 )
		pMonster:AddParticle( "Nemo_Flame_Shot_04", 0.35, 0.85 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "ATTACK03_ING" )
    end
end

-- 서먼
function nemophila_Attack05Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    pMonster:ToggleRender( true )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
		pMonster:SetCountValue(3)
	elseif( iFrame == 15 ) then
		pMonster:AddParticle( "Nemo_Flame_Shot_01", 0.42, 0.85 )
		pMonster:AddParticle( "Nemo_Flame_Shot_02", 0.38, 0.85 )
		pMonster:AddParticle( "Nemo_Flame_Shot_03", 0.42, 0.85 )
		pMonster:AddParticle( "Nemo_Flame_Shot_04", 0.35, 0.85 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "ATTACK03_ING" )
    end
end

-- 저주의 샘
function nemophila_Attack06Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    pMonster:ToggleRender( true )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 27 ) then
		pMonster:PlaySound( "986021" )
		pMonster:PlaySound( "986022" )
	elseif( iFrame == 30 ) then
		pMonster:AddDamageWithLocate( DT_HERO_NEMOPHILLA_CURSE_SPRING, pMonster:GetTargetX(), pMonster:GetTargetY(), true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 서먼
function nemophila_Attack07Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    local pMon = g_MyD3D:GetMonster( 1 )
    pMonster:ToggleRender( true )
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 도플갱어
function nemophila_Attack08Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    local pMon = g_MyD3D:GetMonster(13)
    pMonster:ToggleRender( true )
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
		
	elseif( iFrame == 6 ) then
		pMonster:PlaySound( "986023" )
		pMonster:PlaySound( "986024" )
	elseif( iFrame == 47 ) then
		pMonster:AddParticle( "Nemo_Summon_01",0.5, 0.35 )
		pMonster:AddParticle( "Nemo_Summon_02",0.5, 0.35 )
		pMonster:AddParticle( "Nemo_Summon_03",0.5, 0.35 )
		pMonster:AddParticle( "Nemo_Summon_04",0.5, 0.35 )
		pMonster:AddParticle( "Nemo_Summon_05",0.5, 0.35 )
		pMonster:AddParticle( "Nemo_Summon_06",0.5, 0.35 )
		pMonster:AddParticle( "Nemo_Summon_07",0.5, 0.35 )
		pMonster:AddParticle( "Nemo_Summon_08",0.5, 0.35 )
		pMonster:AddParticle( "Nemo_Summon_09",0.5, 0.35 )
		pMonster:AddParticle( "Nemo_Summon_10",0.5, 0.35 )
		pMonster:AddParticle( "Nemo_Summon_11",0.5, 0.35 )
		pMonster:AddParticle( "Nemo_Summon_12",0.5, 0.35 )
		pMonster:AddParticle( "Bingo_Resserection_01",0.5, 0.35 )
		pMonster:AddParticle( "Bingo_Resserection_02",0.5, 0.35 )
		pMonster:AddParticle( "Bingo_Resserection_03",0.5, 0.35 )
		pMonster:AddParticle( "Box_Open_05",0.5, 0.35 )
	elseif( iFrame == 50 ) then
		--pMonster:PlaySound( "986025" )
	elseif( iFrame == 145 ) then
		
		pMon:StartMonster( MON_NEMOPHILLA_GHOST, pMon:GetLevel() )
		
		local posx = 0.5
		if( false == pMonster:GetIsRight() ) then
			posx = posx * -1.0
		end
		pMon:SetX( pMonster:GetX() + posx )
		pMon:SetY( pMonster:GetY() )
		pMon:SetIsRight( pMonster:GetIsRight() )
		pMon:SetState("SUMMON")
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 배반의 폭포
function nemophila_Attack09Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    local pMon = g_MyD3D:GetMonster( 1 )
    pMonster:ToggleRender( true )
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 27 ) then
		pMonster:PlaySound(999062)
		--pMonster:PlaySound( "986027" )
	elseif( iFrame == 30 ) then
		pMonster:AddDamageWithLocate( DT_HERO_NEMOPHILLA_FALL, pMonster:GetTargetX(), pMonster:GetTargetY(), true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 데몬코어 시간경과 시 ALL KILL
function nemophila_Attack10Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    local pMon = g_MyD3D:GetMonster( 1 )
	local particlePosY = 0.6
    pMonster:ToggleRender( true )
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 39 ) then
		pMonster:PlaySound(999062)
		for i = 0, 5 do
			pMonster:AddDamageWithLocate(DT_HERO_DEMONCORE_FAIL, 1.9, particlePosY, true )
			pMonster:AddDamageWithLocate(DT_HERO_DEMONCORE_FAIL, 2.5, particlePosY, true )
			particlePosY = particlePosY + 0.6
		end
		particlePosY = 3.55
	elseif( iFrame == 44 ) then
		pMonster:PlaySound(999062)
		for i = 0, 5 do
			pMonster:AddDamageWithLocate(DT_HERO_DEMONCORE_FAIL, 1.3, particlePosY, true )
			pMonster:AddDamageWithLocate(DT_HERO_DEMONCORE_FAIL, 3.1, particlePosY, true )
			particlePosY = particlePosY + 0.6
		end
		particlePosY = 5.55
	elseif( iFrame == 49 ) then
		pMonster:PlaySound(999062)
		for i = 0, 5 do
			pMonster:AddDamageWithLocate(DT_HERO_DEMONCORE_FAIL, 0.7, particlePosY, true )
			pMonster:AddDamageWithLocate(DT_HERO_DEMONCORE_FAIL, 3.7, particlePosY, true )
			particlePosY = particlePosY + 0.6
		end
		
		particlePosY = 0.55
	elseif( iFrame == 54 ) then
		for i = 0, 5 do
			pMonster:AddDamageWithLocate(DT_HERO_DEMONCORE_FAIL, 0.1, particlePosY, true )
			pMonster:AddDamageWithLocate(DT_HERO_DEMONCORE_FAIL, 4.2, particlePosY, true )
			particlePosY = particlePosY + 0.6
		end
		
		particlePosY = 3.55
		pMonster:PlaySound(999062)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 다크시드
function nemophila_Attack11Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    local pMon = g_MyD3D:GetMonster( 1 )
    pMonster:ToggleRender( true )
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 27 ) then
		pMonster:PlaySound( "986029" )
	elseif( iFrame == 30 ) then
		local posx = 0.45
		local posy = 0.3
		
		
		pMonster:AddDamage(DT_HERO_NEMOPHILLA_FIELD)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end


-- 서먼
function nemophila_breakFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    local pMon = g_MyD3D:GetMonster( 1 )
    pMonster:ToggleRender( true )
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
		pMonster:SetShield(0.0)
	elseif( iFrame == 27 ) then
		pMonster:PlaySound( "986029" )
	elseif( iFrame == 30 ) then
		local posx = 0.45
		local posy = 0.3
		
		
		pMonster:AddDamage(DT_HERO_NEMOPHILLA_FIELD)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 서먼
function nemophila_Attack12Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    local pMon = g_MyD3D:GetMonster( 1 )
    pMonster:ToggleRender( true )
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 27 ) then
		pMonster:PlaySound( "986028" )
		local posy = 1
		pMonster:AddParticle("Nemo_Summon_Gunt_01", 0.5, posy)
		pMonster:AddParticle("Nemo_Summon_Gunt_02", 0.5, posy)
		pMonster:AddParticle("Nemo_Summon_Gunt_03", 0.5, posy)
	elseif( iFrame == 80 ) then
        local pMon = KSummonInfo()
        pMon:Init()
        pMon:SetState("SUMMON")
        pMon.iMonType = MON_WEAK_GAUNT
        pMon.fX = -200
        pMon.fY = 200
        pMonster:SummonMonster( pMon )
		local pMon = KSummonInfo()
        pMon:Init()
        pMon:SetState("SUMMON")
        pMon.iMonType = MON_WEAK_GAUNT
        pMon.fX = -100
        pMon.fY = 0
        pMonster:SummonMonster( pMon )
		local pMon = KSummonInfo()
        pMon:Init()
        pMon:SetState("SUMMON")
        pMon.iMonType = MON_WEAK_GAUNT
        pMon.fX = 100
        pMon.fY = 0
        pMonster:SummonMonster( pMon )
		local pMon = KSummonInfo()
        pMon:Init()
        pMon:SetState("SUMMON")
        pMon.iMonType = MON_WEAK_GAUNT
        pMon.fX = 200
        pMon.fY = 200
        pMonster:SummonMonster( pMon )
		
--	elseif( iFrame == 73 ) then

		
        local pMon = KSummonInfo()
        pMon:Init()
        pMon:SetState("SUMMON")
        pMon.iMonType = MON_WEAK_GAUNT
        pMon.fX = -250
        pMon.fY = 250
        pMonster:SummonMonster( pMon )
		local pMon = KSummonInfo()
        pMon:Init()
        pMon:SetState("SUMMON")
        pMon.iMonType = MON_WEAK_GAUNT
        pMon.fX = -150
        pMon.fY = 0
        pMonster:SummonMonster( pMon )
		local pMon = KSummonInfo()
        pMon:Init()
        pMon:SetState("SUMMON")
        pMon.iMonType = MON_WEAK_GAUNT
        pMon.fX = 150
        pMon.fY = 0
        pMonster:SummonMonster( pMon )
		local pMon = KSummonInfo()
        pMon:Init()
        pMon:SetState("SUMMON")
        pMon.iMonType = MON_WEAK_GAUNT
        pMon.fX = 250
        pMon.fY = 250
        pMonster:SummonMonster( pMon )
--	elseif( iFrame == 123 ) then		
		
        local pMon = KSummonInfo()
        pMon:Init()
        pMon:SetState("SUMMON")
        pMon.iMonType = MON_WEAK_GAUNT
        pMon.fX = -350
        pMon.fY = 0
        pMonster:SummonMonster( pMon )
		local pMon = KSummonInfo()
        pMon:Init()
        pMon:SetState("SUMMON")
        pMon.iMonType = MON_WEAK_GAUNT
        pMon.fX = -350
        pMon.fY = 0
        pMonster:SummonMonster( pMon )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 악마의 생명
function nemophila_Attack13Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    local pMon = g_MyD3D:GetMonster( 1 )
    pMonster:ToggleRender( true )
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 20 ) then
		--pMonster:PlaySound( "986030" )
		pMonster:PlaySound( "986031" )
		local posy = 1.17
		pMonster:AddParticleNoDirection( "Nemo_DemonCast_01", 0, posy )
		pMonster:AddParticleNoDirection( "Nemo_DemonCast_02", 0, posy )
		pMonster:AddParticleNoDirection( "Nemo_DemonCast_03", 0, posy )
		pMonster:AddParticleNoDirection( "Nemo_DemonCast_04", 0, posy )
		pMonster:AddParticleNoDirection( "Nemo_DemonCast_05", 0, posy )
		pMonster:AddParticleNoDirection( "Nemo_DemonCast_06", 0, posy )
		pMonster:AddParticleNoDirection( "Nemo_DemonCast_07", 0, posy )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  점프 상태
function nemophila_JumpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )				
    end
end

--  텔레포트 상태
function nemophila_TeleportFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:AddParticle( "nemophila_Warp_01", 0.0, -0.34 )
		pMonster:AddParticle( "nemophila_Warp_02", 0.0, -0.34 )
    elseif( iFrame == 2 ) then
		pMonster:ToggleRender( false )
		pMonster:SetPushCheck( false )
		pMonster:SetInvincibleFrame( 20 )
		pMonster:PlaySound( "995026" )
		
		local fRand = pMonster:FloatRand()
		local fDistX = 0.2

		if ( fRand < 0.5 ) then			
			fDistX = 0.2
			if( pMonster:GetTargetIsRight() == true ) then
				pMonster:SetX( pMonster:GetTargetX() - fDistX )
			else
				pMonster:SetX( pMonster:GetTargetX() + fDistX )
			end
			
			pMonster:SetCountValue( 1 )
			
		elseif ( fRand <= 1.0 ) then
			fDistX = 0.7
			if( pMonster:FloatRand() < 0.5 ) then
				pMonster:SetX( pMonster:GetTargetX() - fDistX )
			else
				pMonster:SetX( pMonster:GetTargetX() + fDistX )
			end
			
			pMonster:SetCountValue( 2 )
			
		elseif ( fRand < 1.0 ) then		-- 딜단 현재 안들어오게 함
			fDistX = 0.3
			if( pMonster:FloatRand() < 0.5 ) then
				pMonster:SetX( pMonster:GetTargetX() - fDistX )
			else
				pMonster:SetX( pMonster:GetTargetX() + fDistX )
			end
			
			pMonster:SetCountValue( 3 )		
		end
		
		local posy = pMonster:GetTargetY()
		if ( posy < 4.5 ) then
			pMonster:SetY( 4.6 )
		else
			pMonster:SetY( posy + 0.1 )
		end
		
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

--  텔레포트 착지 상태
function nemophila_TeleportLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame == 1 ) then
		pMonster:AddParticle( "Iblis_Teleport_01", 0.0, 0.74 )
		pMonster:AddParticle( "Iblis_Teleport_02", 0.0, 0.74 )
		pMonster:AddParticle( "Iblis_Teleport_03", 0.0, 0.74 )
    elseif( iFrame == 6 ) then
		pMonster:ToggleRender( true )
		pMonster:SetPushCheck( true )
    elseif( iFrame == 10 ) then
		pMonster:SetInvincible( false )
	elseif( iFrame >= 15 ) then
	--[[
        if( pMonster:GetCountValue() == 1 ) then
			pMonster:SetState( "ATTACK03" )   -- 더블
		elseif( pMonster:GetCountValue() == 2 ) then
			pMonster:SetState( "ATTACK01" )   -- 볼꽃
		elseif( pMonster:GetCountValue() == 3 ) then
			pMonster:SetState( "ATTACK04" )   -- 메테오
		else
		--]]
			pMonster:SetState( "WAIT" )   -- 가만있기
		--end
		
		pMonster:SetCountValue(0)
    end
end
-----------------------------------------------------------------------
-- 컨디션체크
-----------------------------------------------------------------------

function nemophila_Check_shield( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( sheild_check == false and pMonster:GetShield() <= 100.0 ) then
		pMonster:SetState("SHEILD_BREAK")
		sheild_check = true
    end
end

function nemophila_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 0, -1500, 1000, 1500, -300 ) == true ) then
		pMonster:TurnToTarget()
        pMonster:ResetDelay()
    end
end

function nemophila_Check_ReleaseTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 0, -1000, 1000, 1000, -300 ) == false ) then
		pMonster:ReleaseTarget()
		pMonster:ResetDelay()
	end
end

function nemophila_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function nemophila_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 200, -1000, 380, 1000, -100 ) == true ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "WALK" )
        pMonster:ResetDelay()
    end
end

function nemophila_Check_WalkStop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 100, -200, 400, 200, -400 ) == true or pMonster:FloatRand() < 0.2) then
    	pMonster:SetSpeedX( 0.0 )
		pMonster:SetState( "WAIT" )		
		pMonster:ResetDelay()
    end
end

function nemophila_CheckDownUp02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetSpeedY() < 0.0 ) then
		pMonster:SetState( "DOWN_UP02" )
	end
end

function nemophila_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:FloatRand() < 0.75 ) then
		--pMonster:TurnToTarget()
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
    end
end

function nemophila_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 0, -1500, 600, 1500, -100 ) == true ) then
		--pMonster:TurnToTarget()
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
    end
end

function nemophila_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 200, -1500, 500, 1500, -400 ) == true ) then
        pMonster:SetState( "ATTACK03" )
        pMonster:ResetDelay()
    end
end

function nemophila_Check_Attack04( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetSummonedMonsterCount() < 2 ) then
		--pMonster:TurnToTarget()
        pMonster:SetState( "ATTACK04" )
        pMonster:ResetDelay()
    end
end


function nemophila_Check_Attack06( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 200, -1500, 500, 1500, -400 ) == true ) then
		--pMonster:TurnToTarget()
        pMonster:SetState( "ATTACK06" )
        pMonster:ResetDelay()
    end
end


function nemophila_Check_Attack08( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    local pMon = g_MyD3D:GetMonster(13)

    if( pMon:IsLive() ) then
		return
    end
    
    if( pMonster:GetShield() > 1 ) then
		return
	else
		--pMonster:TurnToTarget()
        pMonster:SetState( "ATTACK08" )
        pMonster:ResetDelay()
    end
end



function nemophila_Check_Attack11( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    if( pMonster:GetShield() > 0.0 ) then
		return
	end

    if( pMonster:CheckTargetInRange( 0, -500, 600, 500, -300 ) == true ) then
		--pMonster:TurnToTarget()
        pMonster:SetState( "ATTACK11" )
        pMonster:ResetDelay()
    end
end

function nemophila_Check_Attack09( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 200, -1500, 500, 1500, -400 ) == true ) then
		--pMonster:TurnToTarget()
        pMonster:SetState( "ATTACK09" )
        pMonster:ResetDelay()
    end
end

function nemophila_Check_Attack12( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 200, -500, 500, 500, -400 ) == true ) then
		pMonster:SetState( "ATTACK12" )
        pMonster:ResetDelay()
    end
end

function nemophila_Check_Teleport2( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    
    
    if( pMonster:GetShield() > 0.0 ) then
		return
	end

    if( pMonster:IsTarget() == true and pMonster:CheckTargetInRange( 0, -400, 100, 400, -100 ) == false ) then
		pMonster:SetState( "TELEPORT" )
		pMonster:ResetDelay()
    end
end

function nemophila_Check_Teleport( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    
    
    if( pMonster:GetShield() > 0.0 ) then
		return
	end

    if( pMonster:IsTarget() == true and pMonster:CheckTargetInRange( 1000, -500, 500, 500, -500 ) == true ) then
		pMonster:SetState( "TELEPORT" )
		pMonster:ResetDelay()
    end
end

function nemophila_Check_TeleportLanding( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	pMonster:TurnToTarget()
	pMonster:SetState( "TELEPORT_LANDING" )
	pMonster:ResetDelay()	
end


-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------
function Onnemophila_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    pMonster:SetSpeedX( pMonster:GetSpeedX() * (2.0 / 3.0) )

	if( pMonster:CheckState( "DOWN_UP01" ) == true or pMonster:CheckState( "DOWN_UP02" ) == true ) then		
		pMonster:SetDownDelay( 40 + (pMonster:FloatRand() * 50) )		
		pMonster:SetState( "DOWN_UP_LANDING" )    
	elseif( pMonster:CheckState( "DOWN_SPECIAL" ) == true ) then		
		pMonster:SetDownDelay( 40 + (pMonster:FloatRand() * 50) )		
		pMonster:SetState( "DOWN_SPECIAL_LANDING" )    
    end
end

function Onnemophila_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( pMonster:CheckState( "DOWN_UP01" ) == false and pMonster:CheckState( "DOWN_UP02" ) == false and pMonster:CheckState( "DOWN_MIDDLE" ) == false and pMonster:CheckState( "DOWN_DOWN" ) == false and pMonster:CheckState( "DOWN_SPECIAL" ) == false and pMonster:CheckState( "STONECURSE" ) == false and pMonster:CheckState( "ICECURSE" ) == false  and pMonster:CheckState( "HOLD" ) == false ) then
		pMonster:TurnToTarget()
	
		if( pMonster:GetIsRight() == true ) then
			pMonster:SetSpeedX( -0.02 )
		else
			pMonster:SetSpeedX( 0.02 )
		end		
		pMonster:SetState( "DIE" )
	end
	
end

function Onnemophila_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetPushCheck( true )
	pMonster:SetFly( false )
	pMonster:SetSpeedX( 0.0 )
	pMonster:SetSpeedY( 0.0 )
	
	if ( pMonster:CheckState( "COUNTER" ) == false and pMonster:CheckState( "COUNTER_DOWN" ) == false and pMonster:FloatRand() < 0.2 and pMonster:IsSuperArmor() == false ) then	
		local fRand = pMonster:FloatRand()
		if ( fRand < 0.5 ) then
			pMonster:SetState( "ATTACK05" )
		elseif ( fRand >= 0.5 and fRand < 0.75 ) then
			pMonster:SetState( "ATTACK02" )
		else
			pMonster:SetState( "ATTACK06" )
		end
		pMonster:TurnToTarget()
		pMonster:SetSuperArmor(true)
	end
	

end

function Onnemophila_ShieldDamage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    
end


function nemophila_Jump( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	local fTargetX = pMonster:GetTargetX()
	local fTargetY = pMonster:GetTargetY()
	
	local fMonX = pMonster:GetX()
	local fMonY = pMonster:GetY()
		
	fSpeedX = ( fTargetX - fMonX ) * 1.5
	fSpeedY = ((fTargetY - fMonY) / ((fTargetY - fMonY) / 4.1)) + (((fTargetY - fMonY) * 1.6) + pMonster:FloatAbs((fSpeedX / 3.1)))
	
	pMonster:SetNoCheckContact(26 + (fSpeedY * 5.0))
	pMonster:TurnToTarget()
	pMonster:SetSpeedX( pMonster:GetWalkSpeed() * fSpeedX )
	pMonster:SetSpeedY( pMonster:GetWalkSpeed() * fSpeedY )
end
