-- AI_BlackFairy_Boss.lua

ActionList =
{	
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "BlackFairy_Wait.frm",
        Func    = "BlackFairy_Boss_WaitFunc",

        Trigger =
        {
			-- 타게팅
            {
                AICheckFrame        = 25,
                AIFunc              = "BlackFairy_Boss_Check_Targeting",
                DelayFrame          = 110,
            },
            -- 타겟지움
            {
                AICheckFrame        = 220,
                AIFunc              = "BlackFairy_Boss_Check_ReleaseTarget",
                DelayFrame          = 440,
            },
            -- 타겟을 향해 턴
            {
                AICheckFrame        = 25,
                AIFunc              = "BlackFairy_Boss_Check_TurnToTarget",
                DelayFrame          = 55,
            },
            -- 얼음가시공격
            {
                AICheckFrame        = 55,
                AIFunc              = "BlackFairy_Boss_Check_Attack01",
                DelayFrame          = 55,
            },
            -- 아이스브레스
            {
                AICheckFrame        = 75,
                AIFunc              = "BlackFairy_Boss_Check_Attack02",
                DelayFrame          = 550,
            },
            -- 걷기
            {
                AICheckFrame        = 220,
                AIFunc              = "BlackFairy_Boss_Check_Walk",
                DelayFrame          = 220,
            },            
            -- 텔레포트(타겟에게로)
            {
                AICheckFrame        = 110,
                AIFunc              = "BlackFairy_Boss_Check_Teleport2",
                DelayFrame          = 110,
            },
            -- 텔레포트(타겟에서 도망치기)
            {
                AICheckFrame        = 110,
                AIFunc              = "BlackFairy_Boss_Check_Teleport",
                DelayFrame          = 110,
            },
			-- 해골소환
            {
                AICheckFrame        = 500,
                AIFunc              = "BlackFairy_Boss_Check_SummonMonster",
                DelayFrame          = 1500,
            },
        },
    },

	
		
    -- 이동
    {
        ID      = "WALK",
        Motion  = "BlackFairy_Walk.frm",
        Func    = "BlackFairy_Boss_WalkFunc",
        EnableMoveCheck = 1,
        MoveFailFunc    = "BlackFairy_Boss_MoveFail",

        Trigger =
        {
			-- 타게팅
			{
                AICheckFrame        = 25,
                AIFunc              = "BlackFairy_Boss_Check_Targeting",
                DelayFrame          = 110,
            },
			-- 타겟을 향해 턴
            {
                AICheckFrame        = 25,
                AIFunc              = "BlackFairy_Boss_Check_TurnToTarget",
                DelayFrame          = 55,
            },
            -- 얼음가시공격
            {
                AICheckFrame        = 55,
                AIFunc              = "BlackFairy_Boss_Check_Attack01",
                DelayFrame          = 110,
            },
            -- 텔레포트(타겟에게로)
            {
                AICheckFrame        = 110,
                AIFunc              = "BlackFairy_Boss_Check_Teleport2",
                DelayFrame          = 110,
            },
            -- 텔레포트(타겟에서 도망치기)
            {
                AICheckFrame        = 55,
                AIFunc              = "BlackFairy_Boss_Check_Teleport",
                DelayFrame          = 55,
            },
			-- 멈추기
            {
                AICheckFrame        = 110,
                AIFunc              = "BlackFairy_Boss_Check_WalkStop",
                DelayFrame          = 110,
            },
        }
    },
    
    -- 텔레포트
    {
        ID      = "TELEPORT",
        Motion  = "BlackFairy_Teleport.frm",
        Func    = "BlackFairy_Boss_TeleportFunc",
        
        Trigger =
        {
			-- 타게팅
			{
                AICheckFrame        = 30,
                AIFunc              = "BlackFairy_Boss_Check_TeleportLanding",
                DelayFrame          = 0,
            },
        }
    },
    
    -- 텔레포트 착지
    {
        ID      = "TELEPORT_LANDING",
        Motion  = "BlackFairy_Teleport_Landing.frm",
        Func    = "BlackFairy_Boss_TeleportLandingFunc",
    },
    
    -- 얼음가시공격
    {
        ID      = "ATTACK01",
        Motion  = "BlackFairy_Attack01.frm",
        Func    = "BlackFairy_Boss_Attack01Func",
    },
    
    -- 아이스브레스
    {
        ID      = "ATTACK02",
        Motion  = "BlackFairy_Attack02.frm",
        Func    = "BlackFairy_Boss_Attack02Func",
    },
    
    -- 얼음메테오
    {
        ID      = "ATTACK03",
        Motion  = "BlackFairy_Attack03.frm",
        Func    = "BlackFairy_Boss_Attack03Func",
    },
	
	-- 해골격투가 소환
    {
        ID      = "SUMMON_MONSTER",
        Motion  = "BlackFairy_Attack01.frm",
        Func    = "BlackFairy_Boss_SummonMonsterFunc",
    },
    
    -- 점프
    {
        ID      = "JUMP",
        Motion  = "BlackFairy_Jump.frm",
        Func    = "BlackFairy_Boss_JumpFunc",
    },
    
    -- 점프다운
    {
        ID      = "JUMPDOWN",
        Motion  = "BlackFairy_JumpDown.frm",
        Func    = "BlackFairy_Boss_JumpFunc",
    },

    -- 데미지 상
    {
        ID      = "DAMAGE_UP",
        Motion  = "BlackFairy_Damage_Up.frm",
        Func    = "BlackFairy_Boss_DamageFunc",
    },
    
    -- 데미지 중
    {
        ID      = "DAMAGE_MIDDLE",
        Motion  = "BlackFairy_Damage_Middle.frm",
        Func    = "BlackFairy_Boss_DamageFunc",
    },
    
    -- 데미지 하
    {
        ID      = "DAMAGE_DOWN",
        Motion  = "BlackFairy_Damage_Down.frm",
        Func    = "BlackFairy_Boss_DamageFunc",
    },

    -- 다운 상
    {
        ID      = "DOWN_UP01",
        Motion  = "BlackFairy_Down_Up01.frm",
        Func    = "BlackFairy_Boss_DownUpFunc",
        
        Trigger =
        {
            {
                AICheckFrame        = 1,
                AIFunc              = "BlackFairy_Boss_CheckDownUp02",
                DelayFrame          = 0,
            },
        }
    },
    
    -- 다운 상02
    {
        ID      = "DOWN_UP02",
        Motion  = "BlackFairy_Down_Up02.frm",
        Func    = "BlackFairy_Boss_DownUp02Func",
        IsFallDownMotion    = TRUE,
    },
	
	-- 다운 상 착지
    {
        ID      = "DOWN_UP_LANDING",
        Motion  = "BlackFairy_Down_Up03.frm",
        Func    = "BlackFairy_Boss_DownFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "BlackFairy_Boss_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- 다운 중
    {
        ID      = "DOWN_MIDDLE",
        Motion  = "BlackFairy_Down_Middle.frm",
        Func    = "BlackFairy_Boss_DownFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "BlackFairy_Boss_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- 다운 하
    {
        ID      = "DOWN_DOWN",
        Motion  = "BlackFairy_Down_Middle.frm",
        Func    = "BlackFairy_Boss_DownDownFunc",
        IsFallDownMotion    = TRUE,

        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "BlackFairy_Boss_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- 다운 스페셜
    {
        ID      = "DOWN_SPECIAL",
        Motion  = "BlackFairy_Down_Special01.frm",
        Func    = "BlackFairy_Boss_DownSpecialFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- 다운 스페셜 착지
    {
        ID      = "DOWN_SPECIAL_LANDING",
        Motion  = "BlackFairy_Down_Special02.frm",
        Func    = "BlackFairy_Boss_DownSpecialLandingFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "BlackFairy_Boss_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- 죽기
    {
        ID      = "DIE",
        Motion  = "BlackFairy_Die01.frm",
        Func    = "BlackFairy_Boss_DieFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- 죽기 착지
    {
        ID      = "DIE_LANDING",
        Motion  = "BlackFairy_Die02.frm",
        Func    = "BlackFairy_Boss_DieLandingFunc",
        IsFallDownMotion    = TRUE,
    },

    -- 일어나기
    {
        ID      = "STANDUP",
        Motion  = "BlackFairy_Standup.frm",
        Func    = "BlackFairy_Boss_StandupFunc",
    },
    
    -- 스톤커스
    {
        ID      = "STONECURSE",
        Motion  = "BlackFairy_Stone.frm",
        Func    = "BlackFairy_Boss_StoneCurseFunc",
    },
    
    -- 빙결상태
    {
        ID      = "ICECURSE",
        Motion  = "BlackFairy_Stone.frm",
        Func    = "BlackFairy_Boss_IceCurseFunc",
    },
    -- 홀드상태
	{
		ID		= "HOLD",
		Motion	= "BlackFairy_Stone.frm",
		Func	= "BlackFairy_Boss_HoldFunc",
	},
	
	-- 드라마 대기
	{
        ID      = "WAIT_DRAMA",
        Motion  = "BlackFairy_Wait.frm",
        Func    = "BlackFairy_Boss_WaitDramaFunc",
	},
	
	-- 힐 
	{
        ID      = "HEAL",
        Motion  = "BlackFairy_Attack01.frm",
        Func    = "BlackFairy_Boss_HealFunc",
	},
}

CallBack =
{
    Land    = "OnBlackFairy_Boss_Land",
    Die     = "OnBlackFairy_Boss_Die",
    Damage  = "OnBlackFairy_Boss_Damage",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function InitBlackFairy_Boss( iMonsterIndex )
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
	
	pMonster:RegisterSummonMonsterType( MON_SKELETON_FIGHTER )
end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function BlackFairy_Boss_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
end


-- 드라마_대기 상태
function BlackFairy_Boss_WaitDramaFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame <= 1 ) then
		pMonster:SetIsRight( false )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
end

-- 힐_드라마 상태
function BlackFairy_Boss_HealFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame == 36 ) then
		pMonster:AddDamageWithLocate( DT_BOOST_HEAL1, 0.0, 0.1 )
	elseif( iFrame == 38 ) then
		pMonster:AddDamageWithLocate( DT_BOOST_HEAL2, 0.0, 0.1 )
		pMonster:PlaySound( 46 )
		
		if( pMonster:GetHP() <=  pMonster:GetMaxHP() * 0.4 ) then
			pMonster:SetHP(pMonster:GetHP() + pMonster:GetMaxHP() * 0.1  )
		end
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
end

-- 걷기 상태
function BlackFairy_Boss_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
        
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
end

-- 죽는상태
function BlackFairy_Boss_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
		pMonster:SetFly( false )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "DIE_LANDING" )
    end
end

-- 죽는상태 착지
function BlackFairy_Boss_DieLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		--pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-- 데미지 입은거
function BlackFairy_Boss_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 다운 상
function BlackFairy_Boss_DownUpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
    elseif( iFrame >= pMonster:GetLastFrame() ) then		
        pMonster:SetFrameLock( true )
    end
end

-- 다운 상2
function BlackFairy_Boss_DownUp02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

-- 다운 상3
function BlackFairy_Boss_DownUp03Func( iMonsterIndex, iFrame )
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
function BlackFairy_Boss_DownFunc( iMonsterIndex, iFrame )
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
function BlackFairy_Boss_DownDownFunc( iMonsterIndex, iFrame )
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
function BlackFairy_Boss_DownSpecialFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "DOWN_SPECIAL" )
    end
end

-- 다운 스페셜 착지
function BlackFairy_Boss_DownSpecialLandingFunc( iMonsterIndex, iFrame )
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
function BlackFairy_Boss_StandupFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetPushCheck( true )
        pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
end

--  얼음가시공격 상태
function BlackFairy_Boss_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame == 36 ) then
		pMonster:AddDamage( DT_MONSTER_BLACKFAIRY01 )
		pMonster:AddParticle( "black fairy_ice drill 01", 0.15, 0.34 )
		pMonster:AddParticle( "black fairy_ice drill 02", 0.2, 0.34 )
		pMonster:AddParticle( "black fairy_ice drill 03", 0.2, 0.34 )
		pMonster:AddParticle( "black fairy_ice drill 04", 0.35, 0.34 )
		pMonster:PlaySound(286)
	elseif( iFrame == 61 ) then
		pMonster:AddParticle( "black fairy_ice drill_after 01", 0.4, 0.34 )
		pMonster:AddParticle( "black fairy_ice drill_after 02", 0.4, 0.34 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  아이스브레스 상태
function BlackFairy_Boss_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 31 ) then
		pMonster:AddDamageWithLocate( DT_MONSTER_WENDY03, 0.0, 0.15 )
		pMonster:AddParticle( "black fairy_ice breath01", 0.15, 0.34 )
		pMonster:AddParticle( "black fairy_ice breath02", 0.15, 0.34 )
		pMonster:AddParticle( "black fairy_ice breath03", 0.15, 0.34 )
		pMonster:PlaySound(458)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 얼음메테오
function BlackFairy_Boss_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
		pMonster:SetFly( true )
	elseif( iFrame > 6 and iFrame <= 40 ) then
		if( pMonster:GetIsRight() ) then
			pMonster:SetSpeedX( -0.006 )
		else
			pMonster:SetSpeedX( 0.006 )
		end	
		pMonster:SetNoCheckContact( 5 )
		pMonster:SetSpeedY( 0.004 )
		
		-- 동시에 소환해주세요..
		-- 따로따로 하니까 하나밖에 안나옴..
		if( iFrame == 30 ) then
			if( pMonster:GetIsRight() ) then
				pMonster:AddDamageWithLocate( DT_ARME4_SPECIAL3_METEO_READY, -0.5, 0.0 )
			else
				pMonster:AddDamageWithLocate( DT_ARME4_SPECIAL3_METEO_READY, 0.4, 0.0 )
			end	
		end

    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFly( false )
        pMonster:SetFrameLock( true )				
    end
end

-- 해골소환
function BlackFairy_Boss_SummonMonsterFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 36 ) then
        local pMon = KSummonInfo()
        pMon:Init()
        pMon:SetState("WAIT")
        pMon.iMonType = MON_SKELETON_FIGHTER
        pMon.fX = -100
        pMon.fY = 0
        pMonster:SummonMonster( pMon )
		local pMon = KSummonInfo()
        pMon:Init()
        pMon:SetState("WAIT")
        pMon.iMonType = MON_SKELETON_FIGHTER
        pMon.fX = 100
        pMon.fY = 0
        pMonster:SummonMonster( pMon )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end	
