-- AI_DarkTemplar.lua

ActionList =
{	
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "DarkTemplar_Wait.frm",
        Func    = "DarkTemplar_WaitFunc",

        Trigger =
        {
			-- 타게팅
            {
                AICheckFrame        = 55,
                AIFunc              = "DarkTemplar_Check_Targeting",
                DelayFrame          = 110,
            },

            -- 타겟지움 (일단 안함)
            --{
            --    AICheckFrame        = 220,
            --    AIFunc              = "DarkTemplar_Check_ReleaseTarget",
            --    DelayFrame          = 440,
            --},

            -- 타겟을 향해 턴
            {
                AICheckFrame        = 40,
                AIFunc              = "DarkTemplar_Check_TurnToTarget",
                DelayFrame          = 60,
            },

            -- 걷기
            {
                AICheckFrame        = 102,
                AIFunc              = "DarkTemplar_Check_Walk",
                DelayFrame          = 200,
            },

            -- 
            {
                AICheckFrame        = 90,
                AIFunc              = "DarkTemplar_Check_Attack01",
                DelayFrame          = 200,
				DelayFrame1			= 150,
				DelayFrame2			= 100,
				DelayFrame3			= 100,
            },

            -- 
            {
                AICheckFrame        = 120,
                AIFunc              = "DarkTemplar_Check_Attack02",
                DelayFrame          = 300,
				DelayFrame1			= 250,
				DelayFrame2			= 200,
				DelayFrame3			= 200,
            },

            --
            {
                AICheckFrame        = 20,
                AIFunc              = "DarkTemplar_Check_Attack03",
                DelayFrame          = 264,
				DelayFrame1			= 176,
				DelayFrame2			= 88,
				DelayFrame3			= 88,
            },

            --
            {
                AICheckFrame        = 200,
                AIFunc              = "DarkTemplar_Check_Attack04",
                DelayFrame          = 650,
				DelayFrame1			= 500,
				DelayFrame2			= 350,
				DelayFrame3			= 350,
            },

            -- 텔레포트(타겟에게로)
            {
                AICheckFrame        = 140,
                AIFunc              = "DarkTemplar_Check_Teleport2",
                DelayFrame          = 140,
            },

            -- 텔레포트(타겟에서 도망치기)
            {
                AICheckFrame        = 10,
                AIFunc              = "DarkTemplar_Check_Teleport",
                DelayFrame          = 190,
            },
        },
    },

    -- 이동
    {
        ID      = "WALK",
        Motion  = "DarkTemplar_move.frm",
        Func    = "DarkTemplar_WalkFunc",

        Trigger =
        {
			-- 타게팅
			{
                AICheckFrame        = 30,
                AIFunc              = "DarkTemplar_Check_Targeting",
                DelayFrame          = 90,
            },

			-- 타겟을 향해 턴
            {
                AICheckFrame        = 15,
                AIFunc              = "DarkTemplar_Check_TurnToTarget",
                DelayFrame          = 55,
            },

            -- 텔레포트(타겟에서 도망치기)
            {
                AICheckFrame        = 20,
                AIFunc              = "DarkTemplar_Check_Teleport",
                DelayFrame          = 60,
            },

			-- 멈추기
            {
                AICheckFrame        = 10,
                AIFunc              = "DarkTemplar_Check_WalkStop",
                DelayFrame          = 50,
            },

        }
    },
    
    -- 텔레포트
    {
        ID      = "TELEPORT",
        Motion  = "DarkTemplar_wait.frm",
        Func    = "DarkTemplar_TeleportFunc",
        
        Trigger =
        {
			-- 타게팅
			{
                AICheckFrame        = 10,
                AIFunc              = "DarkTemplar_Check_TeleportLanding",
                DelayFrame          = 10,
            },
        }
    },
    
    -- 텔레포트 착지
    {
        ID      = "TELEPORT_LANDING",
        Motion  = "DarkTemplar_wait.frm",
        Func    = "DarkTemplar_TeleportLandingFunc",
    },
    
    {
        ID      = "SUMMON",
        Motion  = "DarkTemplar_Wait.frm",
        Func    = "DarkTemplar_SummonFunc",
    },
    
    -- 근접공격
    {
        ID      = "ATTACK01",
        Motion  = "DarkTemplar_Attack01.frm",
        Func    = "DarkTemplar_Attack01Func",
    },
    
    -- 라이트닝
    {
        ID      = "ATTACK02",
        Motion  = "DarkTemplar_Attack02.frm",
        Func    = "DarkTemplar_Attack02Func",
    },
    
    -- 플래임 펄스
    {
        ID      = "ATTACK03",
        Motion  = "DarkTemplar_Attack03.frm",
        Func    = "DarkTemplar_Attack03Func",
    },
    
    -- 메테오
    {
        ID      = "ATTACK04",
        Motion  = "DarkTemplar_Attack04.frm",
        Func    = "DarkTemplar_Attack04Func",
    },    

    -- 데미지 상
    {
        ID      = "DAMAGE_UP",
        Motion  = "DarkTemplar_Damage_Up.frm",
        Func    = "DarkTemplar_DamageFunc",
    },
    
    -- 데미지 중
    {
        ID      = "DAMAGE_MIDDLE",
        Motion  = "DarkTemplar_Damage_Middle.frm",
        Func    = "DarkTemplar_DamageFunc",
    },
    
    -- 데미지 하
    {
        ID      = "DAMAGE_DOWN",
        Motion  = "DarkTemplar_Damage_Down.frm",
        Func    = "DarkTemplar_DamageFunc",
    },

    -- 다운 상
    {
        ID      = "DOWN_UP01",
        Motion  = "DarkTemplar_Down_Up01.frm",
        Func    = "DarkTemplar_DownUpFunc",
        
        Trigger =
        {
            {
                AICheckFrame        = 1,
                AIFunc              = "DarkTemplar_CheckDownUp02",
                DelayFrame          = 0,
            },
        }
    },
    
    -- 다운 상02
    {
        ID      = "DOWN_UP02",
        Motion  = "DarkTemplar_Down_Up02.frm",
        Func    = "DarkTemplar_DownUp02Func",
        IsFallDownMotion    = TRUE,
    },
	
	-- 다운 상 착지
    {
        ID      = "DOWN_UP_LANDING",
        Motion  = "DarkTemplar_Down_Up03.frm",
        Func    = "DarkTemplar_DownFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "DarkTemplar_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- 다운 중
    {
        ID      = "DOWN_MIDDLE",
        Motion  = "DarkTemplar_Down_Middle.frm",
        Func    = "DarkTemplar_DownFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "DarkTemplar_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- 다운 하
    {
        ID      = "DOWN_DOWN",
        Motion  = "DarkTemplar_Down_Down.frm",
        Func    = "DarkTemplar_DownDownFunc",
        IsFallDownMotion    = TRUE,

        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "DarkTemplar_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- 다운 스페셜
    {
        ID      = "DOWN_SPECIAL",
        Motion  = "DarkTemplar_Down_Special01.frm",
        Func    = "DarkTemplar_DownSpecialFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- 다운 스페셜 착지
    {
        ID      = "DOWN_SPECIAL_LANDING",
        Motion  = "DarkTemplar_Down_Special02.frm",
        Func    = "DarkTemplar_DownSpecialLandingFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "DarkTemplar_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- 죽기
    {
        ID      = "DIE",
        Motion  = "DarkTemplar_down_middle.frm",
        Func    = "DarkTemplar_DieFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- 죽기 착지
    {
        ID      = "DIE_LANDING",
        Motion  = "DarkTemplar_down_middle.frm",
        Func    = "DarkTemplar_DieLandingFunc",
        IsFallDownMotion    = TRUE,
    },

    -- 일어나기
    {
        ID      = "STANDUP",
        Motion  = "DarkTemplar_Standup.frm",
        Func    = "DarkTemplar_StandupFunc",
    },
    
    -- 스톤커스
    {
        ID      = "STONECURSE",
        Motion  = "DarkTemplar_Stone.frm",
        Func    = "DarkTemplar_StoneCurseFunc",
    },
    
    -- 빙결상태
    {
        ID      = "ICECURSE",
        Motion  = "DarkTemplar_Stone.frm",
        Func    = "DarkTemplar_IceCurseFunc",
    },
    -- 홀드상태
	{
		ID		= "HOLD",
		Motion	= "DarkTemplar_Stone.frm",
		Func	= "DarkTemplar_HoldFunc",
	},
	
	{
        ID      = "STUN",
        Motion  = "DarkTemplar_Wait.frm",
        Func    = "DarkTemplar_StunFunc",
    },
}

CallBack =
{
    Land    = "OnDarkTemplar_Land",
    Die     = "OnDarkTemplar_Die",
    Damage  = "OnDarkTemplar_Damage",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function InitDarkTemplar( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
        
	pMonster:RegistReaction(	ATTACKTYPE_HOLD,	ATTACKDIR_NORMAL,	"HOLD"	)
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_UP,     "DAMAGE_UP" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_MIDDLE, "DAMAGE_MIDDLE" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_DOWN,   "DAMAGE_DOWN" )
 
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_UP,       "DOWN_UP01" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_MIDDLE,   "DOWN_MIDDLE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_DOWN,     "DOWN_DOWN" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_NORMAL,   "DOWN_SPECIAL" )
    
    pMonster:RegistReaction( ATTACKTYPE_STONECURSE, ATTACKDIR_NORMAL,   "STONECURSE" )
    pMonster:RegistReaction( ATTACKTYPE_ICECURSE, ATTACKDIR_NORMAL,   "ICECURSE" )
    
    pMonster:AddTraceParticleToBone( "Dark_Templar_Handflame_Red_01", 1.0, 26, 3, 6, 0.0, 0.05 )
	pMonster:AddTraceParticleToBone( "Dark_Templar_Handflame_Pupple_01", 1.0, 35, 3, 6, 0.0, 0.05 )
end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function DarkTemplar_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
end

-- 대기 상태
function DarkTemplar_SummonFunc( iMonsterIndex, iFrame )
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

-- 대기 상태
function DarkTemplar_StunFunc( iMonsterIndex, iFrame )
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
function DarkTemplar_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
        
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
end

-- 죽는상태
function DarkTemplar_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame == 2 ) then
		pMonster:PlaySound(995031)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-- 죽는상태 착지
function DarkTemplar_DieLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame == 2 ) then
		pMonster:PlaySound(995031)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-- 데미지 입은거
function DarkTemplar_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 다운 상
function DarkTemplar_DownUpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
    elseif( iFrame >= pMonster:GetLastFrame() ) then		
        pMonster:SetFrameLock( true )
    end
end

-- 다운 상2
function DarkTemplar_DownUp02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

-- 다운 상3
function DarkTemplar_DownUp03Func( iMonsterIndex, iFrame )
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

-- 다운 미들
function DarkTemplar_DownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetFrameLock( true )				
		
		if( pMonster:GetHP() <= 0 ) then
			pMonster:SetState( "DIE_LANDING" )
		end		
    end
end

-- 다운 다운
function DarkTemplar_DownDownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 7 ) then
		pMonster:SetSpeedX( pMonster:GetSpeedX() / 5 )		
		pMonster:SetSpeedY( 0.03 )		
    elseif( iFrame >= pMonster:GetLastFrame() ) then
			pMonster:SetState( "DOWN_UP01" )
    end
end

-- 다운 스페셜
function DarkTemplar_DownSpecialFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "DOWN_SPECIAL" )
    end
end

-- 다운 스페셜 착지
function DarkTemplar_DownSpecialLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetFrameLock( true )		
		if( pMonster:GetHP() <= 0 ) then
			pMonster:SetState( "DIE_LANDING" )
		end        		
    end
end

-- 일어나기
function DarkTemplar_StandupFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetPushCheck( true )
        pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
end

--  근접공격 상태
function DarkTemplar_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
    elseif( iFrame == 36 ) then
		pMonster:ComputeAngleToTarget( 0.0, 0.2 ) -- 타겟으로의 각도를 계산
		local angle = pMonster:GetAngleToTarget()
		if( pMonster:GetIsRight() ) then
			pMonster:AddDamageWithLocateAngle( DT_DARKTEMPLAR_CURSEFIRE, 0.0, 0.0, false, angle )
		else
			pMonster:AddDamageWithLocateAngle( DT_DARKTEMPLAR_CURSEFIRE, 0.0, 0.0, false, -angle )
		end
		pMonster:PlaySound(995027)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  라이트닝 상태
function DarkTemplar_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 43 ) then
        pMonster:AddDamage(DT_DARKTEMPLAR_SOUL_DRAIN)
        pMonster:PlaySound(995028)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  플래임 펄스
function DarkTemplar_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    if( iFrame == 43 ) then
        pMonster:PlaySound( 995029 )
        pMonster:AddDamage( DT_DARKTEMPLAR_DOUBLEFRAME )
    elseif( iFrame == 50 ) then
        pMonster:PlaySound( 995029 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end


-- 메테오
function DarkTemplar_Attack04Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 65 ) then
		pMonster:PlaySound(995030)
		if( pMonster:GetIsRight() ) then
			pMonster:AddDamageWithLocate( DT_ARME4_SPECIAL3_METEO_READY, -0.5, 0.0 )
		else
			pMonster:AddDamageWithLocate( DT_ARME4_SPECIAL3_METEO_READY, 0.4, 0.0 )
		end
	elseif( iFrame == 70 ) then
		pMonster:AddDamageWithLocate( DT_ARME4_SPECIAL3_METEO_READY, 1.5, 0.0 )
	elseif( iFrame == 75 ) then
		pMonster:AddDamageWithLocate( DT_ARME4_SPECIAL3_METEO_READY, -1.5, 0.0 )
	elseif( iFrame == 80 ) then
		pMonster:AddDamageWithLocate( DT_ARME4_SPECIAL3_METEO_READY, 0.7, 0.0 )
	elseif( iFrame == 85 ) then
		pMonster:AddDamageWithLocate( DT_ARME4_SPECIAL3_METEO_READY, -2.7, 0.0 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  점프 상태
function DarkTemplar_JumpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )				
    end
end

--  텔레포트 상태
function DarkTemplar_TeleportFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:ToggleRender( false )
		pMonster:SetPushCheck( false )
		pMonster:SetInvincibleFrame( 20 )
		pMonster:AddParticle( "Dark_Templar_Warp_01", 0.0, -0.34 )
		pMonster:AddParticle( "Dark_Templar_Warp_02", 0.0, -0.34 )
		pMonster:PlaySound( "995026" )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

--  텔레포트 착지 상태
function DarkTemplar_TeleportLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:AddParticle( "Dark_Templar_Warp_01", 0.0, -0.34 )
		pMonster:AddParticle( "Dark_Templar_Warp_02", 0.0, -0.34 )
    elseif( iFrame == 6 ) then
		pMonster:ToggleRender( true )
		pMonster:SetPushCheck( true )
    elseif( iFrame == 10 ) then
		pMonster:SetInvincible( false )
	elseif( iFrame >= 15 ) then
        if( pMonster:GetCountValue() == 1 ) then
			pMonster:SetState( "ATTACK03" )   -- 더블
		elseif( pMonster:GetCountValue() == 2 ) then
			pMonster:SetState( "ATTACK01" )   -- 볼꽃
		elseif( pMonster:GetCountValue() == 3 ) then
			pMonster:SetState( "ATTACK04" )   -- 메테오
		else
			pMonster:SetState( "WAIT" )   -- 가만있기
		end
		
		pMonster:SetCountValue(0)
    end
end

--  회피 상태
function DarkTemplar_AvoidFunc( iMonsterIndex, iFrame )
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
function DarkTemplar_StoneCurseFunc( iMonsterIndex, iFrame )
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
function DarkTemplar_IceCurseFunc( iMonsterIndex, iFrame )
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
function DarkTemplar_HoldFunc( iMonsterIndex, iFrame )
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

function DarkTemplar_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 0, -500, 500, 500, -400 ) == true ) then
		pMonster:TurnToTarget()
        pMonster:ResetDelay()
    end
