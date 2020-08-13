-- AI_BlueAntmonGuard.lua

ActionList =
{	
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "AntmonGuard_Wait.frm",
        Func    = "BlueAntmonGuard_WaitFunc",

        Trigger =
        {
			-- 타게팅
            {
                AICheckFrame        = 55,
                AIFunc              = "BlueAntmonGuard_Check_Targeting",
                DelayFrame          = 110,
            },
            -- 타겟지움
            {
                AICheckFrame        = 220,
                AIFunc              = "BlueAntmonGuard_Check_ReleaseTarget",
                DelayFrame          = 440,
            },
            -- 타겟을 향해 턴
            {
                AICheckFrame        = 75,
                AIFunc              = "BlueAntmonGuard_Check_TurnToTarget",
                DelayFrame          = 75,
            },
            -- 걷기
            {
                AICheckFrame        = 75,
                AIFunc              = "BlueAntmonGuard_Check_Walk",
                DelayFrame          = 110,
            },
            -- 점프업
            {
                AICheckFrame        = 55,
                AIFunc              = "BlueAntmonGuard_Check_JumpUp",
                DelayFrame          = 55,
            },        
            -- 점프다운
            {
                AICheckFrame        = 110,
                AIFunc              = "BlueAntmonGuard_Check_JumpDown",
                DelayFrame          = 165,
            },
            -- 근접공격
            {
                AICheckFrame        = 35,
                AIFunc              = "BlueAntmonGuard_Check_Attack01",
                DelayFrame          = 55,
            },
             -- 근접공격2
            {
                AICheckFrame        = 110,
                AIFunc              = "BlueAntmonGuard_Check_Attack02",
                DelayFrame          = 220,
            },
            -- 어슬렁대기(이동)
            {
                AICheckFrame        = 110,
                AIFunc              = "BlueAntmonGuard_Check_Idle",
                DelayFrame          = 220,
            },
        },
    },

    -- 이동
    {
        ID              = "WALK",
        Motion          = "AntmonGuard_Walk.frm",
        Func            = "BlueAntmonGuard_WalkFunc",
        EnableMoveCheck = TRUE,
        MoveFailFunc    = "BlueAntmonGuard_MoveFail",


        Trigger =
        {
			-- 타게팅
			{
                AICheckFrame        = 55,
                AIFunc              = "BlueAntmonGuard_Check_Targeting",
                DelayFrame          = 110,
            },
            -- 타겟지움
            {
                AICheckFrame        = 220,
                AIFunc              = "BlueAntmonGuard_Check_ReleaseTarget",
                DelayFrame          = 440,
            },
			-- 타겟을 향해 턴
            {
                AICheckFrame        = 55,
                AIFunc              = "BlueAntmonGuard_Check_TurnToTarget",
                DelayFrame          = 55,
            },
            -- 점프업
            {
                AICheckFrame        = 55,
                AIFunc              = "BlueAntmonGuard_Check_JumpUp",
                DelayFrame          = 55,
            },        
            -- 점프다운
            {
                AICheckFrame        = 110,
                AIFunc              = "BlueAntmonGuard_Check_JumpDown",
                DelayFrame          = 220,
            },
			-- 근접공격
            {
                AICheckFrame        = 25,
                AIFunc              = "BlueAntmonGuard_Check_Attack01",
                DelayFrame          = 110,
            },
            -- 멈추기
            {
                AICheckFrame        = 10,
                AIFunc              = "BlueAntmonGuard_Check_Stop",
                DelayFrame          = 55,
            },
        }
    },
    
     -- 어슬렁대기
    {
        ID              = "IDLE",
        Motion          = "AntmonGuard_Walk.frm",
        Func            = "BlueAntmonGuard_IdleFunc",
        EnableMoveCheck = TRUE,
        MoveFailFunc    = "BlueAntmonGuard_IdleMoveFail",


        Trigger =
        {
			-- 타게팅
			{
                AICheckFrame        = 45,
                AIFunc              = "BlueAntmonGuard_Check_Targeting",
                DelayFrame          = 110,
            },
            -- 어슬렁대기(멈춤)
            {
                AICheckFrame        = 330,
                AIFunc              = "BlueAntmonGuard_Check_Idle_Stop",
                DelayFrame          = 330,
            },
        }
    },
        
    -- 근접공격
    {
        ID      = "ATTACK01",
        Motion  = "AntmonGuard_Attack01.frm",
        Func    = "BlueAntmonGuard_Attack01Func",
    },
    
    -- 근접공격2
    {
        ID      = "ATTACK02",
        Motion  = "AntmonGuard_Attack02.frm",
        Func    = "BlueAntmonGuard_Attack02Func",
    },
	
	-- 근접공격3
    {
        ID      = "ATTACK03",
        Motion  = "AntmonGuard_Attack03.frm",
        Func    = "BlueAntmonGuard_Attack03Func",
    },
    
    -- 기상공격
    {
        ID      = "STANDUPATTACK",
        Motion  = "AntmonGuard_StandupAttack.frm",
        Func    = "BlueAntmonGuard_StandupAttackFunc",
    },
    
    -- 점프
    {
        ID      = "JUMP",
        Motion  = "antmonguard_jump_up.frm",
        Func    = "BlueAntmonGuard_JumpFunc",
    },
    
    -- 점프
    {
        ID      = "JUMP_DOWN",
        Motion  = "antmonguard_jump_down.frm",
        Func    = "AntmonGuard_JumpDownFunc",
    },
    
    -- 점프
    {
        ID      = "JUMP_LANDING",
        Motion  = "antmonguard_jump_landing.frm",
        Func    = "AntmonGuard_ToWait",
    },

    -- 데미지 상
    {
        ID      = "DAMAGE_UP",
        Motion  = "AntmonGuard_Damage_Up.frm",
        Func    = "BlueAntmonGuard_DamageFunc",
    },
    
    -- 데미지 중
    {
        ID      = "DAMAGE_MIDDLE",
        Motion  = "AntmonGuard_Damage_Normal.frm",
        Func    = "BlueAntmonGuard_DamageFunc",
    },
    
    -- 데미지 하
    {
        ID      = "DAMAGE_DOWN",
        Motion  = "AntmonGuard_Damage_Down.frm",
        Func    = "BlueAntmonGuard_DamageFunc",
    },

    -- 다운 상
    {
        ID      = "DOWN_UP01",
        Motion  = "AntmonGuard_Down_Up01.frm",
        Func    = "BlueAntmonGuard_DownUpFunc",
        
        Trigger =
        {
            {
                AICheckFrame        = 1,
                AIFunc              = "BlueAntmonGuard_CheckDownUp02",
                DelayFrame          = 0,
            },
        }
    },
    
    -- 다운 상02
    {
        ID      = "DOWN_UP02",
        Motion  = "AntmonGuard_Down_Up02.frm",
        Func    = "BlueAntmonGuard_DownUp02Func",
        IsFallDownMotion    = TRUE,
    },
	
	-- 다운 상 착지
    {
        ID      = "DOWN_UP_LANDING",
        Motion  = "AntmonGuard_Down_Up03.frm",
        Func    = "BlueAntmonGuard_DownUp03Func",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "BlueAntmonGuard_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
	
    -- 다운 중
    {
        ID      = "DOWN_MIDDLE",
        Motion  = "AntmonGuard_Down_Middle.frm",
        Func    = "BlueAntmonGuard_DownFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "BlueAntmonGuard_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- 다운 하
    {
        ID      = "DOWN_DOWN",
        Motion  = "AntmonGuard_Down_Middle.frm",
        Func    = "BlueAntmonGuard_DownFunc",
        IsFallDownMotion    = TRUE,

        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "BlueAntmonGuard_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- 다운 스페셜
    {
        ID      = "DOWN_SPECIAL",
        Motion  = "AntmonGuard_Down_Special01.frm",
        Func    = "BlueAntmonGuard_DownSpecialFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- 다운 스페셜 착지
    {
        ID      = "DOWN_SPECIAL_LANDING",
        Motion  = "AntmonGuard_Down_Special02.frm",
        Func    = "BlueAntmonGuard_DownSpecialLandingFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "BlueAntmonGuard_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },

    -- 죽기
    {
        ID      = "DIE",
        Motion  = "AntmonGuard_Down_Middle.frm",
        Func    = "BlueAntmonGuard_DieFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- 죽기 착지
    {
        ID      = "DIE_LANDING",
        Motion  = "AntmonGuard_Die02.frm",
        Func    = "BlueAntmonGuard_DieLandingFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- 일어나기
    {
        ID      = "STANDUP",
        Motion  = "AntmonGuard_Standup.frm",
        Func    = "BlueAntmonGuard_StandupFunc",
    },
    
    -- 스톤커스
    {
        ID      = "STONECURSE",
        Motion  = "AntmonGuard_Stone.frm",
        Func    = "BlueAntmonGuard_StoneCurseFunc",
    },
    
    -- 빙결상태
    {
        ID      = "ICECURSE",
        Motion  = "AntmonGuard_Stone.frm",
        Func    = "BlueAntmonGuard_IceCurseFunc",
    },
    -- 홀드상태
	{
		ID		= "HOLD",
		Motion	= "AntmonGuard_Stone.frm",
		Func	= "BlueAntmonGuard_HoldFunc",
	},
}

CallBack =
{
    Land    = "OnBlueAntmonGuard_Land",
    Die     = "OnBlueAntmonGuard_Die",
    Damage  = "OnBlueAntmonGuard_Damage",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function InitBlueAntmonGuard( iMonsterIndex )
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
    
end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function BlueAntmonGuard_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 걷기 상태
function BlueAntmonGuard_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
        
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
end

-- 어슬렁대기 상태
function BlueAntmonGuard_IdleFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
        
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "IDLE" )
    end
end

-- 죽었음
function BlueAntmonGuard_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "DIE_LANDING" )
    end
end

-- 죽기 착지
function BlueAntmonGuard_DieLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-- 데미지 입은거
function BlueAntmonGuard_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 다운 상
function BlueAntmonGuard_DownUpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
    elseif( iFrame >= pMonster:GetLastFrame() ) then		
        pMonster:SetFrameLock( true )
    end
end

-- 다운 상2
function BlueAntmonGuard_DownUp02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

-- 다운 상3
function BlueAntmonGuard_DownUp03Func( iMonsterIndex, iFrame )
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
function BlueAntmonGuard_DownFunc( iMonsterIndex, iFrame )
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

-- 다운 스페셜
function BlueAntmonGuard_DownSpecialFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "DOWN_SPECIAL" )
    end
end

-- 다운 스페셜 착지
function BlueAntmonGuard_DownSpecialLandingFunc( iMonsterIndex, iFrame )
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
function BlueAntmonGuard_StandupFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetPushCheck( true )
        pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  근접공격 상태
function BlueAntmonGuard_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame < 21 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 0.5 )
	elseif( iFrame == 31 ) then
		pMonster:AddDamage( DT_MONSTER_ANTMONGUARD01 )
		pMonster:PlaySound(493)
	elseif( iFrame >= 31 and iFrame < 41 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
	elseif( iFrame == 81 ) then
		pMonster:AddDamage( DT_MONSTER_ANTMONGUARD02 )
		pMonster:PlaySound(493)
	elseif( iFrame >= 71 and iFrame < 85 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
	elseif( iFrame >= 109 and iFrame < 135 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 0.5 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end

end

--  근접공격2 상태
function BlueAntmonGuard_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 61 ) then
        pMonster:AddParticle("special02_1_2", 0.00, 0.3)
		pMonster:AddParticle("special02_1_3", 0.00, 0.3)
    elseif( iFrame == 101 ) then
        pMonster:AddDamage( DT_MONSTER_ANTMONGUARD02 )
    elseif( iFrame == 106 ) then
        pMonster:EarthQuakeWithRange( 25, 0.06, 0.028, 0.70 )
    elseif( iFrame == 111 ) then
        pMonster:PlaySound( "47" )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end

end

--  근접공격3 상태
function BlueAntmonGuard_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
	elseif( iFrame == 26 ) then
		pMonster:AddParticle("special02_1_2", 0.04, 0.18)
		pMonster:AddParticle("special02_1_3", 0.04, 0.18)
	elseif( iFrame >= 46 and iFrame < 71 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 7.0 )
    elseif( iFrame == 76 ) then
		pMonster:AddDamage( DT_MONSTER_ANTMONGUARD01 )
	elseif( iFrame == 86 ) then
		pMonster:PlaySound(493)
	elseif( iFrame == 101 ) then
		pMonster:AddDamage( DT_MONSTER_ANTMONGUARD02 )
	elseif( iFrame == 111 ) then
		pMonster:PlaySound(493)
	elseif( iFrame == 121 ) then
		pMonster:AddDamage( DT_MONSTER_ANTMONGUARD02 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end

end

--  기상공격 상태
function BlueAntmonGuard_StandupAttackFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame <= 1 ) then
		pMonster:SetPushCheck( true )
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 61 ) then
		pMonster:SetNoCheckContact(30)
		pMonster:SetSpeedY( 0.024 )
    elseif( iFrame == 91 ) then
        pMonster:EarthQuakeWithRange( 25, 0.06, 0.03, 0.75 )
    elseif( iFrame == 93 ) then
        pMonster:PlaySound( "47" )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end

end

--  점프 상태
function BlueAntmonGuard_JumpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( pMonster:GetSpeedY() <= 0.0 ) then
		pMonster:SetState("JUMP_DOWN")
		pMonster:SetFrameLock( false )
	end
    
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end

end

--  점프 다운 상태
function AntmonGuard_JumpDownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

--  점프 상태
function AntmonGuard_ToWait( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  스톤커스 걸렸음
function BlueAntmonGuard_StoneCurseFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
        pMonster:AddTraceParticle( "StoneCurse_small", 3 )
        pMonster:AddParticle( "StoneCurse_small_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "StoneCurse_small_tick", 0.0, 0.0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:AddParticle( "StoneCurse_small_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "StoneCurse_small_tick", 0.0, 0.0 )
        pMonster:SetInvincible( false )
        pMonster:SetState( "WAIT" )
        
        if( pMonster:GetHP() <= 0 ) then
			pMonster:SetState( "DIE" )
		end
    end
end

--  아이스커스 걸렸음
function BlueAntmonGuard_IceCurseFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
        pMonster:AddTraceParticle( "IceCurse_small", 3 )
        pMonster:AddParticle( "IceCurse_small_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "IceCurse_small_tick", 0.0, 0.0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:AddParticle( "IceCurse_small_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "IceCurse_small_tick", 0.0, 0.0 )
        pMonster:SetSuperArmor( false )
        pMonster:SetState( "WAIT" )
        
        if( pMonster:GetHP() <= 0 ) then
			pMonster:SetState( "DIE" )
		end
    end
end


-- 홀드 걸렸음(이펙트)
function BlueAntmonGuard_HoldFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor(true)
		pMonster:AddParticle( "Arme01_Hold_Beam_effect_01_Small", 0.0, 0.12 )
		pMonster:AddParticle( "Arme01_Hold_Beam_effect_02_Small", 0.0, 0.12 )
		pMonster:AddParticle( "Arme01_Hold_Beam_effect_03_Small", 0.0, 0.12 )
		pMonster:AddParticle( "Arme01_Hold_Beam_effect_04_Small", 0.0, 0.12 )
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

function BlueAntmonGuard_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 100, -400, 200, 400, -100 ) == true or pMonster:SetTarget( 0, -200, 400, 200, -200 ) == true ) then
		pMonster:TurnToTarget()		
		
		if( pMonster:CheckState( "IDLE" ) == true ) then
			pMonster:SetState( "WAIT" )
		end
		
        pMonster:ResetDelay()
    end  
end

function BlueAntmonGuard_Check_ReleaseTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 300, -500, 400, 500, -200 ) == false ) then
		pMonster:ReleaseTarget()
		pMonster:ResetDelay()
	end
