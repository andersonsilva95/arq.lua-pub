-- AI_KaruelBorder_BuffBox.lua

ActionList =
{
    -- ���
    {
        ID      = "WAIT",
        Motion  = "swamp_flies_wait.frm",
        Func    = "KaruelBorderBuffBox_WaitFunc",

        Trigger =
        {
			--  ��ó�� ���� �˾Ƽ� �״´�.
			{
                AICheckFrame        = 1,
                AIFunc              = "KaruelBorderBuffBox_Check_Targeting",
                DelayFrame          = 0,
            },
		},
    },
	-- �ױ�
    {
        ID      = "DIE_LANDING",
        Motion  = "swamp_flies_wait.frm",
        Func    = "KaruelBorderBuffBox_DieFunc",
    },
}

CallBack =
{
    Die     = "KaruelBorderBuffBox_Die",
    Damage  = "KaruelBorderBuffBox_Damage",
}


-----------------------------------------------------------------------
-- �ʱ�ȭ �Լ�
-----------------------------------------------------------------------
function InitKaruelBorder_BuffBox( iMonsterIndex )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )
	pMonster:SetIsRight(true)
	pMonster:SetInitAI( true )
	pMonster:SetInvincible( true )
	pMonster:RegisterSummonMonsterType( MON_KARUELBORDER_SUMMON_SCOUT )
	g_MyD3D:CreateMeshAnimationForPrevLoad( MON_KARUELBORDER_SUMMON_SCOUT )
end

-----------------------------------------------------------------------
-- �� State�� ����Ǵ� �Լ���..
-----------------------------------------------------------------------

-- ��� ����
function KaruelBorderBuffBox_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )
	
	if( pMonster:GetInitAI() ) then
		pMonster:SetMagicEffect( iMonsterIndex, EGC_EFFECT_KARUELBORDER_BUFFBOX_IMAGE, 9999999.0, 1 );
		pMonster:AddDamageWithLocate(DT_KARUEL_MAP_DAMAGE_1, 0.3, -3.0 )
		pMonster:AddDamageWithLocate(DT_KARUEL_MAP_DAMAGE_2, -0.5, 0.5 )
		pMonster:AddDamageWithLocate(DT_KARUEL_MAP_DAMAGE_3, -2.5, 0.0 )
		pMonster:SetInitAI( false )
	end
	
	if( iFrame <= 1 ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.0 )
		pMonster:SetIsRight(true)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
end

-- �ױ����
function KaruelBorderBuffBox_DieFunc( iMonsterIndex, iFrame )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:ClearMagicEffect( iMonsterIndex, EGC_EFFECT_KARUELBORDER_BUFFBOX_IMAGE )
		pMonster:PlaySound(979)
		pMonster:SetInvincible( true )
		pMonster:AddParticle("Dun_Kruel1_Box_Buff_01", 0.0, 0.1 )
		pMonster:AddParticle("Dun_Kruel1_Box_Buff_02", 0.0, 0.1 )
		pMonster:AddParticle("Dun_Kruel1_Box_Buff_03", 0.0, 0.1 )
		pMonster:AddParticle("Dun_Kruel1_Box_Buff_04", 0.0, 0.1 )
		pMonster:AddParticle("Dun_Kruel1_Box_Buff_05", 0.0, 0.1 )
		pMonster:SetMagicPlayerEffect( -1, EGC_EFFECT_KARUELBORDER_BUFFBOX, 999999.0 )
	elseif( iFrame == pMonster:GetLastFrame() -1 ) then
		local posy = 0.0
		pMonster:AddParticle("Iblis_Summon_01", 0.0, posy)
		pMonster:AddParticle("Iblis_Summon_02", 0.0, posy)
		pMonster:AddParticle("Iblis_Summon_03", 0.0, posy)
		pMonster:AddParticle("Iblis_Summon_04", 0.0, posy)
		pMonster:AddParticle("Iblis_Summon_05", 0.0, posy)
		local pMon = KSummonInfo()
        pMon:Init()
        pMon:SetState("WAIT")
        pMon.iMonType = MON_KARUELBORDER_SUMMON_SCOUT
        pMon.fX = -100
        pMon.fY = 0
        pMonster:SummonMonster( pMon )
		local pMon = KSummonInfo()
        pMon:Init()
        pMon:SetState("WAIT")
        pMon.iMonType = MON_KARUELBORDER_SUMMON_SCOUT
        pMon.fX = 100
        pMon.fY = 0
        pMonster:SummonMonster( pMon )
		pMonster:PlaySound(996004)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end


-----------------------------------------------------------------------
-- �����üũ
-----------------------------------------------------------------------
function KaruelBorderBuffBox_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 0, -10, 10, 10, -10 ) == true ) then
		pMonster:SetState( "DIE_LANDING" )
		pMonster:ResetDelay()
	end
end

-----------------------------------------------------------------------
-- �ݹ� �Լ�
-----------------------------------------------------------------------
function KaruelBorderBuffBox_Die( iMonsterIndex )
	local pMonster = MonsterManager:GetMonster( iMonsterIndex )
	
	pMonster:SetState( "DIE_LANDING" )
end

function KaruelBorderBuffBox_Damage( iMonsterIndex )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )
	
	pMonster:SetSpeedX( 0.0)
    pMonster:SetSpeedY( 0.0 )
    pMonster:SetPushCheck( true )
end