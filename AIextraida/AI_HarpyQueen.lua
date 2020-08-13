-- AI_HarpyQueen.lua

ActionList =
{	
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "HarpyQueen_Wait.frm",
        Func    = "HarpyQueen_WaitFunc",

        Trigger =
        {
			-- 타게팅
            {
                AICheckFrame        = 55,
                AIFunc              = "HarpyQueen_Check_Targeting",
                DelayFrame          = 110,
            },
            -- 타겟지움
            {
                AICheckFrame        = 440,
                AIFunc              = "HarpyQueen_Check_ReleaseTarget",
                DelayFrame          = 880,
            },
            -- 타겟을 향해 턴
            {
                AICheckFrame        = 25,
                AIFunc              = "HarpyQueen_Check_TurnToTarget",
                DelayFrame          = 25,
            },
            -- 위로이동
            {
                AICheckFrame        = 200,
				AICheckFrame3		= 100,
                AIFunc              = "HarpyQueen_Check_MoveUp",
                DelayFrame          = 50,
            },
            -- 아래로이동 좌
            {
                AICheckFrame        = 75,
                AIFunc              = "HarpyQueen_Check_MoveDownLeft",
                DelayFrame          = 55,
            },
            -- 아래로이동 우
            {
                AICheckFrame        = 75,
                AIFunc              = "HarpyQueen_Check_MoveDownRight",
                DelayFrame          = 55,
            },
            -- 근접공격
            {
                AICheckFrame        = 110,
                AIFunc              = "HarpyQueen_Check_Attack01",
                DelayFrame          = 110,
            },
            -- 가만히있기
            {
                AICheckFrame        = 110,
                AIFunc              = "HarpyQueen_Check_Idle",
                DelayFrame          = 330,
            },
        },
    },

    -- 위로이동
    {
        ID      = "MOVE_UP",
        Motion  = "HarpyQueen_Wait.frm",
        Func    = "HarpyQueen_MoveUpFunc",

        Trigger =
        {
			-- 타게팅
			{
                AICheckFrame        = 25,
                AIFunc              = "HarpyQueen_Check_Targeting",
                DelayFrame          = 110,
            },
            -- 타겟지움
            {
                AICheckFrame        = 440,
                AIFunc              = "HarpyQueen_Check_ReleaseTarget",
                DelayFrame          = 880,
            },
			-- 타겟을 향해 턴
            {
                AICheckFrame        = 25,
                AIFunc              = "HarpyQueen_Check_TurnToTarget",
                DelayFrame          = 25,
            },
            -- 아래로이동 좌
            {
                AICheckFrame        = 15,
                AIFunc              = "HarpyQueen_Check_MoveDownLeft",
                DelayFrame          = 15,
            },
            -- 아래로이동 우
            {
                AICheckFrame        = 15,
                AIFunc              = "HarpyQueen_Check_MoveDownRight",
                DelayFrame          = 15,
            },
			-- 멈추기
            {
                AICheckFrame        = 20,
                AIFunc              = "HarpyQueen_Check_Stop",
                DelayFrame          = 10,
            },
        }
    },
    
    -- 아래로이동 좌
    {
        ID      = "MOVE_DOWN_LEFT",
        Motion  = "HarpyQueen_Wait.frm",
        Func    = "HarpyQueen_MoveDownLeftFunc",

        Trigger =
        {
			-- 타게팅
			{
                AICheckFrame        = 25,
                AIFunc              = "HarpyQueen_Check_Targeting",
                DelayFrame          = 110,
            },
            -- 타겟지움
            {
                AICheckFrame        = 440,
                AIFunc              = "HarpyQueen_Check_ReleaseTarget",
                DelayFrame          = 880,
            },
			-- 타겟을 향해 턴
            {
                AICheckFrame        = 25,
                AIFunc              = "HarpyQueen_Check_TurnToTarget",
                DelayFrame          = 25,
            },
            -- 위로이동
            {
                AICheckFrame        = 20,
                AIFunc              = "HarpyQueen_Check_MoveUp",
                DelayFrame          = 20,
            },
            -- 아래로이동 우
            {
                AICheckFrame        = 15,
                AIFunc              = "HarpyQueen_Check_MoveDownRight",
                DelayFrame          = 20,
            },
			-- 멈추기
            {
                AICheckFrame        = 20,
                AIFunc              = "HarpyQueen_Check_Stop",
                DelayFrame          = 10,
            },
        }
    },
    
     -- 아래로이동 우
    {
        ID      = "MOVE_DOWN_RIGHT",
        Motion  = "HarpyQueen_Wait.frm",
        Func    = "HarpyQueen_MoveDownRightFunc",

        Trigger =
        {
			-- 타게팅
			{
                AICheckFrame        = 25,
                AIFunc              = "HarpyQueen_Check_Targeting",
                DelayFrame          = 110,
            },
            -- 타겟지움
            {
                AICheckFrame        = 440,
                AIFunc              = "HarpyQueen_Check_ReleaseTarget",
                DelayFrame          = 880,
            },
			-- 타겟을 향해 턴
            {
                AICheckFrame        = 25,
                AIFunc              = "HarpyQueen_Check_TurnToTarget",
                DelayFrame          = 25,
            },
            -- 위로이동
            {
                AICheckFrame        = 20,
                AIFunc              = "HarpyQueen_Check_MoveUp",
                DelayFrame          = 20,
            },
            -- 아래로이동 좌
            {
                AICheckFrame        = 15,
                AIFunc              = "HarpyQueen_Check_MoveDownLeft",
                DelayFrame          = 20,
            },
			-- 멈추기
            {
                AICheckFrame        = 20,
                AIFunc              = "HarpyQueen_Check_Stop",
                DelayFrame          = 10,
            },
        }
    },
    
    -- 가만히있기
    {
        ID      = "IDLE",
        Motion  = "HarpyQueen_Wait.frm",
        Func    = "HarpyQueen_IdleFunc",

        Trigger =
        {
			-- 타게팅
			{
                AICheckFrame        = 45,
                AIFunc              = "HarpyQueen_Check_Targeting",
                DelayFrame          = 110,
            },
        }
    },

    -- 근접공격01
    {
        ID      = "ATTACK01",
        Motion  = "HarpyQueen_Attack01.frm",
        Func    = "HarpyQueen_Attack01Func",
    },
    
    -- 깃털공격02
    {
        ID      = "ATTACK02",
        Motion  = "HarpyQueen_Attack02.frm",
        Func    = "HarpyQueen_Attack02Func",
    },
    
    -- 데미지 상
    {
        ID      = "DAMAGE_UP",
        Motion  = "HarpyQueen_Damage_Up.frm",
        Func    = "HarpyQueen_DamageFunc",
    },
    
    -- 데미지 하
    {
        ID      = "DAMAGE_DOWN",
        Motion  = "HarpyQueen_Damage_Down.frm",
        Func    = "HarpyQueen_DamageFunc",
    },
    
    -- 다운
    {
        ID      = "DOWN",
        Motion  = "HarpyQueen_Down01.frm",
        Func    = "HarpyQueen_DownFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- 다운 착지
    {
        ID      = "DOWN_LANDING",
        Motion  = "HarpyQueen_Down02.frm",
        Func    = "HarpyQueen_DownLandingFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "HarpyQueen_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- 죽기
    {
        ID      = "DIE",
        Motion  = "HarpyQueen_Down01.frm",
        Func    = "HarpyQueen_DieFunc",
    },
    
    -- 죽기착지
    {
        ID      = "DIE_LANDING",
        Motion  = "HarpyQueen_Die02.frm",
        Func    = "HarpyQueen_DieLandingFunc",
    },
    
    -- 일어나기
    {
        ID      = "STANDUP",
        Motion  = "HarpyQueen_Standup.frm",
        Func    = "HarpyQueen_StandupFunc",
    },
    
    -- 스톤커스
    {
        ID      = "STONECURSE",
        Motion  = "HarpyQueen_Stone.frm",
        Func    = "HarpyQueen_StoneCurseFunc",
    },
    
    -- 빙결상태
    {
        ID      = "ICECURSE",
        Motion  = "HarpyQueen_Stone.frm",
        Func    = "HarpyQueen_IceCurseFunc",
    },
    -- 홀드상태
	{
		ID		= "HOLD",
		Motion	= "HarpyQueen_Stone.frm",
		Func	= "HarpyQueen_HoldFunc",
	},
}

CallBack =
{
    Land    = "OnHarpyQueen_Land",
    Die     = "OnHarpyQueen_Die",
    Damage  = "OnHarpyQueen_Damage",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function InitHarpyQueen( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
        
	pMonster:RegistReaction(	ATTACKTYPE_HOLD,	ATTACKDIR_NORMAL,	"HOLD"	)
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_UP,     "DAMAGE_UP" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_MIDDLE, "DAMAGE_UP" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_DOWN,   "DAMAGE_DOWN" )
 
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_UP,       "DAMAGE_UP" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_MIDDLE,   "DAMAGE_DOWN" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_DOWN,     "DAMAGE_DOWN" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_NORMAL,   "DAMAGE_UP" )
    
    pMonster:RegistReaction( ATTACKTYPE_STONECURSE, ATTACKDIR_NORMAL,   "STONECURSE" )
    pMonster:RegistReaction( ATTACKTYPE_ICECURSE, ATTACKDIR_NORMAL,   "ICECURSE" )
    
    --pMonster:SetPushBoundBox( false )
    pMonster:SetFly( true )
    pMonster:SetCountValue( pMonster:GetHP() - 700 )

end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function HarpyQueen_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
end

-- 위로날기 상태
function HarpyQueen_MoveUpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetSpeedX( pMonster:GetWalkSpeed() * -1.0 )
	pMonster:SetSpeedY( 0.012 )
	
	if( iFrame <= 1 ) then
		pMonster:SetNoCheckContact(550)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "MOVE_UP" )
    end
