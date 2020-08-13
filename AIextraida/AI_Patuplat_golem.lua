-- AI_eventbox.lua

ActionList =
{
    -- ���
    {
        ID      = "WAIT",
        Motion  = "miragepot_wait.frm",
        Func    = "miragepot_waitFunc",
    },
    --[[
    -- ������
    {
        ID      = "DAMAGE",
        Motion  = "miragepot_wait.frm",
        Func    = "eventbox_DamageFunc",
    },
	--]]
    
    {
        ID      = "DIE_LANDING",
        Motion  = "miragepot_wait.frm",
        Func    = "eventbox_DieLanding1Func",
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

function InitMiragePot( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	pMonster:SetIsRight(true)
	pMonster:AddTraceParticleToBone( "Patu_Spear", 1.0, 0, 8, 8, 0.0, 0.5, true )
pMonster:SetHP( 1 )
end

-----------------------------------------------------------------------
-- �� State�� ����Ǵ� �Լ���..
-----------------------------------------------------------------------

-- ��� ����
function miragepot_waitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame <= 1 ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.0 )
		pMonster:SetIsRight(true)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
end

-- ��
function eventbox_DieLanding1Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame == pMonster:GetLastFrame() - 1 ) then
		local posx = 0.0
		local posy = 0.5
		pMonster:AddParticle("Patu_Spear_Spark_01" , posx, posy)
		pMonster:AddParticle("Patu_Spear_Spark_02" , posx, posy)
		pMonster:AddParticle("Patu_Spear_Spark_03" , posx, posy)
		pMonster:AddParticle("Patu_Spear_Spark_04" , posx, posy)
		pMonster:AddParticle("Patu_Spear_Spark_05" , posx, posy)
		pMonster:AddParticle("Patu_Spear_Spark_06" , posx, posy)
		pMonster:AddParticle("Patu_Spear_Spark_07" , posx, posy)
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