-- AI_Aboriginemon.lua

ActionList =
{
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "Aboriginemon_Wait.frm",
        Func    = "Aboriginemon_WaitFunc",


		-- 대기상태일동안 수행될수 있는 트리거들을 나열한다.
		
        Trigger =
        {
            -- 타게팅
            {
                AICheckFrame        = 55,                            -- 얼마나 자주 현재의 트리거를 체크할 것인지를 수치로 입력(프레임)
                AIFunc              = "Aboriginemon_Check_Targeting",      -- 트리거가 체크되었을때 명령을 수행할 함수의 이름을 입력(수행조건을 입력하는 함수)
                DelayFrame          = 110,                           -- 명령이 수행되었을때 트리거 체크를 얼마동안 멈출 것인지를 수치로 입력
            },
            -- 타겟지움
            {
                AICheckFrame        = 330,
                AIFunc              = "Aboriginemon_Check_ReleaseTarget",
                DelayFrame          = 550,
            },
            -- 타겟을 향해 턴
            {
                AICheckFrame        = 55,
                AIFunc              = "Aboriginemon_Check_TurnToTarget",
                DelayFrame          = 55,
            },
            -- 근접공격
            {
                AICheckFrame        = 35,
                AIFunc              = "Aboriginemon_Check_Attack01",
                DelayFrame          = 55,
            },
            -- 점프공격
            {
                AICheckFrame        = 75,
                AIFunc              = "Aboriginemon_Check_JumpAttack",
                DelayFrame          = 75,
            },
            -- 점프이동공격
            {
                AICheckFrame        = 110,
                AIFunc              = "Aboriginemon_Check_Attack02",
                DelayFrame          = 110,
            },            
            -- 점프업
            {
                AICheckFrame        = 110,
                AIFunc              = "Aboriginemon_Check_JumpUp",
                DelayFrame          = 110,
            },        
            -- 점프다운
            {
                AICheckFrame        = 165,
                AIFunc              = "Aboriginemon_Check_JumpDown",
                DelayFrame          = 165,
            },
            -- 걷기
            {
                AICheckFrame        = 55,
                AIFunc              = "Aboriginemon_Check_Walk",
                DelayFrame          = 165,
            },
            -- 어슬렁대기(이동)
            {
                AICheckFrame        = 110,
                AIFunc              = "Aboriginemon_Check_Idle",
                DelayFrame          = 110,
            },
        },
    },

    -- 이동
    {
        ID              = "WALK",
        Motion          = "Aboriginemon_Walk.frm",
        Func            = "Aboriginemon_WalkFunc",
        EnableMoveCheck = TRUE,
        MoveFailFunc    = "Aboriginemon_MoveFail",


        Trigger =
        {
            -- 타게팅
            {
                AICheckFrame        = 55,
                AIFunc              = "Aboriginemon_Check_Targeting",
                DelayFrame          = 110,
            },
            -- 타겟지움
            {
                AICheckFrame        = 220,
                AIFunc              = "Aboriginemon_Check_ReleaseTarget",
                DelayFrame          = 440,
            },
            -- 타겟을 향해 턴
            {
                AICheckFrame        = 55,
                AIFunc              = "Aboriginemon_Check_TurnToTarget",
                DelayFrame          = 55,
            },
            -- 점프공격
            {
                AICheckFrame        = 55,
                AIFunc              = "Aboriginemon_Check_JumpAttack",
                DelayFrame          = 55,
            },        
            -- 점프업
            {
                AICheckFrame        = 110,
                AIFunc              = "Aboriginemon_Check_JumpUp",
                DelayFrame          = 110,
            },        
            -- 점프다운
            {
                AICheckFrame        = 165,
                AIFunc              = "Aboriginemon_Check_JumpDown",
                DelayFrame          = 165,
            },
            -- 근접공격
            {
                AICheckFrame        = 15,
                AIFunc              = "Aboriginemon_Check_Attack01",
                DelayFrame          = 110,
            },
            -- 점프이동공격
            {
                AICheckFrame        = 110,
                AIFunc              = "Aboriginemon_Check_Attack02",
                DelayFrame          = 110,
            },
			-- 멈추기
            {
                AICheckFrame        = 10,
                AIFunc              = "Aboriginemon_Check_Stop",
                DelayFrame          = 55,
            },
        }
    },
    
    -- 어슬렁대기
    {
        ID              = "IDLE",
        Motion          = "Aboriginemon_Walk.frm",
        Func            = "Aboriginemon_IdleFunc",
        EnableMoveCheck = TRUE,
        MoveFailFunc    = "Aboriginemon_IdleMoveFail",


        Trigger =
        {
            -- 타게팅
            {
                AICheckFrame        = 45,
                AIFunc              = "Aboriginemon_Check_Targeting",
                DelayFrame          = 110,
            },
            -- 어슬렁대기(멈춤)
            {
                AICheckFrame        = 440,
                AIFunc              = "Aboriginemon_Check_Idle_Stop",
                DelayFrame          = 440,
            },
        }
    },

    -- 근접공격01
    {
        ID      = "ATTACK01",
        Motion  = "Aboriginemon_Attack01.frm",
        Func    = "Aboriginemon_Attack01Func",
    },
    
    -- 점프이동공격
    {
        ID      = "ATTACK02",
        Motion  = "Aboriginemon_Attack02.frm",
        Func    = "Aboriginemon_Attack02Func",
    },
	
	-- 점프공격
    {
        ID      = "JUMPATTACK",
        Motion  = "Aboriginemon_Attack02.frm",
        Func    = "Aboriginemon_JumpAttackFunc",
    },
	
	-- 카운터공격
    {
        ID      = "ATTACK05",
        Motion  = "Aboriginemon_Attack05.frm",
        Func    = "Aboriginemon_Attack05Func",
    },

    -- 점프
    {
        ID      = "JUMP",
        Motion  = "Aboriginemon_Jump01.frm",
        Func    = "Aboriginemon_JumpFunc",
    },
    
    -- 점프착지
    {
        ID      = "JUMP_LANDING",
        Motion  = "Aboriginemon_Jump02.frm",
        Func    = "Aboriginemon_JumpLandingFunc",
    },

    -- 데미지 상
    {
        ID      = "DAMAGE_UP",
        Motion  = "Aboriginemon_Damage_Up.frm",
        Func    = "Aboriginemon_DamageFunc",
    },
    
    -- 데미지 중
    {
        ID      = "DAMAGE_MIDDLE",
        Motion  = "Aboriginemon_Damage_Middle.frm",
        Func    = "Aboriginemon_DamageFunc",
    },
    
    -- 데미지 하
    {
        ID      = "DAMAGE_DOWN",
        Motion  = "Aboriginemon_Damage_Down.frm",
        Func    = "Aboriginemon_DamageFunc",
    },

    -- 다운 상
    {
        ID                  = "DOWN_UP01",
        Motion              = "Aboriginemon_Down_Up01.frm",
        Func                = "Aboriginemon_DownUpFunc",
        
        Trigger =
        {
            {
                AICheckFrame        = 1,
                AIFunc              = "Aboriginemon_CheckDownUp02",
                DelayFrame          = 0,
            },
        }
    },
    
    -- 다운 상02
    {
        ID                  = "DOWN_UP02",
        Motion              = "Aboriginemon_Down_Up02.frm",
        Func                = "Aboriginemon_DownUp02Func",
        IsFallDownMotion    = TRUE,
    },
    
    -- 다운 상 착지
    {
        ID                  = "DOWN_UP_LANDING",
        Motion              = "Aboriginemon_Down_Up03.frm",
        Func                = "Aboriginemon_DownUp03Func",
        IsFallDownMotion    = TRUE,

        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "Aboriginemon_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- 다운 중
    {
        ID                  = "DOWN_MIDDLE",
        Motion              = "Aboriginemon_Down_Middle.frm",
        Func                = "Aboriginemon_DownFunc",
        IsFallDownMotion    = TRUE,

        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "Aboriginemon_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },

    -- 다운 하
    {
        ID                  = "DOWN_DOWN",
        Motion              = "Aboriginemon_Down_Down.frm",
        Func                = "Aboriginemon_DownDownFunc",
        IsFallDownMotion    = TRUE,

        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "Aboriginemon_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- 다운 스페셜
    {
        ID                  = "DOWN_SPECIAL",
        Motion              = "Aboriginemon_Down_Special01.frm",
        Func                = "Aboriginemon_DownSpecialFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- 다운 스페셜 착지
    {
        ID                  = "DOWN_SPECIAL_LANDING",
        Motion              = "Aboriginemon_Down_Special02.frm",
        Func                = "Aboriginemon_DownSpecialLandingFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "Aboriginemon_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- 죽기
    {
        ID                  = "DIE",
        Motion              = "Aboriginemon_Die01.frm",
        Func                = "Aboriginemon_DieFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- 죽기 착지
    {
        ID                  = "DIE_LANDING",
        Motion              = "Aboriginemon_Die02.frm",
        Func                = "Aboriginemon_DieLandingFunc",
        IsFallDownMotion    = TRUE,
    },

    -- 일어나기
    {
        ID      = "STANDUP",
        Motion  = "Aboriginemon_Standup.frm",
        Func    = "Aboriginemon_StandupFunc",
    },
	
	-- 기상공격
    {
        ID      = "STANDUP_ATTACK",
        Motion  = "Aboriginemon_StandupAttack.frm",
        Func    = "Aboriginemon_StandupAttackFunc",
    },
    
    -- 스톤커스
    {
        ID      = "STONECURSE",
        Motion  = "Aboriginemon_Stone.frm",
        Func    = "Aboriginemon_StoneCurseFunc",
    },
    
    -- 빙결상태
    {
        ID      = "ICECURSE",
        Motion  = "Aboriginemon_Stone.frm",
        Func    = "Aboriginemon_IceCurseFunc",
    },
    
    -- 홀드상태
    {
        ID      = "HOLD",
        Motion  = "Aboriginemon_Stone.frm",
        Func    = "Aboriginemon_HoldFunc",
    },
}

CallBack =
{
    Land    = "OnAboriginemon_Land",
    Die     = "OnAboriginemon_Die",
    Damage  = "OnAboriginemon_Damage",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function InitAboriginemon( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
        
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_UP,           "DAMAGE_UP" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_MIDDLE,       "DAMAGE_MIDDLE" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_DOWN,         "DAMAGE_DOWN" )
 
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_UP,             "DOWN_UP01" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_MIDDLE,         "DOWN_MIDDLE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_DOWN,           "DOWN_DOWN" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_NORMAL,         "DOWN_SPECIAL" )

    pMonster:RegistReaction( ATTACKTYPE_STONECURSE, ATTACKDIR_NORMAL,   "STONECURSE" )
    pMonster:RegistReaction( ATTACKTYPE_ICECURSE, ATTACKDIR_NORMAL,   "ICECURSE" )
    pMonster:RegistReaction( ATTACKTYPE_HOLD, ATTACKDIR_NORMAL,   "HOLD" )
end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function Aboriginemon_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 걷기 상태
function Aboriginemon_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetWalkSpeed() )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
end

-- 어슬렁대기 상태
function Aboriginemon_IdleFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetWalkSpeed() )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "IDLE" )
    end
end

-- 달리기 상태
function Aboriginemon_RunFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetRunSpeed() )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "RUN" )
    end
end

-- 죽는상태
function Aboriginemon_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "DIE_LANDING" )
    end