end

--  점프 상태
function BlackFairy_Boss_JumpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )				
    end
end

--  텔레포트 상태
function BlackFairy_Boss_TeleportFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:ToggleRender( false )
		pMonster:SetPushCheck( false )
		pMonster:SetInvincibleFrame( pMonster:GetLastFrame() + 10 )
		pMonster:AddParticle( "warp01", 0.0, -0.2 )
		pMonster:AddParticle( "warp02", 0.0, -0.2 )
		pMonster:PlaySound( "486" )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )				
    end
end

--  텔레포트 착지 상태
function BlackFairy_Boss_TeleportLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:AddParticle( "warp01", 0.0, -0.2 )
		pMonster:AddParticle( "warp02", 0.0, -0.2 )
		pMonster:PlaySound( "486" )
    elseif( iFrame == 6 ) then		
		pMonster:ToggleRender( true )
		pMonster:SetPushCheck( true )
    elseif( iFrame == 10 ) then		
		pMonster:SetInvincible( false )		
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        if( pMonster:GetCountValue() == 1 ) then
			pMonster:SetState( "ATTACK01" )   -- 불공격		
		elseif( pMonster:GetCountValue() == 2 ) then
			pMonster:SetState( "ATTACK02" )   -- 라이트닝
		elseif( pMonster:GetCountValue() == 3 ) then
			pMonster:SetState( "ATTACK03" )   -- 메테오
		else
			pMonster:SetState( "WAIT" )   -- 가만있기
		end
		
		pMonster:SetCountValue(0)
    end
