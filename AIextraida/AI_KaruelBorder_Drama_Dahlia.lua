-- AI_KaruelBorder_Drama_Dahlia.lua

ActionList =
{
	-- 대기
    {
        ID      = "WAIT",
        Motion  = "Mon_Archer_f_Wait.frm",
        Func    = "KaruelBorderDahlia_Drama_WaitFunc",
    },
	
	-- SUMMON
    {
        ID      = "SUMMON",
        Motion  = "Mon_Archer_f_Wait.frm",
        Func    = "KaruelBorderDahlia_Drama_SummonFunc",
    },

    -- 죽기
    {
        ID      = "DIE",
        Motion  = "Mon_Archer_f_Wait.frm",
        Func    = "KaruelBorderDahlia_Drama_DieFunc",
    },
}

CallBack =
{
    Die     = "OnKaruelBorderDahlia_Drama_Die",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function InitKaruelBorder_Drama_Dahlia( iMonsterIndex )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )
	
    pMonster:RegisterSummonMonsterType( MON_KARUELBORDER_DRAMA_WEREWOLF_MAGE )
	g_MyD3D:CreateMeshAnimationForPrevLoad( MON_KARUELBORDER_DRAMA_WEREWOLF_MAGE )
    pMonster:RegisterSummonMonsterType( MON_KARUELBORDER_DRAMA_WEREWOLF )
	g_MyD3D:CreateMeshAnimationForPrevLoad( MON_KARUELBORDER_DRAMA_WEREWOLF )
    pMonster:RegisterSummonMonsterType( MON_KARUELBORDER_DRAMA_WEREWOLF_BERSERKER )
	g_MyD3D:CreateMeshAnimationForPrevLoad( MON_KARUELBORDER_DRAMA_WEREWOLF_BERSERKER )

end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function KaruelBorderDahlia_Drama_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )

	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- Summon
function KaruelBorderDahlia_Drama_SummonFunc( iMonsterIndex, iFrame )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )
	
    if( iFrame <= 1 ) then
		--SummonMonster( iMonsterIndex, 1.5, 1.2, MON_KARUELBORDER_DRAMA_WEREWOLF_MAGE )
		--SummonMonster( iMonsterIndex, 2.0, 1.2, MON_KARUELBORDER_DRAMA_WEREWOLF )
		--SummonMonster( iMonsterIndex, 2.5, 1.2, MON_KARUELBORDER_DRAMA_WEREWOLF_BERSERKER )
	elseif( iFrame >= 5 ) then
		pMonster:SetState( "DIE" )
    end
end

-- 죽기
function KaruelBorderDahlia_Drama_DieFunc( iMonsterIndex, iFrame )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )

	if( iFrame == 5 ) then
		pMonster:PlaySound(986001)
		pMonster:AddParticleNoDirection( "Dun_Karuel1_Assassin_Hide_01", 0.0, 0.1 )
		pMonster:AddParticleNoDirection( "Dun_Karuel1_Assassin_Hide_02", 0.0, 0.1 )
		pMonster:AddParticleNoDirection( "Dun_Karuel1_Assassin_Hide_03", 0.0, 0.1 )
	elseif( iFrame == 6 ) then
		pMonster:EndMonster( true, true )
    end
end

-----------------------------------------------------------------------
-- 컨디션체크
-----------------------------------------------------------------------

-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------
function OnKaruelBorderDahlia_Drama_Die( iMonsterIndex )
	local pMonster = MonsterManager:GetMonster( iMonsterIndex )
	
	pMonster:SetState( "DIE" )
end

function SummonMonster( iMonsterIndex, PosX, PosY, MonType )
	local pMonster = MonsterManager:GetMonster( iMonsterIndex )

    local pMon = KSummonInfo()
    pMon:Init()
    pMon:SetState("WAIT")
    pMon.iMonType = MonType
    pMon.fX = PosX
    pMon.fY = PosY
	pMonster:SummonMonsterStaticSlot( pMon, true, true, pMonster:GetLevel(), -1 )
end