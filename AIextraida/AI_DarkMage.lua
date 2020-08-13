-- AI_DarkMage.lua

ActionList =
{	
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "Kaido_Wait.frm",
        Func    = "DarkMage_WaitFunc",

        Trigger =
        {
			-- 타게팅
            {
                AICheckFrame        = 55,
                AIFunc              = "DarkMage_Check_Targeting",
                DelayFrame          = 110,
            },
            -- 타겟지움
            {
                AICheckFrame        = 220,
                AIFunc              = "DarkMage_Check_ReleaseTarget",
                DelayFrame          = 440,
            },
            -- 타겟을 향해 턴
            {
                AICheckFrame        = 75,
                AIFunc              = "DarkMage_Check_TurnToTarget",
                DelayFrame          = 75,
            },
            -- 걷기
            {
                AICheckFrame        = 110,
                AIFunc              = "DarkMage_Check_Walk",
                DelayFrame          = 330,
            },
            -- 독가스공격
            {
                AICheckFrame        = 55,
                AIFunc              = "DarkMage_Check_Attack02",
                DelayFrame          = 440,
            },            
            -- 라이트닝
            {
                AICheckFrame        = 55,
                AIFunc              = "DarkMage_Check_Attack03",
                DelayFrame          = 220,
            },
            -- 하이점프
            {
                AICheckFrame        = 110,
                AIFunc              = "DarkMage_Check_HighJump",
                DelayFrame          = 220,
            },        
            -- 점프다운
            {
                AICheckFrame        = 220,
                AIFunc              = "DarkMage_Check_JumpDown",
                DelayFrame          = 220,
            },
            -- 어슬렁대기(이동)
            {
                AICheckFrame        = 110,
                AIFunc              = "DarkMage_Check_Idle",
                DelayFrame          = 110,
            },
        },
    },

    -- 이동
    {
        ID      = "WALK",
        Motion  = "Kaido_Walk.frm",
        Func    = "DarkMage_WalkFunc",
        EnableMoveCheck = 1,
        MoveFailFunc    = "DarkMage_MoveFail",


        Trigger =
        {
			-- 타게팅
			{
                AICheckFrame        = 55,
                AIFunc              = "DarkMage_Check_Targeting",
                DelayFrame          = 110,
            },
            -- 타겟지움
            {
                AICheckFrame        = 110,
                AIFunc              = "DarkMage_Check_ReleaseTarget",
                DelayFrame          = 330,
            },
			-- 타겟을 향해 턴
            {
                AICheckFrame        = 55,
                AIFunc              = "DarkMage_Check_TurnToTarget",
                DelayFrame          = 55,
            },
            -- 하이점프
            {
                AICheckFrame        = 110,
                AIFunc              = "DarkMage_Check_HighJump",
                DelayFrame          = 110,
            },        
            -- 점프다운
            {
                AICheckFrame        = 220,
                AIFunc              = "DarkMage_Check_JumpDown",
                DelayFrame          = 220,
            },
			-- 멈추기
            {
                AICheckFrame        = 10,
                AIFunc              = "DarkMage_Check_Stop",
                DelayFrame          = 55,
            },            
        }
    },
    
    -- 어슬렁대기
    {
        ID      = "IDLE",
        Motion  = "Kaido_Walk.frm",
        Func    = "DarkMage_IdleFunc",
        EnableMoveCheck = 1,
        MoveFailFunc    = "DarkMage_IdleMoveFail",
        
        Trigger =
        {
			-- 타게팅
			{
                AICheckFrame        = 55,
                AIFunc              = "DarkMage_Check_Targeting",
                DelayFrame          = 110,
            },
			-- 어슬렁대기(멈춤)
            {
                AICheckFrame        = 330,
                AIFunc              = "DarkMage_Check_Idle_Stop",
                DelayFrame          = 330,
            },
        },
    },