end

function DarkTemplar_Check_ReleaseTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 0, -1000, 1000, 1000, -800 ) == false ) then
		pMonster:ReleaseTarget()
		pMonster:ResetDelay()
	end
end

function DarkTemplar_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function DarkTemplar_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 600, -150, 180, 150, -100 ) == true ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "WALK" )
        pMonster:ResetDelay()
    end
end

function DarkTemplar_Check_WalkStop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 100, -200, 400, 200, -400 ) == true or pMonster:FloatRand() < 0.2) then
    	pMonster:SetSpeedX( 0.0 )
		pMonster:SetState( "WAIT" )		
		pMonster:ResetDelay()
    end
end

function DarkTemplar_CheckDownUp02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetSpeedY() < 0.0 ) then
		pMonster:SetState( "DOWN_UP02" )
	end
end

function DarkTemplar_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:IsTarget() == true and pMonster:CheckTargetInRange( 0, -150, 100, 150, -100 ) == false ) then
		pMonster:TurnToTarget()
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
    end
end

function DarkTemplar_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:IsTarget() == true and pMonster:CheckTargetInRange( 0, -150, 100, 150, -100 ) == false ) then
		pMonster:TurnToTarget()
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
    end
end

function DarkTemplar_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 0, -150, 200, 150, -100 ) == true ) then
        pMonster:SetState( "ATTACK03" )
        pMonster:ResetDelay()
    end
