-- AI_Harpy.lua

ActionList =
{	
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "Harpy_Wait.frm",
        Func    = "Harpy_WaitFunc",

        Trigger =
        {
			-- 타게팅
            {
                AICheckFrame        = 55,
                AIFunc              = "Harpy_Check_Targeting",
                DelayFrame          = 110,
            },
            -- 타겟지움
            {
                AICheckFrame        = 440,
                AIFunc              = "Harpy_Check_ReleaseTarget",
                DelayFrame          = 880,
            },
            -- 타겟을 향해 턴
            {
                AICheckFrame        = 45,
                AIFunc              = "Harpy_Check_TurnToTarget",
                DelayFrame          = 45,
            },
            -- 위로이동
            {
                AICheckFrame        = 100,
                AIFunc              = "Harpy_Check_MoveUp",
                DelayFrame          = 200,
            },
            -- 아래로이동
            {
                AICheckFrame        = 90,
                AIFunc              = "Harpy_Check_MoveDown",
                DelayFrame          = 90,
            },
            -- 근접공격
            {
                AICheckFrame        = 110,
                AIFunc              = "Harpy_Check_Attack01",
                DelayFrame          = 220,
            },
            -- 가만히있기
            {
                AICheckFrame        = 110,
                AIFunc              = "Harpy_Check_Idle",
                DelayFrame          = 110,
            },
        },
    },

    -- 위로이동
    {
        ID      = "MOVE_UP",
        Motion  = "Harpy_Wait.frm",
        Func    = "Harpy_MoveUpFunc",

        Trigger =
        {
			-- 타게팅
			{
                AICheckFrame        = 25,
                AIFunc              = "Harpy_Check_Targeting",
                DelayFrame          = 110,
            },
            -- 타겟지움
            {
                AICheckFrame        = 440,
                AIFunc              = "Harpy_Check_ReleaseTarget",
                DelayFrame          = 880,
            },
			-- 타겟을 향해 턴
            {
                AICheckFrame        = 35,
                AIFunc              = "Harpy_Check_TurnToTarget",
                DelayFrame          = 25,
            },
            -- 아래로이동
            {
                AICheckFrame        = 25,
                AIFunc              = "Harpy_Check_MoveDown",
                DelayFrame          = 15,
            },
			-- 멈추기
            {
                AICheckFrame        = 20,
                AIFunc              = "Harpy_Check_Stop",
                DelayFrame          = 10,
            },
        }
    },
    
    -- 아래로이동
    {
        ID      = "MOVE_DOWN",
        Motion  = "Harpy_Wait.frm",
        Func    = "Harpy_MoveDownFunc",

        Trigger =
        {
			-- 타게팅
			{
                AICheckFrame        = 25,
                AIFunc              = "Harpy_Check_Targeting",
                DelayFrame          = 110,
            },
            -- 타겟지움
            {
                AICheckFrame        = 440,
                AIFunc              = "Harpy_Check_ReleaseTarget",
                DelayFrame          = 880,
            },
			-- 타겟을 향해 턴
            {
                AICheckFrame        = 35,
                AIFunc              = "Harpy_Check_TurnToTarget",
                DelayFrame          = 25,
            },
            -- 위로이동
            {
                AICheckFrame        = 25,
                AIFunc              = "Harpy_Check_MoveUp",
                DelayFrame          = 15,
            },
			-- 멈추기
            {
                AICheckFrame        = 20,
                AIFunc              = "Harpy_Check_Stop",
                DelayFrame          = 10,
            },
        }
    },
    
    -- 가만히있기
    {
        ID      = "IDLE",
        Motion  = "Harpy_Wait.frm",
        Func    = "Harpy_IdleFunc",

        Trigger =
        {
			-- 타게팅
			{
                AICheckFrame        = 45,
                AIFunc              = "Harpy_Check_Targeting",
                DelayFrame          = 110,
            },
        }
    },

    -- 근접공격01
    {
        ID      = "ATTACK01",
        Motion  = "Harpy_Attack01.frm",
        Func    = "Harpy_Attack01Func",
    },
    
    -- 데미지 상
    {
        ID      = "DAMAGE_UP",
        Motion  = "Harpy_Damage_Up.frm",
        Func    = "Harpy_DamageFunc",
    },
    
    -- 데미지 하
    {
        ID      = "DAMAGE_DOWN",
        Motion  = "Harpy_Damage_Down.frm",
        Func    = "Harpy_DamageFunc",
    },
    
    -- 죽기
    {
        ID      = "DIE",
        Motion  = "HarpyQueen_Down01.frm",
        Func    = "Harpy_DieFunc",
    },
    
    -- 죽기착지
    {
        ID      = "DIE_LANDING",
        Motion  = "HarpyQueen_Die02.frm",
        Func    = "Harpy_DieLandingFunc",
    },
    
    -- 스톤커스
    {
        ID      = "STONECURSE",
        Motion  = "Harpy_Stone.frm",
        Func    = "Harpy_StoneCurseFunc",
    },
    
    -- 빙결상태
    {
        ID      = "ICECURSE",
        Motion  = "Harpy_Stone.frm",
        Func    = "Harpy_IceCurseFunc",
    },
    -- 홀드상태
	{
		ID		= "HOLD",
		Motion	= "Harpy_Stone.frm",
		Func	= "Harpy_HoldFunc",
	},
}

CallBack =
{
    Land    = "OnHarpy_Land",
    Die     = "OnHarpy_Die",
    Damage  = "OnHarpy_Damage",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function InitHarpy( iMonsterIndex )
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

end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function Harpy_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
end

-- 위로날기 상태
function Harpy_MoveUpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetSpeedX( pMonster:GetWalkSpeed() * -1.0 )
	pMonster:SetSpeedY( 0.01 )
	
	if( iFrame <= 1 ) then
		pMonster:SetNoCheckContact(550)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "MOVE_UP" )
    end