end

function BlueAntmonGuard_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function BlueAntmonGuard_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 600, -500, 500, 500, -500 ) == true and pMonster:FloatRand() < 0.7) then
			pMonster:TurnToTarget()
			pMonster:SetState( "WALK" )
			pMonster:ResetDelay()
	end
end

function BlueAntmonGuard_Check_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 150, -160, 100, 160, -140 ) == true ) then
	
		if ( pMonster:FloatRand() < 0.8) then				
			pMonster:SetSpeedX( 0.0 )
			pMonster:SetState( "WAIT" )
		end
		
		pMonster:ResetDelay()
	end
end

function BlueAntmonGuard_CheckDownUp02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetSpeedY() < 0.0 ) then
		pMonster:SetState( "DOWN_UP02" )
	end
end

function BlueAntmonGuard_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 100, -100, 100, 100, -140 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
	end
end

function BlueAntmonGuard_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 100, -400, 400, 400, -300 ) == true and pMonster:FloatRand() < 0.5 and pMonster:GetIsContact() == true and pMonster:GetCountValue() >= 5 ) then
		pMonster:SetState( "ATTACK02" )
		pMonster:SetCountValue(0)
		pMonster:ResetDelay()
	end
end

function BlueAntmonGuard_Check_JumpUp( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 100, -100, 300, 100, 100 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		BlueAntmonGuard_Jump( iMonsterIndex )
		pMonster:SetState( "JUMP" )
		pMonster:ResetDelay()
	end
end

function BlueAntmonGuard_Check_JumpDown( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 60, -100, -40, 100, -200 ) == true ) then
		pMonster:SetNoCheckContact(30)
		pMonster:SetIgnoreFHCheck(true)
		pMonster:SetState( "JUMP_DOWN" )
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )
		pMonster:SetSpeedY( 0.01 )	
		pMonster:ResetDelay()
	end
