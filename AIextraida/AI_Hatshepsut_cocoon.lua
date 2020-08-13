-- AI_hatshepsut_egg.lua

ActionList =
{
    -- ���
    {
        ID      = "WAIT",
        Motion  = "hatshepsut_egg_Wait.frm",
        Func    = "hatshepsut_egg_WaitFunc",
    },
	
	-- ����
    {
        ID      = "DIE",
        Motion  = "hatshepsut_egg_Die.frm",
        Func    = "hatshepsut_egg_DieFunc",
    },
    
    -- ����
    {
        ID      = "SUCK",
        Motion  = "hatshepsut_egg_Die.frm",
        Func    = "hatshepsut_egg_SuckFunc",
    },
}

CallBack =
{
    Land    	= "Onhatshepsut_egg_Land",
    Die     	= "Onhatshepsut_egg_Die",
    Damage  	= "Onhatshepsut_egg_Damage",
}

-----------------------------------------------------------------------
-- �ʱ�ȭ �Լ�
-----------------------------------------------------------------------

function Inithatshepsut_egg( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	pMonster:SetCountValue(0)
	pMonster:SetIsRight( true )
end

-----------------------------------------------------------------------
-- �� State�� ����Ǵ� �Լ���..
-----------------------------------------------------------------------

-- ��� ����
function hatshepsut_egg_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	pMonster.DefRatio = 10000.0
	
	if( iFrame == 3 ) then
		pMonster:SetIsRight( true )
		pMonster:AddParticle("Stone_Effect_01", 0.0, 0.34 )		
    elseif( iFrame >= pMonster:GetLastFrame() ) then				
        pMonster:SetState( "WAIT" )
    end
end

-- �׾���
function hatshepsut_egg_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    local pMon = g_MyD3D:GetMonster( 0 ) -- �ϼ���Ʈ
    if( iFrame <= 1) then
		pMonster:SetInvincible( true )
	elseif( iFrame == pMonster:GetLastFrame() - 2 ) then
		pMonster:AddParticle("Hatshepsut_Egg_Boom_01", 0.0, 0.0 )
		pMonster:AddParticle("Hatshepsut_Egg_Boom_02", 0.0, 0.0 )
		pMonster:AddParticle("Hatshepsut_Egg_Boom_03", 0.0, 0.0 )
		pMonster:AddParticle("Hatshepsut_Egg_Boom_04", 0.0, 0.0 )
		pMonster:AddParticle("Hatshepsut_Egg_Boom_05", 0.0, 0.0 )
		pMon:AddCountValue(1)
		if( pMon:GetHP() > 0 ) then
			pMon:SetState("BUFF01")
		end
		pMonster:PlaySound(993022)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
        pMonster:SetHP(0.0)
        pMonster:SetFrameLock( true )
    end
end

-- ��ŷ ���̺�~
function hatshepsut_egg_SuckFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    local pMon = g_MyD3D:GetMonster( 0 ) -- �ϼ���Ʈ
    if( iFrame <= 1) then
		pMonster:SetInvincible( true )
	elseif( iFrame == pMonster:GetLastFrame() - 1 ) then
		pMonster:AddParticle("Hatshepsut_Egg_Boom_01", 0.0, 0.0 )
		pMonster:AddParticle("Hatshepsut_Egg_Boom_02", 0.0, 0.0 )
		pMonster:AddParticle("Hatshepsut_Egg_Boom_03", 0.0, 0.0 )
		pMonster:AddParticle("Hatshepsut_Egg_Boom_04", 0.0, 0.0 )
		pMonster:AddParticle("Hatshepsut_Egg_Boom_05", 0.0, 0.0 )
		pMonster:PlaySound(993022)
		pMon:AddCountValue(-1)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
        pMonster:SetHP(0.0)
        pMonster:SetFrameLock( true )
    end
end


-----------------------------------------------------------------------
-- �����üũ
-----------------------------------------------------------------------

-----------------------------------------------------------------------
-- �ݹ� �Լ�
-----------------------------------------------------------------------
function Onhatshepsut_egg_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
end

function Onhatshepsut_egg_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetState( "DIE" )
end

function Onhatshepsut_egg_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetSpeedX( 0.0 )
	pMonster:SetSpeedY( 0.0 )
	pMonster:SetIsRight( true )
	pMonster:AddCountValue(1)
	
	if ( pMonster:GetCountValue() >= 10 ) then
		pMonster:SetState( "DIE" )
	end
end

