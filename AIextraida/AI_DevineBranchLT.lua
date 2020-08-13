-- AI_DivineTreeLT.lua

ActionList =
{
    -- ���
    {
        ID      = "WAIT",
        Motion  = "DivineTree02_Wait02.frm",
        Func    = "DivineTreeLT_WaitFunc",

        Trigger =
        {
			-- Ÿ����
			{
				AICheckFrame	= 100,
				AIFunc			= "DivineTreeLT_Check_Targeting",
				DelayFrame		= 100,
			},

            -- ��U
            {
                AICheckFrame        = 500,
				AICheckFrame1       = 450,
				AICheckFrame2       = 400,
				AICheckFrame3       = 400,
                AIFunc              = "DivineTreeLT_Check_Attack01",
                DelayFrame          = 900,
				DelayFrame1         = 600,
				DelayFrame2         = 300,
				DelayFrame3         = 300,
            },

            -- move
            {
                AICheckFrame        = 110,
                AIFunc              = "DivineTreeLT_Check_MoveUp",
                DelayFrame          = 220,
            },
            -- move
            {
                AICheckFrame        = 110,
                AIFunc              = "DivineTreeLT_Check_MoveDown",
                DelayFrame          = 220,
            },
        },
    },
    
    -- ��~�̵�
    {
        ID      = "MOVE_UP",
        Motion  = "DivineTree02_Wait02.frm",
        Func    = "DivineTreeLT_MoveUpFunc",

        Trigger =
        {
			-- Ÿ����
			{
                AICheckFrame        = 100,
                AIFunc              = "DivineTreeLT_Check_Targeting",
                DelayFrame          = 120,
            },
            -- ��U
            {
                AICheckFrame        = 200,
                AIFunc              = "DivineTreeLT_Check_Attack01",
                DelayFrame          = 500,
            },
        },
    },
    
    -- ��~�̵�
    {
        ID      = "MOVE_DOWN",
        Motion  = "DivineTree02_Wait02.frm",
        Func    = "DivineTreeLT_MoveDownFunc",

        Trigger =
        {
			-- Ÿ����
			{
                AICheckFrame        = 100,
                AIFunc              = "DivineTreeLT_Check_Targeting",
                DelayFrame          = 120,
            },
            -- ��U
            {
                AICheckFrame        = 200,
                AIFunc              = "DivineTreeLT_Check_Attack01",
                DelayFrame          = 500,
            },
        },
    },
    
    -- ��ȭ�� �� ��
    {
        ID      = "ATTACK01",
        Motion  = "DivineTree02_Attack02.frm",
        Func    = "DivineTreeLT_Attack02Func",
    },
    {
        ID                  = "DIE",
        Motion              = "DivineTree02_Die02.frm",
        Func                = "DivineTreeLT_DieFunc",
    },
    
    -- ������
    {
        ID      = "DAMAGE",
        Motion  = "divinetree02_damage02.frm",
        Func    = "DivineTreeLT_DamageFunc",
    },
}

CallBack =
{
	Die     = "OnDivineTreeLT_Die",
	Damage	= "OnDivineTreeLT_Damage",
}

-----------------------------------------------------------------------
-- �ʱ�ȭ �Լ�
-----------------------------------------------------------------------

function InitDivineTreeLT( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    pMonster:SetIsRight( true )
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
function DivineTreeLT_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetX( -0.15 )
	pMonster:SetSpeedX( 0.0 )
	pMonster:SetSpeedY( 0.0 )

	if( iFrame == 2 ) then
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

local initPosY = 2.4
-- �����̵� ����
function DivineTreeLT_MoveUpFunc( iMonsterIndex, iFrame )
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
function DivineTreeLT_MoveDownFunc( iMonsterIndex, iFrame )
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
function DivineTreeLT_Attack02Func( iMonsterIndex, iFrame )
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
function DivineTreeLT_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  �׾���
function DivineTreeLT_DieFunc( iMonsterIndex, iFrame )
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
function DivineTreeLT_Check_Targeting( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:SetTarget( 100, -100, 400, 1200, -800 ) == true ) then
		pMonster:ResetDelay()
	end
end

function DivineTreeLT_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:FloatRand() < 0.75 ) then
		pMonster:SetState( "ATTACK01" )
	end

	pMonster:ResetDelay()
	
end

function DivineTreeLT_Check_MoveUp( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 100, -100, 200, 1200, -200 ) == true and pMonster:FloatRand() < 0.5 ) then
		pMonster:SetState( "MOVE_UP" )
		pMonster:ResetDelay()
	end
end

function DivineTreeLT_Check_MoveDown( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 100, -100, -400, 1200, -1000 ) == true and pMonster:FloatRand() < 0.5 ) then
		pMonster:SetState( "MOVE_DOWN" )
		pMonster:ResetDelay()
	end
end

function DivineTreeLT_Check_Stop( iMonsterIndex, iFrame )
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
function OnDivineTreeLT_Die( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    pMonster:SetState( "DIE" )
end

function OnDivineTreeLT_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonste5r( iMonsterIndex )
    pMonster:SetPushCheck( true )
    pMonster:SetSpeedX(0)
    pMonster:SetSpeedY(0)
    
	if ( pMonster:FloatRand() < 0.1 ) then	
		pMonster:SetState( "ATTACK01" )
	end
end