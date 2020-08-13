-- AI_Setesh.lua

ActionList =
{	
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "Setesh_Wait.frm",
        Func    = "Setesh_WaitFunc",

        Trigger =
        {
			-- 타게팅
            {
                AICheckFrame        = 30,
                AIFunc              = "Setesh_Check_Targeting",
                DelayFrame          = 50,
            },

            -- 타겟지움 (일단 안함)
            --{
            --    AICheckFrame        = 220,
            --    AIFunc              = "Setesh_Check_ReleaseTarget",
            --    DelayFrame          = 440,
            --},

            -- 타겟을 향해 턴
            {
                AICheckFrame        = 30,
                AIFunc              = "Setesh_Check_TurnToTarget",
                DelayFrame          = 10,
            },

            -- 업조브 필드 [75%]
            {
                AICheckFrame        = 330,
                AIFunc              = "Setesh_Check_Attack01",
                DelayFrame          = 550,
            },

            -- 토네이도
            {
                AICheckFrame        = 40,
                AIFunc              = "Setesh_Check_Attack02",
                DelayFrame          = 220,
            },

            -- 스타 라이트
            {
                AICheckFrame        = 222,
                AIFunc              = "Setesh_Check_Attack03",
                DelayFrame          = 222,
            },

            -- 사도 소환
            {
                AICheckFrame        = 512,
                AIFunc              = "Setesh_Check_Attack04",
                DelayFrame          = 444,
            },
            
            -- 버닝 홀 [50%]
            {
                AICheckFrame        = 300,
                AIFunc              = "Setesh_Check_Attack05",
                DelayFrame          = 500,
            },

            -- 텔레포트(타겟에게로)
            {
                AICheckFrame        = 144,
                AIFunc              = "Setesh_Check_Teleport",
                DelayFrame          = 333,
            },

            -- 텔레포트(타겟에서 도망치기)
            {
                AICheckFrame        = 199,
                AIFunc              = "Setesh_Check_Teleport2",
                DelayFrame          = 300,
            },

        },
    },

    -- 이동
    {
        ID      = "WALK",
        Motion  = "Setesh_wait.frm",
        Func    = "Setesh_WalkFunc",

        Trigger =
        {
			-- 타게팅
			{
                AICheckFrame        = 30,
                AIFunc              = "Setesh_Check_Targeting",
                DelayFrame          = 90,
            },

			-- 타겟을 향해 턴
            {
                AICheckFrame        = 20,
                AIFunc              = "Setesh_Check_TurnToTarget",
                DelayFrame          = 20,
            },

            -- 텔레포트(타겟에서 도망치기)
            {
                AICheckFrame        = 120,
                AIFunc              = "Setesh_Check_Teleport2",
                DelayFrame          = 160,
            },

			-- 멈추기
            {
                AICheckFrame        = 110,
                AIFunc              = "Setesh_Check_WalkStop",
                DelayFrame          = 150,
            },

        }
    },
    
    -- 텔레포트
    {
        ID      = "TELEPORT",
        Motion  = "Setesh_wait.frm",
        Func    = "Setesh_TeleportFunc",
        
        Trigger =
        {
			-- 타게팅
			{
                AICheckFrame        = 10,
                AIFunc              = "Setesh_Check_TeleportLanding",
                DelayFrame          = 10,
            },
        }
    },
    
    -- 텔레포트
    {
        ID      = "TELEPORT2",
        Motion  = "Setesh_wait.frm",
        Func    = "Setesh_Teleport2Func",
        
        Trigger =
        {
			-- 타게팅
			{
                AICheckFrame        = 10,
                AIFunc              = "Setesh_Check_TeleportLanding",
                DelayFrame          = 10,
            },
        }
    },
    
    -- 텔레포트 착지
    {
        ID      = "TELEPORT_LANDING",
        Motion  = "Setesh_wait.frm",
        Func    = "Setesh_TeleportLandingFunc",
    },
    
    {
        ID      = "SUMMON",
        Motion  = "Setesh_Wait.frm",
        Func    = "Setesh_SummonFunc",
    },
    
    -- 근접공격
    {
        ID      = "ATTACK01",
        Motion  = "Setesh_Attack01.frm",
        Func    = "Setesh_Attack01Func",
    },
    
    -- 라이트닝
    {
        ID      = "ATTACK02",
        Motion  = "Setesh_Attack02.frm",
        Func    = "Setesh_Attack02Func",
    },
    
    -- 플래임 펄스
    {
        ID      = "ATTACK03",
        Motion  = "Setesh_Attack03.frm",
        Func    = "Setesh_Attack03Func",
    },
    
    -- 메테오
    {
        ID      = "ATTACK04",
        Motion  = "Setesh_Attack04.frm",
        Func    = "Setesh_Attack04Func",
    },    

	-- 버닝홀
    {
        ID      = "ATTACK05",
        Motion  = "Setesh_Attack05.frm",
        Func    = "Setesh_Attack05Func",
    },   
    
    -- 데미지 상
    {
        ID      = "DAMAGE_UP",
        Motion  = "Setesh_Damage_Up.frm",
        Func    = "Setesh_DamageFunc",
    },
    
    -- 데미지 중
    {
        ID      = "DAMAGE_MIDDLE",
        Motion  = "Setesh_Damage_Middle.frm",
        Func    = "Setesh_DamageFunc",
    },
    
    -- 데미지 하
    {
        ID      = "DAMAGE_DOWN",
        Motion  = "Setesh_Damage_Down.frm",
        Func    = "Setesh_DamageFunc",
    },

    -- 죽기
    {
        ID      = "DIE",
        Motion  = "Setesh_die.frm",
        Func    = "Setesh_DieFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- 죽기 착지
    {
        ID      = "DIE_LANDING",
        Motion  = "Setesh_die.frm",
        Func    = "Setesh_DieLandingFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- 스톤커스
    {
        ID      = "STONECURSE",
        Motion  = "Setesh_Stone.frm",
        Func    = "Setesh_StoneCurseFunc",
    },
    
    -- 빙결상태
    {
        ID      = "ICECURSE",
        Motion  = "Setesh_Stone.frm",
        Func    = "Setesh_IceCurseFunc",
    },
    -- 홀드상태
	{
		ID		= "HOLD",
		Motion	= "Setesh_Stone.frm",
		Func	= "Setesh_HoldFunc",
	},
}

CallBack =
{
    Land    = "OnSetesh_Land",
    Die     = "OnSetesh_Die",
    Damage  = "OnSetesh_Damage",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function InitSetesh( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    --[[
	pMonster:RegistReaction(	ATTACKTYPE_HOLD,	ATTACKDIR_NORMAL,	"HOLD"	)
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_UP,     "DAMAGE_UP" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_MIDDLE, "DAMAGE_MIDDLE" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_DOWN,   "DAMAGE_DOWN" )
 
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_UP,       "DAMAGE_UP" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_MIDDLE,   "DAMAGE_MIDDLE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_DOWN,     "DAMAGE_DOWN" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_NORMAL,   "DAMAGE_DOWN" )
    
    pMonster:RegistReaction( ATTACKTYPE_STONECURSE, ATTACKDIR_NORMAL,   "STONECURSE" )
    pMonster:RegistReaction( ATTACKTYPE_ICECURSE, ATTACKDIR_NORMAL,   "ICECURSE" )
    --]]
    pMonster:RegisterSummonMonsterType( MON_DEATH_PRIOR )
end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function Setesh_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
end

-- 대기 상태
function Setesh_SummonFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame == 2 ) then
		local posy = 0.0
		pMonster:AddParticle("Setesh_Summon_Circle_01", 0.0, posy)
		pMonster:AddParticle("Setesh_Summon_Circle_02", 0.0, posy)
		pMonster:AddParticle("Setesh_Summon_Circle_03", 0.0, posy)
		pMonster:AddParticle("Setesh_Summon_Circle_04", 0.0, posy)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
end

-- 대기 상태
function Setesh_StunFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

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
function Setesh_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
        
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
end

-- 죽는상태
function Setesh_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame == 2 ) then
		pMonster:PlaySound(994014)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-- 죽는상태 착지
