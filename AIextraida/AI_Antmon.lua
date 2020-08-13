-- AI_Antmon.lua

ActionList =
{	
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "Antmon_Wait.frm",
        Func    = "Antmon_WaitFunc",


		-- 대기상태일동안 수행될수 있는 트리거들을 나열한다.
		
        Trigger =
        {
            -- 타게팅
            {
                AICheckFrame        = 55,                            -- 얼마나 자주 현재의 트리거를 체크할 것인지를 수치로 입력(프레임)
                AIFunc              = "Antmon_Check_Targeting",      -- 트리거가 체크되었을때 명령을 수행할 함수의 이름을 입력(수행조건을 입력하는 함수)
                DelayFrame          = 110,                           -- 명령이 수행되었을때 트리거 체크를 얼마동안 멈출 것인지를 수치로 입력
            },
            -- 타겟지움
            {
                AICheckFrame        = 330,
                AIFunc              = "Antmon_Check_ReleaseTarget",
                DelayFrame          = 550,
            },
            -- 타겟을 향해 턴
            {
                AICheckFrame        = 75,
                AIFunc              = "Antmon_Check_TurnToTarget",
                DelayFrame          = 75,
            },
            -- 걷기
            {
                AICheckFrame        = 75,
                AIFunc              = "Antmon_Check_Walk",
                DelayFrame          = 110,
            },
            -- 달리기
            {
                AICheckFrame        = 75,
                AIFunc              = "Antmon_Check_Run",
                DelayFrame          = 110,
            },
            -- 점프이동
            {
                AICheckFrame        = 75,
                AIFunc              = "Antmon_Check_JumpMove",
                DelayFrame          = 220,
            },        
            -- 점프공격
            {
                AICheckFrame        = 75,
                AIFunc              = "Antmon_Check_JumpAttack",
                DelayFrame          = 75,
            },
            -- 점프업
            {
                AICheckFrame        = 75,
                AIFunc              = "Antmon_Check_JumpUp",
                DelayFrame          = 75,
            },        
            -- 점프다운
            {
                AICheckFrame        = 165,
                AIFunc              = "Antmon_Check_JumpDown",
                DelayFrame          = 165,
            },
			-- 필살기
            {
                AICheckFrame        = 45,
                AIFunc              = "Antmon_Check_SpecialAttack",
                DelayFrame          = 550,
            },
            -- 근접공격
            {
                AICheckFrame        = 55,
                AIFunc              = "Antmon_Check_Attack01",
                DelayFrame          = 55,
            },
            -- 어슬렁대기(이동)
            {
                AICheckFrame        = 110,
                AIFunc              = "Antmon_Check_Idle",
                DelayFrame          = 110,
            },
        },
    },

    -- 이동
    {
        ID              = "WALK",
        Motion          = "Antmon_Walk.frm",
        Func            = "Antmon_WalkFunc",
        EnableMoveCheck = TRUE,
        MoveFailFunc    = "Antmon_MoveFail",


        Trigger =
        {
            -- 타게팅
            {
                AICheckFrame        = 55,
                AIFunc              = "Antmon_Check_Targeting",
                DelayFrame          = 110,
            },
            -- 타겟지움
            {
                AICheckFrame        = 220,
                AIFunc              = "Antmon_Check_ReleaseTarget",
                DelayFrame          = 440,
            },
            -- 타겟을 향해 턴
            {
                AICheckFrame        = 55,
                AIFunc              = "Antmon_Check_TurnToTarget",
                DelayFrame          = 55,
            },
            -- 점프업
            {
                AICheckFrame        = 55,
                AIFunc              = "Antmon_Check_JumpUp",
                DelayFrame          = 55,
            },        
            -- 점프다운
            {
                AICheckFrame        = 110,
                AIFunc              = "Antmon_Check_JumpDown",
                DelayFrame          = 110,
            },
            -- 근접공격
            {
                AICheckFrame        = 15,
                AIFunc              = "Antmon_Check_Attack01",
                DelayFrame          = 110,
            },
			-- 멈추기
            {
                AICheckFrame        = 10,
                AIFunc              = "Antmon_Check_Stop",
                DelayFrame          = 55,
            },
        }
    },
    
    -- 어슬렁대기
    {
        ID              = "IDLE",
        Motion          = "Antmon_Walk.frm",
        Func            = "Antmon_IdleFunc",
        EnableMoveCheck = TRUE,
        MoveFailFunc    = "Antmon_IdleMoveFail",


        Trigger =
        {
            -- 타게팅
            {
                AICheckFrame        = 45,
                AIFunc              = "Antmon_Check_Targeting",
                DelayFrame          = 110,
            },
            -- 어슬렁대기(멈춤)
            {
                AICheckFrame        = 440,
                AIFunc              = "Antmon_Check_Idle_Stop",
                DelayFrame          = 440,
            },
        }
    },
    
    -- 달리기
    {
        ID              = "RUN",
        Motion          = "Antmon_Run.frm",
        Func            = "Antmon_RunFunc",
        EnableMoveCheck = TRUE,
        MoveFailFunc    = "Antmon_MoveFail",


        Trigger =
        {
			-- 멈추기
            {
                AICheckFrame        = 1,
                AIFunc              = "Antmon_Check_RunStop",
                DelayFrame          = 1,
            },
        }
    },

    -- 근접공격01
    {
        ID      = "ATTACK01",
        Motion  = "Antmon_Attack01.frm",
        Func    = "Antmon_Attack01Func",
    },
	
	-- 필살기
    {
        ID      = "SPECIAL_ATTACK",
        Motion  = "Antmon_SpecialAttack.frm",
        Func    = "Antmon_SpecialAttackFunc",
    },

    -- 점프
    {
        ID      = "JUMP",
        Motion  = "antmon_jump_up.frm",
        Func    = "Antmon_JumpFunc",
    },
    
    -- 점프
    {
        ID      = "JUMP_DOWN",
        Motion  = "antmon_Jump_Down.frm",
        Func    = "Antmon_JumpDownFunc",
    },
    
    -- 점프
    {
        ID      = "JUMP_LANDING",
        Motion  = "antmon_Jump_Landing.frm",
        Func    = "Antmon_ToWait",
    },

    -- 점프공격
    {
        ID      = "JUMPATTACK",
        Motion  = "Antmon_JumpAttack.frm",
        Func    = "Antmon_JumpAttackFunc",
    },

    -- 데미지 상
    {
        ID      = "DAMAGE_UP",
        Motion  = "Antmon_Damage_Up.frm",
        Func    = "Antmon_DamageFunc",
    },
    
    -- 데미지 중
    {
        ID      = "DAMAGE_MIDDLE",
        Motion  = "Antmon_Damage_Middle.frm",
        Func    = "Antmon_DamageFunc",
    },
    
    -- 데미지 하
    {
        ID      = "DAMAGE_DOWN",
        Motion  = "Antmon_Damage_Down.frm",
        Func    = "Antmon_DamageFunc",
    },

    -- 다운 상
    {
        ID                  = "DOWN_UP01",
        Motion              = "Antmon_Down_Up01.frm",
        Func                = "Antmon_DownUpFunc",
        
        Trigger =
        {
            {
                AICheckFrame        = 1,
                AIFunc              = "Antmon_CheckDownUp02",
                DelayFrame          = 0,
            },
        }
    },
    
    -- 다운 상02
    {
        ID                  = "DOWN_UP02",
        Motion              = "Antmon_Down_Up02.frm",
        Func                = "Antmon_DownUp02Func",
        IsFallDownMotion    = TRUE,
    },
    
    -- 다운 상 착지
    {
        ID                  = "DOWN_UP_LANDING",
        Motion              = "Antmon_Down_Up03.frm",
        Func                = "Antmon_DownUp03Func",
        IsFallDownMotion    = TRUE,

        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "Antmon_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- 다운 중
    {
        ID                  = "DOWN_MIDDLE",
        Motion              = "Antmon_Down_Middle.frm",
        Func                = "Antmon_DownFunc",
        IsFallDownMotion    = TRUE,

        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "Antmon_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },

    -- 다운 하
    {
        ID                  = "DOWN_DOWN",
        Motion              = "Antmon_Down_Down.frm",
        Func                = "Antmon_DownDownFunc",
        IsFallDownMotion    = TRUE,

        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "Antmon_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- 다운 스페셜
    {
        ID                  = "DOWN_SPECIAL",
        Motion              = "Antmon_Down_Special01.frm",
        Func                = "Antmon_DownSpecialFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- 다운 스페셜 착지
    {
        ID                  = "DOWN_SPECIAL_LANDING",
        Motion              = "Antmon_Down_Special02.frm",
        Func                = "Antmon_DownSpecialLandingFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "Antmon_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- 죽기
    {
        ID                  = "DIE",
        Motion              = "Antmon_Die01.frm",
        Func                = "Antmon_DieFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- 죽기 착지
    {
        ID                  = "DIE_LANDING",
        Motion              = "Antmon_Die02.frm",
        Func                = "Antmon_DieLandingFunc",
        IsFallDownMotion    = TRUE,
    },

    -- 일어나기
    {
        ID      = "STANDUP",
        Motion  = "Antmon_Standup.frm",
        Func    = "Antmon_StandupFunc",
    },
    
    -- 기상공격
    {
        ID      = "STANDUP_ATTACK",
        Motion  = "Antmon_StandupAttack.frm",
        Func    = "Antmon_StandupAttackFunc",
    },
    
    -- 회피
    {
        ID      = "AVOID",
        Motion  = "Antmon_Avoid.frm",
        Func    = "Antmon_AvoidFunc",
    },
    
    -- 스톤커스
    {
        ID      = "STONECURSE",
        Motion  = "Antmon_Stone.frm",
        Func    = "Antmon_StoneCurseFunc",
    },
    
    -- 빙결상태
    {
        ID      = "ICECURSE",
        Motion  = "Antmon_Stone.frm",
        Func    = "Antmon_IceCurseFunc",
    },
    -- 홀드상태
	{
		ID		= "HOLD",
		Motion	= "Antmon_Stone.frm",
		Func	= "Antmon_HoldFunc",
	},
}

CallBack =
{
    Land    = "OnAntmon_Land",
    Die     = "OnAntmon_Die",
    Damage  = "OnAntmon_Damage",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function InitAntmon( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
        
	pMonster:RegistReaction(	ATTACKTYPE_HOLD,	ATTACKDIR_NORMAL,	"HOLD"	)
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_UP,           "DAMAGE_UP" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_MIDDLE,       "DAMAGE_MIDDLE" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_DOWN,         "DAMAGE_DOWN" )
 
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_UP,             "DOWN_UP01" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_MIDDLE,         "DOWN_MIDDLE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_DOWN,           "DOWN_DOWN" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_NORMAL,         "DOWN_SPECIAL" )

    pMonster:RegistReaction( ATTACKTYPE_STONECURSE, ATTACKDIR_NORMAL,   "STONECURSE" )
    pMonster:RegistReaction( ATTACKTYPE_ICECURSE, ATTACKDIR_NORMAL,   "ICECURSE" )
end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function Antmon_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame == 1 ) then
		pMonster:SetSpeedX( 0.0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 걷기 상태
function Antmon_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetWalkSpeed() )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
end

-- 어슬렁대기 상태
function Antmon_IdleFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetWalkSpeed() )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "IDLE" )
    end
end

-- 달리기 상태
function Antmon_RunFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetRunSpeed() )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "RUN" )
    end
end

-- 죽는상태
function Antmon_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "DIE_LANDING" )
    end