end

-- 죽는상태 착지
function Aboriginemon_DieLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-- 데미지 입은거
function Aboriginemon_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 다운 상
function Aboriginemon_DownUpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetPushCheck( false )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

-- 다운 상2
function Aboriginemon_DownUp02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

-- 다운 상3
function Aboriginemon_DownUp03Func( iMonsterIndex, iFrame )
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
function Aboriginemon_DownFunc( iMonsterIndex, iFrame )
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
function Aboriginemon_DownDownFunc( iMonsterIndex, iFrame )
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
function Aboriginemon_DownSpecialFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
        pMonster:SetPushCheck( false )
        pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "DOWN_SPECIAL" )
    end
end

-- 다운 스페셜 착지
function Aboriginemon_DownSpecialLandingFunc( iMonsterIndex, iFrame )
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
function Aboriginemon_StandupFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
        pMonster:SetPushCheck( true )
        pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 기상공격
function Aboriginemon_StandupAttackFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1) then
        pMonster:SetPushCheck( true )
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 41 ) then
        pMonster:SetNoCheckContact( 40 )
        pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.5 )
        pMonster:SetSpeedY( 0.034 )
    elseif( iFrame == 71 ) then
        pMonster:PlaySound(533)
        pMonster:AddDamage( DT_SPEARMAN_ATK3 )
	elseif( iFrame == 75 ) then
		pMonster:AddDamage( DT_SPEARMAN_ATK3 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  근접공격 상태
function Aboriginemon_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame == 29 ) then
		pMonster:PlaySound(533)
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.5 )
        pMonster:AddDamage( DT_SPEARMAN_ATK1 )
    elseif( iFrame == 48 ) then
		pMonster:PlaySound(533)
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 2.0 )
		pMonster:AddDamage( DT_SPEARMAN_ATK1 )
	elseif( iFrame == 78 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 2.0 )
		pMonster:AddDamage( DT_SPEARMAN_ATK2 )
		pMonster:PlaySound(533)
	elseif( iFrame >= 86 and iFrame < 101 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 2.0 )
	elseif( iFrame == 101 ) then
		pMonster:PlaySound(533)
		pMonster:AddDamage( DT_SPEARMAN_ATK3 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  점프 상태
function Aboriginemon_JumpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

--  점프착지 상태
function Aboriginemon_JumpLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  점프이동공격 상태
function Aboriginemon_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame <= 1 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 3.5 )
		pMonster:SetSpeedY( 0.04 )			
    elseif( iFrame == 41 ) then
		pMonster:PlaySound(533)
        pMonster:AddDamage( DT_SPEARMAN_ATK3 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  점프공격 상태
function Aboriginemon_JumpAttackFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame == 41 ) then
		pMonster:PlaySound(533)
        pMonster:AddDamage( DT_SPEARMAN_ATK3 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  카운터공격 상태
function Aboriginemon_Attack05Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	
	if( iFrame <= 11 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * -0.5 )
		
		if( iFrame <= 1 ) then
			pMonster:SetSuperArmor( true )
		end
    elseif( iFrame == 51 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 2.0 )
		pMonster:PlaySound(533)
		pMonster:AddDamage( DT_SPEARMAN_ATK4 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  스톤커스 걸렸음
function Aboriginemon_StoneCurseFunc( iMonsterIndex, iFrame )
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
function Aboriginemon_IceCurseFunc( iMonsterIndex, iFrame )
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

--  홀드 걸렸음(이펙트)
function Aboriginemon_HoldFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
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

function Aboriginemon_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 300, -600, 250, 600, -150 ) == true or pMonster:SetTarget( 0, -300, 400, 300, -200 ) == true ) then
		pMonster:TurnToTarget()
		
		if( pMonster:CheckState( "IDLE" ) == true ) then
			pMonster:SetState( "WAIT" )
		end
		
        pMonster:ResetDelay()
    end