function Setesh_DieLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame == 2 ) then
		pMonster:PlaySound(994014)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-- 데미지 입은거
function Setesh_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  근접공격 상태
function Setesh_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
    elseif( iFrame == 33 ) then
		if( pMonster:GetIsRight() ) then
			pMonster:AddDamage(DT_SETESH_SHEILD_1)
		else
			pMonster:AddDamage(DT_SETESH_SHEILD_1_R)
		end
	elseif( iFrame == 36 ) then
		pMonster:PlaySound(994015)
	elseif( iFrame == 110 ) then
		if( pMonster:GetIsRight() ) then
			pMonster:AddDamage(DT_SETESH_SHEILD_2)
		else
			pMonster:AddDamage(DT_SETESH_SHEILD_2_R)
		end
		--pMonster:AddDamage(DT_SETESH_SHEILD_11)
		
    elseif( iFrame == 125 ) then
		--몬스터 버프 테스트~
		local buffTime = 15.0
		pMonster:SetMagicEffect( iMonsterIndex, EGC_EFFECT_SETESH_PROTECT, buffTime, 1, -1, false, false );
		pMonster:SetSuperArmorFrame( buffTime * 55.0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  라이트닝 상태
function Setesh_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 65 ) then
		if( pMonster:GetIsRight() ) then
			pMonster:AddDamage(DT_SETESH_TONADO)
		else
			pMonster:AddDamage(DT_SETESH_TONADO_R)
		end
       pMonster:PlaySound(994016)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  스타 라이트
