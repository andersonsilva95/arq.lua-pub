-- AI_Barakup.lua

ActionList =
{
    -- ���
    {
        ID      = "WAIT",
        Motion  = "Barakup_Wait.frm",
        Func    = "Barakup_WaitFunc",
    },
    
    -- ���
    {
        ID      = "PRISONBREAK_WAIT",
        Motion  = "Barakup_Wait.frm",
        Func    = "Barakup_PrisonWaitFunc",
    },
    
    -- �׼�
    {
        ID      = "WAIT_ACTION",
        Motion  = "Barakup_action.frm",
        Func    = "Barakup_ActionFunc",
    },
    
    -- �̵�
    {
        ID      = "MOVE",
        Motion  = "Barakup_move.frm",
        Func    = "Barakup_moveFunc",
    },
    
    -- �̵� ������
    {
        ID      = "MOVE_BACK",
        Motion  = "Barakup_move.frm",
        Func    = "Barakup_move_backFunc",
    },
}

CallBack =
{
}

-----------------------------------------------------------------------
-- �ʱ�ȭ �Լ�
-----------------------------------------------------------------------

function InitBarakup( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	pMonster:SetCountValue(0)
	pMonster:SetIsRight( false )
end

-----------------------------------------------------------------------
-- �� State�� ����Ǵ� �Լ���..
-----------------------------------------------------------------------

-- ��� ����
function Barakup_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	pMonster.DefRatio = 10000.0
	
	if( iFrame == 3 ) then
		pMonster:SetInvincible( true )
		pMonster:AddCountValue(1)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		if( pMonster:GetCountValue() >= 3 ) then
			pMonster:SetState( "WAIT_ACTION" )
		else
			pMonster:SetState( "WAIT" )
		end
    end
end

-- ��� ����
function Barakup_PrisonWaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	pMonster.DefRatio = 10000.0
	
	if( iFrame == 3 ) then
		pMonster:SetInvincible( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "PRISONBREAK_WAIT" )
    end
end

-- ��� ����
function Barakup_ActionFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	pMonster.DefRatio = 10000.0
	
	if( iFrame == 3 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame == 29 ) then
		pMonster:AddParticleNoDirection("Barakup_Hit", -0.07, 0.25)
	elseif( iFrame == 42 ) then
		pMonster:AddParticleNoDirection("Barakup_Hit", -0.07, 0.25)
	elseif( iFrame == 55 ) then
		pMonster:AddParticleNoDirection("Barakup_Hit", -0.07, 0.25)

    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- �ȱ� ����
function Barakup_moveFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetRunSpeed() )
	if( iFrame == 3 ) then
		pMonster:SetInvincible( true )
		pMonster:SetCountValue(0)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "MOVE" )
    end
end

-- �ȱ� ����
function Barakup_move_backFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetRunSpeed() )
    if( pMonster:GetCountValue() == 0 ) then
		pMonster:SetIsRight( not pMonster:GetIsRight() )
		pMonster:AddCountValue(1)
    end
    
	if( iFrame == 3 ) then
		pMonster:SetInvincible( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "MOVE" )
    end
end