end

function BlueAntmonGuard_Check_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 120, -130, 100, 130, -140 ) == true ) then
		if ( pMonster:FloatRand() < 0.6 ) then
			pMonster:SetSpeedX( 0.0 )
			pMonster:SetState( "WAIT" )
		end
		pMonster:ResetDelay()
	end
end


function BlueAntmonGuard_CheckStandup( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetHP() > 0 and pMonster:GetDownDelay() == 0 ) then
		if( pMonster:CheckTargetInRange( 0, -300, 400, 300, -100 ) == true and pMonster:FloatRand() < 0.3 ) then
			pMonster:AddCountValue(-3)
			pMonster:SetState( "STANDUPATTACK" )			
		else			
			pMonster:SetState( "STANDUP" )
		end
    end
end

-- 어슬렁대기..  방향 바꾸기 후 이동
function BlueAntmonGuard_Check_Idle( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == false ) then
        pMonster:SetState( "IDLE" )
        pMonster:ResetDelay()
    end
end

-- 어슬렁대는 중.. 멈추기
function BlueAntmonGuard_Check_Idle_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == false and pMonster:FloatRand() < 0.5 ) then
		pMonster:SetSpeedX( 0.0 )
        pMonster:SetState( "WAIT" )
    end
end

-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------
function OnBlueAntmonGuard_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetSpeedX( pMonster:GetSpeedX() * (2.0 / 3.0) )
	
    if( pMonster:CheckState( "JUMP" ) == true or pMonster:CheckState( "JUMP_DOWN" ) == true ) then    
		pMonster:TurnToTarget()
        pMonster:SetState( "JUMP_LANDING" )
    elseif( pMonster:CheckState( "DOWN_UP01" ) == true or pMonster:CheckState( "DOWN_UP02" ) == true ) then		
		pMonster:SetDownDelay( 40 + (pMonster:FloatRand() * 50) )		
		pMonster:SetState( "DOWN_UP_LANDING" )    
	elseif( pMonster:CheckState( "DOWN_SPECIAL" ) == true ) then		
		pMonster:SetDownDelay( 40 + (pMonster:FloatRand() * 50) )		
		pMonster:SetState( "DOWN_SPECIAL_LANDING" )    
    end   