end

-- 죽는상태 착지
function Antmon_DieLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-- 데미지 입은거
function Antmon_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 다운 상
function Antmon_DownUpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetPushCheck( false )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

-- 다운 상2
function Antmon_DownUp02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

-- 다운 상3
function Antmon_DownUp03Func( iMonsterIndex, iFrame )
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
function Antmon_DownFunc( iMonsterIndex, iFrame )
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
function Antmon_DownDownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
        pMonster:SetPushCheck( false )
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 7 ) then
        pMonster:SetSpeedX( pMonster:GetSpeedX() / 5 )
        pMonster:SetSpeedY( 0.032 )        
    elseif( iFrame >= pMonster:GetLastFrame() ) then
            pMonster:SetState( "DOWN_UP01" )
    end
end

-- 다운 스페셜
function Antmon_DownSpecialFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
        pMonster:SetPushCheck( false )
        pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "DOWN_SPECIAL" )
    end
end

-- 다운 스페셜 착지
function Antmon_DownSpecialLandingFunc( iMonsterIndex, iFrame )
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
function Antmon_StandupFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
        pMonster:SetPushCheck( true )
        pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 기상공격
function Antmon_StandupAttackFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
        pMonster:SetPushCheck( true )
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 56 ) then
        pMonster:SetNoCheckContact( 40 )
        if( pMonster:GetIsRight() ) then
            pMonster:SetSpeedX( 0.007 )
        else
            pMonster:SetSpeedX( -0.007 )
        end
        pMonster:SetSpeedY( 0.034 )
    elseif( iFrame == 86 ) then
        pMonster:AddDamage( DT_MONSTER_ANTMON01 )
    elseif( iFrame == 93 ) then
        pMonster:AddDamage( DT_MONSTER_ANTMON01 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  근접공격 상태
function Antmon_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame == 33 ) then
        pMonster:AddDamage( DT_MONSTER_ANTMON01 )
	pMonster:PlaySound(533)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  필살기 상태