--[[
    -- 근접공격
    {
        ID      = "ATTACK01",
        Motion  = "Kaido_Attack01.frm",
        Func    = "DarkMage_Attack01Func",
    },
--]]
    -- 독가스공격
    {
        ID      = "ATTACK02",
        Motion  = "Kaido_Attack02.frm",
        Func    = "DarkMage_Attack02Func",
    },
    
    -- 라이트닝
    {
        ID      = "ATTACK03",
        Motion  = "Kaido_Attack03.frm",
        Func    = "DarkMage_Attack03Func",
    },
    
    -- 필살기
    {
        ID      = "SPECIAL_ATTACK",
        Motion  = "Kaido_SpecialAttack.frm",
        Func    = "DarkMage_SpecialAttackFunc",
    },
    
    -- 점프
    {
        ID      = "JUMP",
        Motion  = "kaido_jump_up.frm",
        Func    = "DarkMage_JumpFunc",
    },
    
    -- 점프
    {
        ID      = "JUMP_DOWN",
        Motion  = "kaido_jump_down.frm",
        Func    = "DarkMage_JumpDownFunc",
    },
    
    -- 점프
    {
        ID      = "JUMP_LANDING",
        Motion  = "kaido_jump_landing.frm",
        Func    = "DarkMage_ToWait",
    },
    
    -- 데미지 상
    {
        ID      = "DAMAGE_UP",
        Motion  = "Kaido_Damage_Up.frm",
        Func    = "DarkMage_DamageFunc",
    },
    
    -- 데미지 중
    {
        ID      = "DAMAGE_MIDDLE",
        Motion  = "Kaido_Damage_Middle.frm",
        Func    = "DarkMage_DamageFunc",
    },
    
    -- 데미지 하
    {
        ID      = "DAMAGE_DOWN",
        Motion  = "Kaido_Damage_Down.frm",
        Func    = "DarkMage_DamageFunc",
    },

    -- 다운 상
    {
        ID      = "DOWN_UP01",
        Motion  = "Kaido_Down_Up01.frm",
        Func    = "DarkMage_DownUpFunc",
        
        Trigger =
        {
            {
                AICheckFrame        = 1,
                AIFunc              = "DarkMage_CheckDownUp02",
                DelayFrame          = 0,
            },
        }
    },
    
    -- 다운 상02
    {
        ID      = "DOWN_UP02",
        Motion  = "Kaido_Down_Up02.frm",
        Func    = "DarkMage_DownUp02Func",
    },
	
	-- 다운 상 착지
    {
        ID      = "DOWN_UP_LANDING",
        Motion  = "Kaido_Down_Up03.frm",
        Func    = "DarkMage_DownUp03Func",
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "DarkMage_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- 다운 중
    {
        ID      = "DOWN_MIDDLE",
        Motion  = "Kaido_Down_Middle.frm",
        Func    = "DarkMage_DownFunc",
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "DarkMage_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- 다운 하
    {
        ID      = "DOWN_DOWN",
        Motion  = "Kaido_Down_Down.frm",
        Func    = "DarkMage_DownDownFunc",

        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "DarkMage_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- 다운 스페셜
    {
        ID      = "DOWN_SPECIAL",
        Motion  = "Kaido_Down_Special01.frm",
        Func    = "DarkMage_DownSpecialFunc",
    },
    
    -- 다운 스페셜 착지
    {
        ID      = "DOWN_SPECIAL_LANDING",
        Motion  = "Kaido_Down_Special02.frm",
        Func    = "DarkMage_DownSpecialLandingFunc",
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "DarkMage_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- 죽기
    {
        ID      = "DIE",
        Motion  = "Kaido_Die01.frm",
        Func    = "DarkMage_DieFunc",
    },
    
    -- 죽기 착지
    {
        ID      = "DIE_LANDING",
        Motion  = "Kaido_Die02.frm",
        Func    = "DarkMage_DieLandingFunc",
    },

    -- 일어나기
    {
        ID      = "STANDUP",
        Motion  = "Kaido_Standup.frm",
        Func    = "DarkMage_StandupFunc",
    },
    
   
    -- 스톤커스
    {
        ID      = "STONECURSE",
        Motion  = "Kaido_Stone.frm",
        Func    = "DarkMage_StoneCurseFunc",
    },
    
    -- 빙결상태
    {
        ID      = "ICECURSE",
        Motion  = "Kaido_Stone.frm",
        Func    = "DarkMage_IceCurseFunc",
    },
    -- 홀드상태
	{
		ID		= "HOLD",
		Motion	= "Kaido_Stone.frm",
		Func	= "DarkMage_HoldFunc",
	},
}

CallBack =
{
    Land    = "OnDarkMage_Land",
    Die     = "OnDarkMage_Die",
    Damage  = "OnDarkMage_Damage",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function InitDarkMage( iMonsterIndex )
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
function DarkMage_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
end

-- 걷기 상태
function DarkMage_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
        
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
end

-- 어슬렁대기 상태
function DarkMage_IdleFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
        
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "IDLE" )
    end
end

-- 죽는상태
function DarkMage_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "DIE_LANDING" )
    end
end

-- 죽는상태 착지
function DarkMage_DieLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-- 데미지 입은거
function DarkMage_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 다운 상
function DarkMage_DownUpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
    elseif( iFrame >= pMonster:GetLastFrame() ) then		
        pMonster:SetFrameLock( true )
    end
end

-- 다운 상2
function DarkMage_DownUp02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

-- 다운 상3
function DarkMage_DownUp03Func( iMonsterIndex, iFrame )
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
function DarkMage_DownFunc( iMonsterIndex, iFrame )
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
function DarkMage_DownDownFunc( iMonsterIndex, iFrame )
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
function DarkMage_DownSpecialFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "DOWN_SPECIAL" )
    end
end

-- 다운 스페셜 착지
function DarkMage_DownSpecialLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame == 3 ) then
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
function DarkMage_StandupFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetPushCheck( true )
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 16 ) then        
        if( pMonster:GetIsRight() ) then
			pMonster:SetSpeedX( 0.014 )
		else
			pMonster:SetSpeedX( -0.014 )
		end	
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
end

