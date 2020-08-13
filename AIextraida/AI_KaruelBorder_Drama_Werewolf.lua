-- AI_KaruelBorder_Drama_Werewolf.lua

ActionList =
{	
    -- ���
    {
        ID      = "WAIT",
        Motion  = "werewolf_Wait.frm",
        Func    = "KaruelBorderWerewolf_WaitFunc",
    },

    -- �ױ� ����
    {
        ID      = "DIE",
        Motion  = "werewolf_Wait.frm",
        Func    = "KaruelBorderWerewolf_DieLandingFunc",
    },
}

CallBack =
{
    Die     = "OnKaruelBorderWerewolf_Die",
}

-----------------------------------------------------------------------
-- �ʱ�ȭ �Լ�
-----------------------------------------------------------------------

function InitKaruelBorderWerewolf( iMonsterIndex )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )
    
    pMonster:AddParticle( "Iblis_Teleport_01", 0.0, 0.28 )
    pMonster:AddParticle( "Iblis_Teleport_02", 0.0, 0.28 )
    pMonster:AddParticle( "Iblis_Teleport_03", 0.0, 0.28 )
    pMonster:AddParticle( "Debris_Tel_out", 0.0, 0.28 )
end

-----------------------------------------------------------------------
-- �� State�� ����Ǵ� �Լ���..
-----------------------------------------------------------------------

-- ��� ����
function KaruelBorderWerewolf_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )
    
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- �ױ� ����
function KaruelBorderWerewolf_DieLandingFunc( iMonsterIndex, iFrame )
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

function OnKaruelBorderWerewolf_Die( iMonsterIndex )
	local pMonster = MonsterManager:GetMonster( iMonsterIndex )

	pMonster:SetState( "DIE" )
end