end

-- 아래로날기 좌 상태
function HarpyQueen_MoveDownLeftFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	--pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
	pMonster:SetSpeedX( -0.012 )
	pMonster:SetSpeedY( -0.004 )
	
	if( iFrame <= 1 ) then
		pMonster:SetNoCheckContact(550)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "MOVE_DOWN_LEFT" )
    end
end

-- 아래로날기 우 상태
function HarpyQueen_MoveDownRightFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	--pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
	pMonster:SetSpeedX( 0.012 )
	pMonster:SetSpeedY( -0.004 )
	
	if( iFrame <= 1 ) then
		pMonster:SetNoCheckContact(550)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "MOVE_DOWN_RIGHT" )
    end
end

-- 가만히있기 상태
function HarpyQueen_IdleFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
        
	if( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.0 )
        pMonster:SetState( "IDLE" )
    end
end

-- 죽기상태
function HarpyQueen_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
		pMonster:PlaySound( 53 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

-- 죽기착지상태
function HarpyQueen_DieLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-- 데미지 입은거
function HarpyQueen_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetSpeedX( pMonster:GetSpeedX() * 19.0 / 20.0 )
	pMonster:SetSpeedY( pMonster:GetSpeedY() * 19.0 / 20.0 )
	
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 다운
function HarpyQueen_DownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
		pMonster:SetFly( false )
		pMonster:SetSuperArmor( true )
		pMonster:PlaySound( 52 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

-- 다운 착지
function HarpyQueen_DownLandingFunc( iMonsterIndex, iFrame )
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
function HarpyQueen_StandupFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
        pMonster:SetPushCheck( true )
        pMonster:SetSuperArmor( true )
        pMonster:SetCountValue( pMonster:GetHP() - 700 )
	elseif( iFrame == 31 ) then
		pMonster:SetSpeedY( 0.08 )		
		pMonster:SetNoCheckContact( 550 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetFly( true )
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.0 )
        pMonster:SetState( "WAIT" )        
    end
end

--  근접공격 상태
function HarpyQueen_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
		pMonster:SetNoCheckContact( 550 )
	elseif( iFrame >= 6 and iFrame < 21 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * -0.3)
		pMonster:SetSpeedY( 0.003 )
    elseif( iFrame >= 76 and iFrame < 96 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 3.1)
		pMonster:SetSpeedY( -0.028 )
		
		if( iFrame == 81 ) then
			pMonster:StartAttack( 15, PAR_FRONTDOWN_1, 0.0 )
		end
	elseif( iFrame == 101 ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.0 )
		pMonster:EndAttack()
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  깃털공격 02 상태
function HarpyQueen_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
        pMonster:SetNoCheckContact( 550 )
        pMonster:StartText( "DANGER" )        
        pMonster:PlaySound( "129" )
    elseif( iFrame >= 16 and iFrame < 31) then
		pMonster:SetSpeedY( 0.02 )
	elseif( iFrame >= 31 and iFrame < 56) then
		pMonster:SetSpeedY( -0.001 )
	elseif( iFrame == 56 ) then
		pMonster:SetSpeedY( 0.0 )
		pMonster:SkillReadyEffectNoStop( 100, 100, 255, 0.0 )
    elseif( iFrame == 81 ) then
		pMonster:AddParticle("Harpy_feather01", 0.0, 0.4)
		pMonster:AddDamageWithLocate( DT_MONSTER_HARPYQUEEN01_03,  -0.02, 0.04 )
		pMonster:AddDamageWithLocate( DT_MONSTER_HARPYQUEEN01_04,  0.02, 0.04 )
	elseif( iFrame == 87 ) then		
		pMonster:AddDamageWithLocate( DT_MONSTER_HARPYQUEEN01_03,  -0.02, 0.04 )
		pMonster:AddDamageWithLocate( DT_MONSTER_HARPYQUEEN01_04,  0.02, 0.04 )
		pMonster:AddDamageWithLocate( DT_MONSTER_HARPYQUEEN01_02,  0.1, -0.012 )
		pMonster:AddDamageWithLocate( DT_MONSTER_HARPYQUEEN01_05, -0.1, -0.012 )
	elseif( iFrame == 93 ) then
		pMonster:AddDamageWithLocate( DT_MONSTER_HARPYQUEEN01_02,  0.1, -0.012 )
		pMonster:AddDamageWithLocate( DT_MONSTER_HARPYQUEEN01_05, -0.1, -0.012 )
		pMonster:AddDamageWithLocate( DT_MONSTER_HARPYQUEEN01_01,  0.3, 0.04 )
		pMonster:AddDamageWithLocate( DT_MONSTER_HARPYQUEEN01_06, -0.3, 0.04 )		
	elseif( iFrame == 99 ) then
		pMonster:AddDamageWithLocate( DT_MONSTER_HARPYQUEEN01_01,  0.3, 0.04 )
		pMonster:AddDamageWithLocate( DT_MONSTER_HARPYQUEEN01_06, -0.3, 0.04 )		
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end


--  스톤커스 걸렸음
function HarpyQueen_StoneCurseFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetFly( false )
		pMonster:SetNoCheckContact(0)
        pMonster:SetSuperArmor( true )
        pMonster:SetPushCheck( false )
        pMonster:AddTraceParticle( "StoneCurse_medium", 3 )
        pMonster:AddParticle( "StoneCurse_medium_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "StoneCurse_medium_tick", 0.0, 0.0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:AddParticle( "StoneCurse_medium_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "StoneCurse_medium_tick", 0.0, 0.0 )
        pMonster:SetPushCheck( true )
        pMonster:SetSuperArmor( false )
        pMonster:SetFly( true )
        pMonster:SetNoCheckContact(550)
        pMonster:SetState( "WAIT" )
        
        if( pMonster:GetHP() <= 0 ) then
			pMonster:SetPushCheck( false )
			pMonster:SetFly( false )
			pMonster:SetNoCheckContact( 0 )
			pMonster:SetSpeedX( 0.0 )
			pMonster:SetSpeedY( 0.01 )
			pMonster:SetState( "DIE" )
		end
    end
end

--  아이스커스 걸렸음
function HarpyQueen_IceCurseFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetFly( false )
		pMonster:SetNoCheckContact(0)
        pMonster:SetSuperArmor( true )
        pMonster:AddTraceParticle( "IceCurse_medium", 3 )
        pMonster:AddParticle( "IceCurse_medium_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "IceCurse_medium_tick", 0.0, 0.0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:AddParticle( "IceCurse_medium_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "IceCurse_medium_tick", 0.0, 0.0 )
        pMonster:SetSuperArmor( false )
		pMonster:SetFly( true )
        pMonster:SetNoCheckContact(550)
        pMonster:SetState( "WAIT" )
        
        if( pMonster:GetHP() <= 0 ) then
			pMonster:SetPushCheck( false )
			pMonster:SetFly( false )
			pMonster:SetNoCheckContact( 0 )
			pMonster:SetSpeedX( 0.0 )
			pMonster:SetSpeedY( 0.01 )
			pMonster:SetState( "DIE" )
		end
    end
end

-- 홀드 걸렸음(이펙트)
function HarpyQueen_HoldFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame <= 1 ) then
		pMonster:SetFly( false )
		pMonster:SetNoCheckContact(0)
        pMonster:SetSuperArmor( true )
        pMonster:SetPushCheck( false )
		pMonster:AddTraceParticleOffset( "Arme01_Hold_Beam_effect_01_Middle", 0.0, 0.12, 3 )
		pMonster:AddTraceParticleOffset( "Arme01_Hold_Beam_effect_02_Middle", 0.0, 0.12, 3 )
		pMonster:AddTraceParticleOffset( "Arme01_Hold_Beam_effect_03_Middle", 0.0, 0.12, 3 )
		pMonster:AddTraceParticleOffset( "Arme01_Hold_Beam_effect_04_Middle", 0.0, 0.12, 3 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetSuperArmor( false )
		pMonster:SetPushCheck( true )
        pMonster:SetSuperArmor( false )
		pMonster:SetFly( true )
        pMonster:SetNoCheckContact(550)
        pMonster:SetState( "WAIT" )
        
        if( pMonster:GetHP() <= 0 ) then
			pMonster:SetPushCheck( false )
			pMonster:SetFly( false )
			pMonster:SetNoCheckContact( 0 )
			pMonster:SetSpeedX( 0.0 )
			pMonster:SetSpeedY( 0.01 )
			pMonster:SetState( "DIE" )
		end
	end
end

-----------------------------------------------------------------------
-- 컨디션체크
-----------------------------------------------------------------------

function HarpyQueen_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 50, -450, 300, 450, -400 ) == true ) then
		pMonster:TurnToTarget()
		
		if( pMonster:CheckState( "IDLE" ) == true ) then
			pMonster:SetState( "WAIT" )
		end
        pMonster:ResetDelay()
    end