--  근접공격 상태
function DarkMage_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame == 29 ) then
		if( pMonster:GetIsRight() ) then
			pMonster:SetSpeedX( 0.02 )
		else
			pMonster:SetSpeedX( -0.02 )
		end	

	elseif( iFrame == 31 ) then		
		pMonster:AddDamage( DT_MONSTER_DARKMAGE01 )		
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  독가스공격 상태
function DarkMage_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
		pMonster:PlaySound(529)
	elseif( iFrame == 51 ) then
		pMonster:AddDamageWithLocate( DT_DARK_POISON_GAS,  0.00,  0.15)		
	elseif( iFrame == 53 ) then
		pMonster:AddDamageWithLocate( DT_DARK_POISON_GAS, -0.10,  0.15)		
	elseif( iFrame == 55 ) then
		pMonster:AddDamageWithLocate( DT_DARK_POISON_GAS,  0.10,  0.15)		
	elseif( iFrame == 57 ) then
		pMonster:AddDamageWithLocate( DT_DARK_POISON_GAS,  0.00,  0.10)		
	elseif( iFrame == 59 ) then
		pMonster:AddDamageWithLocate( DT_DARK_POISON_GAS,  0.00,  0.20)		
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  라이트닝 상태
function DarkMage_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 59 ) then
		pMonster:PlaySound(41)
	elseif( iFrame >= 61 and iFrame < 140 ) then
		if( math.mod( iFrame, 2 ) == 0 ) then
			pMonster:AddDamageWithLocate( DT_LIGHTNING_GENERATE1, 0.15, 0.12 )
			pMonster:AddDamageWithLocate( DT_LIGHTNING_BOLT, 0.1, 0.13 )
			pMonster:AddDamageWithLocate( DT_LIGHTNING_BOLT, 1.1, 0.13 )
			pMonster:AddDamageWithLocate( DT_LIGHTNING_BOLT, 2.1, 0.13 )
		end		
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  필살기 상태
function DarkMage_SpecialAttackFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  점프 상태
function DarkMage_JumpFunc( iMonsterIndex, iFrame )
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
function DarkMage_JumpDownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

--  점프 상태
function DarkMage_ToWait( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  스톤커스 걸렸음
function DarkMage_StoneCurseFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
        pMonster:AddTraceParticle( "StoneCurse_small", 0, 3 )
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
function DarkMage_IceCurseFunc( iMonsterIndex, iFrame )
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
function DarkMage_HoldFunc( iMonsterIndex, iFrame )
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

function DarkMage_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 100, -400, 200, 400, -100 ) == true or pMonster:SetTarget( 0, -200, 400, 200, -200 ) == true ) then
		pMonster:TurnToTarget()
		
		if( pMonster:CheckState( "IDLE" ) == true ) then
			pMonster:SetState( "WAIT" )
		end
		
        pMonster:ResetDelay()
    end
end

function DarkMage_Check_ReleaseTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 300, -500, 400, 500, -200 ) == false ) then
		pMonster:ReleaseTarget()
		pMonster:ResetDelay()
	end
end