end

function DarkTemplar_Check_Attack04( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 100, -600, 600, 600, -400 ) == true ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "ATTACK04" )
        pMonster:ResetDelay()
    end
end

function DarkTemplar_Check_Teleport( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 0, -300, 350, 300, -300 ) == true ) then
		if( pMonster:GetIsRight() == true ) then
			if( pMonster:GetX() <= 0.5 ) then
				pMonster:SetX( pMonster:GetTargetX() + 1.2 )
				pMonster:TurnToTarget()
			else
				pMonster:SetX( pMonster:GetTargetX() - 1.2 )
			end
		else
			if( pMonster:GetX() <= 3.2 ) then
				pMonster:SetX( pMonster:GetTargetX() + 1.2 )
			else
				pMonster:SetX( pMonster:GetTargetX() - 1.2 )
				pMonster:TurnToTarget()
			end
		end
		
		pMonster:SetCountValue( 4 )
		pMonster:SetY( pMonster:GetTargetY() + 0.1 )		
		pMonster:SetState( "TELEPORT" )
		pMonster:ResetDelay()
    end
end

function DarkTemplar_Check_Teleport2( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == true and pMonster:CheckTargetInRange( 100, -500, 260, 500, -240 ) == false ) then
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
		pMonster:SetState( "TELEPORT" )
		pMonster:ResetDelay()
    end