end

function HarpyQueen_Check_ReleaseTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 0, -1300, 1100, 1300, -1100 ) == false ) then
		pMonster:ReleaseTarget()
		pMonster:ResetDelay()
	end
end

function HarpyQueen_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function HarpyQueen_Check_MoveUp( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
	    if( pMonster:GetY() < pMonster:GetTargetY() + 0.15 ) then
			pMonster:TurnToTarget()
	        pMonster:SetState( "MOVE_UP" )
	        pMonster:ResetDelay()
	    end
	end
end

function HarpyQueen_Check_MoveDownLeft( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == true and pMonster:GetX() > pMonster:GetTargetX() ) then
		if( pMonster:GetY() > pMonster:GetTargetY() + 0.15 ) then
			pMonster:TurnToTarget()
	        pMonster:SetState( "MOVE_DOWN_LEFT" )
	        pMonster:ResetDelay()
		end
    end
end

function HarpyQueen_Check_MoveDownRight( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == true and pMonster:GetX() < pMonster:GetTargetX() ) then
		if( pMonster:GetY() > pMonster:GetTargetY() + 0.15 ) then
			pMonster:TurnToTarget()
	        pMonster:SetState( "MOVE_DOWN_RIGHT" )
	        pMonster:ResetDelay()
		end
    end
end

function HarpyQueen_Check_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:IsTarget() == true ) then
		if( pMonster:GetY() < pMonster:GetTargetY() + 0.15 and pMonster:GetY() > pMonster:GetTargetY() - 0.15 ) then
			pMonster:SetSpeedX( 0.0 )
			pMonster:SetSpeedY( 0.0 )
			pMonster:SetState( "WAIT" )
			pMonster:ResetDelay()
		end
	end
