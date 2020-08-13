-- AI_Carnival_Switch.lua

local DEFINE_AUTOOFF_COOLTIME = 330
local iAutoOFFCoolTime = DEFINE_AUTOOFF_COOLTIME

ActionList =
{
    -- ���
    {
        ID      = "WAIT",
        Motion  = "miragepot_wait.frm",
        Func    = "CarnivalSwitch_WaitFunc",
    },
	
    -- ������
    {
        ID      = "DAMAGE",
        Motion  = "miragepot_wait.frm",
        Func    = "CarnivalSwitch_DamageFunc",
    },
	
	-- ON
    {
        ID      = "ON",
        Motion  = "miragepot_wait.frm",
        Func    = "CarnivalSwitch_ONFunc",
    },
	
	-- OFF
    {
        ID      = "OFF",
        Motion  = "miragepot_wait.frm",
        Func    = "CarnivalSwitch_OFFFunc",
    },
	
	-- �ױ�
    {
        ID      = "DIE",
        Motion  = "miragepot_wait.frm",
        Func    = "CarnivalSwitch_DieLandingFunc",
    },
}

CallBack =
{
    Damage  = "CarnivalSwitch_Damage",
	Die     = "CarnivalSwitch_Die",
}

-----------------------------------------------------------------------
-- �ʱ�ȭ �Լ�
-----------------------------------------------------------------------
function InitCarnivalSwitch( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster.DefRatio = 90000.0
    pMonster:SetIsRight(false)
	pMonster:SetMagicEffect( iMonsterIndex, EGC_EFFECT_EVENT_CARNIVAL_SWITCH_LEFT, 100000.0, 1, -1, false, false );
end

-----------------------------------------------------------------------
-- �� State�� ����Ǵ� �Լ���..
-----------------------------------------------------------------------

-- ��� ����
function CarnivalSwitch_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame <= 1 ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.0 )
		pMonster:SetIsRight(false)
        pMonster:SetState( "ON" )
    end
end

-- ����ġ ON����
function CarnivalSwitch_ONFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( true == pMonster:IsMagicEffect( iMonsterIndex, EGC_EFFECT_EVENT_CARNIVAL_SWITCH_RIGHT ) ) then
		pMonster:ClearMagicPlayerEffect(-1, EGC_EFFECT_EVENT_CARNIVAL_BLIND_IN )
		pMonster:SetMagicPlayerEffect(-1, EGC_EFFECT_EVENT_CARNIVAL_BLIND_OUT, 999999.0, 1 )
		pMonster:ClearMagicEffect( iMonsterIndex, EGC_EFFECT_EVENT_CARNIVAL_SWITCH_RIGHT )
		pMonster:SetMagicEffect( iMonsterIndex, EGC_EFFECT_EVENT_CARNIVAL_SWITCH_LEFT, 100000.0, 1, -1, false, false );
		iAutoOFFCoolTime = DEFINE_AUTOOFF_COOLTIME
	end
	
	if( pMonster:IsHost() ) then
		if( 0 < iAutoOFFCoolTime ) then
			iAutoOFFCoolTime = iAutoOFFCoolTime - 1
		elseif( 0 == iAutoOFFCoolTime ) then
			if ( pMonster:CheckState( "ON" ) ) then
				pMonster:PlaySound(993003)
			end
			pMonster:SetState( "OFF" )
			iAutoOFFCoolTime = -1
			return
		end
	end
	
	pMonster:SetSpeedX( 0.0 )
	pMonster:SetSpeedY( 0.0 )
	pMonster:SetIsRight(false)
	
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "ON" )
    end
end

-- ����ġ OFF����
function CarnivalSwitch_OFFFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( true == pMonster:IsMagicEffect( iMonsterIndex, EGC_EFFECT_EVENT_CARNIVAL_SWITCH_LEFT ) ) then
		pMonster:ClearMagicPlayerEffect(-1, EGC_EFFECT_EVENT_CARNIVAL_BLIND_OUT )
		pMonster:SetMagicPlayerEffect(-1, EGC_EFFECT_EVENT_CARNIVAL_BLIND_IN, 999999.0, 1 )
		pMonster:ClearMagicEffect( iMonsterIndex, EGC_EFFECT_EVENT_CARNIVAL_SWITCH_LEFT )
		pMonster:SetMagicEffect( iMonsterIndex, EGC_EFFECT_EVENT_CARNIVAL_SWITCH_RIGHT, 100000.0, 1, -1, false, false );
		iAutoOFFCoolTime = DEFINE_AUTOOFF_COOLTIME
	end
	
	pMonster:SetSpeedX( 0.0 )
	pMonster:SetSpeedY( 0.0 )
	pMonster:SetIsRight(false)
	
	if( iFrame >= pMonster:GetLastFrame() ) then
		if ( pMonster:CheckState( "ON" ) ) then
			pMonster:PlaySound(993003)
		end
        pMonster:SetState( "OFF" )
    end
end

-- ������ ����
function CarnivalSwitch_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( pMonster:IsHost() ) then
		pMonster:SetState( "ON" )
	end
end

-- �ױ�
function CarnivalSwitch_DieLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame == 1 ) then
		pMonster:ClearMagicPlayerEffect(-1, EGC_EFFECT_EVENT_CARNIVAL_BLIND_IN )
		pMonster:SetMagicPlayerEffect(-1, EGC_EFFECT_EVENT_CARNIVAL_BLIND_OUT, 999999.0, 1 )
		pMonster:ClearMagicEffect( iMonsterIndex, EGC_EFFECT_EVENT_CARNIVAL_SWITCH_LEFT )
		pMonster:ClearMagicEffect( iMonsterIndex, EGC_EFFECT_EVENT_CARNIVAL_SWITCH_RIGHT )
        pMonster:EndMonster(false, true)
        pMonster:SetFrameLock( true )
	end
end

-----------------------------------------------------------------------
-- �ݹ� �Լ�
-----------------------------------------------------------------------
function CarnivalSwitch_Damage( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if ( pMonster:CheckState( "OFF" ) ) then
		pMonster:PlaySound(999047)
	end
	pMonster:SetState( "DAMAGE" )
end

function CarnivalSwitch_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetState( "DIE" )
end