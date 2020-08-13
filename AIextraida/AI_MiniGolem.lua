-- AI_MiniGolem.lua

ActionList =
{
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "MiniGolem_Wait.frm",
        Func    = "MiniGolem_WaitFunc",

        Trigger =
        {
			-- 타게팅
            {
                AICheckFrame        = 25,
                AIFunc              = "MiniGolem_Check_Targeting",
                DelayFrame          = 110,
            },
            -- 타겟지움
            {
                AICheckFrame        = 220,
                AIFunc              = "MiniGolem_Check_ReleaseTarget",
                DelayFrame          = 440,
            },
            -- 타겟을 향해 턴
            {
                AICheckFrame        = 75,
                AIFunc              = "MiniGolem_Check_TurnToTarget",
                DelayFrame          = 75,
            },
            -- 달리기
            {
                AICheckFrame        = 75,
                AIFunc              = "MiniGolem_Check_Run",
                DelayFrame          = 150,
            },
            -- 근접공격01
            {
                AICheckFrame        = 55,
                AIFunc              = "MiniGolem_Check_Attack01",
                DelayFrame          = 55,
            },
            -- 휠윈드흉내내기
            {
                AICheckFrame        = 35,
                AIFunc              = "MiniGolem_Check_Attack02",
                DelayFrame          = 330,
            },
            -- 하이점프
            {
                AICheckFrame        = 75,
                AIFunc              = "MiniGolem_Check_HighJump",
                DelayFrame          = 75,
            },        
            -- 점프다운
            {
                AICheckFrame        = 220,
                AIFunc              = "MiniGolem_Check_JumpDown",
                DelayFrame          = 220,
            },            
            -- 어슬렁대기(시작)
            {
                AICheckFrame        = 110,
                AIFunc              = "MiniGolem_Check_Idle",
                DelayFrame          = 110,
            },
        },
    },

    -- 이동
    {
        ID      = "RUN",
        Motion  = "minigolem_walk.frm",
        Func    = "MiniGolem_RunFunc",
        EnableMoveCheck = 1,
        MoveFailFunc    = "MiniGolem_MoveFail",


        Trigger =
        {
			-- 타게팅
			{
                AICheckFrame        = 25,
                AIFunc              = "MiniGolem_Check_Targeting",
                DelayFrame          = 110,
            },
            -- 타겟지움
            {
                AICheckFrame        = 220,
                AIFunc              = "MiniGolem_Check_ReleaseTarget",
                DelayFrame          = 440,
            },
            -- 근접공격01
            {
                AICheckFrame        = 15,
                AIFunc              = "MiniGolem_Check_Attack01",
                DelayFrame          = 110,
            },
            -- 하이점프
            {
                AICheckFrame        = 55,
                AIFunc              = "MiniGolem_Check_HighJump",
                DelayFrame          = 55,
            },        
            -- 점프다운
            {
                AICheckFrame        = 220,
                AIFunc              = "MiniGolem_Check_JumpDown",
                DelayFrame          = 220,
            },
			-- 멈추기
            {
                AICheckFrame        = 10,
                AIFunc              = "MiniGolem_Check_RunStop",
                DelayFrame          = 55,
            },
        }
    },
    
    -- 어슬렁대기
    {
        ID              = "IDLE",
        Motion          = "MiniGolem_Wait.frm",
        Func            = "MiniGolem_IdleFunc",

        Trigger =
        {
            -- 타게팅
            {
                AICheckFrame        = 45,
                AIFunc              = "MiniGolem_Check_Targeting",
                DelayFrame          = 110,
            },
        }
    },
    
    -- 근접공격
    {
        ID      = "ATTACK01",
        Motion  = "MiniGolem_Attack01.frm",
        Func    = "MiniGolem_Attack01Func",
    },
    
    -- 스페셜공격
    {
        ID      = "ATTACK02",
        Motion  = "MiniGolem_Attack02.frm",
        Func    = "MiniGolem_Attack02Func",
    },
    
    -- 점프
    {
        ID      = "JUMP",
        Motion  = "MiniGolem_Jump_up.frm",
        Func    = "MiniGolem_JumpFunc",
    },
    
    -- 점프
    {
        ID      = "JUMP_DOWN",
        Motion  = "minigolem_jump_down.frm",
        Func    = "MiniGolem_JumpDownFunc",
    },
    
    -- 점프
    {
        ID      = "JUMP_LANDING",
        Motion  = "minigolem_jump_landing.frm",
        Func    = "MiniGolem_ToWait",
    },

    -- 데미지
    {
        ID      = "DAMAGE",
        Motion  = "MiniGolem_Damage.frm",
        Func    = "MiniGolem_DamageFunc",
    },
    
    -- 죽기
    {
        ID      = "DIE",
        Motion  = "MiniGolem_Die.frm",
        Func    = "MiniGolem_DieFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- 일어나기
    {
        ID      = "STANDUP",
        Motion  = "MiniGolem_Standup.frm",
        Func    = "MiniGolem_StandupFunc",
        IsFallDownMotion    = TRUE,
    },    
}