function Antmon_SpecialAttackFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame < 56 ) then
		if( iFrame <= 1) then
			pMonster:SetSuperArmor( true )
		end
		
		if( pMonster:GetIsRight() ) then
			pMonster:SetSpeedX( -0.003 )
		else
			pMonster:SetSpeedX( 0.003 )
		end
	elseif( iFrame == 61 ) then
		pMonster:AddParticle("special02_1_2", 0.04, 0.18)
		pMonster:AddParticle("special02_1_3", 0.04, 0.18)
	elseif( iFrame == 88 ) then
	
		if( pMonster:GetIsRight() ) then
			pMonster:SetSpeedX( 0.014 )
		else
			pMonster:SetSpeedX( -0.014 )
		end
		
	elseif( iFrame == 96 ) then
		pMonster:PlaySound(530)
		pMonster:AddDamage( DT_MONSTER_ANTMON02 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  점프 상태
function Antmon_JumpFunc( iMonsterIndex, iFrame )
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
function Antmon_JumpDownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

--  점프 상태
function Antmon_ToWait( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  점프공격 상태
function Antmon_JumpAttackFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame == 41 ) then
        pMonster:AddDamage( DT_MONSTER_ANTMON01 )
    elseif( iFrame == 54 ) then
        pMonster:EndAttack()
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  회피 상태
function Antmon_AvoidFunc( iMonsterIndex, iFrame )
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
function Antmon_StoneCurseFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
        pMonster:AddTraceParticle( "StoneCurse_small", 3 )
        pMonster:AddParticle( "StoneCurse_small_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "StoneCurse_small_tick", 0.0, 0.0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:AddParticle( "StoneCurse_small_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "StoneCurse_small_tick", 0.0, 0.0 )
        pMonster:SetSuperArmor( false )
        pMonster:SetState( "WAIT" )
        
        if( pMonster:GetHP() <= 0 ) then
			pMonster:SetState( "DIE" )
		end
    end
end

--  아이스커스 걸렸음
function Antmon_IceCurseFunc( iMonsterIndex, iFrame )
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
function Antmon_HoldFunc( iMonsterIndex, iFrame )
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

function Antmon_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 100, -400, 200, 400, -100 ) == true or pMonster:SetTarget( 0, -200, 400, 200, -200 ) == true ) then
		pMonster:TurnToTarget()
		
		if( pMonster:CheckState( "IDLE" ) == true ) then
			pMonster:SetState( "WAIT" )
		end
		
        pMonster:ResetDelay()
    end
