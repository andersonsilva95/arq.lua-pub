-- AI_DivineTreeRT.lua

ActionList =
{
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "divinetree02_wait03.frm",
        Func    = "DivineTreeRT_WaitFunc",

        Trigger =
        {
			-- 타게팅
			{
				AICheckFrame	= 100,
				AIFunc			= "DivineTreeRT_Check_Targeting",
				DelayFrame		= 100,
			},

            -- 콩켝
            {
                AICheckFrame        = 300,
				AICheckFrame1       = 250,
				AICheckFrame2       = 200,
				AICheckFrame3       = 200,
                AIFunc              = "DivineTreeRT_Check_Attack01",
                DelayFrame          = 1500,
				DelayFrame1         = 1000,
				DelayFrame2         = 500,
				DelayFrame3         = 500,
            },

            -- move
            {
                AICheckFrame        = 220,
                AIFunc              = "DivineTreeRT_Check_MoveUp",
                DelayFrame          = 110,
            },
            -- move
            {
                AICheckFrame        = 220,
                AIFunc              = "DivineTreeRT_Check_MoveDown",
                DelayFrame          = 110,
            },
        },
    },
    
    -- 상~이동
    {
        ID      = "MOVE_UP",
        Motion  = "DivineTree02_Wait03.frm",
        Func    = "DivineTreeRT_MoveUpFunc",

        Trigger =
        {
			-- 타게팅
			{
                AICheckFrame        = 100,
                AIFunc              = "DivineTreeRT_Check_Targeting",
                DelayFrame          = 120,
            },
            -- 콩켝
            {
                AICheckFrame        = 200,
                AIFunc              = "DivineTreeRT_Check_Attack01",
                DelayFrame          = 500,
            },
        },
    },
    
    -- 하~이동
    {
        ID      = "MOVE_DOWN",
        Motion  = "DivineTree02_Wait03.frm",
        Func    = "DivineTreeRT_MoveDownFunc",

        Trigger =
        {
			-- 타게팅
			{
                AICheckFrame        = 100,
                AIFunc              = "DivineTreeRT_Check_Targeting",
                DelayFrame          = 120,
            },
            -- 콩켝
            {
                AICheckFrame        = 200,
                AIFunc              = "DivineTreeRT_Check_Attack01",
                DelayFrame          = 500,
            },
        },
    },
    
    -- 석화의 고리 상
    {
        ID      = "ATTACK01",
        Motion  = "DivineTree02_Attack02.frm",
        Func    = "DivineTreeRT_Attack02Func",
    },
    {
        ID                  = "DIE",
        Motion              = "DivineTree02_Die02.frm",
        Func                = "DivineTreeRT_DieFunc",
    },
    
    -- 데미지
    {
        ID      = "DAMAGE",
        Motion  = "divinetree02_damage02.frm",
        Func    = "DivineTreeRT_DamageFunc",
    },
}

CallBack =
{
	Die     = "OnDivineTreeRT_Die",
	Damage	= "OnDivineTreeRT_Damage",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function InitDivineTreeRT( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    pMonster:SetIsRight( false )
    pMonster:SetSpeedX( 0.0 )
	pMonster:SetSpeedY( 0.0 )
    pMonster:SetPushCheck( false )
    pMonster:SetFly( true )
    
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
function DivineTreeRT_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetX( pMonster:GetStageX() + 0.15 )
	pMonster:SetSpeedX( 0.0 )
	pMonster:SetSpeedY( 0.0 )

	if( iFrame == 2 ) then
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

local initPosY = 2.4
-- 위로이동 상태
function DivineTreeRT_MoveUpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:GetY() < initPosY + 0.3 ) then
		pMonster:SetSpeedY( 0.003 )
	else
		pMonster:SetSpeedY( 0.0 )
	end

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 아래로이동 상태
function DivineTreeRT_MoveDownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetY() > initPosY - 0.5 ) then
		pMonster:SetSpeedY( -0.003 )
	else
		pMonster:SetSpeedY( 0.0 )
	end
        
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 물기
function DivineTreeRT_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetSpeedY(0)
	
    if( iFrame == 1) then
		pMonster:SetSuperArmor(true)
    elseif( iFrame == 67 ) then
		pMonster:PlaySound(996003)
		pMonster:StartAttack( 9, PAR_DOWN, 1.0, 2, 2, 17)
    elseif( iFrame == 84 ) then
		pMonster:EndAttack()
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end


-- 데미지 입은거
function DivineTreeRT_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  죽었어
function DivineTreeRT_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame == 2 ) then
		pMonster:PlaySound(996007)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-----------------------------------------------------------------------
-- 컨디션체크
-----------------------------------------------------------------------
function DivineTreeRT_Check_Targeting( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:SetTarget( 100, -1200, 400, 100, -800 ) == true ) then
		pMonster:ResetDelay()
	end
end

function DivineTreeRT_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:FloatRand() < 0.75 ) then
		pMonster:SetState( "ATTACK01" )
	end

	pMonster:ResetDelay()
end

function DivineTreeRT_Check_MoveUp( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 100, -1200, 200, 100, -200 ) == true and pMonster:FloatRand() < 0.5 ) then
		pMonster:SetState( "MOVE_UP" )
		pMonster:ResetDelay()
	end
end

function DivineTreeRT_Check_MoveDown( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 100, -1200, -400, 100, -1000 ) == true and pMonster:FloatRand() < 0.5 ) then
		pMonster:SetState( "MOVE_DOWN" )
		pMonster:ResetDelay()
	end
end

function DivineTreeRT_Check_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 200, -200, 160, 200, -240 ) == true ) then
	
		pMonster:SetSpeedY( 0.0 )
		pMonster:SetState( "WAIT" )
		pMonster:ResetDelay()
	end
end
-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------
function OnDivineTreeRT_Die( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    pMonster:SetState( "DIE" )
end

function OnDivineTreeRT_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonste5r( iMonsterIndex )
    pMonster:SetPushCheck( true )
    pMonster:SetSpeedX(0)
    pMonster:SetSpeedY(0)
    
	if ( pMonster:FloatRand() < 0.1 ) then	
		pMonster:SetState( "ATTACK01" )
	end
end