end

--  스톤커스 걸렸음
function BlackFairy_Boss_StoneCurseFunc( iMonsterIndex, iFrame )
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
function BlackFairy_Boss_IceCurseFunc( iMonsterIndex, iFrame )
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
function BlackFairy_Boss_HoldFunc( iMonsterIndex, iFrame )
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

function BlackFairy_Boss_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 100, -400, 200, 400, -100 ) == true or pMonster:SetTarget( 0, -200, 400, 200, -200 ) == true ) then
        pMonster:ResetDelay()
    end
end

function BlackFairy_Boss_Check_ReleaseTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 0, -1100, 900, 1100, -900 ) == false ) then
		pMonster:ReleaseTarget()
		pMonster:ResetDelay()
	end
end

function BlackFairy_Boss_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function BlackFairy_Boss_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == true and pMonster:CheckTargetInRange( 100, -200, 400, 200, -400 ) == false ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "WALK" )
        pMonster:ResetDelay()
    end
end

function BlackFairy_Boss_Check_WalkStop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 100, -200, 400, 200, -400 ) == true or pMonster:FloatRand() < 0.2) then
    	pMonster:SetSpeedX( 0.0 )
		pMonster:SetState( "WAIT" )		
		pMonster:ResetDelay()
    end
end

function BlackFairy_Boss_CheckDownUp02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetSpeedY() < 0.0 ) then
		pMonster:SetState( "DOWN_UP02" )
	end