end

function OnBlueAntmonGuard_Die( iMonsterIndex )
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

function OnBlueAntmonGuard_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
    pMonster:SetPushCheck( true )
	pMonster:AddCountValue(1)	
	
	if( pMonster:CheckState( "JUMP" ) == true and pMonster:IsSuperArmor() == false ) then
		pMonster:SetNoCheckContact( 5 )
	end
	
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
	
	if( pMonster:IsSuperArmor() == false and pMonster:CheckState( "DOWN_UP01" ) == false and pMonster:CheckState( "DOWN_MIDDLE" ) == false and pMonster:CheckState( "DOWN_DOWN" ) == false and pMonster:CheckState( "DOWN_SPECIAL" ) == false and pMonster:CheckState( "STONECURSE" ) == false and pMonster:CheckState( "ICECURSE" ) == false ) then
		if ( pMonster:FloatRand() < 0.1 and pMonster:GetIsContact() == true and pMonster:GetIsRight() ~= pMonster:GetTargetIsRight() ) then
			if ( pMonster:FloatRand() < 0.5 ) then
				pMonster:SetState( "ATTACK02" )
			else
				pMonster:SetState( "ATTACK03" )
			end
			
			pMonster:TurnToTarget()
			pMonster:SetSuperArmor( true )
			
		end
    end
end

function BlueAntmonGuard_Jump( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	local fTargetX = pMonster:GetTargetX()
	local fTargetY = pMonster:GetTargetY()
	
	local fMonX = pMonster:GetX()
	local fMonY = pMonster:GetY()
		
	fSpeedX = ( fTargetX - fMonX ) * 1.5
	fSpeedY = ((fTargetY - fMonY) / ((fTargetY - fMonY) / 4.0)) + (((fTargetY - fMonY) * 1.5) + pMonster:FloatAbs((fSpeedX / 3.1)))
	
	pMonster:SetNoCheckContact(26 + (fSpeedY * 4.9))
	pMonster:TurnToTarget()
	pMonster:SetSpeedX( fSpeedX * 0.01 )
	pMonster:SetSpeedY( fSpeedY * 0.01 )
end

function BlueAntmonGuard_MoveFail( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:GetIsContact() == true )then		
		if( pMonster:GetY() - (0.1) < pMonster:GetTargetY() )then			
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

function BlueAntmonGuard_IdleMoveFail( iMonsterIndex )
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
