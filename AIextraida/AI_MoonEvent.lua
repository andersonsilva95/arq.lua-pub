-- AI_eventbox.lua

ActionList =
{
    -- ���
    {
        ID      = "WAIT",
        Motion  = "eventbox_Wait.frm",
        Func    = "eventbox_WaitFunc",
    },
    --[[
    -- ������
    {
        ID      = "DAMAGE",
        Motion  = "eventbox_damage.frm",
        Func    = "eventbox_DamageFunc",
    },
	--]]
    
    {
        ID      = "DIE_LANDING",
        Motion  = "eventbox_Die.frm",
        Func    = "eventbox_DieLandingFunc",
    },
}

CallBack =
{
    Land    = "Oneventbox_Land",
    Die     = "Oneventbox_Die",
    Damage  = "Oneventbox_Damage",
}

-----------------------------------------------------------------------
-- �ʱ�ȭ �Լ�
-----------------------------------------------------------------------

function IniteventboxMec( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	pMonster:SetIsRight(true)
end

-----------------------------------------------------------------------
-- �� State�� ����Ǵ� �Լ���..
-----------------------------------------------------------------------

-- ��� ����
function eventbox_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame <= 1 ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.0 )
		pMonster:SetIsRight(true)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
end

-- �̵� ����
function eventbox_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
        
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
end


-- �ױ���������
function eventbox_DieLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

--  ������ ����
function eventbox_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
    
    if( pMonster:GetHP() <= 0 ) then
		pMonster:SetState( "DIE_LANDING" )
	end
end

-----------------------------------------------------------------------
-- �����üũ
-----------------------------------------------------------------------


-----------------------------------------------------------------------
-- �ݹ� �Լ�
-----------------------------------------------------------------------
function Oneventbox_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

end

function Oneventbox_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetState( "DIE_LANDING" )
end

function Oneventbox_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetSpeedX( 0.0)
    pMonster:SetSpeedY( 0.0 )

    pMonster:SetPushCheck( true )
end