end

function HarpyQueen_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 140, -140, -40, 140, -230 ) == true ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.0 )
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
    end
end

function HarpyQueen_CheckStandup( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetHP() > 0 and pMonster:GetDownDelay() == 0 ) then
		pMonster:SetState( "STANDUP" )
    end
end

-- 어슬렁대기..  
function HarpyQueen_Check_Idle( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == false ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.0 )
        pMonster:SetState( "IDLE" )
        pMonster:ResetDelay()
    end
end

-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------
function OnHarpyQueen_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    pMonster:SetSpeedX( pMonster:GetSpeedX() * (2.0 / 3.0) )

    if( pMonster:CheckState( "DIE" ) == true ) then
        pMonster:SetState( "DIE_LANDING" )	
    elseif( pMonster:CheckState( "DOWN" ) == true ) then
		pMonster:SetDownDelay( 360 )
        pMonster:SetState( "DOWN_LANDING" )	
    end
end

function OnHarpyQueen_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckState( "DOWN" ) == false and pMonster:CheckState( "DOWN_LANDING" ) == false  and pMonster:CheckState( "STONECURSE" ) == false and pMonster:CheckState( "ICECURSE" ) == false  and pMonster:CheckState( "HOLD" ) == false ) then
		pMonster:TurnToTarget()	
		pMonster:SetPushCheck( false )
		pMonster:SetFly( false )
		pMonster:SetNoCheckContact( 15 )
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.02 )
		pMonster:SetState( "DIE" )
	end	
end

function OnHarpyQueen_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetPushCheck( true )
	pMonster:SetNoCheckContact( 550 )
	
	--pMonster:SetSpeedX( (pMonster:GetSpeedX() )
	pMonster:SetSpeedY( (pMonster:GetSpeedY() * 1.0) / 3.0 )
	--pMonster:SetSpeedX( 0.0 )
	--pMonster:SetSpeedY( 0.0 )
	
	if ( pMonster:FloatRand() < 0.02 and pMonster:CheckState( "STONECURSE" ) == false and pMonster:CheckState( "ICECURSE" ) == false ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.0 )
		pMonster:SetState( "ATTACK02" )
	end

	if( pMonster:GetHP() < pMonster:GetCountValue() ) then
		pMonster:TurnToTarget()			
		pMonster:SetNoCheckContact( 55 )
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.02 )
		pMonster:SetState( "DOWN" )	
	end
		
end
