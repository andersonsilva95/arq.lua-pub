-- AI_KaruelBorder_Trap.lua

ActionList =
{
    -- ���
    {
        ID      = "WAIT",
        Motion  = "Mon_Trap_f_Wait.frm",
        Func    = "KaruelBorderTrap_WaitFunc",
		
        Trigger =
        {
			-- Ÿ����
            {
                AICheckFrame        = 1,
                AIFunc              = "KaruelBorderTrap_Check_Targeting",
                DelayFrame          = 240,
            },    
		},
    },

	-- �����غ�
    {
        ID      = "ATTACK_READY",
        Motion  = "Mon_Trap_f_Wait.frm",
        Func    = "KaruelBorderTrap_Ready",
    },
	
    -- ��������
    {
        ID      = "ATTACK01",
        Motion  = "Mon_Trap_f_Wait.frm",
        Func    = "KaruelBorderTrap_ATTACK",
    },
    -- ��������1
    {
        ID      = "ATTACK02",
        Motion  = "Mon_Trap_f_Wait.frm",
        Func    = "KaruelBorderTrap_ATTACK02",
    },
	-- ��������2
    {
        ID      = "ATTACK03",
        Motion  = "Mon_Trap_f_Wait.frm",
        Func    = "KaruelBorderTrap_ATTACK03",
    },
	-- ����
    {
        ID      = "DIE",
        Motion  = "Mon_Trap_f_Wait.frm",
        Func    = "KaruelBorderTrap_DieFunc",
    },
}

CallBack =
{
    Die     	= "OnKaruelBorderTrap_Die",
    Damage  	= "OnKaruelBorderTrap_Damage",
}

-----------------------------------------------------------------------
-- �ʱ�ȭ �Լ�
-----------------------------------------------------------------------

function InitKaruelBorder_Trap( iMonsterIndex )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )
	pMonster:SetInitAI( true )
	pMonster:SetIsRight( false )
end

-----------------------------------------------------------------------
-- �� State�� ����Ǵ� �Լ���..
-----------------------------------------------------------------------

-- ��� ����
function KaruelBorderTrap_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )

	pMonster:SetNoCrashDamage( TRUE )
	pMonster:SetPushCheck( FALSE )
	
    if( pMonster:GetInitAI() ) then
		pMonster:SetMagicEffect( iMonsterIndex, EGC_EFFECT_KARUELBORDER_TRAP, 9999999.0, 1, -1, false, false );
        pMonster:SetInitAI( false )
    end
    if( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:ReleaseTarget()
        pMonster:SetState( "WAIT" )
    end
end

-- �׾���
function KaruelBorderTrap_DieFunc( iMonsterIndex, iFrame )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1) then
		pMonster:SetInvincible( true )
		pMonster:ClearALLMagicEffect()
	elseif( iFrame == pMonster:GetLastFrame() - 1 ) then
		pMonster:AddParticle("Dota_Tower_Boom_Small_01", 0.0, 0.1 )
		pMonster:AddParticle("Dota_Tower_Boom_Small_02", 0.0, 0.1 )
		pMonster:PlaySound(90019)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:ClearALLMagicEffect()
        pMonster:EndMonster(false, true)
        pMonster:SetFrameLock( true )
    end
end

-- �����غ�
function KaruelBorderTrap_Ready( iMonsterIndex, iFrame )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )
	
	if( iFrame <= 1 ) then
		pMonster:AddParticleNoDirection("Dun_Karuel1_Trap_Vibe", 0.0, 0.15 )
    elseif( iFrame == 5 ) then
		pMonster:ClearALLMagicEffect()
	elseif( iFrame == 30 ) then
		pMonster:SetState( "ATTACK01" )
    end
end


-- ����
function KaruelBorderTrap_ATTACK( iMonsterIndex, iFrame )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )
	
	pMonster:SetNoCrashDamage( FALSE )
	pMonster:SetPushCheck( TRUE )
	
	if( iFrame <= 1 ) then
		pMonster:SetMagicEffect( iMonsterIndex, EGC_EFFECT_KARUELBORDER_TRAP, 9999999.0, 1, -1, false, false );
		pMonster:PlaySound(296)
		pMonster:AddParticle("Dun_Karuel1_Trap_03", 0.0, 0.1 )
		pMonster:AddParticle("Dun_Karuel1_Trap_04", 0.0, 0.1 )
		pMonster:AddDamage( DT_KARUELBORDER_TRAP_ATTACK )
		pMonster:AddDamage( DT_KARUELBORDER_TRAP_ATTACK2 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "ATTACK02" )
    end
end

-- ��������1
function KaruelBorderTrap_ATTACK02( iMonsterIndex, iFrame )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )
	
	pMonster:SetNoCrashDamage( FALSE )
	pMonster:SetPushCheck( TRUE )
	
	if( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "ATTACK03" )
    end
end

-- ��������3
function KaruelBorderTrap_ATTACK03( iMonsterIndex, iFrame )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )
	
	pMonster:SetNoCrashDamage( FALSE )
	pMonster:SetPushCheck( TRUE )
	
	if( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetInitAI( true )
		pMonster:SetState( "WAIT" )
    end
end

-----------------------------------------------------------------------
-- �����üũ
-----------------------------------------------------------------------
function KaruelBorderTrap_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )

    if( pMonster:GetEnemyCntInRange( 0, -60, 10, 60, -60 ) > 0 ) then
		pMonster:SetState( "ATTACK_READY" )
        pMonster:ResetDelay()
    end
end


-----------------------------------------------------------------------
-- �ݹ� �Լ�
-----------------------------------------------------------------------
function OnKaruelBorderTrap_Die( iMonsterIndex )
	local pMonster = MonsterManager:GetMonster( iMonsterIndex )
	
	pMonster:SetState( "DIE" )
end

function OnKaruelBorderTrap_Damage( iMonsterIndex )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )
	
	pMonster:SetSpeedX( 0.0 )
	pMonster:SetSpeedY( 0.0 )
	pMonster:SetIsRight( false )
end