CallBack =
{
    Land    = "OnMiniGolem_Land",
    Die     = "OnMiniGolem_Die",
    Damage  = "OnMiniGolem_Damage",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function InitMiniGolem( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
        
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_UP,     "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_MIDDLE, "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_DOWN,   "DAMAGE" )
 
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_UP,       "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_MIDDLE,   "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_DOWN,     "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_NORMAL,   "DAMAGE" )

end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function MiniGolem_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
end

-- 달리기 상태
function MiniGolem_RunFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetRunSpeed() )
        
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "RUN" )
    end
end

-- 어슬렁대기 상태
function MiniGolem_IdleFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "IDLE" )        
    end
end


-- 죽는상태
function MiniGolem_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-- 데미지 입은거
function MiniGolem_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 일어나기
function MiniGolem_StandupFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetPushCheck( true )
        pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
end

--  근접공격 상태
function MiniGolem_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame == 72 ) then
		pMonster:AddDamage( DT_MONSTER_MINIGOLEM01 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  스페셜공격
function MiniGolem_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame >= 61 and iFrame < 101 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
		if( iFrame == 66 ) then
			pMonster:AddDamageWithLocate( DT_MONSTER_MINIGOLEM02, 1.0, 0.25 )
		end
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "STANDUP" )
    end
end

--  점프 상태
function MiniGolem_JumpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( pMonster:GetSpeedY() <= 0.0 ) then
		pMonster:SetState("JUMP_DOWN")
		pMonster:SetFrameLock( false )
	end

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

--  점프 다운 상태
function MiniGolem_JumpDownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

--  점프 상태
function MiniGolem_ToWait( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 어슬렁대기..  방향 바꾸기 후 이동
function MiniGolem_Check_Idle( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == false ) then
        pMonster:SetState( "IDLE" )
        pMonster:ResetDelay()
    end
end

-----------------------------------------------------------------------
-- 컨디션체크
-----------------------------------------------------------------------

function MiniGolem_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 100, -400, 200, 400, -100 ) == true or pMonster:SetTarget( 0, -200, 400, 200, -200 ) == true ) then
		pMonster:TurnToTarget()
		
		if( pMonster:CheckState( "IDLE" ) == true ) then
			pMonster:SetState( "WAIT" )
		end
		
        pMonster:ResetDelay()
    end
end

function MiniGolem_Check_ReleaseTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 300, -600, 600, 600, -500 ) == false ) then
		pMonster:ReleaseTarget()
        pMonster:ResetDelay()
    end
end

function MiniGolem_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function MiniGolem_Check_Run( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 600, -500, 500, 500, -500 ) == true ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "RUN" )
        pMonster:ResetDelay()
    end
end

function MiniGolem_Check_RunStop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 100, -100, 150, 100, -100 ) == true ) then
		pMonster:TurnToTarget()
    	pMonster:SetSpeedX( 0.0 )
		pMonster:SetState( "WAIT" )		
		pMonster:ResetDelay()
    end
end

function MiniGolem_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 80, -100, 100, 100, -100 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
    end
end

function MiniGolem_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 120, -120, 100, 120, -100 ) == true and pMonster:GetCountValue() >= 5 ) then
		pMonster:SetCountValue(0)
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
    end
end

function MiniGolem_Check_HighJump( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 100, -100, 300, 100, 100 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		MiniGolem_Jump( iMonsterIndex )
		pMonster:SetState( "JUMP" )
		pMonster:ResetDelay()
    end
end

function MiniGolem_Check_JumpDown( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 100, -100, -40, 100, -200 ) == true ) then
		pMonster:SetNoCheckContact(15)
		pMonster:SetIgnoreFHCheck(true)
		pMonster:SetState( "JUMP_DOWN" )
		pMonster:ResetDelay()
    end
end

function MiniGolem_CheckStandup( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetHP() > 0 and pMonster:GetDownDelay() == 0 ) then
		pMonster:SetState( "STANDUP" )
    end
end

-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------
function OnMiniGolem_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    pMonster:SetSpeedX( pMonster:GetSpeedX() * (2.0 / 3.0) )

    if( pMonster:CheckState( "JUMP" ) == true or pMonster:CheckState( "JUMP_DOWN" ) == true ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "JUMP_LANDING" )
    end
end

function OnMiniGolem_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetState( "DIE" )
	
end

function OnMiniGolem_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetSpeedX( pMonster:GetSpeedX() / 3.0 )
	pMonster:SetSpeedY( pMonster:GetSpeedY() / 3.0 )
	
	pMonster:AddCountValue(1)
	
end

function MiniGolem_Jump( iMonsterIndex )
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

function MiniGolem_MoveFail( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:GetIsContact() == true )then		
		if( pMonster:GetY() - (0.446) < pMonster:GetTargetY() )then			
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