end

function BlackFairy_Boss_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 120, -120, 150, 120, -100 ) == true ) then
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
    end
end

function BlackFairy_Boss_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 250, -50, 140, 50, -140 ) == true ) then
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
    end
end

function BlackFairy_Boss_Check_Teleport( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 0, -300, 300, 300, -300 ) == true ) then
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

function BlackFairy_Boss_Check_Teleport2( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:IsTarget() == true and pMonster:CheckTargetInRange( 0, -300, 130, 300, -130 ) == false ) then
		local fRand = pMonster:FloatRand()
		local fDistX = 0.2
		
		if ( fRand < 0.4 ) then			
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
			
		elseif ( fRand < 1.0 ) then						
			fDistX = 0.5
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

function BlackFairy_Boss_Check_TeleportLanding( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	pMonster:TurnToTarget()
	pMonster:SetState( "TELEPORT_LANDING" )
	pMonster:ResetDelay()	
end

function BlackFairy_Boss_CheckStandup( iMonsterIndex, iFrame )
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

function BlackFairy_Boss_Check_SummonMonster( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetSummonedMonsterCount() < 2 ) then
        pMonster:SetState( "SUMMON_MONSTER" )
        pMonster:ResetDelay()
    end
end


-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------
function OnBlackFairy_Boss_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    pMonster:SetSpeedX( pMonster:GetSpeedX() * (2.0 / 3.0) )

	if( pMonster:CheckState( "JUMP" ) == true ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "WAIT" )
	elseif( pMonster:CheckState( "ATTACK03" ) == true ) then
		pMonster:SetState( "WAIT" )    
	elseif( pMonster:CheckState( "DOWN_UP01" ) == true or pMonster:CheckState( "DOWN_UP02" ) == true ) then		
		pMonster:SetDownDelay( 40 + (pMonster:FloatRand() * 50) )		
		pMonster:SetState( "DOWN_UP_LANDING" )    
	elseif( pMonster:CheckState( "DOWN_SPECIAL" ) == true ) then		
		pMonster:SetDownDelay( 40 + (pMonster:FloatRand() * 50) )		
		pMonster:SetState( "DOWN_SPECIAL_LANDING" )    
    end
end

function OnBlackFairy_Boss_Die( iMonsterIndex )
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

function OnBlackFairy_Boss_Damage( iMonsterIndex )
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
		if ( pMonster:FloatRand() < 0.2 ) then			
		
			local fRand = pMonster:FloatRand()
			
			if( fRand < 0.3 ) then			
				if( pMonster:GetTargetIsRight() == true ) then
					pMonster:SetX( pMonster:GetTargetX() - 0.2 )
				else
					pMonster:SetX( pMonster:GetTargetX() + 0.2 )
				end
				
				pMonster:SetCountValue( 1 )
				
			elseif( fRand < 0.6 ) then			
				if( pMonster:FloatRand() < 0.5 ) then
					pMonster:SetX( pMonster:GetTargetX() - 0.7 )
				else
					pMonster:SetX( pMonster:GetTargetX() + 0.7 )
				end
				
				pMonster:SetCountValue( 2 )
				
			elseif( fRand < 1.0 ) then						
				if( pMonster:FloatRand() < 0.5 ) then
					pMonster:SetX( pMonster:GetTargetX() + 0.3 )
				else
					pMonster:SetX( pMonster:GetTargetX() - 0.3 )
				end
				
				pMonster:SetCountValue( 3 )		
			end
			
			pMonster:SetY( pMonster:GetTargetY() + 0.1 )
			pMonster:SetState( "TELEPORT" )
		end
    end

end

function BlackFairy_Boss_Jump( iMonsterIndex )
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

function BlackFairy_Boss_MoveFail( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:GetIsContact() == true )then		
		if( pMonster:GetY() - (0) < pMonster:GetTargetY() )then			
			pMonster:SetNoCheckContact(27)
			pMonster:SetState( "JUMP" )			
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )			
			pMonster:SetSpeedY( 0.038 )			
		else
			pMonster:SetNoCheckContact(15)
			pMonster:SetState( "JUMP" )		
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )
			pMonster:SetSpeedY( 0.019 )	
		end
	end
end