end

function Aboriginemon_Check_ReleaseTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 400, -800, 600, 800, -600 ) == false ) then
		pMonster:ReleaseTarget()
		pMonster:ResetDelay()
	end
end

function Aboriginemon_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == true ) then
        pMonster:TurnToTarget()
        pMonster:ResetDelay()
    end
end

function Aboriginemon_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 500, -600, 500, 600, -500 ) == true and pMonster:CheckTargetInRange( 0, -100, 100, 100, -150 ) == false and pMonster:FloatRand() < 0.8 ) then
		pMonster:TurnToTarget()
		pMonster:SetState( "WALK" )
		pMonster:ResetDelay()
	end
end

function Aboriginemon_Check_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 70, -80, 240, 80, -260 ) == true ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetState( "WAIT" )
		pMonster:ResetDelay()
	end
end

function Aboriginemon_CheckDownUp02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetSpeedY() < 0.0 ) then
        pMonster:SetState( "DOWN_UP02" )
    end
end

function Aboriginemon_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 100, -110, 100, 110, -100 ) == true ) then
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
	end
end

function Aboriginemon_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 350, -50, 100, 50, -100 ) == true and pMonster:GetIsContact() == true ) then
		pMonster:SetNoCheckContact(50)		
		pMonster:SetState( "ATTACK02" )		
		pMonster:ResetDelay()
	end