end

function Antmon_Check_ReleaseTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 300, -600, 600, 600, -500 ) == false ) then
		pMonster:ReleaseTarget()
		pMonster:ResetDelay()
	end
end

function Antmon_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == true ) then
        pMonster:TurnToTarget()
        pMonster:ResetDelay()
    end
end

function Antmon_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 600, -500, 500, 500, -500 ) == true and pMonster:CheckTargetInRange( 0, -100, 100, 100, -150 ) == false and pMonster:FloatRand() < 0.7 ) then
		pMonster:TurnToTarget()
		pMonster:SetState( "WALK" )
		pMonster:ResetDelay()
	end
end

function Antmon_Check_Run( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 400, -300, 200, 300, -250 ) == true and pMonster:CheckTargetInRange( 0, -100, 100, 100, -150 ) == false ) then
		pMonster:TurnToTarget()
		pMonster:SetState( "RUN" )
		pMonster:ResetDelay()
	end	
end

function Antmon_Check_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 150, -160, 240, 160, -320 ) == true ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetState( "WAIT" )
		pMonster:ResetDelay()
	end
end

function Antmon_Check_RunStop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 0, -160, 140, 160, -200 ) == true or pMonster:CheckTargetInRange( 400, -300, 200, 300, -250 ) == false ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetState( "WAIT" )
		pMonster:ResetDelay()
	end
