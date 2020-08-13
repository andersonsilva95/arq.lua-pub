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
        ID      = "DIE_LANDING_1",
        Motion  = "miragepot_wait.frm",
        Func    = "eventbox_DieLanding1Func",
    },
    
    {
        ID      = "DIE_LANDING_2",
        Motion  = "miragepot_wait.frm",
        Func    = "eventbox_DieLanding2Func",
    },
    
    {
        ID      = "DIE_LANDING_3",
        Motion  = "miragepot_wait.frm",
        Func    = "eventbox_DieLanding3Func",
    },
    
    {
        ID      = "DIE_LANDING_4",
        Motion  = "miragepot_wait.frm",
        Func    = "eventbox_DieLanding4Func",
    },
    
    {
        ID      = "DIE_LANDING_5",
        Motion  = "miragepot_wait.frm",
        Func    = "eventbox_DieLanding5Func",
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
	pMonster:AddTraceParticleToBone( "Mirage_Pot", 1.0, 0, 8, 8, 0.0, 0.1, true )
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

-- �̵� ����
function eventbox_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
        
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
end

-- ��
function eventbox_DieLanding1Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
		local posx = 0.0
		local posy = 0.1
		pMonster:AddParticle("Mirage_Pot_Spark_01" , posx, posy)
		pMonster:AddParticle("Mirage_Pot_Spark_02" , posx, posy)
		pMonster:AddParticle("Mirage_Pot_Spark_03" , posx, posy)
		pMonster:AddParticle("Mirage_Pot_Spark_04" , posx, posy)
		pMonster:AddParticle("Mirage_Pot_Spark_05" , posx, posy)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-- �� 25���� ȸ��
function eventbox_DieLanding2Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
		local posx = 0.0
		local posy = 0.1
		pMonster:AddParticle("Mirage_Pot_Spark_01" , posx, posy)
		pMonster:AddParticle("Mirage_Pot_Spark_02" , posx, posy)
		pMonster:AddParticle("Mirage_Pot_Spark_03" , posx, posy)
		pMonster:AddParticle("Mirage_Pot_Spark_04" , posx, posy)
		pMonster:AddParticle("Mirage_Pot_Spark_05" , posx, posy)
		pMonster:AddParticle("Hp_Up" , posx, posy)
	elseif( iFrame == 5 ) then
		pMonster:AddDamage(DT_MIRAGE_POT_HP)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-- ���� 100���� ȸ��
function eventbox_DieLanding3Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
		local posx = 0.0
		local posy = 0.1
		pMonster:AddParticle("Mirage_Pot_Spark_01" , posx, posy)
		pMonster:AddParticle("Mirage_Pot_Spark_02" , posx, posy)
		pMonster:AddParticle("Mirage_Pot_Spark_03" , posx, posy)
		pMonster:AddParticle("Mirage_Pot_Spark_04" , posx, posy)
		pMonster:AddParticle("Mirage_Pot_Spark_05" , posx, posy)
		pMonster:AddParticle("Mp_Up" , posx, posy)
	elseif( iFrame == 5 ) then
		pMonster:AddDamage(DT_MIRAGE_POT_MP)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-- ���� ���� ȿ��~
function eventbox_DieLanding4Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
		local posx = 0.0
		local posy = 0.1
		pMonster:AddParticle("Mirage_Pot_Spark_01" , posx, posy)
		pMonster:AddParticle("Mirage_Pot_Spark_02" , posx, posy)
		pMonster:AddParticle("Mirage_Pot_Spark_03" , posx, posy)
		pMonster:AddParticle("Mirage_Pot_Spark_04" , posx, posy)
		pMonster:AddParticle("Mirage_Pot_Spark_05" , posx, posy)
	elseif( iFrame == 5 ) then
		pMonster:AddDamage(DT_MIRAGE_POT_JUMP)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-- ���� 0����~ ��� ����
function eventbox_DieLanding5Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
		local posx = 0.0
		local posy = 0.1
		pMonster:AddParticle("Mirage_Pot_Spark_01" , posx, posy)
		pMonster:AddParticle("Mirage_Pot_Spark_02" , posx, posy)
		pMonster:AddParticle("Mirage_Pot_Spark_03" , posx, posy)
		pMonster:AddParticle("Mirage_Pot_Spark_04" , posx, posy)
		pMonster:AddParticle("Mirage_Pot_Spark_05" , posx, posy)
		pMonster:AddParticle("Mp_Minus" , posx, posy)
	elseif( iFrame == 5 ) then
		pMonster:AddDamage(DT_MIRAGE_POT_DEC_MP)
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

	if( pMonster:FloatRand() < 0.2 ) then
		pMonster:SetState( "DIE_LANDING_1" )
	elseif( pMonster:FloatRand() < 0.4 ) then
		pMonster:SetState( "DIE_LANDING_2" )
	elseif( pMonster:FloatRand() < 0.6 ) then
		pMonster:SetState( "DIE_LANDING_3" )
	elseif( pMonster:FloatRand() < 0.8 ) then
		pMonster:SetState( "DIE_LANDING_4" )
	else
		pMonster:SetState( "DIE_LANDING_5" )
	end
end

function Oneventbox_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetSpeedX( 0.0)
    pMonster:SetSpeedY( 0.0 )

    pMonster:SetPushCheck( true )
end