end

function Aboriginemon_Check_JumpAttack( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 150, -100, 300, 100, 100 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		Aboriginemon_Jump( iMonsterIndex )
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
	end
end

function Aboriginemon_Check_JumpUp( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 200, -200, 300, 200, 100 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		Aboriginemon_Jump( iMonsterIndex )
		pMonster:SetState( "JUMP" )
		pMonster:ResetDelay()
	end
end

function Aboriginemon_Check_JumpDown( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 60, -100, -80, 100, -300 ) == true ) then
		pMonster:SetNoCheckContact(30)
		pMonster:SetIgnoreFHCheck(true)
		pMonster:SetState( "JUMP" )
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )
		pMonster:SetSpeedY( 0.01 )			
		pMonster:ResetDelay()
	end
end

function Aboriginemon_CheckStandup( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetHP() > 0 and pMonster:GetDownDelay() == 0 ) then
		if( pMonster:CheckTargetInRange( 200, -200, 200, 200, -100 ) == true ) then
			if ( pMonster:FloatRand() <= 0.4) then				
				pMonster:AddCountValue(-3)
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
function Aboriginemon_Check_Idle( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == false ) then
        pMonster:SetState( "IDLE" )
        pMonster:ResetDelay()
    end
end

-- 어슬렁대는 중.. 멈추기
function Aboriginemon_Check_Idle_Stop( iMonsterIndex, iFrame )
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
function OnAboriginemon_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    pMonster:SetSpeedX( pMonster:GetSpeedX() * (1.0 / 2.0) )

    if( pMonster:CheckState( "JUMP" ) == true ) then
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

