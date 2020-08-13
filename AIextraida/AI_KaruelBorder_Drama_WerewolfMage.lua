-- AI_KaruelBorder_Drama_WerewolfMage.lua

ActionList =
{	
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "werewolf_mage_Wait.frm",
        Func    = "KaruelBorderWerewolf_mage_WaitFunc",
    },

    -- 죽기
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
-- 초기화 함수
-----------------------------------------------------------------------

function InitKaruelBorderWerewolf_mage( iMonsterIndex )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )
        
    pMonster:AddParticle( "Iblis_Teleport_01", 0.0, 0.22 )
    pMonster:AddParticle( "Iblis_Teleport_02", 0.0, 0.22 )
    pMonster:AddParticle( "Iblis_Teleport_03", 0.0, 0.22 )
    pMonster:AddParticle( "Debris_Tel_out", 0.0, 0.22 )
end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function KaruelBorderWerewolf_mage_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 죽기
function KaruelBorderWerewolf_mage_DieLandingFunc( iMonsterIndex, iFrame )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
    end
end

-----------------------------------------------------------------------
-- 컨디션체크
-----------------------------------------------------------------------

-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------

function OnKaruelBorderWerewolf_mage_Die( iMonsterIndex )
	local pMonster = MonsterManager:GetMonster( iMonsterIndex )
	pMonster:SetState( "DIE" )
end