end

-- 아래로날기 상태
function Harpy_MoveDownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
	pMonster:SetSpeedY( -0.004 )
	
	if( iFrame <= 1 ) then
		pMonster:SetNoCheckContact(550)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "MOVE_DOWN" )
    end
end

-- 가만히있기 상태
function Harpy_IdleFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
        
	if( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.0 )
        pMonster:SetState( "IDLE" )
    end
end

-- 죽기상태
function Harpy_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
		pMonster:PlaySound( 52 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

-- 죽기착지상태
function Harpy_DieLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-- 데미지 입은거
function Harpy_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetSpeedX( pMonster:GetSpeedX() * 19.0 / 20.0 )
	pMonster:SetSpeedY( pMonster:GetSpeedY() * 19.0 / 20.0 )
	
	if( iFrame <= 1 ) then
		--pMonster:PlaySound( 52 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  근접공격 상태
function Harpy_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetNoCheckContact( 550 )
        pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.0 )
    elseif( iFrame >= 56 and iFrame < 76 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 2.5)
		pMonster:SetSpeedY( -0.025 )
		
		if( iFrame == 59 ) then
			pMonster:StartAttack( 15, PAR_FRONTDOWN_0, 0.0 )
		elseif( iFrame == 76 ) then
			pMonster:EndAttack()
		end
	elseif( iFrame == 76 ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.0 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  스톤커스 걸렸음
function Harpy_StoneCurseFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetFly( false )
		pMonster:SetNoCheckContact(0)
        pMonster:SetSuperArmor( true )
        pMonster:SetPushCheck( false )
        pMonster:AddTraceParticle( "StoneCurse_small", 3 )
        pMonster:AddParticle( "StoneCurse_small_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "StoneCurse_small_tick", 0.0, 0.0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:AddParticle( "StoneCurse_small_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "StoneCurse_small_tick", 0.0, 0.0 )
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
function Harpy_IceCurseFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetFly( false )
		pMonster:SetNoCheckContact(0)
        pMonster:SetSuperArmor( true )
        pMonster:AddTraceParticle( "IceCurse_small", 3 )
        pMonster:AddParticle( "IceCurse_small_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "IceCurse_small_tick", 0.0, 0.0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:AddParticle( "IceCurse_small_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "IceCurse_small_tick", 0.0, 0.0 )
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
function Harpy_HoldFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame <= 1 ) then
		pMonster:SetFly( false )
		pMonster:SetNoCheckContact(0)
        pMonster:SetSuperArmor( true )
        pMonster:SetPushCheck( false )
		pMonster:AddTraceParticleOffset( "Arme01_Hold_Beam_effect_01_Small", 0.0, 0.12, 3 )
		pMonster:AddTraceParticleOffset( "Arme01_Hold_Beam_effect_02_Small", 0.0, 0.12, 3 )
		pMonster:AddTraceParticleOffset( "Arme01_Hold_Beam_effect_03_Small", 0.0, 0.12, 3 )
		pMonster:AddTraceParticleOffset( "Arme01_Hold_Beam_effect_04_Small", 0.0, 0.12, 3 )
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

function Harpy_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 50, -450, 300, 450, -400 ) == true ) then
		pMonster:TurnToTarget()
		
		if( pMonster:CheckState( "IDLE" ) == true ) then
			pMonster:SetState( "WAIT" )
		end
        pMonster:ResetDelay()
    end
end

function Harpy_Check_ReleaseTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 100, -1100, 800, 1100, -800 ) == false ) then
		pMonster:ReleaseTarget()
        pMonster:ResetDelay()
    end
end

function Harpy_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function Harpy_Check_MoveUp( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == true and pMonster:GetY() < pMonster:GetTargetY() + 0.15 ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "MOVE_UP" )
        pMonster:ResetDelay()
    end
end

function Harpy_Check_MoveDown( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == true and pMonster:GetY() > pMonster:GetTargetY() + 0.15 ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "MOVE_DOWN" )
        pMonster:ResetDelay()
    end
end

function Harpy_Check_Stop( iMonsterIndex, iFrame )
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

function Harpy_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 180, -120, -100, 120, -220 ) == true or pMonster:CheckTargetInRange( 80, -80, -40, 80, -100 ) == true ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.0 )
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
    end
end

function Harpy_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 130, -100, -40, 100, -240 ) == true ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.0 )
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
    end
end

-- 어슬렁대기..  
function Harpy_Check_Idle( iMonsterIndex, iFrame )
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
function OnHarpy_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    pMonster:SetSpeedX( pMonster:GetSpeedX() * (2.0 / 3.0) )

    if( pMonster:CheckState( "DIE" ) == true ) then
        pMonster:SetState( "DIE_LANDING" )	
    end
end

function OnHarpy_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckState( "STONECURSE" ) == false and pMonster:CheckState( "ICECURSE" ) == false  and pMonster:CheckState( "HOLD" ) == false ) then
		pMonster:TurnToTarget()	
		pMonster:SetPushCheck( false )
		pMonster:SetFly( false )
		pMonster:SetNoCheckContact( 10 )
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.02 )
		pMonster:SetState( "DIE" )
	end
	
end

function OnHarpy_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetPushCheck( true )
	pMonster:SetNoCheckContact( 550 )
	
	--pMonster:SetSpeedX( (pMonster:GetSpeedX() )
	pMonster:SetSpeedY( (pMonster:GetSpeedY() * 1.0) / 3.0 )
	--pMonster:SetSpeedX( 0.0 )
	--pMonster:SetSpeedY( 0.0 )
		
end