function Setesh_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
    elseif( iFrame == 43 ) then
        pMonster:PlaySound( 994017 )
    elseif( iFrame == 50 ) then
        pMonster:AddTraceParticleToBone( "Setesh_Storm_Spark_01", 1.0, 26, 7, 8, 0.0, 0.0 )
		pMonster:AddTraceParticleToBone( "Setesh_Storm_Spark_02", 1.0, 26, 7, 8, 0.0, 0.0 )
		pMonster:AddTraceParticleToBone( "Setesh_Storm_Spark_03", 1.0, 26, 7, 8, 0.0, 0.0 )
		pMonster:AddTraceParticleToBone( "Setesh_Storm_Spark_04", 1.0, 26, 7, 8, 0.0, 0.0 )
		pMonster:AddTraceParticleToBone( "Setesh_Storm_Spark_05", 1.0, 26, 7, 8, 0.0, 0.0 )
		pMonster:AddTraceParticleToBone( "Setesh_Storm_Spark_06", 1.0, 26, 7, 8, 0.0, 0.0 )
		pMonster:AddTraceParticleToBone( "Setesh_Storm_Spark_07", 1.0, 26, 7, 8, 0.0, 0.0 )
	elseif( iFrame == 83 ) then
		pMonster:PlaySound( 994018 )
    elseif( iFrame == 120 ) then
        pMonster:AddDamageToAlivePlayer( DT_SETESH_STARLIGHT, 0.0, 0.0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end


-- 서먼
function Setesh_Attack04Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    local pMon = g_MyD3D:GetMonster( 1 )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 120 ) then
		local posy = 0.0
		pMonster:AddParticle("Setesh_Summon_01", 0.0, posy)
		pMonster:AddParticle("Setesh_Summon_02", 0.0, posy)
		pMonster:AddParticle("Setesh_Summon_03", 0.0, posy)
		pMonster:AddParticle("Setesh_Summon_04", 0.0, posy)
		pMonster:AddParticle("Setesh_Summon_05", 0.0, posy)
		pMonster:PlaySound(994020)
		local pMon = KSummonInfo()
        pMon:Init()
        pMon:SetState("SUMMON")
        pMon.iMonType = MON_DEATH_PRIOR
    	pMon.fX = -350
    	pMon.fY = 0
		pMonster:SummonMonster( pMon )
		
		pMon = KSummonInfo()
        pMon:Init()
        pMon:SetState("SUMMON")
        pMon.iMonType = MON_DEATH_PRIOR
    	pMon.fX = 350
    	pMon.fY = 0
		pMonster:SummonMonster( pMon )
		
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  버닝 홀
function Setesh_Attack05Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	local angle = 0.0

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
		pMonster:SetPushCheck( false )
    elseif( iFrame >= 60 and iFrame <= 184 ) then
		pMonster:PullPlayer(0.0,1.3, 0.35)
		if ( iFrame == 60 ) then
			pMonster:AddDamage( DT_SETESH_ATTACK05_PARTICLE )
		end
		
		if ( math.mod( iFrame, 10 ) == 0 ) then
			pMonster:AddDamage( DT_SETESH_ATTACK05 )
			pMonster:PlaySound(999021)
		end
	elseif( iFrame == 185 ) then
		pMonster:AddDamage(DT_SETESH_ATTACK05_BOMB)

		pMonster:AddDamageWithLocateAngle( DT_SENTRYKEEPER2_ATK3, 0.52, 0.46, false, 0 )
        pMonster:AddDamageWithLocateAngle( DT_SENTRYKEEPER2_ATK3, 0.52, 0.6, false, 1.5708 )
        pMonster:AddDamageWithLocateAngle( DT_SENTRYKEEPER2_ATK3, 0.52, 0.32, false, 4.7124 )
        pMonster:AddDamageWithLocateAngle( DT_SENTRYKEEPER2_ATK3, 0.52, 0.46, false, 3.1416 )

		pMonster:PlaySound(989034)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetPushCheck( true )
        pMonster:SetState( "WAIT" )
    end
