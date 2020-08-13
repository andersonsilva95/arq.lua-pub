-- AI_Tank.lua

ActionList =
{
    -- ���
    {
        ID      = "WAIT",
        Motion  = "Tank_Wait.frm",
        Func    = "Tank_WaitFunc",
    },
    
    -- ������
    {
        ID      = "DAMAGE",
        Motion  = "Tank_Damage.frm",
        Func    = "Tank_DamageFunc",
    },
}

CallBack =
{
    Land    = "",
    Die     = "",
    Damage  = "OnTank_Damage",
}

-----------------------------------------------------------------------
-- �ʱ�ȭ �Լ�
-----------------------------------------------------------------------
function InitTank( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_NORMAL,           "DAMAGE" )
end

-----------------------------------------------------------------------
-- �� State�� ����Ǵ� �Լ���..
-----------------------------------------------------------------------

-- ��� ����
function Tank_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end 
end

-- ������ ������
function Tank_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame == 30 ) then
        pMonster:AddDamageLastPlayers( 198 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

function OnTank_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( pMonster:CheckPreState( "DAMAGE" ) == false ) then
		pMonster:SetPushCheck( true )
		pMonster:SetState("DAMAGE")
	end
end
