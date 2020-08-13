-- AI_Gangster_Carb.lua

ActionList =
{	
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "Gangster_Carb_Wait.frm",
        Func    = "Gangster_Carb_WaitFunc",

        Trigger =
        {
			-- 타게팅
            {
                AICheckFrame        = 150,
                AIFunc              = "Gangster_Carb_Check_Targeting",
                DelayFrame          = 150,
            },

            -- 타겟지움
            {
                AICheckFrame        = 200,
                AIFunc              = "Gangster_Carb_Check_ReleaseTarget",
                DelayFrame          = 150,
            },

            -- 타겟을 향해 턴
            {
                AICheckFrame        = 80,
                AIFunc              = "Gangster_Carb_Check_TurnToTarget",
                DelayFrame          = 60,
            },

            -- 걷기
            {
                AICheckFrame        = 90,
                AIFunc              = "Gangster_Carb_Check_Walk",
                DelayFrame          = 210,
            },

            -- 점프업
            {
                AICheckFrame        = 101,
                AIFunc              = "Gangster_Carb_Check_JumpUp",
                DelayFrame          = 100,
            },        

            -- 점프다운
            {
                AICheckFrame        = 102,
                AIFunc              = "Gangster_Carb_Check_JumpDown",
                DelayFrame          = 100,
            },

            -- 어슬렁대기(이동)
            {
                AICheckFrame        = 200,
                AIFunc              = "Gangster_Carb_Check_Idle",
                DelayFrame          = 200,
            },

			-- 리프트
            {
                AICheckFrame        = 165,
                AIFunc              = "Gangster_Carb_Check_Attack01",
                DelayFrame          = 235,
            },

            -- 쵸핑
            {
                AICheckFrame        = 110,
                AIFunc              = "Gangster_Carb_Check_Attack02",
                DelayFrame          = 330,
            },

		},
	},

    -- 이동
    {
        ID              = "WALK",
        Motion          = "Gangster_Carb_walk.frm",
        Func            = "Gangster_Carb_WalkFunc",
        EnableMoveCheck = TRUE,
        MoveFailFunc    = "Gangster_Carb_MoveFail",


        Trigger =
        {
			-- 타게팅
			{
                AICheckFrame        = 60,
                AIFunc              = "Gangster_Carb_Check_Targeting",
                DelayFrame          = 60,
            },
            -- 타겟지움
            {
                AICheckFrame        = 100,
                AIFunc              = "Gangster_Carb_Check_ReleaseTarget",
                DelayFrame          = 100,
            },
			-- 타겟을 향해 턴
            {
                AICheckFrame        = 30,
                AIFunc              = "Gangster_Carb_Check_TurnToTarget",
                DelayFrame          = 30,
            },
            -- 점프업
            {
                AICheckFrame        = 41,
                AIFunc              = "Gangster_Carb_Check_JumpUp",
                DelayFrame          = 80,
            },        
            -- 점프다운
            {
                AICheckFrame        = 42,
                AIFunc              = "Gangster_Carb_Check_JumpDown",
                DelayFrame          = 100,
            },

			-- 멈추기
            {
                AICheckFrame        = 2,
                AIFunc              = "Gangster_Carb_Check_Stop",
                DelayFrame          = 50,
            },
        }
    },
    
     -- 어슬렁대기
    {
        ID              = "IDLE",
        Motion          = "Gangster_Carb_idle.frm",
        Func            = "Gangster_Carb_IdleFunc",
        EnableMoveCheck = TRUE,
        MoveFailFunc    = "Gangster_Carb_IdleMoveFail",


        Trigger =
        {
			-- 타게팅
			{
                AICheckFrame        = 40,
                AIFunc              = "Gangster_Carb_Check_Targeting",
                DelayFrame          = 40,
            },
            -- 어슬렁대기(멈춤)
            {
                AICheckFrame        = 220,
                AIFunc              = "Gangster_Carb_Check_Idle_Stop",
                DelayFrame          = 100,
            },
        }
    },

    -- 근접공격
    {
        ID      = "ATTACK01",
        Motion  = "Gangster_Carb_Attack01.frm",
        Func    = "Gangster_Carb_Attack01Func",
    },
    
    -- 근접공격
    {
        ID      = "ATTACK02",
        Motion  = "Gangster_Carb_Attack02.frm",
        Func    = "Gangster_Carb_Attack02Func",
    },
    
    -- 점프
    {
        ID      = "JUMP",
        Motion  = "Gangster_Carb_Jump_Up.frm",
        Func    = "Gangster_Carb_JumpFunc",
    },
    
    -- 점프
    {
        ID      = "JUMP_DOWN",
        Motion  = "Gangster_Carb_Jump_Down.frm",
        Func    = "Gangster_Carb_JumpDownFunc",
    },
    
    -- 점프
    {
        ID      = "JUMP_LANDING",
        Motion  = "Gangster_Carb_Jump_Landing.frm",
        Func    = "Gangster_Carb_ToWait",
    },

    -- 데미지 상
    {
        ID      = "DAMAGE_UP",
        Motion  = "Gangster_Carb_Damage_Up.frm",
        Func    = "Gangster_Carb_DamageFunc",
    },
    
    -- 데미지 중
    {
        ID      = "DAMAGE_MIDDLE",
        Motion  = "Gangster_Carb_Damage_Middle.frm",
        Func    = "Gangster_Carb_DamageFunc",
    },
    
    -- 데미지 하
    {
        ID      = "DAMAGE_DOWN",
        Motion  = "Gangster_Carb_Damage_Down.frm",
        Func    = "Gangster_Carb_DamageFunc",
    },

    -- 다운 상
    {
        ID      = "DOWN_UP01",
        Motion  = "Gangster_Carb_Down_Up01.frm",
        Func    = "Gangster_Carb_DownUpFunc",
        
        Trigger =
        {
            {
                AICheckFrame        = 1,
                AIFunc              = "Gangster_Carb_CheckDownUp02",
                DelayFrame          = 0,
            },
        }
    },
    
    -- 다운 상02
    {
        ID      = "DOWN_UP02",
        Motion  = "Gangster_Carb_Down_Up02.frm",
        Func    = "Gangster_Carb_DownUp02Func",
        IsFallDownMotion    = TRUE,
    },
	
	-- 다운 상 착지
    {
        ID      = "DOWN_UP_LANDING",
        Motion  = "Gangster_Carb_Down_Up03.frm",
        Func    = "Gangster_Carb_DownUp03Func",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "Gangster_Carb_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
	
    -- 다운 중
    {
        ID      = "DOWN_MIDDLE",
        Motion  = "Gangster_Carb_Down_Middle.frm",
        Func    = "Gangster_Carb_DownFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 0,
                AIFunc              = "Gangster_Carb_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- 다운 하
    {
        ID      = "DOWN_DOWN",
        Motion  = "Gangster_Carb_Down_Middle.frm",
        Func    = "Gangster_Carb_DownFunc",
        IsFallDownMotion    = TRUE,

        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "Gangster_Carb_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- 다운 스페셜
    {
        ID      = "DOWN_SPECIAL",
        Motion  = "Gangster_Carb_Down_Special01.frm",
        Func    = "Gangster_Carb_DownSpecialFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- 다운 스페셜 착지
    {
        ID      = "DOWN_SPECIAL_LANDING",
        Motion  = "Gangster_Carb_Down_Special02.frm",
        Func    = "Gangster_Carb_DownSpecialLandingFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "Gangster_Carb_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- 죽기
    {
        ID      = "DIE",
        Motion  = "Gangster_Carb_down_middle.frm",
        Func    = "Gangster_Carb_DieLandingFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- 죽기 착지
    {
        ID      = "DIE_LANDING",
        Motion  = "Gangster_Carb_die.frm",
        Func    = "Gangster_Carb_DieLandingFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- 일어나기
    {
        ID      = "STANDUP",
        Motion  = "Gangster_Carb_Standup.frm",
        Func    = "Gangster_Carb_StandupFunc",
    },
    
    -- 스톤커스
    {
        ID      = "STONECURSE",
        Motion  = "Gangster_Carb_Stone.frm",
        Func    = "Gangster_Carb_StoneCurseFunc",
    },
    
    -- 빙결상태
    {
        ID      = "ICECURSE",
        Motion  = "Gangster_Carb_Stone.frm",
        Func    = "Gangster_Carb_IceCurseFunc",
    },
    -- 홀드상태
	{
		ID		= "HOLD",
		Motion	= "Gangster_Carb_Stone.frm",
		Func	= "Gangster_Carb_HoldFunc",
	},
}

CallBack =
{
    Land    = "OnGangster_Carb_Land",
    Die     = "OnGangster_Carb_Die",
    Damage  = "OnGangster_Carb_Damage",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function InitGangster_Carb( iMonsterIndex )
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
function Gangster_Carb_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 걷기 상태
function Gangster_Carb_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetRunSpeed() )
        
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
end

-- 어슬렁대기 상태
function Gangster_Carb_IdleFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
        
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "IDLE" )
    end
end

-- 죽었음
function Gangster_Carb_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
        
    if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "DIE_LANDING" )
    end
end

-- 죽기 착지
function Gangster_Carb_DieLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame == 2 ) then
		pMonster:PlaySound(988010)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-- 데미지 입은거
function Gangster_Carb_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 다운 상
function Gangster_Carb_DownUpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
    elseif( iFrame >= pMonster:GetLastFrame() ) then		
        pMonster:SetFrameLock( true )
    end
end

-- 다운 상2
function Gangster_Carb_DownUp02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

-- 다운 상3
function Gangster_Carb_DownUp03Func( iMonsterIndex, iFrame )
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
function Gangster_Carb_DownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetFrameLock( true )
    end
    
    if( pMonster:GetHP() <= 0 ) then
		pMonster:SetState( "DIE_LANDING" )
	end
end

-- 다운 스페셜
function Gangster_Carb_DownSpecialFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "DOWN_SPECIAL" )
    end
end

-- 다운 스페셜 착지
function Gangster_Carb_DownSpecialLandingFunc( iMonsterIndex, iFrame )
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
function Gangster_Carb_StandupFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetPushCheck( true )
        pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  근접공격 상태
function Gangster_Carb_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		--pMonster:SetSuperArmor( true )
	elseif( iFrame == 72 ) then
		pMonster:AddDamage( DT_GANGSTER_CARB_ATK1 )
		pMonster:PlaySound(988011)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  근접공격 상태
function Gangster_Carb_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		--pMonster:SetSuperArmor( true )
    elseif( iFrame == 62 ) then
		pMonster:AddDamage( DT_GANGSTER_CARB_ATK2_1 )
		pMonster:PlaySound(988012)
	elseif( iFrame == 84 ) then
		pMonster:AddDamage( DT_GANGSTER_CARB_ATK2_1 )
		pMonster:PlaySound(988012)
	elseif( iFrame == 104 ) then
		pMonster:AddDamage( DT_GANGSTER_CARB_ATK2_2 )
		pMonster:PlaySound(988012)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end



--  점프 상태
function Gangster_Carb_JumpFunc( iMonsterIndex, iFrame )
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
function Gangster_Carb_JumpDownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

--  점프 상태
function Gangster_Carb_ToWait( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  스톤커스 걸렸음
function Gangster_Carb_StoneCurseFunc( iMonsterIndex, iFrame )
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
function Gangster_Carb_IceCurseFunc( iMonsterIndex, iFrame )
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
function Gangster_Carb_HoldFunc( iMonsterIndex, iFrame )
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

function Gangster_Carb_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 100, -250, 220, 250, -260 ) == true ) then
		pMonster:TurnToTarget()
		
		if( pMonster:CheckState( "IDLE" ) == true ) then
			pMonster:SetState( "WAIT" )
		end
		
        pMonster:ResetDelay()
    end  
end

function Gangster_Carb_Check_ReleaseTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 100, -400, 360, 400, -360 ) == false ) then
		pMonster:ReleaseTarget()
		pMonster:ResetDelay()
	end