end


--  점프 상태
function Setesh_JumpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )				
    end
end

--  텔레포트 상태
function Setesh_TeleportFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:AddParticle( "Setesh_Warp_01", 0.0, -0.34 )
		pMonster:AddParticle( "Setesh_Warp_02", 0.0, -0.34 )
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
		
		pMonster:SetY( pMonster:GetTargetY() + 0.1 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

--  텔레포트 상태
function Setesh_Teleport2Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:AddParticle( "Setesh_Warp_01", 0.0, -0.34 )
		pMonster:AddParticle( "Setesh_Warp_02", 0.0, -0.34 )
		pMonster:ToggleRender( false )
		pMonster:SetPushCheck( false )
		pMonster:SetInvincibleFrame( 20 )
		pMonster:PlaySound( "995026" )
	elseif( iFrame == 2 ) then
		local fRand = pMonster:FloatRand()
		local fDistX = 0.2
		local randX = pMonster:GetStageX() * fRand

		if ( fRand < 0.5 ) then
			fDistX = 0.2
			pMonster:SetX( randX )
			pMonster:SetCountValue( 1 )
		elseif ( fRand <= 1.0 ) then
			fDistX = 0.7
			pMonster:SetX( randX )
			pMonster:SetCountValue( 2 )
		elseif ( fRand < 1.0 ) then		-- 딜단 현재 안들어오게 함
			fDistX = 0.3
			pMonster:SetX( randX )
			pMonster:SetCountValue( 3 )
		end
		
		pMonster:SetY( pMonster:GetTargetY() + 0.1 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

--  텔레포트 착지 상태
function Setesh_TeleportLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame == 1 ) then
		pMonster:AddParticle( "Setesh_Warp_01", 0.0, -0.34 )
		pMonster:AddParticle( "Setesh_Warp_02", 0.0, -0.34 )
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

--  회피 상태
function Setesh_AvoidFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
    elseif( iFrame == 6 ) then
		if( pMonster:GetIsRight() ) then
			pMonster:SetSpeedX( -0.015 )
		else
			pMonster:SetSpeedX( 0.015 )
		end
		pMonster:SetNoCheckContact( 5 )
		pMonster:SetSpeedY( 0.02 )		
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetPushCheck( true )
        pMonster:SetState( "WAIT" )
    end
end

--  스톤커스 걸렸음
function Setesh_StoneCurseFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
        pMonster:AddTraceParticle( "StoneCurse_medium", 3 )
        pMonster:AddParticle( "StoneCurse_medium_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "StoneCurse_medium_tick", 0.0, 0.0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:AddParticle( "StoneCurse_medium_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "StoneCurse_medium_tick", 0.0, 0.0 )
        pMonster:SetSuperArmor( false )
        pMonster:SetState( "WAIT" )
        
        if( pMonster:GetHP() <= 0 ) then
			pMonster:SetState( "DIE" )
		end
    end
end

--  아이스커스 걸렸음
function Setesh_IceCurseFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
        pMonster:AddTraceParticle( "IceCurse_medium", 3 )
        pMonster:AddParticle( "IceCurse_medium_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "IceCurse_medium_tick", 0.0, 0.0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:AddParticle( "IceCurse_medium_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "IceCurse_medium_tick", 0.0, 0.0 )
        pMonster:SetSuperArmor( false )
        pMonster:SetState( "WAIT" )
        
        if( pMonster:GetHP() <= 0 ) then
			pMonster:SetState( "DIE" )
		end
    end
end

-- 홀드 걸렸음(이펙트)
function Setesh_HoldFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor(true)
		pMonster:AddParticle( "Arme01_Hold_Beam_effect_01_Middle", 0.0, 0.12 )
		pMonster:AddParticle( "Arme01_Hold_Beam_effect_02_Middle", 0.0, 0.12 )
		pMonster:AddParticle( "Arme01_Hold_Beam_effect_03_Middle", 0.0, 0.12 )
		pMonster:AddParticle( "Arme01_Hold_Beam_effect_04_Middle", 0.0, 0.12 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetSuperArmor( false )
		pMonster:SetState( "WAIT" )
		
		if( pMonster:GetHP() <= 0 ) then
			pMonster:SetState( "DIE" )
		end
	end
end

-----------------------------------------------------------------------
-- 컨디션체크
-----------------------------------------------------------------------

function Setesh_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 0, -400, 400, 400, -400 ) == true ) then
		pMonster:TurnToTarget()
        pMonster:ResetDelay()
    end
