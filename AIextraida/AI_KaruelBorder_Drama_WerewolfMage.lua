-- AI_KaruelBorder_Drama_WerewolfMage.lua

ActionList =
{	
    -- ���
    {
        ID      = "WAIT",
        Motion  = "werewolf_mage_Wait.frm",
        Func    = "KaruelBorderWerewolf_mage_WaitFunc",
    },

    -- �ױ�
    {
        ID      = "DIE",
        Motion  = "werewolf_mage_Wait.frm",
        Func    = "KaruelBorderWerewolf_mage_DieLandingFunc",
    },
}

CallBack =
{
    Die     = "OnKaruelBorderWerewolf_mage_Die",
}

-----------------------------------------------------------------------
-- �ʱ�ȭ �Լ�
-----------------------------------------------------------------------

function InitKaruelBorderWerewolf_mage( iMonsterIndex )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )
        
    pMonster:AddParticle( "Iblis_Teleport_01", 0.0, 0.22 )
    pMonster:AddParticle( "Iblis_Teleport_02", 0.0, 0.22 )
    pMonster:AddParticle( "Iblis_Teleport_03", 0.0, 0.22 )
    pMonster:AddParticle( "Debris_Tel_out", 0.0, 0.22 )
end

-----------------------------------------------------------------------
-- �� State�� ����Ǵ� �Լ���..
-----------------------------------------------------------------------

-- ��� ����
function KaruelBorderWerewolf_mage_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- �ױ�
function KaruelBorderWerewolf_mage_DieLandingFunc( iMonsterIndex, iFrame )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
    end
end

-----------------------------------------------------------------------
-- �����üũ
-----------------------------------------------------------------------

-----------------------------------------------------------------------
-- �ݹ� �Լ�
-----------------------------------------------------------------------

function OnKaruelBorderWerewolf_mage_Die( iMonsterIndex )
	local pMonster = MonsterManager:GetMonster( iMonsterIndex )
	pMonster:SetState( "DIE" )
end