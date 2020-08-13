-- AI_prison_back.lua

ActionList =
{
    -- ���
    {
        ID      = "WAIT",
        Motion  = "prison_Wait.frm",
        Func    = "prison_back_WaitFunc",
    },
    
    -- �̵�
    {
        ID      = "OPEN",
        Motion  = "prison_die.frm",
        Func    = "prison_back_moveFunc",
    },
}

CallBack =
{
}

-----------------------------------------------------------------------
-- �ʱ�ȭ �Լ�
-----------------------------------------------------------------------

function Initprison_back( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	pMonster:SetCountValue(0)
	pMonster:SetIsRight( false )
end

-----------------------------------------------------------------------
-- �� State�� ����Ǵ� �Լ���..
-----------------------------------------------------------------------

-- ��� ����
function prison_back_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	pMonster.DefRatio = 10000.0
	
	if( iFrame == 3 ) then
		pMonster:SetInvincible( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then				
        pMonster:SetState( "WAIT" )
    end
end

-- �ȱ� ����
function prison_back_moveFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end


-----------------------------------------------------------------------
-- �����üũ
-----------------------------------------------------------------------

-----------------------------------------------------------------------
-- �ݹ� �Լ�
-----------------------------------------------------------------------
function Onprison_back_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
end

function Onprison_back_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetSpeedX( 0.0 )
	pMonster:SetSpeedY( 0.0 )
	pMonster:SetIsRight( true )
	pMonster:AddCountValue(1)
	
	if ( pMonster:GetCountValue() >= 10 ) then
		pMonster:SetState( "DIE" )
	end
end