end

function Setesh_Check_ReleaseTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 0, -1000, 1000, 1000, -800 ) == false ) then
		pMonster:ReleaseTarget()
		pMonster:ResetDelay()
	end
end

function Setesh_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function Setesh_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 600, -150, 180, 150, -100 ) == true ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "WALK" )
        pMonster:ResetDelay()
    end
end

function Setesh_Check_WalkStop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 100, -200, 400, 200, -400 ) == true or pMonster:FloatRand() < 0.2) then
    	pMonster:SetSpeedX( 0.0 )
		pMonster:SetState( "WAIT" )		
		pMonster:ResetDelay()
    end
end

function Setesh_CheckDownUp02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetSpeedY() < 0.0 ) then
		pMonster:SetState( "DOWN_UP02" )
	end
end

function Setesh_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:FloatRand() < 0.75 ) then
		--pMonster:TurnToTarget()
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
    end
end

function Setesh_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 150, -150, 200, 150, -100 ) == true ) then
		--pMonster:TurnToTarget()
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
    end
end

function Setesh_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 200, -500, 500, 500, -400 ) == true ) then
        pMonster:SetState( "ATTACK03" )
        pMonster:ResetDelay()
    end
end

function Setesh_Check_Attack04( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetSummonedMonsterCount() < 2 ) then
		--pMonster:TurnToTarget()
        pMonster:SetState( "ATTACK04" )
        pMonster:ResetDelay()
    end
end

function Setesh_Check_Attack05( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true and pMonster:FloatRand() < 0.5 ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "ATTACK05" )
        pMonster:ResetDelay()
    end
end

function Setesh_Check_Teleport( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:IsTarget() == true and pMonster:CheckTargetInRange( 100, -400, 350, 400, -250 ) == false ) then
		pMonster:SetState( "TELEPORT" )
		pMonster:ResetDelay()
    end
end

function Setesh_Check_Teleport2( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 50, -220, 350, 220, -250 ) == true ) then
		pMonster:SetState( "TELEPORT2" )
		pMonster:ResetDelay()
    end
end

function Setesh_Check_TeleportLanding( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	pMonster:TurnToTarget()
	pMonster:SetState( "TELEPORT_LANDING" )
	pMonster:ResetDelay()	
end


-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------
function OnSetesh_Land( iMonsterIndex )
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

function OnSetesh_Die( iMonsterIndex )
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

function OnSetesh_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetPushCheck( true )
	pMonster:SetFly( false )
	pMonster:SetSpeedY( 0.0 )
	pMonster:SetSpeedX( 0.0 )
	if ( pMonster:IsMagicEffect( iMonsterIndex, EGC_EFFECT_SETESH_PROTECT ) and pMonster:IsBackAttack() == false ) then
		pMonster.DefRatio = 10000.0
		local posx = 0.0
		local posy = 0.0
		pMonster:AddParticle("Setesh_Field_01", posx, posy)
		pMonster:AddParticle("Setesh_Field_02", posx, posy)
		pMonster:AddParticle("Setesh_Field_03", posx, posy)
		pMonster:AddParticle("Setesh_Field_04", posx, posy)
	else
		pMonster.DefRatio = 1.0
		if( pMonster:FloatRand() < 0.1 ) then
			pMonster:SetState( "ATTACK03" )
		end

		if( pMonster:GetHP() <= 0 ) then
			pMonster:SetState( "DIE_LANDING" )
		end
	end
	
	if( pMonster:CheckState( "DOWN_UP01" ) == false and pMonster:CheckState( "DOWN_MIDDLE" ) == false and pMonster:CheckState( "DOWN_DOWN" ) == false and pMonster:CheckState( "DOWN_SPECIAL" ) == false and pMonster:CheckState( "STONECURSE" ) == false and pMonster:CheckState( "ICECURSE" ) == false ) then
		if ( pMonster:FloatRand() < 0.1 and pMonster:GetIsContact() == true and pMonster:GetIsRight() ~= pMonster:GetTargetIsRight() ) then
			pMonster:SetState( "ATTACK03" )
		end
	end
end

function Setesh_Jump( iMonsterIndex )
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