function OnAboriginemon_Die( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckState( "DOWN_UP01" ) == false and pMonster:CheckState( "DOWN_UP02" ) == false and pMonster:CheckState( "DOWN_MIDDLE" ) == false and pMonster:CheckState( "DOWN_DOWN" ) == false and pMonster:CheckState( "DOWN_SPECIAL" ) == false and pMonster:CheckState( "STONECURSE" ) == false and pMonster:CheckState( "ICECURSE" ) == false and pMonster:CheckState( "HOLD" ) == false ) then
        pMonster:TurnToTarget()

        if( pMonster:GetIsRight() == true ) then
            pMonster:SetSpeedX( -0.02 )
        else
            pMonster:SetSpeedX( 0.02 )
        end

        pMonster:SetState( "DIE" )
    end
    
end

function OnAboriginemon_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetPushCheck( true )
	
    if( pMonster:CheckState( "JUMP" ) == true or pMonster:CheckState( "ATTACK02" ) == true ) then
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
			pMonster:SetState( "ATTACK05" )
		end
    end
end

function Aboriginemon_Jump( iMonsterIndex )
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

function Aboriginemon_MoveFail( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:GetIsContact() == true )then		
		if( pMonster:GetY() - (0.1) < pMonster:GetTargetY() )then			
			pMonster:SetNoCheckContact(27)
			pMonster:SetIgnoreFHCheck(true)
			pMonster:SetState( "JUMP" )			
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )			
			pMonster:SetSpeedY( 0.04 )			
		else
			pMonster:SetNoCheckContact(30)
			pMonster:SetIgnoreFHCheck(true)
			pMonster:SetState( "JUMP" )		
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )
			pMonster:SetSpeedY( 0.01 )			
		end
	end
end

function Aboriginemon_IdleMoveFail( iMonsterIndex )
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
