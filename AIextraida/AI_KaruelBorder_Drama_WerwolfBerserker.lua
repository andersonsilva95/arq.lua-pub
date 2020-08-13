-- AI_KaruelBorder_Drama_WerwolfBerserker.lua

ActionList =
{	
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "werewolf_berserker_Wait.frm",
        Func    = "KaruelBorderDramaWerewolf_berserker_WaitFunc",
    },

    -- 죽기 착지
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
-- 초기화 함수
-----------------------------------------------------------------------

function InitKaruelBorderWerewolf_berserker( iMonsterIndex )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )
    pMonster:AddParticle( "Iblis_Teleport_01", 0.0, 0.3 )
    pMonster:AddParticle( "Iblis_Teleport_02", 0.0, 0.3 )
    pMonster:AddParticle( "Iblis_Teleport_03", 0.0, 0.3 )
    pMonster:AddParticle( "Debris_Tel_out", 0.0, 0.3 )
end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function KaruelBorderDramaWerewolf_berserker_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 죽기 착지
function KaruelBorderDramaWerewolf_berserker_DieLandingFunc( iMonsterIndex, iFrame )
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

function OnKaruelBorderDramaWerewolf_berserker_Die( iMonsterIndex )
	local pMonster = MonsterManager:GetMonster( iMonsterIndex )

	pMonster:SetState( "DIE" )
end