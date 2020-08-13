-- AI_DivineTreeRT.lua

ActionList =
{
    -- ���
    {
        ID      = "WAIT",
        Motion  = "divinetree02_wait03.frm",
        Func    = "DivineTreeRT_WaitFunc",

        Trigger =
        {
			-- Ÿ����
			{
				AICheckFrame	= 100,
				AIFunc			= "DivineTreeRT_Check_Targeting",
				DelayFrame		= 100,
			},

            -- ��U
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
    
    -- ��~�̵�
    {
        ID      = "MOVE_UP",
        Motion  = "DivineTree02_Wait03.frm",
        Func    = "DivineTreeRT_MoveUpFunc",

        Trigger =
        {
			-- Ÿ����
			{
                AICheckFrame        = 100,
                AIFunc              = "DivineTreeRT_Check_Targeting",
                DelayFrame          = 120,
            },
            -- ��U
            {
                AICheckFrame        = 200,
                AIFunc              = "DivineTreeRT_Check_Attack01",
                DelayFrame          = 500,
            },
        },
    },
    
    -- ��~�̵�
    {
        ID      = "MOVE_DOWN",
        Motion  = "DivineTree02_Wait03.frm",
        Func    = "DivineTreeRT_MoveDownFunc",

        Trigger =
        {
			-- Ÿ����
			{
                AICheckFrame        = 100,
                AIFunc              = "DivineTreeRT_Check_Targeting",
                DelayFrame          = 120,
            },
            -- ��U
            {
                AICheckFrame        = 200,
                AIFunc              = "DivineTreeRT_Check_Attack01",
                DelayFrame          = 500,
            },
        },
    },
    
    -- ��ȭ�� �� ��
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
    
    -- ������
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
-- �ʱ�ȭ �Լ�
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
-- �� State�� ����Ǵ� �Լ���..
-----------------------------------------------------------------------

-- ��� ����
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
-- �����̵� ����
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

-- �Ʒ����̵� ����
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

-- ����
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


-- ������ ������
function DivineTreeRT_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  �׾���
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
-- �����üũ
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
-- �ݹ� �Լ�
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