end

function Antmon_CheckDownUp02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetSpeedY() < 0.0 ) then
        pMonster:SetState( "DOWN_UP02" )
    end
end

function Antmon_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 70, -80, 100, 80, -100 ) == true ) then
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
	end
end

function Antmon_Check_SpecialAttack( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 200, -100, 100, 100, -100 ) == true and pMonster:FloatRand() < 0.5 and pMonster:GetCountValue() >= 5 ) then
		pMonster:SetCountValue(0)
		pMonster:SetState( "SPECIAL_ATTACK" )
		pMonster:ResetDelay()
	end
end

function Antmon_Check_JumpMove( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 350, -50, 100, 50, -100 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		pMonster:SetNoCheckContact(50)
		pMonster:SetState( "JUMP" )
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 3.5 )
		pMonster:SetSpeedY( 0.04 )			
		pMonster:ResetDelay()
	end
end

function Antmon_Check_JumpAttack( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 110, -110, 300, 110, 100 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		Antmon_Jump( iMonsterIndex )
		pMonster:SetState( "JUMPATTACK" )
		pMonster:ResetDelay()
	end
end

function Antmon_Check_JumpUp( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 150, -150, 300, 150, 100 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		Antmon_Jump( iMonsterIndex )
		pMonster:SetState( "JUMP" )
		pMonster:ResetDelay()
	end
end

function Antmon_Check_JumpDown( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 60, -100, -80, 100, -300 ) == true ) then
		pMonster:SetNoCheckContact(30)
		pMonster:SetIgnoreFHCheck(true)
		pMonster:SetState( "JUMP_DOWN" )
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )
		pMonster:SetSpeedY( 0.01 )			
		pMonster:ResetDelay()
	end
end

function Antmon_CheckStandup( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetHP() > 0 and pMonster:GetDownDelay() == 0 ) then
		if( pMonster:CheckTargetInRange( 200, -200, 150, 200, -100 ) == true ) then
			if ( pMonster:FloatRand() < 0.1) then				
				pMonster:SetState( "STANDUP_ATTACK" )				
			else
				pMonster:SetState( "STANDUP" )
			end			
		else
			pMonster:SetState( "STANDUP" )
		end
    end
end

-- 어슬렁대기..  방향 바꾸기 후 이동
function Antmon_Check_Idle( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == false ) then
        pMonster:SetState( "IDLE" )
        pMonster:ResetDelay()
    end
end

-- 어슬렁대는 중.. 멈추기
function Antmon_Check_Idle_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == false ) then
		pMonster:SetSpeedX( 0.0 )
        pMonster:SetState( "WAIT" )
        pMonster:ResetDelay()
    end
end

-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------
function OnAntmon_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    pMonster:SetSpeedX( pMonster:GetSpeedX() * (1.0 / 2.0) )

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

function OnAntmon_Die( iMonsterIndex )
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

function OnAntmon_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetPushCheck( true )
	pMonster:AddCountValue(1)	
    
    if( pMonster:CheckState( "JUMP" ) == true or pMonster:CheckState( "JUMPATTACK" ) == true ) then
        if( pMonster:IsSuperArmor() == false ) then
            pMonster:SetNoCheckContact( 5 )
        end
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
			pMonster:SetState( "AVOID" )
		end
	end
end

function Antmon_Jump( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    local fTargetX = pMonster:GetTargetX()
    local fTargetY = pMonster:GetTargetY()
    
    local fMonX = pMonster:GetX()
    local fMonY = pMonster:GetY()
        
    fSpeedX = ( fTargetX - fMonX ) * 1.5
    fSpeedY = ((fTargetY - fMonY) / ((fTargetY - fMonY) / 4.0)) + (((fTargetY - fMonY) * 1.5) + pMonster:FloatAbs((fSpeedX / 3.1)))

    pMonster:SetNoCheckContact(26 + (fSpeedY * 5.0))
    pMonster:TurnToTarget()
    pMonster:SetSpeedX( fSpeedX * 0.01 )
    pMonster:SetSpeedY( fSpeedY * 0.01 )
end

function Antmon_MoveFail( iMonsterIndex )
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

function Antmon_IdleMoveFail( iMonsterIndex )
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