end

function Gangster_Carb_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function Gangster_Carb_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true and pMonster:FloatRand() < 0.75 ) then
		if( pMonster:CheckTargetInRange( 0, -180, 360, 180, -400 ) == false ) then
			pMonster:TurnToTarget()
			pMonster:SetState( "WALK" )
			pMonster:ResetDelay()
		end
	end
end

function Gangster_Carb_Check_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 0, -180, 360, 180, -400 ) == true ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetState( "WAIT" )
		pMonster:ResetDelay()
	end
end

function Gangster_Carb_CheckDownUp02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetSpeedY() < 0.0 ) then
		pMonster:SetState( "DOWN_UP02" )
	end
end

function Gangster_Carb_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 80, -80, 40, 80, -100 ) == true ) then
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
	end
end

function Gangster_Carb_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 110, -110, 40, 110, -100 ) == true ) then
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
	end
end


function Gangster_Carb_Check_JumpUp( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 200, -200, 360, 200, 80 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		Gangster_Carb_Jump( iMonsterIndex )
		pMonster:SetState( "JUMP" )
		pMonster:ResetDelay()
	end
end

function Gangster_Carb_Check_JumpDown( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 100, -150, -100, 150, -400 ) == true ) then
		pMonster:SetNoCheckContact(30)
		pMonster:SetIgnoreFHCheck(true)
		pMonster:SetState( "JUMP_DOWN" )
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )
		pMonster:SetSpeedY( 0.01 )	
		pMonster:ResetDelay()
	end