end

function DarkTemplar_Check_TeleportLanding( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	pMonster:TurnToTarget()
	pMonster:SetState( "TELEPORT_LANDING" )
	pMonster:ResetDelay()	
end

function DarkTemplar_CheckStandup( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetHP() > 0 and pMonster:GetDownDelay() == 0 ) then
		if ( pMonster:FloatRand() < 0.4 ) then
			if( pMonster:GetTargetIsRight() == true ) then
				pMonster:SetX( pMonster:GetTargetX() - 0.2 )
			else
				pMonster:SetX( pMonster:GetTargetX() + 0.2 )
			end
			
			pMonster:SetCountValue( 1 )			
			pMonster:SetY( pMonster:GetTargetY() + 0.1 )			
			pMonster:SetState( "TELEPORT" )
		else
			pMonster:SetState( "STANDUP" )
		end
    end
end

-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------
function OnDarkTemplar_Land( iMonsterIndex )
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

function OnDarkTemplar_Die( iMonsterIndex )
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

function OnDarkTemplar_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetPushCheck( true )
	pMonster:SetFly( false )
	
	if( pMonster:CheckState( "DOWN_MIDDLE" ) == true or pMonster:CheckState( "DOWN_DOWN" ) == true ) then
		pMonster:SetDownDelay( 40 + (pMonster:FloatRand() * 80) )		
	end
	
	if( pMonster:CheckPreState( "DOWN_UP01" ) == true or pMonster:CheckPreState( "DOWN_UP02") == true ) then
		pMonster:SetNoCheckContact( 25 )
		if( pMonster:CheckState( "DAMAGE_UP" )) then
			pMonster:SetSpeedX( pMonster:GetSpeedX() / 3 )
			pMonster:SetSpeedY( 0.024 )
			pMonster:SetState( "DOWN_UP01" )		
		elseif( pMonster:CheckState( "DOWN_UP01" )) then
			pMonster:SetSpeedY( 0.032 )
			pMonster:SetState( "DOWN_UP01" )		
		elseif( pMonster:CheckState( "DAMAGE_MIDDLE" ) or pMonster:CheckState( "DOWN_MIDDLE" )) then
			pMonster:SetSpeedX( pMonster:GetSpeedX() / 2 )
			pMonster:SetSpeedY( 0.02 )			
			pMonster:SetState( "DOWN_UP01" )
		elseif( pMonster:CheckState( "DAMAGE_DOWN" )) then
			pMonster:SetSpeedX( pMonster:GetSpeedX() / 2 )
			pMonster:SetSpeedY( 0.02 )			
			pMonster:SetState( "DOWN_UP01" )			
		elseif( pMonster:CheckState( "DOWN_DOWN" )) then
			if( pMonster:GetIsRight() == true) then
				pMonster:SetSpeedX( -0.025 )			
			else
				pMonster:SetSpeedX( 0.025 )			
			end
			pMonster:SetNoCheckContact( 5 )
			pMonster:SetSpeedY( -0.04 )			
			pMonster:SetState( "DOWN_MIDDLE" )		
			pMonster:SetDownDelay( 40 + (pMonster:FloatRand() * 80) )			
		end	
	end
	
    if( pMonster:CheckState( "DOWN_UP01" ) == false and pMonster:CheckState( "DOWN_MIDDLE" ) == false and pMonster:CheckState( "DOWN_DOWN" ) == false and pMonster:CheckState( "DOWN_SPECIAL" ) == false) then
		pMonster:SetNoCheckContact( 0 )

		if ( pMonster:FloatRand() < 0.25 ) then
			if( pMonster:FloatRand() < 0.5 ) then
				pMonster:SetX( pMonster:GetTargetX() - pMonster:FloatRand() * 1.5  )
			else
				pMonster:SetX( pMonster:GetTargetX() + pMonster:FloatRand() * 1.5  )
			end

			if( pMonster:FloatRand() < 0.5 ) then
				pMonster:SetY( pMonster:GetTargetY() - pMonster:FloatRand() * 1.5 )
			else
				pMonster:SetY( pMonster:GetTargetY() + pMonster:FloatRand() * 1.5 )
			end

		--[[/*
			local fRand = pMonster:FloatRand()
			local fDistX = 0.2

			if ( fRand < 0.3 ) then
				fDistX = 0.2
				if( pMonster:GetTargetIsRight() == true ) then
					pMonster:SetX( pMonster:GetTargetX() - fDistX )
				else
					pMonster:SetX( pMonster:GetTargetX() + fDistX )
				end
				
				pMonster:SetCountValue( 1 )
				
			elseif ( fRand < 0.7 ) then
				fDistX = 0.7
				if( pMonster:FloatRand() < 0.5 ) then
					pMonster:SetX( pMonster:GetTargetX() - fDistX )
				else
					pMonster:SetX( pMonster:GetTargetX() + fDistX )
				end
				
				pMonster:SetCountValue( 2 )
				
			elseif ( fRand <= 1.0 ) then
				fDistX = 0.3
				if( pMonster:FloatRand() < 0.5 ) then
					pMonster:SetX( pMonster:GetTargetX() - fDistX )
				else
					pMonster:SetX( pMonster:GetTargetX() + fDistX )
				end
				
				pMonster:SetCountValue( 3 )		
			end
			
			pMonster:SetY( pMonster:GetTargetY() + 0.1 )
		*/--]]

			pMonster:SetState( "TELEPORT" )
		end
    end

	if( pMonster:GetHP() <= 0 ) then
		pMonster:SetState( "DIE_LANDING" )
	end
end

function DarkTemplar_Jump( iMonsterIndex )
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
