-- AI_KaruelBorder_Drama_WerwolfBerserker.lua

ActionList =
{	
    -- ���
    {
        ID      = "WAIT",
        Motion  = "werewolf_berserker_Wait.frm",
        Func    = "KaruelBorderDramaWerewolf_berserker_WaitFunc",
    },

    -- �ױ� ����
    {
        ID      = "DIE",
        Motion  = "werewolf_berserker_Wait.frm",
        Func    = "KaruelBorderDramaWerewolf_berserker_DieLandingFunc",
    },
}

CallBack =
{
    Die     = "OnKaruelBorderDramaWerewolf_berserker_Die",
}

-----------------------------------------------------------------------
-- �ʱ�ȭ �Լ�
-----------------------------------------------------------------------

function InitKaruelBorderWerewolf_berserker( iMonsterIndex )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )
    pMonster:AddParticle( "Iblis_Teleport_01", 0.0, 0.3 )
    pMonster:AddParticle( "Iblis_Teleport_02", 0.0, 0.3 )
    pMonster:AddParticle( "Iblis_Teleport_03", 0.0, 0.3 )
    pMonster:AddParticle( "Debris_Tel_out", 0.0, 0.3 )
end

-----------------------------------------------------------------------
-- �� State�� ����Ǵ� �Լ���..
-----------------------------------------------------------------------

-- ��� ����
function KaruelBorderDramaWerewolf_berserker_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- �ױ� ����
function KaruelBorderDramaWerewolf_berserker_DieLandingFunc( iMonsterIndex, iFrame )
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

function OnKaruelBorderDramaWerewolf_berserker_Die( iMonsterIndex )
	local pMonster = MonsterManager:GetMonster( iMonsterIndex )

	pMonster:SetState( "DIE" )
end