end

function Gangster_Carb_CheckStandup( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetHP() > 0 and pMonster:GetDownDelay() == 0 ) then
		pMonster:SetState( "STANDUP" )
    end
end

-- 어슬렁대기..  방향 바꾸기 후 이동
function Gangster_Carb_Check_Idle( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == false ) then
        pMonster:SetState( "IDLE" )
        pMonster:ResetDelay()
    end
end

-- 어슬렁대는 중.. 멈추기
function Gangster_Carb_Check_Idle_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:FloatRand() < 0.5 ) then
		pMonster:SetSpeedX( 0.0 )
        pMonster:SetState( "WAIT" )
    end
end

-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------
function OnGangster_Carb_Land( iMonsterIndex )
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

function OnGangster_Carb_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( pMonster:CheckState( "DOWN_UP01" ) == false and pMonster:CheckState( "DOWN_UP02" ) == false and pMonster:CheckState( "DOWN_MIDDLE" ) == false and pMonster:CheckState( "DOWN_DOWN" ) == false and pMonster:CheckState( "DOWN_SPECIAL" ) == false and pMonster:CheckState( "STONECURSE" ) == false and pMonster:CheckState( "ICECURSE" ) == false  and pMonster:CheckState( "HOLD" ) == false ) then
		pMonster:TurnToTarget()
		pMonster:SetSpeedX( pMonster:GetRunSpeed() * -1.5 )
		pMonster:SetState( "DIE" )
	end
end

function OnGangster_Carb_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
    pMonster:SetPushCheck( true )
    
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
end

function Gangster_Carb_Jump( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	local fTargetX = pMonster:GetTargetX()
	local fTargetY = pMonster:GetTargetY()
	
	local fMonX = pMonster:GetX()
	local fMonY = pMonster:GetY()
		
	fSpeedX = ( fTargetX - fMonX ) * 1.5
	if ( (fTargetY - fMonY) == 0.0 ) then
		fTargetY = fMonY + 0.1
	end
	fSpeedY = ((fTargetY - fMonY) / ((fTargetY - fMonY) / 4.0)) + (((fTargetY - fMonY) * 1.5) + pMonster:FloatAbs((fSpeedX / 3.1)))
	
	pMonster:SetNoCheckContact(26 + (fSpeedY * 4.9))
	pMonster:AddCountValue(1)
	pMonster:TurnToTarget()
	pMonster:SetSpeedX( fSpeedX * 0.01 )
	pMonster:SetSpeedY( fSpeedY * 0.01 )
end

function Gangster_Carb_MoveFail( iMonsterIndex )
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

function Gangster_Carb_IdleMoveFail( iMonsterIndex )
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