function DarkMage_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function DarkMage_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 600, -300, 500, 300, -500 ) == true ) then
			pMonster:TurnToTarget()
			pMonster:SetState( "WALK" )
			pMonster:ResetDelay()
	end
end

function DarkMage_Check_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 150, -150, 300, 150, -300 ) == true ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetState( "WAIT" )
		pMonster:ResetDelay()
	end
end

function DarkMage_CheckDownUp02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetSpeedY() < 0.0 ) then
		pMonster:SetState( "DOWN_UP02" )
	end
end

function DarkMage_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 70, -80, 100, 80, -100 ) == true ) then
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
	end
end

function DarkMage_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 100, -100, 200, 100, -200 ) == true ) then
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
	end
end

function DarkMage_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 300, -100, 120, 100, -100 ) == true ) then
		pMonster:SetState( "ATTACK03" )
		pMonster:ResetDelay()
	end
end

function DarkMage_Check_SpecialAttack( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 200, -100, 200, 100, -100 ) == true and pMonster:GetCountValue() >= 5 ) then
		pMonster:AddCountValue(-5)
		pMonster:SetState( "SPECIAL_ATTACK" )
		pMonster:ResetDelay()
	end
end

function DarkMage_Check_HighJump( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 100, -200, 400, 200, 100 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		DarkMage_Jump( iMonsterIndex )
		pMonster:SetState( "JUMP" )
		pMonster:ResetDelay()
	end
end

function DarkMage_Check_JumpDown( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 60, -100, -80, 100, -200 ) == true ) then
		pMonster:SetNoCheckContact(15)
		pMonster:SetIgnoreFHCheck(true)
		pMonster:SetState( "JUMP_DOWN" )
		pMonster:ResetDelay()
	end
end

function DarkMage_CheckStandup( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetHP() > 0 and pMonster:GetDownDelay() == 0 ) then
		pMonster:SetState( "STANDUP" )
    end
end

-- 어슬렁대기..  방향 바꾸기 후 이동
function DarkMage_Check_Idle( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == false ) then
        pMonster:SetState( "IDLE" )
        pMonster:ResetDelay()
    end
end

-- 어슬렁대는 중.. 멈추기
function DarkMage_Check_Idle_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == false ) then

        pMonster:SetState( "WAIT" )

    end
end

-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------
function OnDarkMage_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    pMonster:SetSpeedX( pMonster:GetSpeedX() * (2.0 / 3.0) )

    if( pMonster:CheckState( "JUMP" ) == true or pMonster:CheckState( "JUMP_DOWN" ) == true ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "WAIT" )
    elseif( pMonster:CheckState( "DOWN_UP01" ) == true or pMonster:CheckState( "DOWN_UP02" ) == true ) then		
		pMonster:SetDownDelay( 40 + (pMonster:FloatRand() * 50) )		
		pMonster:SetState( "DOWN_UP_LANDING" )    
	elseif( pMonster:CheckState( "DOWN_SPECIAL" ) == true ) then		
		pMonster:SetDownDelay( 40 + (pMonster:FloatRand() * 50) )		
		pMonster:SetState( "DOWN_SPECIAL_LANDING" )    
    end
end

function OnDarkMage_Die( iMonsterIndex )
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

function OnDarkMage_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetPushCheck( true )
	pMonster:AddCountValue(1)	
	
    if( pMonster:CheckState( "JUMP" ) == true or pMonster:CheckState( "HIGHJUMP" ) == true ) then
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
end

function DarkMage_Jump( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	local fTargetX = pMonster:GetTargetX()
	local fTargetY = pMonster:GetTargetY()
	
	local fMonX = pMonster:GetX()
	local fMonY = pMonster:GetY()
		
	fSpeedX = ( fTargetX - fMonX ) * 1.5
	fSpeedY = ((fTargetY - fMonY) / ((fTargetY - fMonY) / 4.1)) + (((fTargetY - fMonY) * 1.6) + pMonster:FloatAbs((fSpeedX / 3.1)))
	
	pMonster:SetNoCheckContact(26 + (fSpeedY * 5.0))
	pMonster:TurnToTarget()
	pMonster:SetSpeedX( fSpeedX * 0.01 )
	pMonster:SetSpeedY( fSpeedY * 0.01 )
end

function DarkMage_MoveFail( iMonsterIndex )
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

function DarkMage_IdleMoveFail( iMonsterIndex )
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